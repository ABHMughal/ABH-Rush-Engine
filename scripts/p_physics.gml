//limts
if(hsp>hspl) hsp = hspl;
if(hsp<-hspl) hsp =-hspl;
if(vsp>vspl) vsp =vspl;

///h movment
if hsp>0
{
    for(i=0; i<hsp && !collision_script_right(mask);i+=1)
    {
        x+=acos;
        y-=asin;    
    }
}
if hsp<0
{
    for(i=0;i>hsp && !collision_script_left(mask);i-=1)
    {
        x-=acos;
        y+=asin;
    }
}
//v movment
if vsp>0
{
    for(i=0;i<vsp &&!collision_script_bottom(mask);i+=1)
    {
        y+=1;
    }
}

if vsp<0
{
    for(i=0;i>vsp && !collision_script_top(mask);i-=1;)
    {
        y-=1;
    }
}

///landing
if vsp>=0 && !ground && collision_script_bottom(mask) && (collision_script_leftline(mask) || collision_script_rightline(mask))
{
    angle = find_angle(angle,mask,mask);
    acos = cos(degtorad(angle));
    asin = sin(degtorad(angle));
    
    hsp -= (asin*vsp*2);
    vsp = 0;
    ground = true;
}


///lock to ground
if ground
{
    while (collision_script_main(mask))
    {
        x-=asin;
        y-=acos;
    }

    while (!collision_script_main(mask) && collision_script_ground(mask))
    {
        x+=asin; 
        y+=acos;
    }

    var collide_offset = mask
    var collide_check_condition = !collision_point(x+collide_offset*asin,y+collide_offset*acos,obj_walls,true,true) || (!collision_point(x+collide_offset*asin,y+collide_offset*acos,obj_bwalls,true,true) && xlayer = 0) || (!collision_point(x+collide_offset*asin,y+collide_offset*acos,obj_fwalls,true,true) && xlayer = 1) || (!collision_point(x+collide_offset*asin,y+collide_offset*acos,obj_rail,true,true) && canGrind = true)
    
    if (collide_check_condition)
    {
        x += asin
        y += acos
    }
    else
    {
        x -= asin
        y -= acos
    }
    
}

//leave ground
if (!collision_script_leftline(mask) || !collision_script_rightline(mask)) && !collision_script_bottom(mask) && ground  && !collision_line(x,y,x+20*asin,y+20*acos,obj_walls,true,true)// &&!collision_point(x+18*asin,y+18*acos,obj_walls,true,true)
{   
    ground = false;
    vsp = -asin*hsp;
    hsp = acos*hsp; 
    
    angle = 0;
    asin = 0
    acos = 1    
}


//wall collision
while(collision_script_right(mask))
{
    x-=acos;
    y+=asin;
    hsp = 0
}
while(collision_script_left(mask))
{
    x+=acos;
    y-=asin;
    hsp = 0
}



//gravity

if !ground
{
    if character == consPlayerNameTails && (action == consPlayerActionHomingTarget || action == consPlayerActionHomingNoTarget)
        vsp += 0.03125
    else 
        vsp += grv;
}
///angle speed
if angle > 70 && angle < 290 && abs(hsp) < 1.5 && action != consPlayerActionGrinding
{
    x -= asin*5
    y -= acos*5
    angle = 0;
    vsp = -(asin*hsp)//+acos*hsp;
    hsp = (acos*hsp)//-asin*hsp;
    ground = false;
}

///slope factor
if action = consPlayerActionNormal slp =0.125;
if action = consPlayerActionRoll {if sign(hsp) = sign(asin) slp=0.078125; if sign(hsp) != sign(asin) slp =0.3125;}
if (action >= consPlayerActionNormal && (hsp < hspl && hsp > -hspl )) 
{    
    hsp -= slp*asin;
}
if ground && (collision_script_leftline(mask) && collision_script_rightline(mask))
{
    angle = find_angle(angle,mask,25);
}

/*if collision_script_top(mask) && !ground 
{
    vsp = 0
}
*/
if !ground && collision_script_top(mask) && vsp < 0
{

    var check_angle = find_angle(180,mask,25)
    if (check_angle >= 135 && check_angle <= 170)
    {
        action = consPlayerActionNormal
        angle = check_angle
        hsp = -vsp
        vsp = 0
    }
    else if (check_angle >= 190 && check_angle <= 225)
    {
        action = consPlayerActionNormal
        angle = check_angle
        hsp = vsp
        vsp = 0
    }
    else
    {
        vsp = 0
        angle = 0
    }
}


acos = cos(degtorad(angle));
asin = sin(degtorad(angle));
