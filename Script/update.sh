echo "\n"
echo "---------------------------------"
echo "| $0 start "
echo "---------------------------------"

#自定义参数
SDK_VERSION=$1

if [ ! ${SDK_VERSION} ];then
    echo "请输入SDK版本号"
    exit
fi

#本地参数
NAME=`ppl scan name`
REMOTE=`ppl scan remote`
BRANCH=`ppl scan branch`
CONFIG_PATH=./${NAME}/Env/**/*/*Env.h

ls ${CONFIG_PATH}

#更新项目文件中的版本号
sed -i "" s/"#define ${NAME}_Version .*"/"#define ${NAME}_Version @\"${SDK_VERSION}\""/g ${CONFIG_PATH}

#提交修改
if [[ `git status | grep "${HEADER_PATH##*/}"` || `git status | grep "${CONFIG_PATH##*/}"` ]]; then
    git add ${CONFIG_PATH}
    git commit -m "-- < SDK : ${SDK_VERSION} > --"
    git push -u ${REMOTE} ${BRANCH}
fi
