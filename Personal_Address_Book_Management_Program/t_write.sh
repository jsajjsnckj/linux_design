# 要插入的行数（例如，在第5行之后插入）
line_number=5
type_id=$1
name=$2
relation=$3
phone=$4
notes=$5
# 在指定行数之后插入新数据
sed -i "${line_number}a d_${type_id} ${name} ${relation} ${phone} ${notes}" data.txt

