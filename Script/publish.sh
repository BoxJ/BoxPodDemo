echo "\n"
echo "---------------------------------"
echo "| $0 start "
echo "---------------------------------"

#自定义参数
VERSION=$1

#本地参数
LOCAL_PATH=${0%/*}

#保存修改
git add .
git stash

#发布内容
sh ${LOCAL_PATH}/publish_source.sh ${VERSION}
if [ $? != 0 ];then 
    echo "源码发布失败"
    exit 1
fi
sh ${LOCAL_PATH}/publish_static.sh
if [ $? != 0 ];then 
    echo "静态库发布失败"
    exit 1
fi

#调出修改
git stash pop

echo "---------------------------------"
echo "| $0 final "
echo "---------------------------------"
echo "\n"

exit 0
