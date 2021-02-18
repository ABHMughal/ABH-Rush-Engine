//pulley grab
if action == 27
{
    x = instance_nearest(x,y,obj_pulleyhandle).x
    y = instance_nearest(x,y,obj_pulleyhandle).y + instance_nearest(x,y,obj_pulleyhandle).vspeed
    vsp = 0
    hsp = 0
}
