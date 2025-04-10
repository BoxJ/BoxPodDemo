Pod::Spec.new do |s|
  s.name             = 'BoxAttemptSDK'
  s.version          = '1.0.0'
  s.summary          = '井良测试库.'
  s.description      = '封装了井良的测试代码'

  s.homepage         = 'https://github.com/BoxJ/BoxPodDemo.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BoxJing' => 'dzjingliang@gmail.com' }
  s.source           = { :git => 'git@github.com:BoxJ/BoxPodDemo.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.subspec 'Resource' do |resource|
    resource.source_files = [
      'BoxAttemptSDK/Resource/*',
    ]
    resource.public_header_files = [
      'BoxAttemptSDK/Resource/*.h',
    ]
    resource.resource_bundles = {
      'BoxAttemptSDK' => [
#        'BoxAttemptSDK/Assets/**/*.{png, jpg}',
        'BoxAttemptSDK/Localizations/**/*'
      ]
    }

    resource.dependency 'JMResource'
    resource.dependency 'JMTheme'
    resource.dependency 'JMUIKit'
  end
  
  s.subspec 'Core' do |core|

    core.source_files = [
      'BoxAttemptSDK/Core/**/*',
    ]
    core.public_header_files = [
      'BoxAttemptSDK/Core/*/*.h',
    ]
   
    
    core.dependency 'JMBusiness'
    core.dependency 'JMUtils'
    core.dependency 'JMUIKit'
    core.dependency 'JMFlyer'
    core.dependency 'JMRisk'
    core.dependency 'JMRktCommon'
    core.dependency 'JMRktRequest'
    core.dependency 'JMRktInfo'

    core.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.default_subspec = ['Core', 'Resource']
  
  s.static_framework = true
end
