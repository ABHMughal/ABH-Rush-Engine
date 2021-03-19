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

