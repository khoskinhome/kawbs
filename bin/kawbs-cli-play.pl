#!/usr/bin/perl
use strict; use warnings;
use lib '/opt/kawbs/lib/perl';

# Karl Hoskin . 2020.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# Artistic License 2.0 for more details.
#
# You should have received a copy of the Artistic License 2.0 along
# with this program in the file named LICENSE. If not, please see
# <http://www.perlfoundation.org/artistic_license_2_0>.

use KAWBS::PlayWav qw(
    play_wavs
);

# todo have a param for the voice directory
# Then just play the rest of the ARGV

play_wavs(@ARGV) ;

