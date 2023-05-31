//Tails tail attack
if character == consPlayerNameTails
{
    if action == consPlayerActionNormal && key_attack_p && ground
    {
        sprp = spr_Tails_stand
        image_i = 0
        action = consPlayerActionSlide
        scrPlaySound(snd_Tails_tailattack,0.9,1,false)
    }
    
    if action == consPlayerActionSlide
    {
        if image_i >= 9 || !ground
            action = consPlayerActionNormal
            
        var enemy;
        enemy = instance_place(x + 20*xdir*acos,y - 20*asin,obj_enemy)
        if enemy != noone
        {
            with(enemy)
            {
                instance_destroy()
            }
        }
    }
}
