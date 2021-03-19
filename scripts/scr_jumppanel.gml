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

