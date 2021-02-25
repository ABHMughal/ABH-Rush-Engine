mask_index = argument0;
line = floor(mask*3.5)
if collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_walls,true,true) return true;
if xlayer = 0 && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_bwalls,true,true) return true;
if xlayer = 1 && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_fwalls,true,true) return true;
if canGrind && collision_line(x-(acos*mask)+(asin*mask)+lengthdir_y(8, angle),y+(asin*mask)+(acos*mask)-lengthdir_y(8, angle-90),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_rail,true,true) return true;
if canFloat && !underwater  && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obj_water_surface,true,true) return true;
return false;

