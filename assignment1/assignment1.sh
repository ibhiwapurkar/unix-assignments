echo "Please enter your name: "
read name
echo "Hello $name"
echo "Enter First number: "
read num1
echo "First number is: $num1"
echo "Enter Second number: "
read num2
echo "Second number is: $num2"
sum=$((num1 + num2))
sub=$((num1 - num2))
mul=$((num1 * num2))
div=$((num1 / num2))
echo "Addition is: $sum"
echo "Subtraction is: $sub"
echo "Multiplication is: $mul"
echo "Division is: $div"
