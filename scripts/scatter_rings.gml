audio_play_sound(snd_hit,1,false)
var t, angle, n, spd, outrings, outrings2;
outrings = -1;
outrings2 = -1;
if other.rings > 20
{
    outrings = other.rings - 20;
    other.rings = 20;
}
if outrings > 12
{
    outrings2 = outrings - 12;
    outrings = 12
}
if outrings2 > 12
    outrings = 12;
t = 0;
angle = 70.25;
n = false;
spd = 3;
while t < other.rings
{
var ringID;
    ringID = instance_create(x,y,obj_ring_scatter1)
    ringID.vspeed = -sin(angle)*spd;
    ringID.hspeed = -other.xdir*cos(angle)*spd;
    if n == true 
    {
        ringID.hspeed *= -1;
        angle += 22.5;     
    }
    n = !n
    t += 1;
    if t == 16
    {
         spd = 2;
         angle = 70.25;
    }    
}

t = 0;
angle = 60;
n = false;
spd = 15.5;
while t < outrings
{
    var ringID;
    ringID = instance_create(x,y,obj_ring_scatter2)
    ringID.vspeed = -sin(angle)*spd;
    ringID.hspeed = -other.xdir*cos(angle)*spd;
    ringID.image_xscale = 1.2;
    ringID.image_yscale = 1.2;
    angle += 30;
    t += 1;    
}
other.rings = 0
