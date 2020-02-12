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
set xlabel "Resistance (kOhm)"
set ylabel "S11 (dB)"

set logscale x
set output 'overview.eps'
set xrange [100:5000]
plot 'S11_vs_R.txt' u ($1*1e-3):($2+30) with p ls 1 notitle,\
