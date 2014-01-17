#!/usr/local/bin/perl
## This program demonstrates the Three of A Crime Game in Perl
use Tk;

@criminalNames = ('a', 'b', 'c', 'd','e', 'f', 'g'); # Array of the criminals

$a = int(rand(7)); #Select the random numbers
$b = int(rand(7));
$c = int(rand(7));


while( $b == $a)
{
	$b = int(rand(7));
}
while( $c == $a || $c==$b)
{
	$c = int(rand(7));
}

@ap =($criminalNames[$a],$criminalNames[$b],$criminalNames[$c]); # Array of the actual perpetrators


#--------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------      GUI     -----------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++  Cards Frame  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
my $mw = new MainWindow; # Main Window
$mw->geometry("400x200");

my $frm_cards = $mw -> Frame() -> pack(); #New Frame
my $labNum = $frm_cards -> Label()->pack;
my $lab1 = $frm_cards -> Label()->pack;
my $lab2 = $frm_cards -> Label()->pack;
my $lab3 = $frm_cards -> Label()->pack;
&ShowCard();

my $but_guess = $frm_cards -> Button(-text=>"Guess", -command =>\&Guess) -> pack(-side=>left, -padx => 2);
my $but_showcards = $frm_cards -> Button(-text=>"Show new Cards", -command =>\&ShowCard) -> pack(-side=>left, -padx => 2);
my $but_exit = $frm_cards -> Button(-text => "Exit",-command => sub { exit })-> pack(-side=>left, -padx => 2);
#=========================================================== end of Cards Frame =======================================================


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  Guess Frame  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
my $frm_guess  = $mw -> Frame(); #New Frame
my $label_erorr = $frm_guess -> Label();
my $label_firtGuess = $frm_guess -> Label(-text=>"Enter the first name of actual perpetrators :") -> pack();
my $entry_firstGuess = $frm_guess -> Entry() -> pack();

my $label_secondGuess = $frm_guess -> Label(-text=>"Enter the second name of actual perpetrators :") -> pack();
my $entry_secondGuess = $frm_guess -> Entry() -> pack();

my $label_thirdGuess = $frm_guess -> Label(-text=>"Enter the third name of actual perpetrators :") -> pack();
my $entry_thirdGuess = $frm_guess -> Entry() -> pack();

my $but_enter = $frm_guess -> Button(-text=>"Enter", -command =>\&Result) -> pack(-side=>'left' ,  -fill => 'both',-expand => 1,-pady => 10,-padx => 2);
my $but_exit1 = $frm_guess -> Button(-text=>"Exit",-command => sub { exit })-> pack(-side=>'right',  -fill => 'both',-expand => 1,-pady => 10,-padx => 2);

#========================================================= end of Cards Frame =======================================================


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  Result Frame  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
my $frm_result  = $mw -> Frame(); #New Frame
my $label_resutl = $frm_result -> Label() -> pack();
my $but_exit2 = $frm_result -> Button(-text=>"Exit",-command => sub { exit })-> pack(-side=>'right',  -fill => 'both',-expand => 1,-pady => 10,-padx => 2);
#========================================================= end of Result Frame =========================================================


#--------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------    End of GUI   --------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

MainLoop;


sub ShowCard
{
	my %hash;
	$hash{$_} = undef foreach (@ap);
	@criminalNames1 = grep { not exists $hash{$_} } @criminalNames; # Array of the fake perpetrators
	
	
		
	$j = int(rand(3));

	if($j == 0)
	{
		$actualPerprataro = "No of Actual Perpratator = 1";# Print the No of Actual perpetrators
		
		$a = int(rand(4));
		$b = int(rand(4));
		while($a == $b)
		{
			$a = int(rand(4));
		}
		@card = ($criminalNames1[$a],$criminalNames1[$b],$ap[int(rand(3))]);
	}
	  
	  
	if ($j == 1)
	{
		$actualPerprataro = "No of Actual Perpratator = 2"; # Print the No of Actual perpetrators
		$a = int(rand(3));
		$b = int(rand(3));
		while($a == $b)
		{
			$a = int(rand(3));
		}
		@card = ($ap[$a],$ap[$b],$criminalNames1[int(rand(4))]);
	}
	
	if ($j == 2)
        {
	  $actualPerprataro = "No of Actual Perpratator = 0"; # Print the No of Actual perpetrators
	  $a = int(rand(4));
	  $b = int(rand(4));
	  $c = int(rand(4));
	
	  while( $b == $a)
	   {
		$b = int(rand(4));
	   } 
	
	  while( $c == $a || $c==$b)
	   {
		$c = int(rand(4));
	   }
	
	   @card = ($criminalNames1[$a],$criminalNames1[$b],$criminalNames1[$c]);
        }
	
	#Mix the selected cards.
	$a = int(rand(3));
	$b = int(rand(3));
	$c = int(rand(3));
	
	while( $b == $a)
	{
		$b = int(rand(3));
	}
	
	while( $c == $a || $c==$b)
	{
		$c = int(rand(3));
	}
	
	
	#show the new cards on the GUI
	$labNum -> configure(-text=>$actualPerprataro);
	$lab1 -> configure(-text=>$card[$a]);
	$lab2 -> configure(-text=>$card[$b]);
	$lab3 -> configure(-text=>$card[$c]);
}

sub Guess #change the fram from cards fram to guess fram.
{
	$frm_cards-> packForget();
	$frm_guess-> pack();
}

sub Result
{	
	if ($entry_firstGuess -> get() eq "" || $entry_secondGuess-> get() eq "" || $entry_thirdGuess-> get() eq "" )
	{
		$label_erorr -> configure(-text=>"Please enter a value in all field", -foreground => red);
		$label_erorr -> pack();
	}
	else 
	{
		if (($entry_firstGuess -> get() eq $entry_secondGuess-> get()) || ($entry_secondGuess-> get() eq $entry_thirdGuess-> get()) || ($entry_firstGuess -> get() eq $entry_thirdGuess-> get()))
		{
			$label_erorr -> configure(-text=>"All perpetrators must be different\n\n", -foreground => red);
			$label_erorr -> pack();
		}
		else
		{
			$firstGuess = grep $_ eq $entry_firstGuess -> get(), @criminalNames ; # Search the Actual perpetrators Array for the user input 1
			$secondGuess = grep $_ eq $entry_secondGuess-> get(), @criminalNames ;# Search the Actual perpetrators Array for the user input 2
			$thirdGuess = grep $_ eq $entry_thirdGuess-> get(), @criminalNames ; # Search the Actual perpetrators Array for the user input 3
			if (( $firstGuess == 1 ) && ( $secondGuess == 1 ) && ( $thirdGuess == 1 ) )
			{
				$firstGuess = grep $_ eq $entry_firstGuess -> get(), @ap ; # Search the Actual perpetrators Array for the user input 1
				$secondGuess = grep $_ eq $entry_secondGuess-> get(), @ap ;# Search the Actual perpetrators Array for the user input 2
				$thirdGuess = grep $_ eq $entry_thirdGuess-> get(), @ap ; # Search the Actual perpetrators Array for the user input 3
				if(( $firstGuess == 1 ) && ( $secondGuess == 1 ) && ( $thirdGuess == 1 ) ) # Print the result
					{
					$label_resutl -> configure(-text=>"You Found All Of The Actual Perpetrators", -foreground => green);	
					}
				else
					{
					$label_resutl -> configure(-text=>"Sorry Your answer is Wrong , You Loss \n Real Actual Perpetrators : @ap", -foreground => red);
					}
				$frm_guess-> packForget();
				$frm_result-> pack();
			}
			else
			{
				$label_erorr -> configure(-text=>"The perpetrators must be one of these('a', 'b', 'c', 'd','e', 'f', 'g')\n\n", -foreground => red);
				$label_erorr -> pack();
			}
		}
	}
}