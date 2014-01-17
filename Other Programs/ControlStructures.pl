#!/usr/bin/perl - 
#shebang construct(#!)
# this is a program demonstrating all available control structures in perl
# there are 11 available control stuctures: 1. sequence 2. if 3. unless 4. if/else 5. if/elsif/else 6. while 7. until 8. do/while 9.  do/until 10. for 11. foreach
# these control structures can be combined in only two ways: 1. control-structure stacking 2. control-structure nesting
# every perl control structure must use {} to enclose the body of the loop
use warnings; 

# if and unless Selection structures
print "You earn a bonus if you worked more than 40 hours this week.\n";
print "How many hours did you work this week?\n";
$hours = <STDIN>; # get input from user

# if statement occurs if condition is ture
if ( $hours > 40 ) {
	print "You earned your bonus!\n";
}

# if only one task is to be completed when a condition is met, such as in a print statement, perl allows to be written like this:
print "You work too much!\n" if $hours >= 100; # this if statement is identical to the one above

# unless statement occurs if condition is false
unless ( $hours > 40 ) {
	print "You did not earn your bonus\n";
}

# can also be written in one line like the if statement above
print "You work too little!\n" unless $hours >= 20;

# if/else statement
print "\nYou earn another bonus if you sold more than 10 computers this week.\n";
print "How many computers did you sell this week?\n";
$sales = <>;

if ( $sales > 10 ) {
	print "You earned the sales bonus!\n";
}
else {
	print "You did not earn the sales bonus\n";
}

# conditional operator (?:), Perl's only ternary operator; it takes three operands, The operands together with the conditional operator, form a conditional expression.
# the first operand is a condition, the second operand is the value for the entire conditional expression if the condition is true, and the third operand is the value for the entire conditional expression if the condition is false
print ( $sales > 0 ? "You managed to sell some computers, you will still have a job next week\n" :
				"You didn't sell any computers, you are fired\n" );

# ^ can also be rewritten like this:
$sales >= 25 ? print "Wow you did great this week! You will be promoted soon!\n" :
			   print "Keep up the good work!\n";

# if/elsif/else statement tests multiple cases
if ( $sales >= 25 ) {
	print "\$2,000 bonus!\n";
}
elsif ( $sales >= 15 ) {
	print "\$1,000 bonus!\n";
}
elsif ( $sales > 10 ) {
	print "\$500 bonus!\n";
}
else {
	print "Maybe next week you can get a bonus\n"; 
}

# while loop repeats while its condition is true
$num = 0;
while ( $num <= 3 ) {
	$num += 1; # increments by one until 3
}

# until loop is the opposite of while. Repeats while its condition is false
until ( $num > 3 ) {
	$num += 1; # increments by one until 3 
}

# do/while & do/until tests loop-continuation after the body of the loop is performed. The body of the loop is performed at least once.
print "\ndo while example:\n";
$count = 1;
do {
	print "$count ";
} while ( ++$count <= 5 ); # do/while

print "\ndo until example:\n";

$count = 5;
do {
	print "$count ";
} until ( --$count == 0 ); # do/until

print "\n\nFor loop example:\n";

# for repetition structure
# more appropriate when looping through an array of elements
@array = ("", "Pratik", "Hassan", "Xinghe", "Franklin");

for ( $i = 1; $i < 5; ++$i ) {
	print "Group member $i\: $array[ $i ]\n";
}

print "\nforeach iteration example:\n";

# foreach repetition structure allows a programmer to iterate over a list of values, accessing and manipulating each element.
@set = ( 1 .. 15 );

foreach $number ( @set ) {
	$number **= 2;
}

print "1-15 squared: @set\n";

# loop controls: next
print "\nNext control example\n";

@list = ( 1 .. 5 );
foreach $x ( @list ) {
	
	if ( $x == 3 ) {
		$skipped = $x; # store 3, the skipped value
		next; # skip remaining code in loop only if $_ is 3
	}
	else {
		print "$x ";
	}
}

print "\nUsed 'next' to skip the value $skipped.\n\n";

# loop controls: last
print "Last control example\n";
foreach $x ( @list ) {
	
	if ( $x == 3 ) {
		$number = $x; # store the current value before loop ends
		last; # jump to end of foreach structure
	}
	else {
		print "$x ";
	}
}

print "\nUsed 'last' to terminate loop at $number.\n\n";

# loop controls: redo 
print "Redo control\n";
$n1 = 1;

while ( $n1 <= 5 ) {

	if ( $n1 <= 10 ) {
		print "$n1 ";
		++$n1;
		redo; # continue loop without testing ( $n1 <= 5 )
	}
}

print "\nStopped when \$n1 became $n1.\n\n";

print "Single Block Label example\n";
# single block label - describes a block of code and acts as a target for the loop control commands next, last, and redo. 
LOOP: for ( $number = 1; $number <= 15; ++$number ) {
	next LOOP if ( $number % 2 == 0 );
	print "$number "; # displays only odd numbers from 1 - 15
}

print "\n\nMultiple Block Label example\n";
# multiple block label
OUTER: foreach $row ( 1 .. 10 ) {

	INNER: foreach $column ( 1 .. 10 ) {

		if ( $row < $column ) {
			print "\n";
			next OUTER;
		}

		print "$column ";
	}
}

print "\n\nBare Block example\n";
# bare blocks - a block of code enclosed by curly braces, with or without a label, but with no accompanying control-structure keyword. 'next' is equivalent to 'last' in a bare-block context
print "What number am I thinking of? Guess a number between 1 and 3: ";
$guess = <STDIN>;

BLOCK: { # start of bare block
	if ( $guess == 1 ) {
		print "You guessed it!\n";
		last BLOCK; # jump to the end of the block
	}
	if ( $guess == 2 ) {
		print "You are close!\n";
		last BLOCK;
	}
	if ( $guess == 3 ) {
		print "Nope, that's not right!\n";
		last BLOCK;
	}
	#default case if $guess isn't 1, 2, or 3
	{
		print "Guess again a new number between 1 and 3!: ";
		$guess = <STDIN>;
		redo BLOCK;
	}
}

# Error functions: die - terminate program execution and prints a message
print "\nChoose a positive number (input a negative number to show the 'die' error message): ";
$z = <STDIN>;
unless ( $z > 0 ) {
	die "Error: You didn't read my instructions!\nThis program will now terminate!\nGoodbye\n";
}

#Error functions: warn - produces same output as 'die' but program execution continues
print "Choose a negative number (input a positive number to show the 'warn' error message): ";
$a = <STDIN>;
unless ( $a < 0 ) {
	warn("Error: You didn't read my instructions!\nThis program will still continue\n");
}

print "\n\nEnd of control structures program\n";