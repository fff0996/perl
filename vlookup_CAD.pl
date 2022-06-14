#!/usr/bin/perl
#
use warnings;
use strict;



my $root = $ARGV[0];
my $case = $ARGV[1];
my $control = $ARGV[2];

open(R,$root);

open(O,">$case");
open(C,">$control");
my $flag;

while(<R>){

	my $i=$_;
	chomp($i);


	my @e = split(/\t/,$i);
	#print @e,"\n";
	if($e[0] eq 'FID'){
		print O $i,"\n";
		print C $i,"\n";
		#print $e[413];
		next;
	}
	else{
		my @ch = @e[3..413];
		#print @ch,"\n";

		$flag = 0;
		for my $k (@ch){
			#print $k,"\n";
			#print $k,"\n";
			if($k =~ /^1075$/  or $k =~ /^4109$/ or  $k =~ /^4119$/ or $k =~ /^4129$/  or $k =~ /^I21/ or $k =~ /^I22/ or $k =~ /^I23/ or $k =~ /^I241$/ or $k =~ /^I252$/ or $k =~ /^K401$/ or $k =~ /^K402$/ or $k =~ /^K403/ or $k =~ /^K404$/ or $k =~ /^K411$/ or $k =~ /^K412$/ or $k =~ /^K413$/ or $k =~ /^K414$/ or $k =~ /^K451$/ or $k =~ /^K452$/ or $k =~ /^K453$/ or $k =~ /^K454$/ or $k =~ /^K455$/ or $k =~ /^K491$/ or $k =~ /^K492$/ or $k =~ /^K498$/ or $k =~ /^K499$/ or $k =~ /^K502$/ or $k =~ /^K751$/ or $k =~ /^K752$/ or $k =~ /^K753$/ or $k =~ /^K754$/ or $k =~ /^K758$/ or $k =~ /^K759$/){
				
				$flag = 1;
				last;

			}
		
		}
		if($flag == 0){
			print C $i,"\n";
		}else{
			print O $i,"\n";
		}
		#if(grep(/^E11*/,@ch)){
		#	print $i,"\n";
		#}
		#}
	}
}
close R;
close O;
close C;
#close H;
