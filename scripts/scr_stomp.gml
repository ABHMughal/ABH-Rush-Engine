//stomp
if (action == consPlayerActionNormal || action == consPlayerActionJump) && !ground && key_d && key_attack
{
    action = consPlayerActionStomp
    audio_play_sound(snd_stomp_start,1,false);
    instance_create(x,y,obj_stompfx);
    switch(character)
    {
        case consPlayerNameSonic:
        {
            audio_play_sound(snd_SonicAttack3,1,false);
        }
        break;
        
        case consPlayerNameShadow:
        {
            audio_play_sound(snd_Shadow_Homing2,1,false);
        }
        break;
    }
}
if action == consPlayerActionStomp
{
    vsp = vspl
    hsp = 0
    if ground
    {
        vibrate_xbox_controller(30)
        shake_camera(15)
        if audio_is_playing(snd_stomp_start)
            audio_stop_sound(snd_stomp_start)
        audio_play_sound(snd_stomp_end,1,false)
        action = consPlayerActionNormal
        vsp = 0
    }
}
if action != consPlayerActionStomp && audio_is_playing(snd_stomp_start)
    audio_stop_sound(snd_stomp_start)

