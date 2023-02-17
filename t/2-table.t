
use utf8;
use Lingua::Sinica::PerlYuYan qw();
use Test::More;

# kill UTF-8 warnings
my $builder = Test::More->builder;
binmode $builder->output,         ':utf8';
binmode $builder->failure_output, ':utf8';
binmode $builder->todo_output,    ':utf8';

%check = (
    火 => 'y',
    風 => 'z',
    秋 => 'Y',
    冬 => 'Z',
    萬 => 10**4,
    億 => '10000_0000',
    廿 => 20,
    卅 => 30,
    '８' => 8,
    '９' => 9,
    然 => ':',
    標 => ':',
    者 => '`',
    繫 => '~',
    '‵' => '`',
    '～' => '~',
    之 => '->',
    宗 => '::',
    同 => 'eq ',
    否 => 'not ',
    列 => '"\\n"',
    主 => 'main ',
    察 => 'CHECK',
    滅 => 'DESTROY',
    雙 => 'qq/',
    逆 => 'reverse ',
    厚 => 'ucfirst ',
    換 => 'y/',
    習 => 'study ',
    規 => 'qr/',
    根 => 'sqrt ',
    騷 => 'srand ',
    抽 => 'splice ',
    予 => 'unshift ',
    排 => 'sort ',
    啟 => 'unpack ',