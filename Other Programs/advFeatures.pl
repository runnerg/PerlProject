#!/usr/bin/perl - 
#shebang construct(#!)
# this is a program demonstrating unique advanced features of Perl
use warnings; 

# recursive subroutine 
foreach ( 0 .. 10 ) { # call function factorial for each of the numbers from 0 through 10 and display results
	print "$_! = " . factorial( $_ ) . "\n";
}

sub factorial
{
	my $number = shift; # get the argument

	if ( $number <= 1 ) { # base case
		return 1;
	}
	else { # recursive step
		return $number * factorial( $number - 1 );
	}
}

# implementing stacks and queues

my ( @stack, @queue );
print( "Using the stack:\nPush 1 to 20\n" );

for ( 1 .. 20 ) {
	push( @stack, $_ );
}

print( "Pop the top 10 elements: " );

for ( 1 .. 10 ) {
	print( pop( @stack ), " " );
}

print( "\nPush 21 to 25\n" );

for ( 21 .. 25 ) {
	push( @stack, $_ );
}

print( "Pop remaining elements: " );

while ( @stack ) {
	print( pop( @stack ), " " );
}

print( "\n\nUsing the queue:\nEnqueue 1 to 20\n" );

for ( 1 .. 20 ) {
	push( @queue, $_ );
}

print( "Dequeue first 10 elements: " );

for ( 1 .. 10 ) {
	print( shift( @queue ), " " );
}

print( "\nEnqueue 21 to 25...\n" );

for ( 21 .. 25 ) {
	push( @queue, $_ );
}

print( "Dequeue remaining elements: " );

while ( @queue ) {
	print( shift( @queue ), " " );
}

print "\n";