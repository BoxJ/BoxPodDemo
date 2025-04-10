#自定义参数
TEMP=temp-base-template

#本地参数
LOCAL_PATH=${0%/*}

git clone git@gitlab-ee.jiamiantech.com:zy/architecture/ios/base-template.git --depth=1 ${TEMP}

cp ${TEMP}/Script/* ${LOCAL_PATH}/

rm -fr ${TEMP}
