// spring jump and dash ring
if (action == 5 || action == 6)
{
    if hsp > 0
        xdir = 1;
    else if hsp < 0
        xdir = -1;
        
    if ground
        action = 0;
} 

