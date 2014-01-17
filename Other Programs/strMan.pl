#!/usr/bin/perl - 
#shebang construct(#!)
use warnings; 
use strict;

# This is case of interpolation.
my $str1 = "example 1 \nitcs 4102/5102 spl";
print "$str1\n";

# This is case of non-interpolation.
$str1 = 'example 1 \nitcs 4102/5102 spl';
print "$str1\n";

# Only e will become upper case.
$str1 = "\uexample 1 itcs 4102/5102 spl";
print "$str1\n";

# \U: Whole line will become capital.
$str1 = "\Uexample 1 itcs 4102/5102 spl";
print "$str1\n";

# \U...\EA portion of line will become capital.
$str1 = "example 1 \Uitcs 4102/5102 \Espl"; 
print "$str1\n";

# Backsalash non alpha-numeric including spaces.
$str1 = "\Qexample 1 itcs 4102/5102 survey of programming language's";
print "$str1\n";

my $string = "hello world!\n";
print "The original string: ", 'hello world!\n', "\n\n";

# Using substr
print "Using substr with the string and the offset (2): ";
print substr( $string, 2 );
print "Using substr with the string, offset (2) and length (3): ";
print substr( $string, 2, 3 ), "\n";
print "Using substr with offset (-6), and length (2): ";
print substr( $string, -6, 2 ), "\n";
print "Using substr with offset (-6) and length (-2): ";
print substr( $string, -6, -2 ), "\n\n";

# replace first 5 characters of $string with "bye"
# assign substring that was replaced to $substring
my $substring = substr( $string, 0, 5, "Bye" );

print "The string after the replacement: $string";
print "The substring that was replaced: $substring\n\n";

# convert all letters of $string to uppercase
$string = uc( $string );
print "Uppercase: $string";

# convert all letters of $string to lowercase
$string = lc( $string );
print "Lowercase: $string \n";

# only change first letter to lowercase
$string = lcfirst( $string );
print "First letter changed to lowercase: $string";

# only change first letter to uppercase
$string = ucfirst( $string );
print "First ltter changed to uppercase: $string";

# calculating the length of $string
my $length = length( 'Bye world!\n' );
print "The length of \$string without whitespace: $length \n";

$length = length( "Bye world!\n" );
print "The length of \$string with whitespace: $length \n";

$length = length( $string );
print "The length of \$string (default) is: $length \n";