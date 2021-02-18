//super transformation

if !ground && action == 1 && key_special && rings >= 50 && !super
{
    super = true
    image_i = 0 
    action = 31    
}

if action == 31
{
    hsp = 0
    vsp = 0
    if image_i >= 16
        action = 0   
}

if super && rings <= 0
{
    super = false
}

