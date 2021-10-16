#! /bin/bash 
set term tikz
set output 'plotResult.tex'
set termopt enhanced    # turn on enhanced text mode
set grid
set style data lines
plot "data.dat" using 1:2 with lp linecolor rgb "dark-spring-green"
