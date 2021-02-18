//swingbar
if action == 12
{
    x = instance_nearest(x,y,obj_swingbar).x
    y = instance_nearest(x,y,obj_swingbar).y
    hsp = 0
    vsp = 0
    
    if key_jump && (image_i % 15 >= 0 && image_i % 15 < 5)   
    {
        audio_play_sound(snd_spin,1,false)
        action = 13
        vsp = -8
        hsp = xdir*10
    }
    else if key_jump
    {
        action = 0
        y += 10
    }
}

//swingbar end
if action == 13
{
    if vsp >= 2 || ground
        action = 0
}

