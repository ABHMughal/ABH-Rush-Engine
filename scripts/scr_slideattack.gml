//slide
switch(character)
{
    case consPlayerNameSonic:
    {
        if ground && action == consPlayerActionNormal && abs(hsp) >= 3 && key_attack
        {
            sprp = spr_Sonic_jog
            action = consPlayerActionSlide
            audio_play_sound(snd_SonicAttack3,1,false)
        }     
        if action == consPlayerActionSlide
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
                action = consPlayerActionNormal
            if  !key_attack
                action = consPlayerActionRoll        
        }
    }
    break;
    
    case consPlayerNameShadow:
    {
        if ground && action == consPlayerActionNormal && key_attack_p
        {
            image_i = 0
            if abs(hsp) < 10
                hsp = 10*xdir 
            action = consPlayerActionSlide
            audio_play_sound(snd_Shadow_Homing2,1,false)
            audio_play_sound(snd_Shadow_Warp,1,false)
        }     
        if action == consPlayerActionSlide
        {
            if hsp > 0 
                hsp-=frc; 
            if hsp < 0 
                hsp+=frc;
        
            if image_i >= 24 || !ground
                action = consPlayerActionNormal        
        }      
    }
    break;
}

