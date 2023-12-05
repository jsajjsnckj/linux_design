#!/bin/bash

# 逐行读取文件
line_index=1
while IFS= read -r line
do
    # 使用空格分割每行的字段
    read -r -a fields_array <<< "$line"
     # 获取数组的长度并输出
    array_length=${#fields_array[@]}
    if [ $array_length -eq 3 ];then
	echo "TYPE"
	echo "field 1: ${fields_array[0]}"
	echo "filed 2: ${fields_array[1]}"
        echo "field 3: ${fields_array[2]}"
    elif [ $array_length -eq 5 ];then
    	echo "DATA"
   	echo "field 1: ${fields_array[0]}"
   	echo "filed 2: ${fields_array[1]}"
    	echo "field 3: ${fields_array[2]}"
    	echo "filed 2: ${fields_array[3]}"
        echo "field 3: ${fields_array[4]}"
    else
	echo "data readError"
    fi
    line_index=$((line_index+1))
done < data.txt


