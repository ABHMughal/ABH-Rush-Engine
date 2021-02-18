mask = argument0//+1*acos;
multiply = 2.5;
radius = 9
if collision_circle(x-asin*(mask*multiply),y+acos *(mask*multiply),radius,obj_walls,true,true) return true;
if xlayer = 0 && collision_circle(x-asin*(mask*multiply),y+acos*(mask*multiply),radius,obj_bwalls,true,true) return true;
if xlayer = 1 && collision_circle(x-asin*(mask*multiply),y+acos*(mask*multiply),radius,obj_fwalls,true,true) return true;
if canGrind && collision_circle(x-asin*(mask*multiply),y+acos*(mask*multiply),radius,obj_rail,true,true) return true;
if canFloat && !underwater && collision_circle(x-asin*(mask*multiply),y+acos*(mask*multiply),radius,obj_water_surface,true,true) return true;
return false;
