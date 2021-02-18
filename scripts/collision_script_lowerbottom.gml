mask = argument0

if collision_point(x+(acos*mask*1.5)+(asin*mask*1.5),y-(asin*mask*1.5)+(acos*mask*1.5),obj_walls,true,true)
    return true
if xlayer = 0 && collision_point(x+(acos*mask*1.5)+(asin*mask*1.5),y-(asin*mask*1.5)+(acos*mask*1.5),obj_bwalls,true,true)
    return true
if xlayer = 1 && collision_point(x+(acos*mask*1.5)+(asin*mask*1.5),y-(asin*mask*1.5)+(acos*mask*1.5),obj_fwalls,true,true)
    return true
         
return false
