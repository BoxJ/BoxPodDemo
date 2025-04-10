echo "\n"
echo "---------------------------------"
echo "| $0 start "
echo "---------------------------------"

#自定义参数

#本地参数
LOCAL_PATH=${0%/*}
NAME=`ppl scan name`
VERSION=`ppl scan version`
REPO_NAME="jm-sdk-ios-pod-specs"
REPO_PATH="jm-sdk/pods"
CODING_USER=`git config --get coding.user.pub`
CODING_SOURCE="https://jiamiantech-generic.pkg.coding.net/${REPO_PATH}/${NAME}.zip?version=${VERSION}"
CODING_SOURCE_LATEST="https://jiamiantech-generic.pkg.coding.net/${REPO_PATH}/${NAME}.zip"

#配置环境
cd Example
E=Release pod install
if [ $? != 0 ];then
    echo "pod install 失败"
    exit 1
fi
cd ..

#构建项目
echo "执行构建：${NAME}-${VERSION}"
ppl build --arch=arm64
if [ ! -f "${NAME}-${VERSION}/${NAME}.framework/${NAME}" ];then
    echo "Error-构建失败"
    exit 1
fi

#恢复环境
cd Example
pod install
if [ $? != 0 ];then
    echo "pod install 失败"
    exit 1
fi
cd ..

git add "Example/Podfile.lock"
git commit -m "pod install"

#构建podspec
echo "执行构建：${NAME}-${VERSION}/${NAME}.podspec"
ruby ${LOCAL_PATH}/build_spec.rb . ${NAME}-${VERSION} ${CODING_SOURCE}
if [ ! -f "${NAME}-${VERSION}/${NAME}.podspec" ];then
    echo "Error-构建podspec失败"
    exit 1
fi

#创建pod目录
cd ${NAME}-${VERSION}
mkdir ${NAME}
cp -r ${NAME}.framework ${NAME}
cp -r ${NAME}.bundle ${NAME}
cp ../LICENSE ./
cp ../README.md ./

#压缩 上传
echo "压缩 ${NAME}.zip"
zip -r ${NAME}.zip ${NAME} ./LICENSE ./README.md
echo "上传 ${NAME}.zip 到 ${CODING_SOURCE}"
curl -T ${NAME}.zip -u ${CODING_USER} ${CODING_SOURCE}
if [ $? != 0 ];then
    exit 1
fi
echo "上传 ${NAME}.zip 到 ${CODING_SOURCE_LATEST}"
curl -T ${NAME}.zip -u ${CODING_USER} ${CODING_SOURCE_LATEST}
if [ $? != 0 ];then
    exit 1
fi

#发布 到 Coding Pod Repo
echo "发布 ${NAME}.podspec 到 ${REPO_NAME}"

REPO_PATH=`pod repo | grep -o -e "/.*/repos/${REPO_NAME}"`
REPO_SPEC_PATH=${REPO_PATH}/${NAME}/${VERSION}

mkdir -p ${REPO_SPEC_PATH}
cp ./${NAME}.podspec ${REPO_SPEC_PATH}
cd ${REPO_PATH}
git add .
git commit -m "Update ${NAME} ${VERSION}"
git push origin master

echo "---------------------------------"
echo "| $0 final "
echo "---------------------------------"
echo "\n"

exit 0
