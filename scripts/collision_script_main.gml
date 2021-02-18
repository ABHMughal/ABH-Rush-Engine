mask = argument0//+1*acos;

if collision_circle(x,y,mask,obj_walls,true,true) return true;
if xlayer = 0 && collision_circle(x,y,mask,obj_bwalls,true,true) return true;
if xlayer = 1 && collision_circle(x,y,mask,obj_fwalls,true,true) return true;
if canGrind && collision_circle(x,y,mask,obj_rail,true,true) return true;
if canFloat && !underwater  && collision_circle(x,y,mask,obj_water_surface,true,true) return true;
return false;
