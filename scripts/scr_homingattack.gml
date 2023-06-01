
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

