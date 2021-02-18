

//current highest speed
currhsph = 0

//boost control part
if key_boost
    boosting = true
if key_boostr
    boosting = false

if boosting && (((action == 0 || action == 11) && ground) || action == 1 || action == 16)
{
    if !instance_exists(obj_boostfx) && boostamount > 0
    {
        instance_create(x,y,obj_boostfx)   
    }  
}
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
    
    if action != 2
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
if action == 0 && ground
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
        action = -4
        image_i = 0
         
    }
}
if action == -4 
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
        action = 0
        
    if abs(hsp) <= 1 || !ground
    {
        action = 0
        xdir = -xdir
    }
}

//direction

if action = 0 //&&  !instance_exists(obj_boostfx)
{
    if key_l xdir = -1;
    if key_r xdir =  1;
}

///movment
if (action == 0 || action == 1 || action == 16)
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
if action == 2
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

//jumping
if key_jump && ground && (action == -4 || action == 0 || action == 2 || action == 9 || action == 11)
{
    ground = false;
    vsp = acos*jmp + (-asin*hsp)/1.5;
    hsp = hsp*acos + asin*jmp;
    angle = 0;
    acos = 1;
    asin = 0;
    action = 1;
    
    if !instance_exists(obj_jumpfx)
        instance_create(x,y,obj_jumpfx)
    
    audio_play_sound(snd_jump,1,false);
}
//small jump
if key_jumpr && vsp < sjmp && action == 1
{
    vsp = sjmp;
}

if action == 1 && !ground
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
if canMove && (action != 0 || (action == 0 && (sprp == spr_Sonic_fall || sprp == spr_Shadow_jump) && vsp > 1)) && action > -1 && action != 2 && action != 16 && action != 17 && action != 8 && action != 9 && action != 22 && action != 26 && action != 34 && ground && collision_line(x,y,x+20*asin,y+20*acos,obj_walls,true,true)
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
if ground && (action == 1)
{
    action = 0;
}

//if ground && !canWallJump
//    canWallJump = true
    
//rolling ducking
if key_d && ground && (action == 0 || action == 1)
{
    if abs(hsp) < 1.03125 {hsp=0; action = -1; image_i = 0}
    if abs(hsp) >= 1.03125 {action = 2; audio_play_sound(snd_roll,1,false)}    
}


if action == -1 && !key_d && image_i >= 5{action=0;}///un duck
if action == 2 && abs(hsp) < 0.5 && ground {action =0;}///un roll
if action == 2 && vsp > 0 && !ground && collision_script_ground(14)//un roll on ground
{action = 0;}

//looking up
if key_u && ground && action =0
{
    if abs(hsp) < 0.2 {hsp =0;action =-3; image_i = 0};
}
if (!key_u||!ground||key_r||key_l)&& (action=-3 && image_i >= 5)
    action=0;


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

//homing attack
if (action == 1 || (action == 0 && !ground) || action == 13) // || (action == 5 && hsp == 0))
{
    canHome = true   
}
else 
{
    canHome = false
}

if canHome && distance_to_object(instance_nearest(x,y,obj_homable)) <= 200 && instance_nearest(x,y,obj_homable).y > (y - 10) && !collision_line(x,y,instance_nearest(x,y,obj_homable).x,instance_nearest(x,y,obj_homable).y,obj_walls,true,true) && instance_nearest(x,y,obj_homable).canHit && (( x < instance_nearest(x,y,obj_homable).x && xdir == 1) || ( x > instance_nearest(x,y,obj_homable).x && xdir == -1))
{
    if !instance_exists(obj_hominglock)
        instance_create(instance_nearest(x,y,obj_homable).x,instance_nearest(x,y,obj_homable).y,obj_hominglock)
}
else if distance_to_object(instance_nearest(x,y,obj_homable)) > 200 || ground || instance_nearest(x,y,obj_homable).y <= (y -10) || ( x < instance_nearest(x,y,obj_homable).x && xdir == -1) || ( x > instance_nearest(x,y,obj_homable).x && xdir == 1)
{
    if instance_exists(obj_hominglock)
        with(obj_hominglock)
        {
            instance_destroy();
        }
}

if (action == 1 && djmp && key_jumpr) || (action == 0 && !ground) || action == 5
    djmp = false
    

if instance_exists(obj_hominglock)
{
    if key_jump && !djmp
    {
        if action != 4
            audio_play_sound(snd_homing,1,false);
        action = 4
        hsp = 0
        vsp = 0
        move_towards_point(obj_hominglock.x,obj_hominglock.y,20);
    }
}
else
{
    if key_jump && !ground && (action == 1 || action == 0) && !djmp && djmp2
    {
        if action != 4.5
        {
            if character == "Sonic"
                audio_play_sound(snd_homing,1,false);
            else if character == "Shadow"
                audio_play_sound(snd_Shadow_Warp,1,false);
        }
        action = 4.5
        hsp = xdir*9
        vsp = 0
        alarm2 = 15
        djmp = true
        djmp2 = false
        image_i = 0
    }
    else if action = 4.5 && ground
    {
        action=0
        alarm2 = 0
        djmp = false
        jmp2 = false
        grv = 0.21875;
    }
}
if !djmp && ground
    djmp = true

if !djmp2 && ground
    djmp2 = true
    
    
if action == 4.5
{
    hsp = xdir*12
    vsp = 0
}

if action == 4 && instance_exists(obj_hominglock)
{
    move_towards_point(obj_hominglock.x,obj_hominglock.y,20);
}
else
{ 
    vspeed = 0;
    hspeed = 0;
}

if action == 4 && (place_meeting(x,y,obj_walls) || ground) 
    action = 0

//after homing attack trick is action 10 which is not controlled here, however djmp2 is controlled in draw event 
    
// spring jump and dash ring
if (action == 5 || action == 6)
{
    if hsp > 0
        xdir = 1;
    else if hsp < 0
        xdir = -1;
        
    if ground
        action = 0;
} 

//dash ramp
if action == 7
{
    hsp = 12*xdir
    if ground
        action = 0
}

//dash pad
if action == 8
{
    if hsp > 0
        hsp = hspl
    else if hsp < 0
        hsp = -hspl
}

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

//grinding
if vsp >= 0
    canGrind = true
else
    canGrind = false


if canGrind && ground && collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)  //collision_point(x+16*asin,y+16*acos,obj_rail,true,true)
{
    if action == 2
        action = 0
        
    if action != 11
    {
        audio_play_sound(snd_railcontact,1,false)
        if !instance_exists(obj_grindspark)
            instance_create(x,y,obj_grindspark)
    }
    action = 11    
}


if action == 11
{
    if !audio_is_playing(snd_grinding)
        audio_play_sound(snd_grinding,1,false)
        
    if hsp > 0
        xdir = 1
    else if hsp < 0
        xdir = -1
    if abs(hsp) < hspm
        hsp += acc*xdir
    if instance_exists(obj_boostfx)
        hsp = hspl*xdir
    hsp += -asin*(dcc/6)
    if !ground  || !collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)   
        action = 0
}
if action != 11 && action != 32 && action != 32.5 && audio_is_playing(snd_grinding)
    audio_stop_sound(snd_grinding)

    
//swingbar
if action == 12
{
    x = instance_nearest(x,y,obj_swingbar).x
    y = instance_nearest(x,y,obj_swingbar).y
    hsp = 0
    vsp = 0
    
    if key_jump && (image_i % 15 >= 0 && image_i % 15 < 5)   
    {
        audio_play_sound(snd_spin,1,false)
        action = 13
        vsp = -8
        hsp = xdir*10
    }
    else if key_jump
    {
        action = 0
        y += 10
    }
}

//swingbar end
if action == 13
{
    if vsp >= 2 || ground
        action = 0
}

//qte time
if action == 14
{
    grv = 0
    if xdir == 1
    {
        if hsp > 0
            hsp -= 0.125
        else
            hsp = 0.625
    }
    else
    {
        if hsp < 0
            hsp += 0.125
        else
            hsp = -0.625
    }
    if vsp < 0
        vsp += 0.125
    else
        vsp = -0.3125
}

//qte success
if action == 15
{
    hsp = xdir*9
    if ground
        action = 0
}
//qte fail
if action == 15.5
{
    hsp += xdir*acc*2
    if ground 
        action = 0
}

//corkscrew movement (main movement is in corkscrew object)
if action == 16
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = 0
        image_i = 0
    }
    
}

if action == 17 // corkscrew while rolling
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = 2
        image_i = 0
    }
}
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

//wallhang and walljump (made basics of it but has some bugs on it so I didn't try to fix it)
if action == 19
{
    vsp = 0
    hsp = 0
        
    if key_jump
    {
        alarm[2] = 0
        xdir = -xdir
        action = 20
        vsp = -7
        hsp = 9*xdir
        audio_play_sound(snd_jump,1,false)
    }
}
if action == 20
{
    if ground || vsp >= 0
        action = 0
}

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

//taking damage
if action == 22
{
    if ground
    {    
        hsp = 0
        vsp = 0
    }    
    if image_i >= 21
    {
        image_i = 0
        action = 0
    }
}

//light ring dash

if distance_to_object(instance_nearest(x,y,obj_lightrings)) <= 20 && key_special
    action = 23

if action == 23
{
    if instance_exists(obj_lightrings) && distance_to_object(instance_nearest(x,y,obj_lightrings)) <= 50
    {    
        if instance_nearest(x,y,obj_lightrings).x > x
            xdir = 1
        else if instance_nearest(x,y,obj_lightrings).x < x
            xdir = -1
        move_towards_point(instance_nearest(x,y,obj_lightrings).x,instance_nearest(x,y,obj_lightrings).y,20)
        hsp = 0
        vsp = 0
        i_angle = point_direction(x,y,instance_nearest(x,y,obj_lightrings).x,instance_nearest(x,y,obj_lightrings).y)
    }
    else
    {
          
        hsp = xdir*9*cos(i_angle)
        vsp = 9*sin(i_angle)
        action = 0
        hspeed = 0
        vspeed = 0
    }
}
//move towards jump panel 
if action == 24
{
    hsp = 0
    vsp = 0
    var speedJump = 15
    if jumppanel == 1
    {
        move_towards_point(instance_nearest(x,y,obj_jumppanel_1).x,instance_nearest(x,y,obj_jumppanel_1).y,speedJump)
        if x > obj_jumppanel_1.x
            xdir =  -1
        else if x < obj_jumppanel_1.x
            xdir = 1
    }
    if jumppanel == 2
    {
        move_towards_point(instance_nearest(x,y,obj_jumppanel_2).x,instance_nearest(x,y,obj_jumppanel_2).y,speedJump)    
        if x > obj_jumppanel_2.x
            xdir =  -1
        else if x < obj_jumppanel_2.x
            xdir = 1
    }
    if jumppanel == 3
    {
        move_towards_point(instance_nearest(x,y,obj_jumppanel_3).x,instance_nearest(x,y,obj_jumppanel_3).y,speedJump)
        if x > obj_jumppanel_3.x
            xdir =  -1
        else if x < obj_jumppanel_3.x
            xdir = 1
    }
    if jumppanel == 4
    {    
        move_towards_point(instance_nearest(x,y,obj_jumppanel_4).x,instance_nearest(x,y,obj_jumppanel_4).y,speedJump)
        if x > obj_jumppanel_4.x
            xdir =  -1
        else if x < obj_jumppanel_4.x
            xdir = 1
    }
    if jumppanel == 5
    {    
        move_towards_point(instance_nearest(x,y,obj_jumppanel_end).x,instance_nearest(x,y,obj_jumppanel_end).y,speedJump)
        if x > obj_jumppanel_end.x
            xdir =  -1
        else if x < obj_jumppanel_end.x
            xdir = 1
    }
    if ground || place_meeting(x,y,obj_jumppanel_end)
    {
        action = 0
        hsp = xdir*5   
        jumppanel = 1
    }
}
//stick to jump panel
if action == 25
{
    hspeed = 0
    vspeed = 0
    hsp = 0
    vsp = 0
    x = instance_nearest(x,y,obj_jumppanel_parent).x - sin(degtorad(instance_nearest(x,y,obj_jumppanel_parent).image_angle))*4
    y = instance_nearest(x,y,obj_jumppanel_parent).y - cos(degtorad(instance_nearest(x,y,obj_jumppanel_parent).image_angle))*4
}

//dead
if action == 26
{
    if ground
    {
        hsp = 0
        vsp = 0
    }
}

//pulley grab
if action == 27
{
    x = instance_nearest(x,y,obj_pulleyhandle).x
    y = instance_nearest(x,y,obj_pulleyhandle).y + instance_nearest(x,y,obj_pulleyhandle).vspeed
    vsp = 0
    hsp = 0
}

//shadow chaos
/*
if character == "Shadow"
{
    if key_special && action == 1 && !ground && abs(hsp) <= 2 && boostamount >= 25
    {
        image_i = 0
        action = 28 
        audio_play_sound(snd_Shadow_Shoot,1,false)
        //shader_set(shader_ColourInverse)
    }
}
//chaos slow motion (unfinished)
if action = 28
{
    vsp = 0
    hsp = 0
    if image_i == 4
    {
        action = 0
        boostamount -= 25
        room_speed = 30
        alarm4 = 300
    }
}
*/

//pole
if action == 29
{
    if place_meeting(x,y,obj_pole)
    {
        hsp = 0
        vsp = 0
        
        x = instance_nearest(x,y,obj_pole).x
        y += 2
        
        if key_jump
        {
            action = 1
            if key_r
                hsp = 7
            else if key_l 
                hsp = -7
            else
                hsp = xdir*7
            audio_play_sound(snd_jump,1,false)
        }
    }
    else
        action = 0
}

//bungee
if action == 30
{
    hsp = 0
    vsp -= 0.5
}

//super transformation

if !ground && action == 1 && key_special && rings >= 50 && !super
{
    super = true
    image_i = 0 
    action = 31    
}

if action == 31
{
    hsp = 0
    vsp = 0
    if image_i >= 16
        action = 0   
}

if super && rings <= 0
{
    super = false
}



//zipline
if action == 32
{
    xdir = 1
    vsp = 0
    y = instance_nearest(x,y,obj_zipline_pre).y + 2
    hsp += 0.125
}
if action == 32.5
{
    hsp = 0
    vsp = 0
    move_towards_point(instance_nearest(x,y,obj_zipline_end).x,instance_nearest(x,y,obj_zipline_end).y-12,zipline_speed)
    if zipline_speed < hspl
        zipline_speed += 0.125
    if instance_exists(obj_boostfx)
        zipline_speed = hspl    
}

//pull grab pole
if action == 33
{
    vsp = 0
    hsp = 0
}

//auto-tunnel movement

if action == 34
{
    hsp = 12
    ground = true
}
