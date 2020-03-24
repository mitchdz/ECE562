SIMS = ['mcf', 'libquantum', 'bitmnp01', 'a2time01', 'cacheb01']
QUEUES = ['4', '8', '16', '32']

for sim in SIMS:
    for queue in QUEUES:
        #part2_OoO_mcf_4_stats.txt
        with open("m5out/part2_OoO_" + sim + "_" + queue + "_stats.txt") as fp:
            for i, line in enumerate(fp):
                if i == 12:
                    #print(line)
                    str = line.split( )
                    print(sim + "_" + queue + "," + str[1])

