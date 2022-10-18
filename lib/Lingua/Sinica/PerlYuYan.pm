
package Lingua::Sinica::PerlYuYan;

use 5.008;
use utf8;
use strict;
use Filter::Simple::Compile;
use Encode ();

our $VERSION = 1257700140.47574; # 2009年11月 9日 周一 01時09分11秒 CST

=encoding utf8

=head1 NAME

Lingua::Sinica::PerlYuYan - 中書珨 - Perl in Classical Chinese in Perl

=head1 VERSION

our $VERSION = 1257700140.47574; # 2009年11月 9日 周一 01時09分11秒 CST

=head1 SYNOPSIS

    # The Sieve of Eratosthenes - 埃拉托斯芬篩法
    use Lingua::Sinica::PerlYuYan;

      用籌兮用嚴。井涸兮無礙
    。印曰最高矣  又道數然哉。
    。截起吾純風  賦小入大合。
    。習予吾陣地  並二至純風。
    。當起段賦取  加陣地合始。
    。陣地賦篩始  繫繫此雜段。
    。終陣地兮印  正道次標哉。
    。輸空接段點  列終註泰來。

=head1 DESCRIPTION

This module makes it possible to write Perl programs in Classical Chinese poetry in Perl.

說此經者，能以珨文言文珨。

(If one I<has> to ask "Why?", please refer to L<Lingua::Romana::Perligata> for