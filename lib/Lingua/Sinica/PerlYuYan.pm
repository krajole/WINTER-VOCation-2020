
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
related information.)

(闕譯，以待來者。)

This module uses the single-character property of Chinese to disambiguate
between keywords, so one may elide whitespaces much like in real Chinese writings.

The vocabulary is in the 文言 (literary text) mode, not the common 白話
(spoken text) mode with multisyllabic words.

C<Lingua::Sinica::PerlYuYan::translate()> (or simply as C<譯()>) translates a
string containing English programs into Chinese.

=cut

our %Tab;
while (<DATA>) {
    $_ = Encode::is_utf8($_) ? $_ : Encode::decode_utf8($_);

    next if /^\s*$/;
    my @eng = split ' ';
    my @chi = map {/\A [!-~]+ \z/msx ? $_ : split //, $_}
      # clusters of ASCII are untranslated keywords; keep them
      split ' ', <DATA>;
    for (my $i = 0; $i <= $#eng; $i++) {
        next if $chi[$i] eq $eng[$i];    # filter untranslated
        $Tab{$chi[$i]} =    # append space if keyword, but not single letter
        $eng[$i] =~ /\A [a-z]{2,} \z/msx ? $eng[$i] . ' ' : $eng[$i];
    }
}

@Tab{qw{ 資曰     亂曰    檔曰     列曰     套曰        }}
   = qw{ __DATA__ __END__ __FILE__ __LINE__ __PACKAGE__ };

FILTER {
    $_ = Encode::is_utf8($_) ? $_ : Encode::decode_utf8($_);

    foreach my $key ( sort { length $b <=> length $a } keys %Tab ) {
        s/$key/$Tab{$key}/g;
    }

    return($_ = Encode::encode_utf8($_));
};

no warnings 'redefine';
sub translate {
    my $code = shift;

    for my $key (sort {length $Tab{$b} cmp length $Tab{$a}} keys %Tab) {
        $code =~ s/\Q$Tab{$key}\E/$key/g;
    }

    return $code;
}

1;

=head1 SEE ALSO

L<Filter::Simple::Compile>, L<Lingua::Romana::Perligata>

=head1 CC0 1.0 Universal

To the extent possible under law, 唐鳳 has waived all copyright and related
or neighboring rights to Lingua-Sinica-PerlYuYan.

This work is published from Taiwan.

L<http://creativecommons.org/publicdomain/zero/1.0>

=begin html

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license" href="http://creativecommons.org/publicdomain/zero/1.0/" style="text-decoration:none;">
    <img src="http://i.creativecommons.org/l/zero/1.0/88x31.png" border="0" alt="CC0" />
  </a>
  <br />
  To the extent possible under law, <a href="http://www.audreyt.org/" rel="dct:publisher"><span property="dct:title">唐鳳</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">Lingua-Sinica-PerlYuYan</span>.
This work is published from
<span about="http://www.audreyt.org/" property="vcard:Country" datatype="dct:ISO3166" content="TW">Taiwan</span>.
</p>

=end html

=cut

__DATA__
a b c d e f g h i j k l m n o p q r s t u v w x y z
甲乙丙丁戊己庚辛壬癸子丑寅卯辰巳午未申酉戌亥地水火風
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
青心赤肝黃脾白肺黑腎鼠牛虎兔龍蛇馬羊猴雞狗豬春夏秋冬

0 1 2 3 4 5 6 7 8 9 10 100 1000 10000 10000_0000
零一二三四五六七八九十 百  千   萬    億
0 1 2 3 4 5 6 7 8 9 10 100 1000 20 30
零壹貳毿肆伍陸柒捌玖拾 佰  仟   廿 卅
0 1 2 3 4 5 6 7 8 9
０１２３４５６７８９

! @ # # $ % % ^ & * ( ) - = _ + + [ ] { } \ | ; : :
非陣井註純雜模析和乘起合減賦底加正內外始終參聯兮然標
' ' " " , , => < . . > / / ? ` ` ~
曰矣道哉又並與 小點接大除分歟行者繫
! @ # $ % ^ & * ( ) - = _ + [ ] { } \ | ; ; : ' " , , < . > / ? ` ~
！＠＃＄％︿＆＊（）－＝＿＋〔〕｛｝╲｜；。：’”，、＜．＞╱？‵～

.. ... ** ++ -- -> ::
至 乃  冪 增 扣 之 宗

&& == || and or lt gt cmp eq not
及 等 許 且  或 前 後 較  同 否

=~ !~ x <=> ~~ //