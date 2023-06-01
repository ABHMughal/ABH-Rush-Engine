

//current highest speed
currhsph = 0

//boost control part
if key_boost
    boosting = true
if key_boostr
    boosting = false

if boosting && (((action == consPlayerActionNormal || action == consPlayerActionGrinding) && ground) || action == consPlayerActionJump || action == consPlayerActionCorkscrew)
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
    
    if !instance_exists(obj_jumpfx)
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

//if ground && !canWallJump
//    canWallJump = true
    
//rolling ducking
if key_d && ground && (action == consPlayerActionNormal || action == consPlayerActionJump)
{
    if abs(hsp) < 1.03125 {hsp=0; action = consPlayerActionDuck; image_i = 0}
    if abs(hsp) >= 1.03125 {action = consPlayerActionRoll; audio_play_sound(snd_roll,1,false)}    
}


if action == consPlayerActionDuck && !key_d && image_i >= 5{action=consPlayerActionNormal;}///un duck
if action == consPlayerActionRoll && abs(hsp) < 0.5 && ground {action =consPlayerActionNormal;}///un roll
if action == consPlayerActionRoll && vsp > 0 && !ground && collision_script_ground(14)//un roll on ground
{action = consPlayerActionNormal;}

//looking up
if key_u && ground && action =consPlayerActionNormal
{
    if abs(hsp) < 0.2 {hsp =0;action =consPlayerActionLookUp; image_i = 0};
}
if (!key_u||!ground||key_r||key_l)&& (action=consPlayerActionLookUp && image_i >= 5)
    action=consPlayerActionNormal;


//spin dash
if sp > 0 {sp = sp-((sp div 1)/265)}
if sp > 192 sp = 192;
if action = consPlayerActionSpindashCharge && key_jump {sp+=8;audio_play_sound(snd_spindash,1,false)}
if action = consPlayerActionSpindashCharge && !key_d {hsp = xdir*9+(xdir*floor(sp)/8);action = consPlayerActionRoll; sp =0;audio_play_sound(snd_spindash_launch,1,false)}
if action =consPlayerActionDuck && key_jump 
{
    sp = 0;
    action = consPlayerActionSpindashCharge; 
    image_i = 0
    audio_play_sound(snd_spindash,1,false)
    instance_create(x,y,obj_spindash_dust)
}

//homing attack
if (action == consPlayerActionJump || (action == consPlayerActionNormal && !ground) || action == consPlayerActionSwingBarJump) // || (action == consPlayerActionSpringJump && hsp == 0))
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

if (action == consPlayerActionJump && djmp && key_jumpr) || (action == consPlayerActionNormal && !ground) || action == consPlayerActionSpringJump
    djmp = false
    

if instance_exists(obj_hominglock)
{
    if key_jump && !djmp
    {
        if action != consPlayerActionHomingTarget
            audio_play_sound(snd_homing,1,false);
        action = consPlayerActionHomingTarget
        hsp = 0
        vsp = 0
        move_towards_point(obj_hominglock.x,obj_hominglock.y,20);
    }
}
else
{
    if key_jump && !ground && (action == consPlayerActionJump || action == consPlayerActionNormal) && !djmp && djmp2
    {
        if action != consPlayerActionHomingNoTarget
        {
            if character == consPlayerNameSonic
                audio_play_sound(snd_homing,1,false);
            else if character == consPlayerNameShadow
                audio_play_sound(snd_Shadow_Warp,1,false);
        }
        action = consPlayerActionHomingNoTarget
        hsp = xdir*9
        vsp = 0
        alarm2 = 15
        djmp = true
        djmp2 = false
        image_i = 0
    }
    else if action = consPlayerActionHomingNoTarget && ground
    {
        action=consPlayerActionNormal
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
    
    
if action == consPlayerActionHomingNoTarget
{
    hsp = xdir*12
    vsp = 0
}

if action == consPlayerActionHomingTarget && instance_exists(obj_hominglock)
{
    move_towards_point(obj_hominglock.x,obj_hominglock.y,20);
}
else
{ 
    vspeed = 0;
    hspeed = 0;
}

if action == consPlayerActionHomingTarget && (place_meeting(x,y,obj_walls) || ground) 
    action = consPlayerActionNormal

//after homing attack trick is action consPlayerActionTrick which is not controlled here, however djmp2 is controlled in draw event 
    
// spring jump and dash ring
if (action == consPlayerActionSpringJump || action == consPlayerActionDashRing)
{
    if hsp > 0
        xdir = 1;
    else if hsp < 0
        xdir = -1;
        
    if ground
        action = consPlayerActionNormal;
} 

//dash ramp
if action == consPlayerActionDashRamp
{
    hsp = 12*xdir
    if ground
        action = consPlayerActionNormal
}

//dash pad
if action == consPlayerActionDashPad
{
    if hsp > 0
        hsp = hspl
    else if hsp < 0
        hsp = -hspl
}

//slide
if character == consPlayerNameSonic
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
else if character == consPlayerNameShadow
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

//grinding
if vsp >= 0
    canGrind = true
else
    canGrind = false


if canGrind && ground && collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)  //collision_point(x+16*asin,y+16*acos,obj_rail,true,true)
{
    if action == consPlayerActionRoll
        action = consPlayerActionNormal
        
    if action != consPlayerActionGrinding
    {
        audio_play_sound(snd_railcontact,1,false)
        if !instance_exists(obj_grindspark)
            instance_create(x,y,obj_grindspark)
    }
    action = consPlayerActionGrinding    
}


if action == consPlayerActionGrinding
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
        action = consPlayerActionNormal
}
if action != consPlayerActionGrinding && action != consPlayerActionZipLineStart && action != consPlayerActionZipLineTravel && audio_is_playing(snd_grinding)
    audio_stop_sound(snd_grinding)

    
//swingbar
if action == consPlayerActionSwingBar
{
    x = instance_nearest(x,y,obj_swingbar).x
    y = instance_nearest(x,y,obj_swingbar).y
    hsp = 0
    vsp = 0
    
    if key_jump && (image_i % 15 >= 0 && image_i % 15 < 5)   
    {
        audio_play_sound(snd_spin,1,false)
        action = consPlayerActionSwingBarJump
        vsp = -8
        hsp = xdir*10
    }
    else if key_jump
    {
        action = consPlayerActionNormal
        y += 10
    }
}

//swingbar end
if action == consPlayerActionSwingBarJump
{
    if vsp >= 2 || ground
        action = consPlayerActionNormal
}

//qte time
if action == consPlayerActionQTE
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
if action == consPlayerActionQTESucces
{
    hsp = xdir*9
    if ground
        action = consPlayerActionNormal
}
//qte fail
if action == consPlayerActionQTEFail
{
    hsp += xdir*acc*2
    if ground 
        action = consPlayerActionNormal
}

//corkscrew movement (main movement is in corkscrew object)
if action == consPlayerActionCorkscrew
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = consPlayerActionNormal
        image_i = 0
    }
    
}

if action == consPlayerActionCorkscrewRoll // corkscrew while rolling
{
    vsp = 0
    angle = 0
    if ground || abs(obj_Sonic.hsp) < 4
    {
        action = consPlayerActionRoll
        image_i = 0
    }
}
//stomp
if (action == consPlayerActionNormal || action == consPlayerActionJump) && !ground && key_d && key_attack
{
    action = consPlayerActionStomp
    audio_play_sound(snd_stomp_start,1,false);
    instance_create(x,y,obj_stompfx);
    if character == consPlayerNameSonic
        audio_play_sound(snd_SonicAttack3,1,false);
    else if character == consPlayerNameShadow
        audio_play_sound(snd_Shadow_Homing2,1,false);
}
if action == consPlayerActionStomp
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
        action = consPlayerActionNormal
        vsp = 0
    }
}
if action != consPlayerActionStomp && audio_is_playing(snd_stomp_start)
    audio_stop_sound(snd_stomp_start)

//wallhang and walljump (made basics of it but has some bugs on it so I didn't try to fix it)
if action == consPlayerActionWallHang
{
    vsp = 0
    hsp = 0
        
    if key_jump
    {
        alarm[2] = 0
        xdir = -xdir
        action = consPlayerActionWallJump
        vsp = -7
        hsp = 9*xdir
        audio_play_sound(snd_jump,1,false)
    }
}
if action == consPlayerActionWallJump
{
    if ground || vsp >= 0
        action = consPlayerActionNormal
}

//4 way canon
if action == consPlayerAction4WayCanon
{
    vsp = 0
    hsp = 0
    if key_jump
    {
        
        if key_u
        {
            vsp = -10
            action = consPlayerActionNormal
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_r
        {
            alarm0 = 30
            grv = 0
            hsp = 9
            action = consPlayerActionDashRing
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_l
        {
            alarm0 = 30
            grv = 0
            hsp = -9
            action = consPlayerActionDashRing    
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
        else if key_d
        {
            vsp = 10
            action = consPlayerActionNormal
            audio_play_sound(snd_4waycanon_blast,1,false)
            audio_play_sound(snd_rainbowring,1,false)
        }
    }
}

//taking damage
if action == consPlayerActionDamaged
{
    if ground
    {    
        hsp = 0
        vsp = 0
    }    
    if image_i >= 21
    {
        image_i = 0
        action = consPlayerActionNormal
    }
}

//light ring dash

if distance_to_object(instance_nearest(x,y,obj_lightrings)) <= 20 && key_special
    action = consPlayerActionLightRingDash

if action == consPlayerActionLightRingDash
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
        action = consPlayerActionNormal
        hspeed = 0
        vspeed = 0
    }
}
//move towards jump panel 
if action == consPlayerActionJumpPanelJump
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
        action = consPlayerActionNormal
        hsp = xdir*5   
        jumppanel = 1
    }
}
//stick to jump panel
if action == consPlayerActionJumpPanelLand
{
    hspeed = 0
    vspeed = 0
    hsp = 0
    vsp = 0
    x = instance_nearest(x,y,obj_jumppanel_parent).x - sin(degtorad(instance_nearest(x,y,obj_jumppanel_parent).image_angle))*4
    y = instance_nearest(x,y,obj_jumppanel_parent).y - cos(degtorad(instance_nearest(x,y,obj_jumppanel_parent).image_angle))*4
}

//dead
if action == consPlayerActionDead
{
    if ground
    {
        hsp = 0
        vsp = 0
    }
}

//pulley grab
if action == consPlayerActionPulley
{
    x = instance_nearest(x,y,obj_pulleyhandle).x
    y = instance_nearest(x,y,obj_pulleyhandle).y + instance_nearest(x,y,obj_pulleyhandle).vspeed
    vsp = 0
    hsp = 0
}

//shadow chaos
/*
if character == consPlayerNameShadow
{
    if key_special && action == consPlayerActionJump && !ground && abs(hsp) <= 2 && boostamount >= 25
    {
        image_i = 0
        action = consPlayerActionChaosControl 
        audio_play_sound(snd_Shadow_Shoot,1,false)
        //shader_set(shader_ColourInverse)
    }
}
//chaos slow motion (unfinished)
if action = consPlayerActionChaosControl
{
    vsp = 0
    hsp = 0
    if image_i == 4
    {
        action = consPlayerActionNormal
        boostamount -= 25
        room_speed = 30
        alarm4 = 300
    }
}
*/

//pole
if action == consPlayerActionPole
{
    if place_meeting(x,y,obj_pole)
    {
        hsp = 0
        vsp = 0
        
        x = instance_nearest(x,y,obj_pole).x
        y += 2
        
        if key_jump
        {
            action = consPlayerActionJump
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
        action = consPlayerActionNormal
}

//bungee
if action == consPlayerActionBungee
{
    hsp = 0
    vsp -= 0.5
}

//super transformation

if !ground && action == consPlayerActionJump && key_special && rings >= 50 && !super
{
    super = true
    image_i = 0 
    action = consPlayerActionSuperTransformation    
}

if action == consPlayerActionSuperTransformation
{
    hsp = 0
    vsp = 0
    if image_i >= 16
        action = consPlayerActionNormal   
}

if super && rings <= 0
{
    super = false
}



//zipline
if action == consPlayerActionZipLineStart
{
    xdir = 1
    vsp = 0
    y = instance_nearest(x,y,obj_zipline_pre).y + 2
    hsp += 0.125
}
if action == consPlayerActionZipLineTravel
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
if action == consPlayerActionPullGrab
{
    vsp = 0
    hsp = 0
}

//auto-tunnel movement

if action == consPlayerActionAutoTunnel
{
    hsp = 12
    ground = true
}
