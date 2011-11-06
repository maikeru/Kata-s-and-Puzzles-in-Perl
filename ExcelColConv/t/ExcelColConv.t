#!/mu/bin/perl

use strict;
use warnings;

use Test::More qw/no_plan/;

require_ok("ExcelColConv.pl");

my $result;
$result = main(0, "A");
is($result, 1, "O A = 1");

$result = main(0, "B");
is($result, 2, "O B = 2");
# 0 Y = 25
$result = main(0, "Y");
is($result, 25, "O Y = 25");
# 0 Z = 26
$result = main(0, "Z");
is($result, 26, "O Z = 26");
# 0 AA = 27
$result = main(0, "AA");
is($result, 27, "O AA = 27");
# 0 AB = 28
$result = main(0, "AB");
is($result, 28, "O AB = 28");
# 0 AZ = 52
$result = main(0, "AZ");
is($result, 52, "O AZ = 52");
# 0 BA = 53
$result = main(0, "BA");
is($result, 53, "O BA = 53");
# 0 BB = 54
$result = main(0, "BB");
is($result, 54, "O BB = 54");
# 0 ZY = 701
$result = main(0, "ZY");
is($result, 701, "O ZY = 701");
# 0 ZZ = 702
$result = main(0, "ZZ");
is($result, 702, "O ZZ = 702");
# 0 AAA = 703
$result = main(0, "AAA");
is($result, 703, "O AAA = 703");
# 0 AAB = 704
$result = main(0, "AAB");
is($result, 704, "O AAB = 704");
# 0 XFD = 16384
$result = main(0, "XFD");
is($result, 16384, "O XFD = 16384");
# 0 ABCDE = 494265
$result = main(0, "ABCDE");
is($result, 494265, "O ABCDE = 494265");

#-------------

# 1 1 = A
$result = main(1, 1);
is($result, "A", "1 1 = A");
# 1 2 = B
$result = main(1, 2);
is($result, "B", "1 2 = B");
# 1 25 = Y
$result = main(1, 25);
is($result, "Y", "1 25 = Y");
# 1 26 = Z
$result = main(1, 26);
is($result, "Z", "1 26 = Z");
# 1 27 = AA
$result = main(1, 27);
is($result, "AA", "1 27 = AA");
# 1 28 = AB
$result = main(1, 28);
is($result, "AB", "1 28 = AB");
# 1 52 = AZ
$result = main(1, 52);
is($result, "AZ", "1 52 = AZ");
# 1 53 = BA
$result = main(1, 53);
is($result, "BA", "1 53 = BA");
# 1 54 = BB
$result = main(1, 54);
is($result, "BB", "1 54 = BB");
# 1 701 = ZY
$result = main(1, 701);
is($result, "ZY", "1 701 = ZY");
# 1 702 = ZZ
$result = main(1, 702);
is($result, "ZZ", "1 702 = ZZ");
# 1 703 = AAA
$result = main(1, 703);
is($result, "AAA", "1 703 = AAA");
# 1 704 = AAB
$result = main(1, 704);
is($result, "AAB", "1 704 = AAB");
# 1 16384 = XFD
$result = main(1, 16384);
is($result, "XFD", "1 16384 = XFD");
# 1 494265 = ABCDE
$result = main(1, 494265);
is($result, "ABCDE", "1 494265 = ABCDE");
