//pole
if action == consPlayerActionPole
{
    if place_meeting(x,y,obj_pole)
    {
        hsp = 0
        vsp = 0
        
        x = instance_nearest(x,y,obj_pole).x
        y += 2
        
        if key_jump
        {
            action = consPlayerActionJump
            if key_r
                hsp = 7
            else if key_l 
                hsp = -7
            else
                hsp = xdir*7
            audio_play_sound(snd_jump,1,false)
        }
    }
    else
        action = consPlayerActionNormal
}
