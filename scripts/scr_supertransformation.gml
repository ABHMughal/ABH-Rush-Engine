//super transformation

if !ground && action == consPlayerActionJump && key_special && rings >= 50 && !super
{
    super = true
    image_i = 0 
    action = consPlayerActionSuperTransformation    
}

if action == consPlayerActionSuperTransformation
{
    hsp = 0
    vsp = 0
    if image_i >= 16
        action = consPlayerActionNormal   
}

if super && rings <= 0
{
    super = false
}

