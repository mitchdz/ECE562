#part2_OoO_a2time01_20_stats.txt
#part2_OoO_a2time01_40_stats.txt
#part2_OoO_a2time01_60_stats.txt
#part2_OoO_a2time01_80_stats.txt
#part2_OoO_bitmnp01_20_stats.txt
#part2_OoO_bitmnp01_40_stats.txt
#part2_OoO_bitmnp01_60_stats.txt
#part2_OoO_bitmnp01_80_stats.txt
#part2_OoO_cacheb01_20_stats.txt
#part2_OoO_cacheb01_40_stats.txt
#part2_OoO_cacheb01_60_stats.txt
#part2_OoO_cacheb01_80_stats.txt
#part2_OoO_libquantum_20_stats.txt
#part2_OoO_libquantum_40_stats.txt
#part2_OoO_libquantum_60_stats.txt
#part2_OoO_libquantum_80_stats.txt
#part2_OoO_mcf_20_stats.txt
#part2_OoO_mcf_40_stats.txt
#part2_OoO_mcf_60_stats.txt
#part2_OoO_mcf_80_stats.txt

SIMS = ['mcf', 'libquantum', 'bitmnp01', 'a2time01']
TIMES = ['20', '40', '60', '80']

for sim in SIMS:
    for time in TIMES:
        with open("m5out/part2_OoO_" + sim + "_" + time + "_stats.txt") as fp:
            for i, line in enumerate(fp):
                if i == 12:
                    #print(line)
                    str = line.split( )
                    print(sim + "_" + time + "," + str[1])

