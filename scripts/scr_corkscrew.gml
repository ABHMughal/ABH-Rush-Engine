//corkscrew movement (main movement is in corkscrew object)
if action == 16
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = 0
        image_i = 0
    }
    
}

if action == 17 // corkscrew while rolling
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = 2
        image_i = 0
    }
}
