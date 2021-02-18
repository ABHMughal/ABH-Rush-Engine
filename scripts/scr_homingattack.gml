
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

