if other.rings > 0
{
    other.image_i = 0
    other.ground = false
    other.action = consPlayerActionDamaged
    other.vsp = -4
    other.hsp = -5*other.xdir
    other.canHit = false
    other.hitInvincible = 240
    scatter_rings()
    switch(other.character)
    {
        case consPlayerNameSonic:
        {
            audio_play_sound(snd_SonicHurt,1,false)
        }
        break;
        
        case consPlayerNameShadow:
        {
            audio_play_sound(snd_Shadow_Die,1,false)
        }
        break;
    }
}
else
{
    other.image_i = 0
    other.ground = false
    other.action = consPlayerActionDead
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

