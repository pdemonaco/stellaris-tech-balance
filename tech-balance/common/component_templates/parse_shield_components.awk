function print_costs(n, ids) {
    print "#=============================================================================="
    print "# Cost"
    print "#=============================================================================="
    print "# Mineral cost for shield components"
    print "# Attributes in this section are named using the following pattern"
    print "# cost_<size>_<tier>_<type>"

    for (i = 1; i <= n; i++)
    {
        id = ids[i]
        cost = costs[id]
        print "@cost_" id " = " cost
    }
}

function print_powers(n, ids) {
    print "#=============================================================================="
    print "# Power"
    print "#=============================================================================="
    print "# Module power cost for shield components"
    print "# Attributes in this section are named using the following pattern"
    print "# power_<size>_<tier>_<type>"

    for (i = 1; i <= n; i++)
    {
        id = ids[i]
        power = powers[id]
        print "@power_" id " = " power
    }
}

function print_hps(n, ids) {
    print "#=============================================================================="
    print "# Shield Hit Points"
    print "#=============================================================================="
    print "# Shield hit points contributed by this module"
    print "# Attributes in this section are named using the following pattern"
    print "# shield_hp_<size>_<tier>_<type>"

    for (i = 1; i <= n; i++)
    {
        id = ids[i]
        hp = hps[id]
        print "@shield_hp_" id " = " hp
    }
}

function print_regens(n, ids) {
    print "#=============================================================================="
    print "# Shield HP Regeneration Per Day"
    print "#=============================================================================="
    print "# Shield hit points regenerated per day by this module"
    print "# Attributes in this section are named using the following pattern"
    print "# shield_regen_<size>_<tier>_<type>"

    for (i = 1; i <= n; i++)
    {
        id = ids[i]
        regen = regens[id]
        print "@shield_regen_" id " = " regen
    }
}

# Simple awk script to output shield component data
BEGIN {
    FS="\t"
}

/^Type/ { next; }

{
    id = $2 "_" $3 "_" $1
    costs[id] = $5
    powers[id] = $6
    hps[id] = $7
    regens[id] = $8
}

END {
    n = asorti(costs, ids)

    print_costs( n, ids )
    print "\n"

    print_powers( n, ids )
    print "\n"
    
    print_hps( n, ids )
    print "\n"

    print_regens( n, ids )
    print "\n"
}
