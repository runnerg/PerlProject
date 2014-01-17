#!/usr/bin/perl - 
# shebang construct(#!)
# this is a program demonstrating all available data types in perl
# there are 3 types of data types in perl: 1. scalars 2. arrays 3. hashes
use warnings;

# scalar variables -- dynamically typed and dynamic casted
# wherever a scalar is used it is always preceded by a dollar sign
#scalar
print "Scalar variables output \n\n";
$x = 25;             		# An integer assignment
$s = "this is the first string";   	# A string 
$s2 = "this is the second string";
$salary = 1445.50;     		# A floating point
print "x = $x \n";
print "Stirng = $s \n";
print "Salary = $salary \n";

print "Scalar X + 5 = "; 
print $x + 5  ."\n";
print $salary + 5.0 ."\n";

$concat = $s ."\t". $s2;
print "$concat \n";

print "Please enter first number:\n";
$n1 = <STDIN>; # STDIN is an abbreviation for standard input
chomp $n1; # chomp the \n

print "Please enter second number:\n";
$n2 = <STDIN>; 
chomp $n2;

$sum = $n1 + $n2; # there are different types of operators like +, -, *, /, %, **

print "The sum is $sum.\n";

# arrays
print "\n\nArray variables Output \n\n";
@arrayNames = ("Pratik", "Hassan", "Xinghe", "Franklin");

$i = 0;
# print our names
while ( $i < 4 ) {
	print "$i 	$arrayNames[ $i ]\n";
	++$i;
}

print "the last member of the group is $arrayNames[3]\n";

@copy = @arrayNames;
$size = @arrayNames;

print "Given names are : @copy\n";
print "Number of names are : $size\n";

# push, pop, shift, unshift functions of the arrays
# use push to insert elements at the end of the array
for ( $i = 1; $i <= 5; ++$i ) {
	push (@array, $i);
	print "@array\n";
}

# use pop to remove elements
while ( @array ) {
	$firstTotal += pop( @array );
	print "@array\n";
}

print "\$firstTotal = $firstTotal\n\n";

# use unshift to insert elements at the front of @array
for ( $i = 1; $i <= 5; ++$i ) {
	unshift( @array, $i );
	print "@array\n";
}

# use shift to remove excess elements
while ( @array ) {
	$secondTotal += shift( @array );
	print "@array\n";
}

print "\$secondTotal = $secondTotal\n";

# hash
print "\n\nHash variables Output \n\n";
%hash = ( width => '400', 
			height => '200',
				color => 'blue',
					length => '100' );

print "\$hash { 'width' } = $hash{ 'width' }\n";
print "\$hash { 'height' } = $hash{ 'height' }\n";
print "\$hash { 'color' } = $hash{ 'color' }\n";
print "\$hash { 'length' } = $hash{ 'length' }\n\n";

# functions of hash: keys, values, each and reverse 
@keys = keys( %hash );

while ( $key = pop( @keys ) ){ # function key returns a list of all the keys in the hash
	print "$key => $hash{ $key }\n";
}

@values = values( %hash );
print "\nThe values of the hash are:\n@values\n\n"; # will output: 400 200 blue 100

# reverse the hash and use function each to get each pair
print "%hash with its keys and values reversed\n";
%hash = reverse( %hash );

while ( ( $key, $value ) = each( %hash ) ) { # function each keeps track of its location in the hash, so every call to this function returns a new key-value pair
	print "$key => $value\n";
}