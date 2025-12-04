result=$(echo "scale=10; s(3.0)" | bc -l | sed 's/\\//' | tr -d '\n' | tr -d '.')
numbers=1400

echo -n "3."
for size in $(seq 0 $numbers); do
#	echo "DEBUG: $result		$size		$num"
	num=$num$(echo -n ${result:$size} | head -c1)
	printf "$(echo -n ${result:$size} | head -c1)"
	result=$(echo "scale=$(($size + 10)); s(3.$num)" | bc -l | sed 's/\\//' | tr -d '\n' | tr -d '.')
done
echo

#wikipedia PI
echo "3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692"
