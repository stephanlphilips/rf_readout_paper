set terminal postscript eps size 2,3.5 enhanced color \
    font 'Helvetica,18' linewidth 2

set terminal svg size 600,500 enhanced font 'Helvetica, 14' linewidth 2

set palette defined ( 0    0.2081    0.1663    0.5292 ,\
 1    0.2116    0.1898    0.5777,\
 2    0.2123    0.2138    0.6270,\
 3    0.2081    0.2386    0.6771,\
 4    0.1959    0.2645    0.7279,\
 5    0.1707    0.2919    0.7792,\
 6    0.1253    0.3242    0.8303,\
 7    0.0591    0.3598    0.8683,\
 8    0.0117    0.3875    0.8820,\
 9    0.0060    0.4086    0.8828,\
10    0.0165    0.4266    0.8786,\
11    0.0329    0.4430    0.8720,\
12    0.0498    0.4586    0.8641,\
13    0.0629    0.4737    0.8554,\
14    0.0723    0.4887    0.8467,\
15    0.0779    0.5040    0.8384,\
16    0.0793    0.5200    0.8312,\
17    0.0749    0.5375    0.8263,\
18    0.0641    0.5570    0.8240,\
19    0.0488    0.5772    0.8228,\
20    0.0343    0.5966    0.8199,\
21    0.0265    0.6137    0.8135,\
22    0.0239    0.6287    0.8038,\
23    0.0231    0.6418    0.7913,\
24    0.0228    0.6535    0.7768,\
25    0.0267    0.6642    0.7607,\
26    0.0384    0.6743    0.7436,\
27    0.0590    0.6838    0.7254,\
28    0.0843    0.6928    0.7062,\
29    0.1133    0.7015    0.6859,\
30    0.1453    0.7098    0.6646,\
31    0.1801    0.7177    0.6424,\
32    0.2178    0.7250    0.6193,\
33    0.2586    0.7317    0.5954,\
34    0.3022    0.7376    0.5712,\
35    0.3482    0.7424    0.5473,\
36    0.3953    0.7459    0.5244,\
37    0.4420    0.7481    0.5033,\
38    0.4871    0.7491    0.4840,\
39    0.5300    0.7491    0.4661,\
40    0.5709    0.7485    0.4494,\
41    0.6099    0.7473    0.4337,\
42    0.6473    0.7456    0.4188,\
43    0.6834    0.7435    0.4044,\
44    0.7184    0.7411    0.3905,\
45    0.7525    0.7384    0.3768,\
46    0.7858    0.7356    0.3633,\
47    0.8185    0.7327    0.3498,\
48    0.8507    0.7299    0.3360,\
49    0.8824    0.7274    0.3217,\
50    0.9139    0.7258    0.3063,\
51    0.9450    0.7261    0.2886,\
52    0.9739    0.7314    0.2666,\
53    0.9938    0.7455    0.2403,\
54    0.9990    0.7653    0.2164,\
55    0.9955    0.7861    0.1967,\
56    0.9880    0.8066    0.1794,\
57    0.9789    0.8271    0.1633,\
58    0.9697    0.8481    0.1475,\
59    0.9626    0.8705    0.1309,\
60    0.9589    0.8949    0.1132,\
61    0.9598    0.9218    0.0948,\
62    0.9661    0.9514    0.0755,\
63    0.9763    0.9831    0.0538)


set pm3d map
set style function pm3d
set view map scale 1

set xlabel "Inducatance (uH)"
set ylabel "Paratic capaticace (pF)"

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
set cntrlabel onecolor format '%8.3g' font 'Helvetica, 18' start 25 interval -1
set cntrparam order 8
set cntrparam levels discrete 100, 200, 400, 600
splot 'f_res.txt' u ($1*1e6):($2*1e12):($3*1e-6) with lines lc rgb "#FFB53D" notitle

set cntrlabel start 15 interval -1 font 'Helvetica, 12' 
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
set cntrlabel onecolor format '%8.3g' font 'Helvetica, 18' start 25 interval -1
set cntrparam order 8
set cntrparam levels discrete 100, 200, 400, 600
splot 'R_match.txt' u ($1*1e6):($2*1e12):($3*1e-3) with lines lc rgb "#FFB53D" notitle

set cntrlabel start 15 interval -1 font 'Helvetica, 12' 
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
set cntrlabel onecolor format '%8.3g' font 'Helvetica, 18' start 25 interval -1
set cntrparam order 8
# set cntrparam levels discrete 0.5, 1, 2, 30
# splot 'band_width.txt' u ($1*1e6):($2*1e12):($3*1e-6) with lines lc rgb "#FFB53D" notitle

# set cntrlabel start 15 interval -1 font 'Helvetica, 12' 
# splot 'band_width.txt' u ($1*1e6):($2*1e12):($3*1e-6) with labels boxed notitle

unset multiplot