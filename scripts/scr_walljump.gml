//wallhang and walljump (made basics of it but has some bugs on it so I didn't try to fix it)
if action == 19
{
    vsp = 0
    hsp = 0
        
    if key_jump
    {
        alarm[2] = 0
        xdir = -xdir
        action = 20
        vsp = -7
        hsp = 9*xdir
        audio_play_sound(snd_jump,1,false)
    }
}
if action == 20
{
    if ground || vsp >= 0
        action = 0
}

