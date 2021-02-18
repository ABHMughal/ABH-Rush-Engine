//boost particle trail
part_type_direction(global.particle1, wrap_angle(floor(point_direction(x_begin,y_begin,x,y))), wrap_angle(floor(point_direction(x_begin,y_begin,x,y))),0,0);
         
if (action == 4 || action == 4.5 || action == 18 || (instance_exists(obj_boostfx)))
{
     part_particles_create(global.particle1,x,y,global.particle1,2);
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

/*
//this section fixes Sonic being colliding a little inside of the wall surface, while drawing the sprites
var _wall = 0 
var _bbox_top = 0
if place_meeting(x,y,obj_walls)
{
    _wall = instance_place(x+asin*16,y+acos*16,obj_walls)
    _bbox_top = sprite_get_bbox_top(_wall) - sprite_get_yoffset(_wall)
}
else if place_meeting(x,y,obj_bwalls) || xlayer == 0
{
    _wall = instance_place(x+asin*16,y+acos*16,obj_bwalls)
    _bbox_top = sprite_get_bbox_top(_wall) - sprite_get_yoffset(_wall)
}
else if place_meeting(x,y,obj_fwalls) || xlayer == 1
{
    _wall = instance_place(x+asin*16,y+acos*16,obj_fwalls)
    _bbox_top = sprite_get_bbox_top(_wall) - sprite_get_yoffset(_wall)
}


if collision_point(x+14.5*asin,y+14.5*acos,obj_walls,true,true)
    _bbox_top += 1

draw_yPos = _bbox_top
    
// drawing sprite    
if acos == 1 && ground
{
    draw_sprite_ext(sprp,image_i,x,y - _bbox_top,xdir,1,i_angle,c_white,image_alpha);
}
else if acos == -1 && ground
    draw_sprite_ext(sprp,image_i,x,y+2,xdir,1,i_angle,c_white,image_alpha);
else
    draw_sprite_ext(sprp,image_i,x,y,xdir,1,i_angle,c_white,image_alpha);
*/

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
    sprp = spr_Sonic_stand;
    frame += 0.20;
    last_action = 0;
}
//ducking
if action == -1
{
    sprp = spr_Sonic_duck

    if key_d && image_i == 3
        frame = 0 
    else frame += 0.5
}
//lookup
if action == -3
{
    sprp = spr_Sonic_lookup
    
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
        sprp = spr_Sonic_walk;
        frame += 1/max(6-(abs(hsp)),1);
    }
    else if abs(hsp) >= 3 && abs(hsp) < 6
    {
        sprp = spr_Sonic_jog;
        frame += 1/max(8-(abs(hsp)),1);
    }
    else if abs(hsp) >= 6 && abs(hsp) < 8
    {
        sprp = spr_Sonic_runslow;
        frame += 1/max(10-(abs(hsp)),1);
    }
    else if abs(hsp) >= 8 && abs(hsp) < 11
    {
        sprp = spr_Sonic_runfast;
        frame += 1/max(12-(abs(hsp)),1);
    }
    else if abs(hsp) >= 11
    {
        sprp = spr_Sonic_sprint1;
        frame += 1/max(13.5-(abs(hsp)),1.1);
    }
    if image_i >= 8
        image_i = 0
}
else if !ground && action == 0
{
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
}
//skidding

if action == -4
{
    if sprp != spr_Sonic_breaklow && sprp != spr_Sonic_breakhigh
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
    frame += 0.35
}

//jumping and rolling

if action == 1 && vsp > 0 && (collision_line(x,y,x,y+80,obj_walls,true,true) || vsp > 9)
{
    if sprp != spr_Sonic_land
        image_i = 0
    sprp = spr_Sonic_land
    if image_i >= 4
        image_i = 1
    frame += 0.25
}
else if (action == 1 || action == 2 || action == 3 || action == 34) //&& sprp != spr_Sonic_land
{
    frame += 1/max(2-(abs(hsp)),1);
    sprp = spr_Sonic_spinjump;
}

if sprp == spr_Sonic_land
    frame += 0.25

//spindash
if action == -2
{
    sprp = spr_Sonic_spindash
    frame += 0.5
    if image_i == 3 || image_i == 7
        image_i = 0
    if key_jump
        image_i = 4
}

//homing
if action == 4 || action == 4.5
{
    frame += 1
    sprp = spr_Sonic_spinjump;
}

if action == 5 //springjump
{
    if sprp == spr_Sonic_jump || sprp == spr_Sonic_walljump
    {
        frame += 0.25;
        if vsp >= -4 
            action = 0   
    }
    if sprp == spr_Sonic_corkscrew
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
    sprp = spr_Sonic_walljump
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
            sprp = spr_Sonic_walljump
            frame += 0.25
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
    //}
    
}
//dashpad
if action == 8
{
    sprp = spr_Sonic_spinjump;
    frame += 1/max(2-(abs(hsp)),1);
}
//slide
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

//trick
if action == 10
{
    if image_i >= 9
    {
        action = 0;
        djmp2 = true
    }
    frame += 0.25;
}

//grinding
if action == 11 && collision_line(x,y,x+25*asin,y+25*acos,obj_rail,true,true) && ground
{
    if abs(hsp) < 8.5
        sprp = spr_Sonic_grind
    else
        sprp = spr_Sonic_grind_fast
    frame += 0.5;
}

//bar swing
if action == 12
{
    sprp = spr_Sonic_360swing
    frame += 0.35
}

if action == 13
{
    sprp = spr_Sonic_roll
    frame += 1;
}

//qte
if action == 14
{
    sprp = spr_Sonic_jump;
    frame += 0.25
}


//qte success
if action == 15
{
    sprp = spr_Sonic_qtetrick2
    frame += 0.35
    if image_i >= 22
        action = 0
}
//qte fail
if action == 15.5
{
    sprp = spr_Sonic_qtefail
    if image_i <= 3
        frame += 0.15
    else
        frame += 0.25
    if image_i >= 7
        image_i = 5
}

//corkscrew
if action == 16
{
    sprp = spr_Sonic_corkscrew
}
if action == 17
{
    sprp = spr_Sonic_spinjump
    frame += 1/max(2-(abs(hsp)),1);
}

//stomp
if action == 18
{
    sprp = spr_Sonic_stomp
    frame += 0.5
}

//walljump
if action == 19
{
    sprp = spr_Sonic_wallhang
}
if action == 20
{
    sprp = spr_Sonic_walljump
    frame += 0.25
}

//4way canon
if action = 21
{
    sprp = spr_Sonic_roll
    frame += 0.25
}

//taking damage
if action == 22
{
    sprp = spr_Sonic_hit
    if !(!ground && image_i == 4)
        frame += 0.25
    
}

//light ring dash
if action == 23
{
    sprp = spr_Sonic_walljump
    frame += 0.5
}

//jump panel
if action == 24
{
    sprp = spr_Sonic_spinjump
    frame += 0.5
}
if action == 25
{
    sprp = spr_Sonic_duck2
}

//dead
if action == 26
{
    sprp = spr_Sonic_dead1
    if !(!ground && image_i == 4)
        frame += 0.25
    if image_i >= 11
    image_i = 10
}

//pulley grab and zipline
if action == 27 || action == 32 || action == 32.5 || action == 33
{
    sprp = spr_Sonic_grab
    frame += 0.125
}

//pole
if action == 29
{
    sprp = spr_Sonic_pole
    frame += 0.25
}

//bungee
if action == 30
{
    sprp = spr_Sonic_bungee
    frame += 0.25
    //if image_i > 4
    //    image_i = 3
}
