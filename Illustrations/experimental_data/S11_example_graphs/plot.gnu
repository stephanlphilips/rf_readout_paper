set terminal postscript eps size 6,5 enhanced color \
    font 'Helvetica,18' linewidth 2

set style line 1 lc rgb '#1074B0' lt 1 lw 1.3 pt 7 ps 0.8
set style line 2 lc rgb '#169D74' lt 1 lw 1.3 pt 7 ps 0.8
set style line 3 lc rgb '#5BB6E6' lt 1 lw 1.3 pt 7 ps 0.8
set style line 4 lc rgb '#E49D25' lt 1 lw 1.3 pt 7 ps 0.8
set style line 5 lc rgb '#F0E252' lt 1 lw 1.3 pt 7 ps 0.8
set style line 6 lc rgb '#2A707F' lt 1 lw 1.3 pt 7 ps 0.8
set style line 7 lc rgb '#7F0000' lt 1 lw 1.3 pt 7 ps 0.8
set style line 8 lc rgb '#9C06CC' lt 1 lw 1.3 pt 7 ps 0.8

set terminal postscript eps size 4,3 enhanced color \
    font 'Helvetica,18' linewidth 2
#1D plots
set xlabel "frequency (MHz)"
set ylabel "S11 (dB)"

set key bottom right box

set output 'overview.eps'

plot 'R_0.txt' u ($1*1e-6):($2+30) with lines ls 1 title "R=0",\
 'R_low.txt' u ($1*1e-6):($2+30) with lines ls 2  title "R=150k",\
 'R_match.txt' u ($1*1e-6):($2+30) with lines ls 3 title "R=275k",\
 'R_high.txt' u ($1*1e-6):($2+30) with lines ls 4  title "R=400k",\
 'R_very_high.txt' u ($1*1e-6):($2+30) with lines ls 5 title "R=1M"