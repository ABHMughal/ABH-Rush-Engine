//grinding

var _radius = 8;

if vsp >= 0
    canGrind = true
else
    canGrind = false

if canGrind && ground && collision_circle(x+asin*mask,y+acos*mask,_radius,obj_rail,true,true) // collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)
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
    if !ground  || !collision_circle(x+asin*mask,y+acos*mask,_radius,obj_rail,true,true) // !collision_line(x,y,x+20*asin,y+20*acos,obj_rail,true,true)   
        action = consPlayerActionNormal
}
if action != consPlayerActionGrinding && action != consPlayerActionZipLineStart && action != consPlayerActionZipLineTravel && audio_is_playing(snd_grinding)
    audio_stop_sound(snd_grinding)

