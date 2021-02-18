walksound = false
//boost particle trail
part_type_direction(global.particle3, wrap_angle(floor(point_direction(x_begin,y_begin,x,y))), wrap_angle(floor(point_direction(x_begin,y_begin,x,y))),0,0);
         
if (action == 4 || action == 4.5 || action == 18 || (instance_exists(obj_boostfx)))
{
     part_particles_create(global.particle3,x,y,global.particle3,2);
}

// handling image angle 

if hsp == 0 && (action <= 0) && ground
    i_angle = 0
else if (i_angle != 0 && action == 0 && !ground)
{
    if i_angle%360 < 180   
        i_angle -= 7
    else if i_angle% 360 > 180
        i_angle += 7
    else if i_angle == 180
    {
        if xdir == 1
            i_angle += 10
        else
            i_angle -= 10
    }
    if i_angle % 360 < 10
        i_angle = 0
}
else if ground && collision_line(x,y,x,y+20,obj_water_surface,true,true) //if running on water then angle is 0
{
    i_angle = 0
}
else
    i_angle = angle

//if on the jump panel then set the angle according to jump panel's angle
if action == 25
    i_angle = instance_nearest(x,y,obj_jumppanel_parent).image_angle
    
//if took damage then make invincible effect
if hitInvincible > 0 && hitInvincible % 2 == 0 && action != 22
    image_alpha = !image_alpha
else
    image_alpha = 1


//handling image index and frame speed
if image_i > 998
{
    image_i = 0;
}
if frame >= 1
{
    frame = 0;
    image_i += 1;
}

//This section is where the sprite changes according to the action performed by Sonic

//standing
if hsp = 0 && ground && action == 0
{
    sprp = spr_Shadow_stand;
    frame += 0.20;
    last_action = 0;
}
//ducking
if action == -1
{
    sprp = spr_Shadow_duck

    if key_d && image_i == 3
        frame = 0 
    else frame += 0.5
}
//lookup
if action == -3
{
    sprp = spr_Shadow_lookup
    
    if key_u && image_i == 2
        frame = 0
    else frame += 0.25       
}

//walking running and spriting
if (hsp != 0 && ground) && action == 0
{
    if last_action == 0
    {
        image_i = 0;
    }
    last_action = 1;
    
        
    if abs(hsp) < 3
    {
        sprp = spr_Shadow_walk;
        frame += 1/max(6-(abs(hsp)),1);
    }
    else if abs(hsp) >= 3 && abs(hsp) < 6
    {
        sprp = spr_Shadow_jog;
        frame += 1/max(7-(abs(hsp)),1);
    }
    else if abs(hsp) >= 6 && abs(hsp) < 10
    {
        sprp = spr_Shadow_skate;
        frame += 1/max(9-(abs(hsp)),0.5);
        
    }
    else if abs(hsp) >= 10 && abs(hsp) < 13
    {
        sprp = spr_Shadow_skate_fast;
        frame += 1 //1/max(10.05-(abs(hsp)),0.5);
    }
    else if abs(hsp) >= 13
    {
        sprp = spr_Shadow_skate_fast;
        frame += 1
    }
    if sprp == spr_Shadow_walk || sprp == spr_Shadow_jog
    {
        if image_i >= 8
           image_i = 0
    }
    else if sprp == spr_Shadow_fly
    {
        if image_i >= 5
            image_i = 0
    }
    else if sprp == spr_Shadow_skate
    {
        if image_i >= 29
           image_i = 0
    }
    else
    {
        if image_i >= 35
            image_i = 0
    }
}
else if !ground && action == 0
{
    /*
    if vsp < -1
    {
        sprp = spr_Sonic_jump;
        frame += 0.25
    }
    else if vsp < 0 && vsp >= -1
    {
        if sprp != spr_Sonic_jumpmid
            image_i = 0
        sprp = spr_Sonic_jumpmid;
        frame += 0.25 
    }
    else if vsp < 1 && vsp >= 0
    {
        if sprp != spr_Sonic_jumpend
            image_i = 0
        sprp = spr_Sonic_jumpend;
        frame += 0.25 
    }
    else
    {
        if sprp != spr_Sonic_fall
            image_i = 0
        sprp = spr_Sonic_fall
        frame += 0.25
    }
    */
    sprp = spr_Shadow_jump
    frame += 0.25
    if vsp < -3
    {
        if image_i >= 3
            image_i = 0   
    }
    else
    {
        if image_i < 3
            image_i = 3
            
        if image_i >= 13
            image_i = 10
    }
    
}
//skidding

if action == -4
{
    /*if sprp != spr_Sonic_breaklow && sprp != spr_Sonic_breakhigh
    {
        if abs(hsp) > 7
            sprp = spr_Sonic_breakhigh
        else if abs(hsp) <= 7
            sprp = spr_Sonic_breaklow 
    }
    
    if sprp == spr_Sonic_breaklow
    {
        if image_i >= 3
            image_i = 1
    }
    else if sprp == spr_Sonic_breakhigh
    {
        if image_i >= 6
            image_i = 3
    }
    */
    sprp = spr_Shadow_skid;
    if image_i >= 8
        image_i = 0
    frame += 0.35
}

//jumping and rolling

if action == 1 && vsp > 0 && (collision_line(x,y,x,y+80,obj_walls,true,true) || vsp > 9)
{
    if sprp != spr_Shadow_land
        image_i = 0
    sprp = spr_Shadow_land
    if image_i >= 4
        image_i = 1
    frame += 0.5
}
else if (action == 1 || action == 2 || action == 3 || action == 34) //&& sprp != spr_Sonic_land
{
    frame += 1/max(2-(abs(hsp)),1);
    sprp = spr_Shadow_spinjump;
}



//spindash
if action == -2
{
    sprp = spr_Shadow_spindash
    frame += 0.5
    if image_i == 3 || image_i == 7
        image_i = 0
    if key_jump
        image_i = 4
}

//homing
if action == 4
{
    frame += 1
    sprp = spr_Shadow_spinjump;
}
if action == 4.5
{
    frame += 0.5
    sprp = spr_Shadow_airdash
}

if action == 5 //springjump
{
    if sprp == spr_Shadow_jump || sprp == spr_Shadow_walljump
    {
        if image_i >= 3
            image_i = 0
        frame += 0.25;
        if vsp >= -4 
            action = 0   
    }
    if sprp == spr_Shadow_corkscrew
    {
        if image_i <= 10
            frame += 0.25;
        else
            action = 0     
    }   
}

//walljump
if action == 6
{
    sprp = spr_Shadow_walljump
    frame += 0.25
}

//dashramp
if action == 7
{
    /*if !key_boost && sprp != spr_Sonic_walljump
    {
        if vsp < 2  
        {
            if sprp != spr_Sonic_corkscrew
                image_i = 0
            sprp = spr_Sonic_corkscrew
            frame += 0.25;
        }
        else if vsp < 4 && vsp >= 2
        {
            if sprp != spr_Sonic_jumpend
                image_i = 0
            sprp = spr_Sonic_jumpend;
            frame += 0.25
        }
        else
        {
            sprp = spr_Sonic_fall
            frame += 0.25
        }   
        
    }
    else
    {*/
        if vsp < 2
        {
            sprp = spr_Shadow_walljump
            frame += 0.25
        }
        else
        {
            sprp = spr_Shadow_jump
            if vsp >= 2 && vsp < 2.25
                image_i = 7
            if image_i < 7
                image_i = 7
            if image_i >= 12
                image_i = 10
                
            frame += 0.25
        }
        /*
        else if vsp < 4 && vsp >= 2
        {
            if sprp != spr_Sonic_jumpend
                image_i = 0
            sprp = spr_Sonic_jumpend;
            frame += 0.25
        }
        else
        {
            sprp = spr_Sonic_fall
            frame += 0.25
        }*/ 
    //}
    
}
//dashpad
if action == 8
{
    sprp = spr_Shadow_spinjump;
    frame += 1/max(2-(abs(hsp)),1);
}
//slide

if action == 9
{
    sprp = spr_Shadow_groundattack
    frame += 0.5
      
}

/*
if action == 9 && (sprp == spr_Sonic_fall || sprp == spr_Sonic_spinjump || sprp == spr_Sonic_walk || sprp == spr_Sonic_jog || sprp == spr_Sonic_runslow || sprp == spr_Sonic_runfast || sprp == spr_Sonic_sprint)
{   
    image_i = 0
    sprp = spr_Sonic_slidestart;
}
if action == 9 && sprp == spr_Sonic_slidestart
    frame += 0.5;
    
if action == 9 && sprp == spr_Sonic_slidestart && image_i >= 3
    sprp = spr_Sonic_slide
    
if action == 9 && sprp == spr_Sonic_slide
    frame += 1/max(7-(abs(hsp)),1);
*/
//trick
if action == 10
{
    if image_i >= 10
    {
        action = 0;
        djmp2 = true
    }
    frame += 0.25;
}

//grinding
if action == 11 && collision_line(x,y,x+25*asin,y+25*acos,obj_rail,true,true) && ground
{ 
    sprp = spr_Shadow_grind
    frame += 0.25;
}

//bar swing
if action == 12
{
    sprp = spr_Shadow_360swing
    frame += 0.35
}

if action == 13
{
    sprp = spr_Shadow_roll
    frame += 1;
}

//qte
if action == 14
{
    sprp = spr_Shadow_jump;
    if image_i >= 3
        image_i = 0
    frame += 0.25
}


//qte success
if action == 15
{
    sprp = spr_Shadow_qtetrick
    frame += 0.2545
    if image_i >= 15
        action = 0
}
//qte fail
if action == 15.5
{
    sprp = spr_Shadow_qtefail
    if image_i <= 3
        frame += 0.15
    else
        frame += 0.25
    if image_i >= 9
        image_i = 7
}

//corkscrew
if action == 16
{
    sprp = spr_Shadow_corkscrew
}
if action == 17
{
    sprp = spr_Shadow_spinjump
    frame += 1/max(2-(abs(hsp)),1);
}

//stomp
if action == 18
{
    sprp = spr_Shadow_stomp
    frame += 0.5
}

//walljump
if action == 19
{
    sprp = spr_Shadow_wallhang
}
if action == 20
{
    sprp = spr_Shadow_walljump
    frame += 0.25
}

//4way canon
if action = 21
{
    sprp = spr_Shadow_spinjump
    frame += 0.25
}

//taking damage
if action == 22
{
    sprp = spr_Shadow_hit
    if !(!ground && image_i == 1)
        frame += 0.25
    
}

//light ring dash
if action == 23
{
    sprp = spr_Shadow_walljump
    frame += 0.5
}

//jump panel
if action == 24
{
    sprp = spr_Shadow_spinjump
    frame += 0.5
}
if action == 25
{
    sprp = spr_Shadow_duck2
}

//dead
if action == 26
{
    sprp = spr_Shadow_dead1
    if !(!ground && image_i == 4)
        frame += 0.25
    if image_i >= 11
    image_i = 10
}

//pulley grab and zipline
if action == 27 || action == 32 || action == 32.5 || action == 33
{
    sprp = spr_Shadow_grab
    frame += 0.125
}


//chaos control
if action == 28
{
    sprp = spr_Shadow_chaosmove_air
    frame += 0.125
}

//pole
if action == 29
{
    sprp = spr_Shadow_pole
    frame += 0.25
}

//bungee
if action == 30
{
    sprp = spr_Shadow_bungee
    frame += 0.25
    //if image_i > 4
    //    image_i = 3
}
