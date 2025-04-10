# frozen_string_literal: true

require 'fileutils'
require 'cocoapods-core'
require 'pod-pipeline/util/scanner'

@pod_path = ARGV[0]
@output_path = ARGV[1]
@trustee_path = ARGV[2]

puts "生成静态包podspec, [#{@pod_path}] -> [#{@output_path}] : "
puts "托管地址: #{@trustee_path}"

# 检索目标路径
PPL::Scanner.new(@pod_path, ['all']).run
@name = PPL::Scanner.name

# 开始写入
@file = File.new("#{@output_path}/#{PPL::Scanner.name}.podspec", 'w')
@file.syswrite("Pod::Spec.new do |s|\n")

# 声明写入函数
def write(key, value)
  if value.is_a?(Hash) || value.is_a?(Array)
    @file.syswrite("\ts.#{key} = #{value}\n")
  else
    @file.syswrite("\ts.#{key} = \"#{value}\"\n")
  end
end

attributes = PPL::Scanner.linter.spec.attributes_hash
attributes.each_key do |key|
  next if key == 'default_subspecs'

  value = attributes[key]
  if key == 'source'
    value.clear
    value['http'] = @trustee_path
  end
  write(key, value)
end

# 合并默认库的依赖项
default_subspecs = PPL::Scanner.linter.spec.default_subspecs
dependencies = Hash[]
libraries = Array[]
frameworks = Array[]
pod_target_xcconfig = Hash[]
PPL::Scanner.linter.spec.subspecs.each do |subspec|
  subname = subspec.name.split('/').last
  next unless default_subspecs.include? subname

  default_attributes = subspec.attributes_hash

  default_attributes.each do |key, value|
    dependencies.merge!(value) if key == 'dependencies'
    libraries |= value if key == 'libraries'
    frameworks |= value if key == 'frameworks'
    pod_target_xcconfig.merge!(value) if key == 'pod_target_xcconfig'
  end
end
dependencies.delete_if { |dependency| dependency.include? "#{@name}/" }
write('dependencies', dependencies) unless dependencies.empty?
write('libraries', libraries) unless libraries.empty?
write('frameworks', frameworks) unless frameworks.empty?
write('pod_target_xcconfig', pod_target_xcconfig) unless pod_target_xcconfig.empty?

# 写入自身静态包引用
@file.syswrite("\ts.vendored_frameworks = \"#{@name}/#{@name}.framework\"\n")
@file.syswrite("\ts.resource = \"#{@name}/#{@name}.bundle\"\n")

@file.syswrite("end\n")
@file.close
