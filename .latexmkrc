@default_files = ('documentation/documentation.tex');
$pdf_mode = 1;
$pdf_update_method = 1;
$out_dir = 'build';
$postscript_mode = 0;
$dvi_mode = 0;
$pdflatex = 'pdflatex %O -shell-escape %S';
$makeindex = "makeindex -s ../documentation/indexstyle.ist %O -o %D %S";