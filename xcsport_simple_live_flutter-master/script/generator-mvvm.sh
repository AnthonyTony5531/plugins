#!/bin/bash

echo "-------------- 请选择state类型：1.stateful 2.stateless  --------------"
read -p 'state类型编号：' stateType

echo "-------------- 请选择类型：1.page 2.view 3.itemview --------------"
read -p 'view类型编号：' type

vFilename="page"
sFilename="page_style"
vmFilename="page_view_model"
classUpper="Page"
vmUpper="PageViewModel"
styleUpper="PageStyle"

if [[ ${type} = "2" ]]
then
    vFilename="view"
    sFilename="view_style"
    vmFilename="view_model"
    classUpper="View"
    vmUpper="ViewModel"
    styleUpper="ViewStyle"
elif [[ ${type} = "3" ]]
then
    vFilename="item_view"
    smFilename="item_view_style"
    vmFilename="item_view_model"
    classUpper="ItemView"
    vmUpper="ItemViewModel"
    styleUpper="ItemViewStyle"
else
    vFilename="page"
    sFilename="page_style"
    vmFilename="page_view_model"
    classUpper="Page"
    vmUpper="PageViewModel"
    styleUpper="PageStyle"
fi

echo "选择了：$vFilename"

echo "-------------- 给类取名（支持下划线，例：user_info_header） --------------"
read -p $'例如：取名index，自动生成index文件夹 \n文件夹内自动生成【index_page(view/item).dart】【index_style.dart】【index_view_model.dart】)：\n' class

#echo "-------------- 老铁，用一句话简述当前类是干什么的  --------------"
#read -p '注释内容：' note

# 脚本当前文件路径
basePath=$(cd `dirname $0`; pwd)
mkdir ${basePath}/${class}
cd ${basePath}/${class}

# 首字母大写转化
upperClass=""
char="_"
if [[ $(echo ${class} | grep "${char}") != "" ]]
  then
    array=(${class//_/ })
    for var in ${array[@]}
    do
       firstClass=$(echo ${var:0:1} | tr '[a-z]' '[A-Z]')
       upperClass=${upperClass}${firstClass}${var:1}

    done
else
  firstClass=$(echo ${class:0:1} | tr '[a-z]' '[A-Z]')
  upperClass=${firstClass}${class:1}
fi

echo "文件路径：${basePath}/${class}"
echo "view类名：${upperClass}${classUpper}"

place1="{class}"
place2="{View}"
place3="{VM}"
place4="{Style}"
place5="{notes}"
place6="{style_file}"
place7="{vm_file}"


dirName="stateful"
if [[ ${stateType} = "2" ]];
then
   dirName="stateless"
fi


sed "s/${place6}/${class}_${sFilename}/g" ${basePath}/${dirName}/view.txt >> ${class}_${vFilename}.dart
sed "s/${place6}/${class}_${sFilename}/g" ${basePath}/${dirName}/style.txt >> ${class}_${sFilename}.dart
sed "s/${place6}/${class}_${sFilename}/g" ${basePath}/${dirName}/view_model.txt >> ${class}_${vmFilename}.dart

sed -i '' -e "s/${place7}/${class}_${vmFilename}/g" ${class}_${vFilename}.dart

sed -i '' -e "s/${place2}/${upperClass}${classUpper}/g" ${class}_${vFilename}.dart
sed -i '' -e "s/${place2}/${upperClass}${classUpper}/g" ${class}_${sFilename}.dart
sed -i '' -e "s/${place2}/${upperClass}${classUpper}/g" ${class}_${vmFilename}.dart

sed -i '' -e "s/${place3}/${upperClass}${vmUpper}/g" ${class}_${vFilename}.dart
sed -i '' -e "s/${place3}/${upperClass}${vmUpper}/g" ${class}_${sFilename}.dart
sed -i '' -e "s/${place3}/${upperClass}${vmUpper}/g" ${class}_${vmFilename}.dart

sed -i '' -e "s/${place4}/${upperClass}${styleUpper}/g" ${class}_${vFilename}.dart
sed -i '' -e "s/${place4}/${upperClass}${styleUpper}/g" ${class}_${sFilename}.dart
sed -i '' -e "s/${place4}/${upperClass}${styleUpper}/g" ${class}_${vmFilename}.dart


#sed -i '' -e "s/${place5}/${note}/g" ${class}_${vFilename}.dart

exit 0