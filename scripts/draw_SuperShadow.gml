walksound = false
//boost particle trail
part_type_direction(global.particle4, wrap_angle(floor(point_direction(x_begin,y_begin,x,y))), wrap_angle(floor(point_direction(x_begin,y_begin,x,y))),0,0);
         
if (action == consPlayerActionHomingTarget || action == consPlayerActionHomingNoTarget || action == consPlayerActionStomp || (instance_exists(obj_boostfx)))
{
     part_particles_create(global.particle4,x,y,global.particle4,2);
}

// handling image angle 

if hsp == 0 && (action <= consPlayerActionNormal) && ground
    i_angle = 0
else if (i_angle != 0 && action == consPlayerActionNormal && !ground)
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
if action == consPlayerActionJumpPanelLand
    i_angle = instance_nearest(x,y,obj_jumppanel_parent).image_angle
    
//if took damage then make invincible effect
if hitInvincible > 0 && hitInvincible % 2 == 0 && action != consPlayerActionDamaged
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
if hsp = 0 && ground && action == consPlayerActionNormal
{
    sprp = spr_SuperShadow_stand;
    frame += 0.20;
    last_action = consPlayerActionNormal;
}
//ducking
if action == consPlayerActionDuck
{
    sprp = spr_SuperShadow_duck

    if key_d && image_i == 3
        frame = 0 
    else frame += 0.5
}
//lookup
if action == consPlayerActionLookUp
{
    sprp = spr_SuperShadow_lookup
    
    if key_u && image_i == 2
        frame = 0
    else frame += 0.25       
}

//walking running and spriting
if (hsp != 0 && ground) && action == consPlayerActionNormal
{
    if last_action == consPlayerActionNormal
    {
        image_i = 0;
    }
    last_action = consPlayerActionJump;
    
        
    if abs(hsp) < 3
    {
        sprp = spr_SuperShadow_walk;
        frame += 1/max(6-(abs(hsp)),1);
    }
    else if abs(hsp) >= 3 && abs(hsp) < 6
    {
        sprp = spr_SuperShadow_jog;
        frame += 1/max(7-(abs(hsp)),1);
    }
    else if abs(hsp) >= 6 && abs(hsp) < 8
    {
        sprp = spr_SuperShadow_skate;
        frame += 1/max(9-(abs(hsp)),1);
        
    }
    else if abs(hsp) >= 8 && abs(hsp) < 11
    {
        sprp = spr_SuperShadow_skate;
        frame += 1/max(10.05-(abs(hsp)),1);
    }
    else if abs(hsp) >= 11
    {
        sprp = spr_SuperShadow_fly;
        frame += 1/max(12-(abs(hsp)),1);
    }
    if sprp == spr_SuperShadow_walk || sprp == spr_SuperShadow_jog
    {
        if image_i >= 8
           image_i = 0
    }
    else if sprp == spr_SuperShadow_fly
    {
        if image_i >= 5
            image_i = 0
    }
    else
    {
        if image_i >= 29
           image_i = 0
    }
}
else if !ground && action == consPlayerActionNormal
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
    sprp = spr_SuperShadow_jump
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

if action == consPlayerActionSkid
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
    sprp = spr_SuperShadow_skid;
    if image_i >= 8
        image_i = 0
    frame += 0.35
}

//jumping and rolling

if action == consPlayerActionJump && vsp > 0 && (collision_line(x,y,x,y+80,obj_walls,true,true) || vsp > 9)
{
    if sprp != spr_SuperShadow_land
        image_i = 0
    sprp = spr_SuperShadow_land
    if image_i >= 4
        image_i = 1
    frame += 0.5
}
else if (action == consPlayerActionJump || action == consPlayerActionRoll || action == consPlayerActionAutoTunnel) //&& sprp != spr_Sonic_land
{
    frame += 1/max(2-(abs(hsp)),1);
    sprp = spr_SuperShadow_spinjump;
}



//spindash
if action == consPlayerActionSpindashCharge
{
    sprp = spr_SuperShadow_spindash
    frame += 0.5
    if image_i == 3 || image_i == 7
        image_i = 0
    if key_jump
        image_i = 4
}

//homing
if action == consPlayerActionHomingTarget
{
    frame += 1
    sprp = spr_SuperShadow_spinjump;
}
if action == consPlayerActionHomingNoTarget
{
    frame += 0.5
    sprp = spr_SuperShadow_airdash
}

if action == consPlayerActionSpringJump //springjump
{
    if sprp == spr_SuperShadow_jump || sprp == spr_SuperShadow_walljump
    {
        if image_i >= 3
            image_i = 0
        frame += 0.25;
        if vsp >= -4 
            action = consPlayerActionNormal   
    }
    if sprp == spr_SuperShadow_corkscrew
    {
        if image_i <= 10
            frame += 0.25;
        else
            action = consPlayerActionNormal     
    }   
}

//walljump
if action == consPlayerActionDashRing
{
    sprp = spr_SuperShadow_walljump
    frame += 0.25
}

//dashramp
if action == consPlayerActionDashRamp
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
            sprp = spr_SuperShadow_walljump
            frame += 0.25
        }
        else
        {
            sprp = spr_SuperShadow_jump
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
if action == consPlayerActionDashPad
{
    sprp = spr_SuperShadow_spinjump;
    frame += 1/max(2-(abs(hsp)),1);
}
//slide

if action == consPlayerActionSlide
{
    sprp = spr_SuperShadow_groundattack
    frame += 0.5
      
}

/*
if action == consPlayerActionSlide && (sprp == spr_Sonic_fall || sprp == spr_Sonic_spinjump || sprp == spr_Sonic_walk || sprp == spr_Sonic_jog || sprp == spr_Sonic_runslow || sprp == spr_Sonic_runfast || sprp == spr_Sonic_sprint)
{   
    image_i = 0
    sprp = spr_Sonic_slidestart;
}
if action == consPlayerActionSlide && sprp == spr_Sonic_slidestart
    frame += 0.5;
    
if action == consPlayerActionSlide && sprp == spr_Sonic_slidestart && image_i >= 3
    sprp = spr_Sonic_slide
    
if action == consPlayerActionSlide && sprp == spr_Sonic_slide
    frame += 1/max(7-(abs(hsp)),1);
*/
//trick
if action == consPlayerActionTrick
{
    if image_i >= 10
    {
        action = consPlayerActionNormal;
        djmp2 = true
    }
    frame += 0.25;
}

//grinding
if action == consPlayerActionGrinding && collision_line(x,y,x+25*asin,y+25*acos,obj_rail,true,true) && ground
{ 
    sprp = spr_SuperShadow_grind
    frame += 0.25;
}

//bar swing
if action == consPlayerActionSwingBar
{
    sprp = spr_SuperShadow_360swing
    frame += 0.35
}

if action == consPlayerActionSwingBarJump
{
    sprp = spr_SuperShadow_roll
    frame += 1;
}

//qte
if action == consPlayerActionQTE
{
    sprp = spr_SuperShadow_jump;
    if image_i >= 3
        image_i = 0
    frame += 0.25
}


//qte success
if action == consPlayerActionQTESucces
{
    sprp = spr_SuperShadow_qtetrick
    frame += 0.2545
    if image_i >= 15
        action = consPlayerActionNormal
}
//qte fail
if action == consPlayerActionQTEFail
{
    sprp = spr_SuperShadow_qtefail
    if image_i <= 3
        frame += 0.15
    else
        frame += 0.25
    if image_i >= 9
        image_i = 7
}

//corkscrew
if action == consPlayerActionCorkscrew
{
    sprp = spr_SuperShadow_corkscrew
}
if action == consPlayerActionCorkscrewRoll
{
    sprp = spr_SuperShadow_spinjump
    frame += 1/max(2-(abs(hsp)),1);
}

//stomp
if action == consPlayerActionStomp
{
    sprp = spr_SuperShadow_stomp
    frame += 0.5
}

//walljump
if action == consPlayerActionWallHang
{
    sprp = spr_SuperShadow_wallhang
}
if action == consPlayerActionWallJump
{
    sprp = spr_SuperShadow_walljump
    frame += 0.25
}

//4way canon
if action = consPlayerAction4WayCanon
{
    sprp = spr_SuperShadow_spinjump
    frame += 0.25
}

//taking damage
if action == consPlayerActionDamaged
{
    sprp = spr_SuperShadow_hit
    if !(!ground && image_i == 1)
        frame += 0.25
    
}

//light ring dash
if action == consPlayerActionLightRingDash
{
    sprp = spr_SuperShadow_walljump
    frame += 0.5
}

//jump panel
if action == consPlayerActionJumpPanelJump
{
    sprp = spr_SuperShadow_spinjump
    frame += 0.5
}
if action == consPlayerActionJumpPanelLand
{
    sprp = spr_SuperShadow_duck2
}

//dead
if action == consPlayerActionDead
{
    sprp = spr_SuperShadow_dead1
    if !(!ground && image_i == 4)
        frame += 0.25
    if image_i >= 11
    image_i = 10
}

//pulley grab and zipline
if action == consPlayerActionPulley || action == consPlayerActionZipLineStart || action == consPlayerActionZipLineTravel || action == consPlayerActionPullGrab
{
    sprp = spr_SuperShadow_grab
    frame += 0.125
}


//chaos control
if action == consPlayerActionChaosControl
{
    sprp = spr_Shadow_chaosmove_air
    frame += 0.125
}

//pole
if action == consPlayerActionPole
{
    sprp = spr_SuperShadow_pole
    frame += 0.25
}

//bungee
if action == consPlayerActionBungee
{
    sprp = spr_SuperShadow_bungee
    frame += 0.25
    //if image_i > 4
    //    image_i = 3
}

//super form
if action == consPlayerActionSuperTransformation
{
    sprp = spr_SuperShadow_transform
    frame += 0.25
}
