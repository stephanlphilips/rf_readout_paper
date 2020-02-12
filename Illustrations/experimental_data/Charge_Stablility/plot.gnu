set terminal postscript eps size 5,4 enhanced color \
    font 'Helvetica,18' linewidth 2

set palette defined ( 0 '#B2182B',\
    	    	      1 '#D6604D',\
		      2 '#F4A582',\
		      3 '#FDDBC7',\
		      4 '#D1E5F0',\
		      5 '#92C5DE',\
		      6 '#4393C3',\
		      7 '#2166AC' ) 

set pm3d map
set style function pm3d
set view map scale 1

set pm3d implicit at b
set pm3d interpolate 0,0 

set output 'CSD.eps'

set xlabel "vP4 (mV)"
set ylabel "vP3 (mV)"
set cblabel "Reflelected signal (a.u.)"

set xrange[2030:2170]
set yrange[1665:1725]

splot 'gates_quad_vP3_set_vP4_set.dat' u ($2+2100):($1):( ($3 + $4)*0.01) with pm3d notitle
