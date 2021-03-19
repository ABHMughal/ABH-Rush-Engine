//wallhang and walljump (made basics of it but has some bugs on it so I didn't try to fix it)
if action == consPlayerActionWallHang
{
    vsp = 0
    hsp = 0
        
    if key_jump
    {
        alarm[2] = 0
        xdir = -xdir
        action = consPlayerActionWallJump
        vsp = -7
        hsp = 9*xdir
        audio_play_sound(snd_jump,1,false)
    }
}
if action == consPlayerActionWallJump
{
    if ground || vsp >= 0
        action = consPlayerActionNormal
}

