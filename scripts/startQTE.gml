activate = false;
other.ground = false
other.image_i = 0;
other.x = x
other.y = y - 20
other.xdir = image_xscale
other.action = consPlayerActionQTE
other.hsp = 8*other.xdir;
other.vsp = -7
    
if audio_is_playing(snd_jumpramp)
    audio_stop_sound(snd_jumpramp)
audio_play_sound(snd_jumpramp,1,false);
alarm[0] = 60
