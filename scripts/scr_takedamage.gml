//taking damage
if action == consPlayerActionDamaged
{
    if ground
    {    
        hsp = 0
        vsp = 0
    }    
    if image_i >= 21
    {
        image_i = 0
        action = consPlayerActionNormal
    }
}

