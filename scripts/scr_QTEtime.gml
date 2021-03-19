//qte time
if action == consPlayerActionQTE
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
if action == consPlayerActionQTESucces
{
    hsp = xdir*9
    if ground
        action = consPlayerActionNormal
}
//qte fail
if action == consPlayerActionQTEFail
{
    hsp += xdir*acc*2
    if ground 
        action = consPlayerActionNormal
}

