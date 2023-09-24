# Get input file name from the user
# Create that file
# Print permissions of this file i.e. rw-r–r–
# You have to split these permissions further in following format:
# User has read and write permissions
# Group has read permissions
# Others have read permissions
# Ask user if they would like to change any permissions -> Y or N
# If Y then 
# ask which permissions they would like to change for user? rwx
# ask which permissions they would like to change for group? rwx
# ask which permissions they would like to change for others? Rwx
# Convert these rwx into 111 (binary format) for user, group, and others
# Change these permissions
# If N then dont do anything
# Print permissions of this file again to make sure changes are reflected i.e. rw-r–r–

# Code:

echo "enter the filename: "
read file
touch $file

filepermission=`ls -al $file`
echo "$filepermission"

word="$filepermission"
fp=${word:1:10}
echo $fp

user_permission="${fp:0:3}"
echo "$user_permission"


if [ ${user_permission:0:1} == "r" ]
then
    echo "User has read permission"
else
    echo "User do not have read permission"
fi

if [ ${user_permission:1:1} == "w" ]
then
    echo "User has write permission"
else
    echo "User do not have write permission"
fi

if [ ${user_permission:2:1} == "x" ]
then
    echo "User has execute permission"
else
    echo "User do not have execute permission"
fi


group_permission="${fp:3:3}"
echo "$group_permission"

if [ ${group_permission:0:1} == "r" ]
then
    echo "group has read permission"
else
    echo "group do not have read permission"
fi

if [ ${group_permission:1:1} == "w" ]
then
    echo "group has write permission"
else
    echo "group do not have write permission"
fi

if [ ${group_permission:2:1} == "x" ]
then
    echo "group has execute permission"
else
    echo "group do not have execute permission"
fi

others_permission="${fp:6:3}"
echo "$others_permission"

if [ ${others_permission:0:1} == "r" ]
then
    echo "others has read permission"
else
    echo "others do not have read permission"
fi

if [ ${others_permission:1:1} == "w" ]
then
    echo "others has write permission"
else
    echo "others do not have write permission"
fi

if [ ${others_permission:2:1} == "x" ]
then
    echo "others has execute permission"
else
    echo "others do not have execute permission"
fi

read -p "Do you need to change permission?(Y/N): " choice
echo "$choice"

if [ $choice == "Y" ] || [ $choice == "y" ]
then 
    read -p "which permission would you like to change for user?(rwx): " new_user_permission
    read -p "which permission would you like to change for group?(rwx): " new_group_permission
    read -p "which permission would you like to change for others?(rwx): " new_others_permission    
else
    echo "no permissions were changed, existing permissions: $fp"
fi

echo $new_user_permission
echo $new_group_permission
echo $new_others_permission

convert_to_digits() {
    local permissions=$1
    local digits=0

    for ((i = 0; i < ${#permissions}; i++)); do
        char="${permissions:i:1}"
        if [ "$char" == "r" ]; then
            digits=$(($digits + 4))
        fi
        if [ "$char" == "w" ]; then
            digits=$(($digits + 2))
        fi
        if [ "$char" == "x" ]; then
            digits=$(($digits + 1))
        fi
    done
    echo $digits

}

new_user_digits=$(convert_to_digits "$new_user_permission")
echo $new_user_digits

new_group_digits=$(convert_to_digits "$new_group_permission")
echo $new_group_digits

new_others_digits=$(convert_to_digits "$new_others_permission")
echo $new_others_digits

echo chmod "${new_user_digits}${new_group_digits}${new_others_digits}" "$file"
chmod "${new_user_digits}${new_group_digits}${new_others_digits}" "$file"
if [ $? -eq 0 ]; then
    echo "Permissions updated successfully"
else
    echo "Permissions not updated successfully."
fi

filepermission=$(ls -al "$file")
echo "Updated permissions of $file:"
echo "$filepermission"

rm $file
