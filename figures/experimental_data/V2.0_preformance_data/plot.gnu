
set terminal pngcairo size 1400,1000 enhanced font 'Verdana,20'
set terminal svg size 800,600 enhanced font 'Verdana,20'



set style line 1 lc rgb '#1074B0' lt 1 lw 1.3 pt 7 ps 0.8
set style line 2 lc rgb '#169D74' lt 1 lw 1.3 pt 7 ps 0.8
set style line 3 lc rgb '#5BB6E6' lt 1 lw 1.3 pt 7 ps 0.8
set style line 4 lc rgb '#E49D25' lt 1 lw 1.3 pt 7 ps 0.8
set style line 5 lc rgb '#F0E252' lt 1 lw 1.3 pt 7 ps 0.8
set style line 6 lc rgb '#2A707F' lt 1 lw 1.3 pt 7 ps 0.8
set style line 7 lc rgb '#7F0000' lt 1 lw 1.3 pt 7 ps 0.8
set style line 8 lc rgb '#9C06CC' lt 1 lw 1.3 pt 7 ps 0.8


set output 'fidelity_example.svg'
set xlabel 'Measurement time (ns)'
set ylabel 'Readout infidelity (%)'

set logscale y
set xrange [0:1000]
plot 'dot_transition_data_dataset_5_P0.53.txt' u 1:2 w l ls 1 notitle


set output 'fid_and_t_elec.svg'

set xlabel 'RF readout power (dBm)'
set ylabel 'Measurement time for 99% fidelity (us)'
set y2label 'Electron temperature (mK)'
unset logscale y
set yrange[0.5:]
set xrange [-10:5]
set ytics nomirror
set y2tics

plot "power_vs_t_elec.txt" u 1:($2*1e3) w l ls 1 axis x1y2 notitle,\
 "power_vs_time_fid_99.txt" u 1:($2*1e-3) w l ls 2 axis x1y1 notitle