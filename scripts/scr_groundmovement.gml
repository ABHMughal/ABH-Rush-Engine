

//current highest speed
currhsph = 0


if instance_exists(obj_boostfx) && boostamount > 0
{
    if ground
        acc = 1
    else 
        acc = 0.0625
    currhsph = hspl   
}
else if super
{
    acc = 0.125
    currhsph = hspl - 2
}
else
{
    acc = 0.0625;
    
    currhsph = hspm
    
    if action != consPlayerActionRoll
    {
        if hsp > hspm
            hsp = hspm
        else if hsp < -hspm
            hsp = -hspm
    }
    else
    {
        if hsp > hspl
            hsp = hspl
        else if hsp < -hspl
            hsp = -hspl
    }
}

if instance_exists(obj_boostfx)
{   
    if hsp > 0
        xdir = 1
    else if hsp < 0
        xdir = -1
}

//skidding
if action == consPlayerActionNormal && ground
{
    if (xdir == 1 && key_l && hsp >= 3 ) || (xdir == -1 && key_r && hsp <= -3)// abs(hsp) > 3
    {
        if collision_line(x,y,x+20*asin,y+20*acos,obj_glass_wall,true,true) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_glass,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_glass,true,true) && xlayer == 1)
            audio_play_sound(snd_skid_glass,1,0)
            
        else if collision_line(x,y,x+20*asin,y+20*acos,obj_grass_wall,true,true)
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_grass,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_grass,true,true) && xlayer == 1)
            audio_play_sound(snd_skid_grass,1,0)
            
        else if collision_line(x,y,x+20*asin,y+20*acos,obj_stone_wall,true,true)
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_stone,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_stone,true,true) && xlayer == 1)
            audio_play_sound(snd_skidhigh,1,0)
            
        else if collision_line(x,y,x+20*asin,y+20*acos,obj_metal_wall,true,true)
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_metal,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_metal,true,true) && xlayer == 1)
            audio_play_sound(snd_skid_metal,1,0)
            
        else if collision_line(x,y,x+20*asin,y+20*acos,obj_wood_wall,true,true)
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_wood,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_wood,true,true) && xlayer == 1)
            audio_play_sound(snd_skid_wood,1,0)
            
        else if collision_line(x,y,x+20*asin,y+20*acos,obj_dirt_wall,true,true)
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_bwalls_dirt,true,true) && xlayer == 0) 
        || (collision_line(x,y,x+20*asin,y+20*acos,obj_fwalls_dirt,true,true) && xlayer == 1)
            audio_play_sound(snd_skid_dirt,1,0)
        else
            audio_play_sound(snd_skidhigh,1,0)
        action = consPlayerActionSkid
        image_i = 0
         
    }
}
if action == consPlayerActionSkid 
{
    if hsp > 1
        hsp -= dcc/4
    if hsp < -1
        hsp += dcc/4
    
    if hsp > 1 && key_l
        hsp -= dcc/3
    if hsp < -1 && key_r
        hsp += dcc/3
    
    if (xdir == 1 && key_r && !key_l) || (xdir == -1 && key_l && !key_r)
        action = consPlayerActionNormal
        
    if abs(hsp) <= 1 || !ground
    {
        action = consPlayerActionNormal
        xdir = -xdir
    }
}

//direction

if action = consPlayerActionNormal //&&  !instance_exists(obj_boostfx)
{
    if key_l xdir = -1;
    if key_r xdir =  1;
}

///movment
if (action == consPlayerActionNormal || action == consPlayerActionJump || action == consPlayerActionCorkscrew)
{
    if ground{
        if key_r
        {
            if hsp >=0 
            {
                if hsp< currhsph 
                    hsp+=acc
            } 
            else hsp+=dcc;
        }
        if key_l
        {
            if hsp<=0 
            {
                if hsp > -currhsph 
                    hsp-=acc
            }         
            else 
                hsp-=dcc;
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
    else
    {
        if key_r
        {if hsp >=0 {if hsp < currhsph hsp+=acc*2}}
        if key_l
        {if hsp<=0 {if hsp > -currhsph hsp-=acc*2}}
        if !key_r && !key_l
        {if hsp > 0 hsp-=frc; if hsp<0 hsp+=frc;if hsp <= frc && hsp >= -frc hsp=0;}
    }
}
//ground spin
if action == consPlayerActionRoll
{
    if ground{
        if hsp > bfr {hsp-=bfr;if key_l hsp-=bdcc}
        if hsp <-bfr {hsp+=bfr;if key_r hsp+=bdcc}
        if hsp < bfr && hsp > -bfr hsp = 0;
    }
    else
    {
        if key_r
        {if hsp >=0 {if hsp< hspm hsp+=acc*2}}
        if key_l
        {if hsp<=0 {if hsp > -hspm hsp-=acc*2}}
    }
}

