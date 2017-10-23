BEGIN { OFS="\t"; }

/^#/ { next; }

/^[[:alnum:]]/ {
    ship = $1;
}

/max_hitpoints/ {
    hitpoints = $3

    print ship, hitpoints
}
