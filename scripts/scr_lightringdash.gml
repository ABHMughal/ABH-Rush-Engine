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
