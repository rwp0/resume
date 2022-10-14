use v5.36;
use Data::Printer;
use Path::Tiny;
use LaTeX::Driver;

my $source = path( '/home/regular/IdeaProjects/resume/resume.tex' );
my $output = path( '/home/regular/IdeaProjects/resume/out/resume.pdf' );

my $latex = LaTeX::Driver -> new(
  source => $source -> stringify, # can accept reference to scalar as text content rather than file name
  output => $output -> stringify,
  format => 'pdf',
);

$latex -> run_bibtex();

my $run = $latex -> run();

p $run, $latex -> stats();

exec( "google-chrome-stable $output &" ) if $run;

# shell: latex resume && bibtex resume && latex resume && latex resume && pdflatex resume && firefox resume.pdf

# Debian:
# texlive-xetex