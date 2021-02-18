//slide
if character == "Sonic"
{
    if ground && action == 0 && abs(hsp) >= 3 && key_attack
    {
        sprp = spr_Sonic_jog
        action = 9
        audio_play_sound(snd_SonicAttack3,1,false)
    }     
    if action == 9
    {
        if xdir == 1 && key_l
            hsp -= dcc
        else if xdir == -1 && key_r
            hsp += dcc
        if hsp > 0 
            hsp-=frc; 
        if hsp<0 
            hsp+=frc;
    
        if abs(hsp) < 1 || !ground
            action = 0
        if  !key_attack
            action = 2        
    }
}
else if character == "Shadow"
{
    if ground && action == 0 && key_attack_p
    {
        image_i = 0
        if abs(hsp) < 10
            hsp = 10*xdir 
        action = 9
        audio_play_sound(snd_Shadow_Homing2,1,false)
        audio_play_sound(snd_Shadow_Warp,1,false)
    }     
    if action == 9
    {
        if hsp > 0 
            hsp-=frc; 
        if hsp < 0 
            hsp+=frc;
    
        if image_i >= 24 || !ground
            action = 0        
    }      
}

