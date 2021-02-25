//grinding

var _radius = 8;

if vsp >= 0
    canGrind = true
else
    canGrind = false

if canGrind && ground && collision_circle(x+asin*mask,y+acos*mask,_radius,obj_rail,true,true) // collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)
{
    if action == 2
        action = 0
        
    if action != 11
    {
        audio_play_sound(snd_railcontact,1,false)
        if !instance_exists(obj_grindspark)
            instance_create(x,y,obj_grindspark)
    }
    action = 11    
}


if action == 11
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
    if !ground  || !collision_circle(x+asin*mask,y+acos*mask,_radius,obj_rail,true,true) // !collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)   
        action = 0
}
if action != 11 && action != 32 && action != 32.5 && audio_is_playing(snd_grinding)
    audio_stop_sound(snd_grinding)

