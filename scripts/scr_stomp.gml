//stomp
if (action == 0 || action == 1) && !ground && key_d && key_attack
{
    action = 18
    audio_play_sound(snd_stomp_start,1,false);
    instance_create(x,y,obj_stompfx);
    if character == "Sonic"
        audio_play_sound(snd_SonicAttack3,1,false);
    else if character == "Shadow"
        audio_play_sound(snd_Shadow_Homing2,1,false);
}
if action == 18
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
        action = 0
        vsp = 0
    }
}
if action != 18 && audio_is_playing(snd_stomp_start)
    audio_stop_sound(snd_stomp_start)

