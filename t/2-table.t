
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