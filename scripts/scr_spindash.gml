//spin dash
if sp > 0 {sp = sp-((sp div 1)/265)}
if sp > 192 sp = 192;
if action = -2 && key_jump {sp+=8;audio_play_sound(snd_spindash,1,false)}
if action = -2 && !key_d {hsp = xdir*9+(xdir*floor(sp)/8);action = 2; sp =0;audio_play_sound(snd_spindash_launch,1,false)}
if action =-1 && key_jump 
{
    sp = 0;
    action = -2; 
    image_i = 0
    audio_play_sound(snd_spindash,1,false)
    instance_create(x,y,obj_spindash_dust)
}

