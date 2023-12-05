#!/bin/bash

# 逐行读取文件
line_index=1
while IFS= read -r line
do
    # 使用空格分割每行的字段
    read -r -a args <<< "$line"
     # 获取数组的长度并输出
    array_length=${#args[@]}
    if [ $array_length -eq 3 ];then
        echo "type:${args[1]},total:${args[2]}"
    	echo -e "      type_id\tname\trelation\tphone\tnotes"
    elif [ $array_length -eq 5 ];then
        echo -e "      ${args[0]:2}\t${args[1]}\t${args[2]}\t${args[3]}\t${args[4]}"
    else
        echo "data readError"
    fi
    line_index=$((line_index+1))
done < data.txt
