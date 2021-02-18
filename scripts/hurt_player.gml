if other.rings > 0
{
    other.image_i = 0
    other.ground = false
    other.action = 22
    other.vsp = -4
    other.hsp = -5*other.xdir
    other.canHit = false
    other.hitInvincible = 240
    scatter_rings()
    if other.character == "Sonic"
        audio_play_sound(snd_SonicHurt,1,false)
    else if other.character == "Shadow"
        audio_play_sound(snd_Shadow_Die,1,false)
}
else
{
    other.image_i = 0
    other.ground = false
    other.action = 26
    other.vsp = -4
    other.hsp = -5*other.xdir
    other.canHit = false
    other.alarm3 = 120
    if instance_exists(obj_HUD_ingame)
        obj_HUD_ingame.show = false
    if instance_exists(obj_pause)
    {
        with(obj_pause)
        {
            instance_destroy()
        }
    }
}

