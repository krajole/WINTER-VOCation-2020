
use utf8;
use Lingua::Sinica::PerlYuYan qw();
use Test::More;

# kill UTF-8 warnings
my $builder = Test::More->builder;
binmode $builder->output,         ':utf8';
binmode $builder->failure_output, ':utf8';