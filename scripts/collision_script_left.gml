mask = argument0;

if collision_circle(x-(acos*mask)-asin*2,y+(asin*mask)-acos*2,3,obj_walls,true,true) return true;
if xlayer = 0 && collision_circle(x-(acos*mask)-asin*2,y+(asin*mask)-acos*2,3,obj_bwalls,true,true) return true;
if xlayer = 1 && collision_circle(x-(acos*mask)-asin*2,y+(asin*mask)-acos*2,3,obj_fwalls,true,true) return true;
if collision_circle(x-(acos*mask)-asin*2,y+(asin*mask)-acos*2,3,obj_rail,true,true) && canGrind && angle == 0 return true;
return false;
