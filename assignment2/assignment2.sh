# ask user to enter a directory name 1
# ask user to enter a directory name 2
# ask user to enter a file name
# Create dir1 and dir2
# Create file using this file name under directory 1
# Insert following two lines in this file
# This is the first line
# This is the second line
# Print contents of this file
# Copy this file from directory 1 to directory 2
# Insert this line in this new file in directory 2
# This is the third line
# Print contents of this new (copied) file

# Code:

echo "enter a directory name 1: "
read dir1
echo "The directory name 1 is $dir1."
echo "enter a directory name 2: "
read dir2
echo "The directory name 2 is $dir2."

echo "enter a file name: "
read filename
echo "$filename"

mkdir -p $dir1 $dir2
touch $dir1/$filename

echo "This is the first line" > $dir1/$filename
echo "This is the second line" >> $dir1/$filename

cat $dir1/$filename

cp $dir1/$filename $dir2/filename_copy

echo "This is the third line" >> $dir2/filename_copy

cat $dir2/filename_copy
