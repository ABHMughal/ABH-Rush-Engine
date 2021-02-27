// spring jump and dash ring
if (action == consPlayerActionSpringJump || action == consPlayerActionDashRing)
{
    if hsp > 0
        xdir = 1;
    else if hsp < 0
        xdir = -1;
        
    if ground
        action = consPlayerActionNormal;
} 

