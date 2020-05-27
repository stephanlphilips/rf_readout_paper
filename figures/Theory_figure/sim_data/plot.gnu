set terminal svg size 500,400 enhanced font 'Verdana,20'

# palette
set palette defined (0  0.0 0.0 0.5, \
                     1  0.0 0.0 1.0, \
                     2  0.0 0.5 1.0, \
                     3  0.0 1.0 1.0, \
                     4  0.5 1.0 0.5, \
                     5  1.0 1.0 0.0, \
                     6  1.0 0.5 0.0, \
                     7  1.0 0.0 0.0, \
                     8  0.5 0.0 0.0 )

set pm3d map
set style function pm3d
set view map scale 1

set xlabel "Inductance (uH)"
set ylabel "Parasitic capacitance (pF)"

set lmargin at screen 0.2
set rmargin at screen 0.8

set xrange [0.21:]
set yrange [0.05:]
set cbrange [0:800]

set output 'f_res.svg'
set multiplot
set pm3d map
set surface
set cblabel "f_{res} (MHz)"
splot 'f_res.txt' u ($1*1e6):($2*1e12):($3*1e-6) with pm3d notitle

unset surface
set contour base
set cntrlabel onecolor format '%8.3g' font 'Verdana, 18' start 25 interval -1
set cntrparam order 8
set cntrparam levels discrete 100, 200, 400, 600
splot 'f_res.txt' u ($1*1e6):($2*1e12):($3*1e-6) with lines lc rgb "#FFB53D" notitle

set cntrlabel start 15 interval -1 font 'Verdana, 12' 
splot 'f_res.txt' u ($1*1e6):($2*1e12):($3*1e-6) with labels boxed notitle

unset multiplot

set output 'R_match.svg'
set multiplot
set cbrange [0:980]
set pm3d map
set surface
set cblabel "Resistance (kOhm)"
splot 'R_match.txt' u ($1*1e6):($2*1e12):($3*1e-3) with pm3d notitle

unset surface
set contour base
set cntrlabel onecolor format '%8.3g' font 'Verdana, 18' start 25 interval -1
set cntrparam order 8
set cntrparam levels discrete 100, 200, 400, 600
splot 'R_match.txt' u ($1*1e6):($2*1e12):($3*1e-3) with lines lc rgb "#FFB53D" notitle

set cntrlabel start 15 interval -1 font 'Verdana, 12' 
splot 'R_match.txt' u ($1*1e6):($2*1e12):($3*1e-3) with labels boxed notitle

unset multiplot

set output 'band_width.svg'

set multiplot
set pm3d map
set surface

set cbrange [0:60]
set cblabel "band width (MHz)"
set logscale zcb
splot 'band_width.txt' u ($1*1e6):($2*1e12):($3*1e-6) with pm3d notitle

unset surface
set contour base
set cntrlabel onecolor format '%8.3g' font 'Verdana, 18' start 25 interval -1
set cntrparam order 8
# set cntrparam levels discrete 0.5, 1, 2, 30
# splot 'band_width.txt' u ($1*1e6):($2*1e12):($3*1e-6) with lines lc rgb "#FFB53D" notitle

# set cntrlabel start 15 interval -1 font 'Verdana, 12' 
# splot 'band_width.txt' u ($1*1e6):($2*1e12):($3*1e-6) with labels boxed notitle

unset multiplot