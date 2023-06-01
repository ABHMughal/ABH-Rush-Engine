//footstep sounds
if ground
{
    if collision_line(x,y,x+20*asin,y+20*acos,obj_water_surface,true,true)
    {
        snd_footstep1 = snd_footstep_water1
        snd_footstep2 = snd_footstep_water2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_glass_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_glass,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_glass,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_glass1
        snd_footstep2 = snd_footstep_glass2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_grass_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_grass,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_grass,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_grass1
        snd_footstep2 = snd_footstep_grass2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_stone_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_stone,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_stone,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_1
        snd_footstep2 = snd_footstep_2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_metal_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_metal,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_metal,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_metal1
        snd_footstep2 = snd_footstep_metal2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_wood_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_wood,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_wood,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_wood1
        snd_footstep2 = snd_footstep_wood2
    }
    else if collision_line(x,y,x+20*asin,y+20*acos,obj_dirt_wall,true,true) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_dirt,true,true) && xlayer == 0) 
    || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_dirt,true,true) && xlayer == 1)
    {
        snd_footstep1 = snd_footstep_dirt1
        snd_footstep2 = snd_footstep_dirt2
    }
    else
    {
        snd_footstep1 = snd_footstep_1
        snd_footstep2 = snd_footstep_2
    }
}

if character == consPlayerNameShadow && (sprp == spr_Shadow_skate || sprp == spr_SuperShadow_skate || sprp == spr_Shadow_skate_fast) 
{
    snd_footstep1 = snd_jetboots_R
    snd_footstep2 = snd_jetboots_L
}


if action == consPlayerActionNormal && sprp != spr_Sonic_stand && sprp != spr_Shadow_stand && sprp != spr_SuperSonic_stand && sprp != spr_SuperSonic_fly && sprp != spr_SuperShadow_stand && sprp != spr_SuperShadow_fly && ground && !stageClear && sprp != spr_Tails_sprint && sprp != spr_Tails_stand && sprp != spr_Shadow_skate_fast && sprp != spr_Shadow_skate && sprp != spr_Shadow_fly
{
    if (image_i == 3 || image_i == 7 ) && !footstep
    {
        footstep = true 
        audio_play_sound(choose(snd_footstep1,snd_footstep2),1,false)
    }
    else if image_i != 3 && image_i != 7
        footstep = false
}
else if (character == consPlayerNameShadow && (sprp == spr_Shadow_skate)) 
{
    if (image_i == 0 || image_i == 14) && !footstep
    {
        footstep = true
        audio_play_sound(choose(snd_footstep1,snd_footstep2),1,false)
    }
    else if image_i != 7 && image_i != 21
        footstep = false
}
else if (character == consPlayerNameShadow && sprp == spr_Shadow_skate_fast)
{
    if (image_i == 4 || image_i == 21) && !footstep
    {
        footstep = true
        audio_play_sound(choose(snd_footstep1,snd_footstep2),1,false)
    }
    else if image_i != 0 && image_i != 17
        footstep = false
}
