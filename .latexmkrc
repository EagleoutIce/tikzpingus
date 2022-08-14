@default_files = ('doc/tikzpingus-doc.tex');
$pdf_mode = 1;
$pdf_update_method = 1;
$out_dir = 'build';
$postscript_mode = 0;
$dvi_mode = 0;
$pdflatex = 'pdflatex %O -shell-escape %S';
$makeindex = "makeindex -s ../doc/indexstyle.ist %O -o %D %S";