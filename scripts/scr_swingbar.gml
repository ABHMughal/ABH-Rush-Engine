//swingbar
if action == consPlayerActionSwingBar
{
    x = instance_nearest(x,y,obj_swingbar).x
    y = instance_nearest(x,y,obj_swingbar).y
    hsp = 0
    vsp = 0
    
    if key_jump && (image_i % 15 >= 0 && image_i % 15 < 5)   
    {
        audio_play_sound(snd_spin,1,false)
        action = consPlayerActionSwingBarJump
        vsp = -8
        hsp = xdir*10
    }
    else if key_jump
    {
        action = consPlayerActionNormal
        y += 10
    }
}

//swingbar end
if action == consPlayerActionSwingBarJump
{
    if vsp >= 2 || ground
        action = consPlayerActionNormal
}

