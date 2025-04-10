echo "\n"
echo "---------------------------------"
echo "| $0 start "
echo "---------------------------------"

#自定义参数
VERSION=$1

if [ VERSION ];then
echo "发布源码，指定版本：${VERSION}"
ppl publish --update-version=${VERSION}\
 --repo=jiamiantech-zy-architecture-ios-jiamianspecs\
 --update-channel=version,git\
 --repo-push-sources=git@gitlab-ee.jiamiantech.com:zy/architecture/ios/jiamianspecs.git,https://mirrors.bfsu.edu.cn/git/CocoaPods/Specs.git\
 --repo-push-allow-warnings
else
echo "发布源码，未指定版本"
ppl publish\
 --repo=jiamiantech-zy-architecture-ios-jiamianspecs\
 --update-channel=version,git\
 --repo-push-sources=git@gitlab-ee.jiamiantech.com:zy/architecture/ios/jiamianspecs.git,https://mirrors.bfsu.edu.cn/git/CocoaPods/Specs.git\
 --repo-push-allow-warnings
fi

echo "---------------------------------"
echo "| $0 final "
echo "---------------------------------"
echo "\n"

exit 0
