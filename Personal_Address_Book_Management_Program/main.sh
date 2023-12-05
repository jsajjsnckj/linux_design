#!/bin/bash

# 定义函数实现不同的功能，比如添加联系人、查找联系人、编辑联系人等

# 主程序
while true; do
  clear
  echo "欢迎使用个人通讯录管理程序"
  echo "1. 添加联系人"
  echo "2. 查找联系人"
  echo "3. 编辑联系人"
  echo "4. 删除联系人"
  echo "5. 显示所有联系人"
  echo "0. 退出程序"
  read -p "请输入您的选择：" choice

  case $choice in
    1)
      # 调用添加联系人函数
	read -p "input type : " type
	read -p "    input name: " name
	read -p "    input relation: " relation
	read -p "    input phone: " phone
	read -p "    input notes: " notes
      	chmod +x addAddress.sh
	./addAddress.sh $type $name $relation $phone $notes
      ;;
    2)
      # 调用查找联系人函数
      	./selectAddress.sh
      ;;
    3)
      # 调用编辑联系人函数
       ./updateAddress.sh
      ;;
    4)
      # 调用删除联系人函数
       ./delAddress.sh
      ;;
    5)
      # 调用显示所有联系人函数
       	chmod +x showAddress.sh
	./showAddress.sh
      ;;
    0)
      echo "谢谢使用，再见！"
      exit 0
      ;;
    *)
      echo "无效的选择，请重新输入"
      ;;
  esac

  read -p "按任意键继续..."
done
