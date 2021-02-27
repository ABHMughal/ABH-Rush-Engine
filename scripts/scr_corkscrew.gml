//corkscrew movement (main movement is in corkscrew object)
if action == consPlayerActionCorkscrew
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = consPlayerActionNormal
        image_i = 0
    }
    
}

if action == consPlayerActionCorkscrewRoll // corkscrew while rolling
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = consPlayerActionRoll
        image_i = 0
    }
}
