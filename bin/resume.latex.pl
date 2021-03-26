use v5.30;
use Data::Dumper;
use File::Spec;
use constant
{
source => File::Spec -> catfile("$ENV{HOME}", qw(var git resume resume.tex)),
output => File::Spec -> catfile("$ENV{HOME}", qw(var git resume resume.pdf)),
};
use LaTeX::Driver; # cpan
my $latex = LaTeX::Driver -> new(
  source  => source,
  output  => output,
  format  => 'pdf',
);
$latex -> run_bibtex();
my $run = $latex -> run();
say Dumper $run, $latex -> stats();
exec("firefox @{[output]} &") if $run;
# shell: latex resume && bibtex resume && latex resume && latex resume && pdflatex resume && firefox resume.pdf
