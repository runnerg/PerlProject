#!/usr/bin/perl
# This program demonstrates a working marble clock in Perl
# It produces an iterative cycle for every minute of the Marble CLock
# The user must press enter to print the next iteration
# 10-27-2013

use warnings;

sub printTrays 
{
	print "oneMin: ";
	for($i=0;$i<@oneMin;$i++)
	{
		print "$oneMin[$i] ";
	}
	print "\n";
	
	print "fiveMins: ";
	for($i=0;$i<@fiveMins;$i++)
	{
		print "$fiveMins[$i] ";
	}
	print "\n";
	
	print "fifteenMins: ";
	for($i=0;$i<@fifteenMins;$i++)
	{
		print "$fifteenMins[$i] ";
	}
	print "\n";
	
	print "hours: ";
	for($i=0;$i<@hours;$i++)
	{
		print "$hours[$i] ";
	}
	print "\n";
	
	print "reservoir: ";
	for($i=0;$i<@reservoir;$i++)
	{
		print "$reservoir[$i] ";
	}
	print "\n\n";
}
#--------------------------------------------------------------------------------------------------------------

# assign the default value to $continue
$continue = "y";
# conditional check to let the user determine how many times the marble clock is run 

$marbles = 0;
while( $marbles<20 )
 {
	print "Number of marbles(>=20): "; # get input from user.
	$marbles = <>;
 }
 # initialize arrays 
@reservoir = ();
	

for( 1..$marbles ) # enqueues the marbles
 {
	push( @reservoir, $_ )
 }

while( $continue ne "n" )  
{
	# initialize number of marbles - runs initial while loop check 
 	if( @oneMin != 4 ) # length of the @oneMin tray is 4 ( 1, 2, 3, 4 )
	{
		push( @oneMin, shift( @reservoir ) ); # add to @oneMin tray
		&printTrays;
	}
	else
	{
		for($j=0;($j<4)&&($continue ne "n");$j++) # unload 1st tray
		{
			push( @reservoir, pop( @oneMin ) );
			&printTrays;
			chomp($continue = <>);
		}
			
		if( @fiveMins != 2 ) # length of @fiveMins tray is 2 ( 5 and 10 )
		{
			push( @fiveMins , shift( @reservoir ) );
			&printTrays;
		}
		else
		{
			for( $j=0;$j<2&&($continue ne "n");$j++ ) # unload second tray
			{
				push( @reservoir, pop( @fiveMins ) );
				&printTrays;
				chomp($continue = <>);
			}
				
			if( @fifteenMins != 3 ) # length of @fifteenMins tray is 3 ( 15, 30, 45 )
			{
				push( @fifteenMins, shift( @reservoir ) );
				&printTrays;
			}
			else
			{
				for($j=0;$j<3&&($continue ne "n");$j++) # unload third tray
				{
					push( @reservoir, pop( @fifteenMins ) );
					&printTrays;
					chomp($continue = <>);
				}
					
				if( @hours != 11 ) # length of @hours tray is 11 ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 )
				{
					push( @hours, shift( @reservoir ) );
					&printTrays;
				}
				else
				{
					for($j=0;$j<11&&($continue ne "n");$j++) # unload fourth and final tray
					{
						push( @reservoir, pop( @hours ) );
						&printTrays;
						chomp($continue = <>);
					}	
				}
			}
		}
	}
	 	
 	#print "Continue?(Press n to quit): "; # ask the user to continue or quit
	chomp($continue = <>);
	print "\n";
}