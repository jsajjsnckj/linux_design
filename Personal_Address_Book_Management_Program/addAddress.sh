echo "args is $* "
type_name=$1
#读取文件获取insert_line
line_index=1
insert_line=0
is_new_type=1
while IFS= read -r line
do
    # 使用空格分割每行的字段
    read -r -a fields_array <<< "$line"
     # 获取数组的长度并输出
    array_length=${#fields_array[@]}
     # 判断如果是类型，且存在
    if [ $array_length -eq 3 ] && [ "${fields_array[1]}" == "$type_name" ]; then
        insert_line=$((line_index+${fields_array[2]}))
        #更新人员数量
        new_type_line="${fields_array[0]} ${fields_array[1]} $((fields_array[2]+1))"
        sed -i "${line_index}s/.*/${new_type_line}/" data.txt
        #echo "update type_num"
	is_new_type=0
	break
    fi
    line_index=$((line_index+1))
done < data.txt
#==========================
type_id=${fields_array[0]:2}
name=$2
relation=$3
phone=$4
notes=$5
#echo "$line_index"
#如果是新的类型就添加
if [ $is_new_type -eq 1 ]; then
	type_id=$((type_id+1))
        line_index=$((line_index-1))
	sed -i "${line_index}a t_${type_id} ${type_name} 1" data.txt
	insert_line=$((line_index+1))
fi
sed -i "${insert_line}a d_${type_id} ${name} ${relation} ${phone} ${notes}" data.txt
#echo "insert data"
#echo "${insert_line}a d_${type_id} ${name} ${relation} ${phone} ${notes}"
