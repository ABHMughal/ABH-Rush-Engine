//boost control part
if key_boost
    boosting = true
if key_boostr
    boosting = false

if boosting && (((action == 0 || action == 11) && ground) || action == 1 || action == 16)
{
    if !instance_exists(obj_boostfx) && boostamount > 0
    {
        instance_create(x,y,obj_boostfx)   
    }  
}
