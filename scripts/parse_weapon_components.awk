function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }

BEGIN {
    FS=";"
    OFS=FS

    laser_tiers["RED"]      = 1
    laser_tiers["BLUE"]     = 2
    laser_tiers["UV"]       = 3
    laser_tiers["XRAY"]     = 4
    laser_tiers["GAMMA"]    = 5
}

/^#/ { next; }

/^key/ { 
    
    data = trim( $2 )
    for( i = 3; i <= NF; i++ )
    {
        data = data OFS trim( $i )
    }

    print "newkey", trim( $1 ), "type","size","tier", data

    next;
}

{
    key = trim( $1 )

    if( key ~ /LASER/ )
    {
        pos = match( key,
            /(SMALL|MEDIUM|LARGE)_([[:alpha:]]*)_(LASER)/,
            key_detail )
        size = key_detail[1]
        type = key_detail[3]
        tier = laser_tiers[key_detail[2]]
    }
    else
    {
        pos = match( key, 
               /(SMALL|MEDIUM|LARGE){0,1}_{0,1}([[:alpha:]_]*[[:alpha:]]+)_*([0-9]){0,1}/, 
               key_detail )
    
        size = key_detail[1]
        type = key_detail[2]
        tier = key_detail[3]
    }
    
    if( length(type) == 0 ) { type = key; }
    if( length(size) == 0 ) { size = "NA"; }
    if( length(tier) == 0 ) { tier = "1"; }
    
    newkey = type "," size "," tier

    data = trim( $2 )
    for( i = 3; i <= NF; i++ )
    {
        data = data OFS trim( $i )
    }

    print  newkey, key, type, size, tier, data
}
