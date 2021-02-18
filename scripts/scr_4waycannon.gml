
//4 way canon
if action == 21
{
    vsp = 0
    hsp = 0
    if key_jump
    {
        
        if key_u
        {
            vsp = -10
            action = 0
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_r
        {
            alarm0 = 30
            grv = 0
            hsp = 9
            action = 6
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_l
        {
            alarm0 = 30
            grv = 0
            hsp = -9
            action = 6    
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_d
        {
            vsp = 10
            action = 0
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
    }
}

