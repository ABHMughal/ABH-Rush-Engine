//qte time
if action == 14
{
    grv = 0
    if xdir == 1
    {
        if hsp > 0
            hsp -= 0.125
        else
            hsp = 0.625
    }
    else
    {
        if hsp < 0
            hsp += 0.125
        else
            hsp = -0.625
    }
    if vsp < 0
        vsp += 0.125
    else
        vsp = -0.3125
}

//qte success
if action == 15
{
    hsp = xdir*9
    if ground
        action = 0
}
//qte fail
if action == 15.5
{
    hsp += xdir*acc*2
    if ground 
        action = 0
}

