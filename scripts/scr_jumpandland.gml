//jumping
if key_jump && ground && (action == consPlayerActionSkid || action == consPlayerActionNormal || action == consPlayerActionRoll || action == consPlayerActionSlide || action == consPlayerActionGrinding)
{
    ground = false;
    vsp = acos*jmp + (-asin*hsp)/1.5;
    hsp = hsp*acos + asin*jmp;
    angle = 0;
    acos = 1;
    asin = 0;
    action = consPlayerActionJump;
    
    if !instance_exists(obj_jumpfx) && character != consPlayerNameTails
        instance_create(x,y,obj_jumpfx)
    
    audio_play_sound(snd_jump,1,false);
}
//small jump
if key_jumpr && vsp < sjmp && action == consPlayerActionJump
{
    vsp = sjmp;
}

if action == consPlayerActionJump && !ground
{
    if key_r
        {
            if hsp >=0 
            {
                if hsp< currhsph 
                    hsp+=acc/2
            } 
            else 
                hsp+=dcc/2;
        }
        if key_l
        {
            if hsp<=0 
            {
                if hsp > -currhsph 
                    hsp-=acc/2
            }         
            else 
                hsp-=dcc/2;
        }
        if !key_r && !key_l
        {
            if hsp > 0 
                hsp -= frc; 
            if hsp < 0 
                hsp += frc;
            if hsp <= frc && hsp >= -frc 
                hsp = 0;
        }
}

//landing
if canMove && (action != consPlayerActionNormal || (action == consPlayerActionNormal && (sprp == spr_Sonic_fall || sprp == spr_Shadow_jump) && vsp > 1)) && action > consPlayerActionDuck && action != consPlayerActionRoll && action != consPlayerActionCorkscrew && action != consPlayerActionCorkscrewRoll && action != consPlayerActionDashPad && action != consPlayerActionSlide && action != consPlayerActionDamaged && action != consPlayerActionDead && action != consPlayerActionAutoTunnel && ground && collision_line(x,y,x+20*asin,y+20*acos,obj_walls,true,true)
{    
    if collision_line(x,y,x,y+20,obj_glass_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_glass,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_glass,true,true) && xlayer == 1)
        audio_play_sound(snd_land_glass,1,0)
        
    else if collision_line(x,y,x,y+20,obj_grass_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_grass,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_grass,true,true) && xlayer == 1)
        audio_play_sound(snd_land_grass,1,0)
        
    else if collision_line(x,y,x,y+20,obj_stone_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_stone,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_stone,true,true) && xlayer == 1)
        audio_play_sound(snd_land,1,0)
        
    else if collision_line(x,y,x,y+20,obj_metal_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_metal,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_metal,true,true) && xlayer == 1)
        audio_play_sound(snd_land_metal,1,0)
        
    else if collision_line(x,y,x,y+20,obj_wood_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_wood,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_wood,true,true) && xlayer == 1)
        audio_play_sound(snd_land_wood,1,0)
        
    else if collision_line(x,y,x,y+20,obj_dirt_wall,true,true)
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_dirt,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_dirt,true,true) && xlayer == 1)
        audio_play_sound(snd_land_dirt,1,0)
        
    else
        audio_play_sound(snd_land,1,0)

}
if ground && (action == consPlayerActionJump)
{
    action = consPlayerActionNormal;
}

