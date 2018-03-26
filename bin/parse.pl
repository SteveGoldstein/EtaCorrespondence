#!/usr/bin/perl -w

use strict;
use Carp;
use English;
use Getopt::Long;
use Cwd;

my $q;

GetOptions (
    'q=i'  => \$q,
            );

if (not defined $q) {
    if ($#ARGV == 0) {
	($q) = $ARGV[0]=~ /GL_\d+_(\d+)\./;
    }
    else {
	croak "Usage: bin/parse.pl -q <q>";
    }
}

my @out;
my $line;
my $empty = 1;

while(<>) {
    chomp;
    if (s/^\[\*\s*//) {
	$line = "";
	$empty = 0;
    } 
    if (s/\s*\*\]\s*$//) { 
	$line .= $_;
	my @F = split /,\s*/, $line;

	my $newLine = \@F;
	push @out, $newLine;
	$line = "";
	next
    }  
    $line .= $_;
}

my $header = $out[0];
my @AbsCharRatioCols;
foreach my $index (0..$#$header) {
    if ($header -> [$index] =~ /^AbsCharRatio/) {
	push @AbsCharRatioCols, $index;
	push @$header, sprintf("-log%d_%s", $q,$header -> [$index]);	
    }
}
map{print join("\t", $_, $header->[$_]), "\n";} @AbsCharRatioCols;

foreach my $line (@out[1..$#out]) {
    foreach my $index (@AbsCharRatioCols) {
	my $ratio = $line -> [$index];
	if ($ratio == 0) {
	    push @$line, "NA";
	}
	else {
	    my $log;
	    if ($ratio == 1) {
		$log = 0;
	    }
	    else {
		if ($ratio < 0) {
		    print "$index\n @$line\n $ratio\n";
		}
		$log = sprintf ("%1.3f", -log($ratio)/log($q));
	    }
	    push @$line, $log;
	}
    }
}

map{ print join(", ", @$_), "\n" } @out
    unless ($empty);


__END__

 for f in  out_0/GL_*.raw; do  g=$(basename $f); g=${g/raw/txt};cat $f |perl -nae 'chomp;if (s/^\[\*\s*//) {$line = ""} if (s/\*\]\s*$//) { $line .= $_; push @lines, $line; $line = "";next}  $line .= $_; END{print join("\n", @lines), "\n"}' > out_0-parsed/$g; done

 for f in  out_0/GL_*.raw; do  g=$(basename $f); g=${g/raw/txt};cat $f |bin/parse.pl > out_0-parsed/$g; done

 for f in out_2/GL_*raw; do  g=$(basename $f); g=${g/raw/csv}; bin/parse.pl $f > out_2-parsed/$g; done
