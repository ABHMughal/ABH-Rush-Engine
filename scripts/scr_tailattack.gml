//Tails tail attack
if character == "Tails"
{
    if action == 0 && key_attack_p && ground
    {
        sprp = spr_Tails_stand
        image_i = 0
        action = 9
        scrPlaySound(snd_Tails_tailattack,0.9,1,false)
    }
    
    if action == 9
    {
        if image_i >= 9 || !ground
            action = 0
            
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
