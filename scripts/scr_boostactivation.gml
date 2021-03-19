//boost control part
if key_boost
    boosting = true
if key_boostr
    boosting = false

if boosting && (((action == consPlayerActionNormal || action == consPlayerActionGrinding) && ground) || action == consPlayerActionJump || action == consPlayerActionCorkscrew)
{
    if !instance_exists(obj_boostfx) && boostamount > 0
    {
        instance_create(x,y,obj_boostfx)   
    }  
}
