mask = argument0;
radius = 8
if collision_circle(x+asin*mask,y+acos*mask,radius,obj_walls,true,true) return true;
if xlayer = 0 && collision_circle(x+asin*mask,y+acos*mask,radius,obj_bwalls,true,true) return true;
if xlayer = 1 && collision_circle(x+asin*mask,y+acos*mask,radius,obj_fwalls,true,true) return true;
if canGrind && collision_circle(x+asin*mask,y+acos*mask,radius,obj_rail,true,true) return true;
if canFloat && !underwater  && collision_circle(x+asin*mask,y+acos*mask,radius,obj_water_surface,true,true) return true;
return false;
