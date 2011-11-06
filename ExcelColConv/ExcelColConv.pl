#!/mu/bin/perl

use strict;
use warnings;

# PBP says to use Readonly instead of use constant but I don't think we have it installed
use constant {
    TO_NUMBER    => 0,
    TO_LETTERS   => 1,
    BASE         => 26,
    ASCII_OFFSET => 64,
    BORDER_CHAR  => "Z",
};

# For testing. Call main if we were run directly from command line
my $result;
$result = main( @ARGV ) unless caller(  );
print $result . "\n";

sub main {
    # Get parameter
    my ($mode, $input) = @_;

    if ($mode == TO_NUMBER) {
        return col_name_to_number($input);
    }
    elsif ($mode == TO_LETTERS) {
        return number_to_col_name($input);
    }
    else {
        die "Invalid mode\n";
    }
}

# q = 1 r = 2 => AB (28)
# q = 1 r = 1 => AA (27)
# q = 1 r = 0 => Z (26)
# q = 2 r = 0 => AZ (52)
# q = 27 r = 0 => ZZ (702)
sub number_to_col_name{
    my ($number) = @_;
    my $quotient  = int($number / BASE);
    my $remainder = $number % BASE;
    # Non-border (Z -> A) case
    if ($quotient && ($remainder != 0)) {
        return number_to_col_name($quotient) . chr($remainder + ASCII_OFFSET);
    }
    # Border case but not end case
    elsif (($quotient > 1) && ($remainder == 0)) {
        return number_to_col_name($quotient - 1) . BORDER_CHAR;
    }
    # Border case and end case
    elsif ($remainder == 0) {
        return BORDER_CHAR;
    }
    # Non-border case and end case
    else {
        return chr($remainder + ASCII_OFFSET);
    }
}

sub col_name_to_number{
    my ($col_name) = @_;
    my $character = substr($col_name, -1, 1);
    $col_name     = substr($col_name, 0, (length($col_name) - 1));
    my $value     = ord($character) - ASCII_OFFSET;
    if (length($col_name) > 0) {
        return $value + (BASE * col_name_to_number($col_name));
    }
    else {
        return $value;
    }
}

