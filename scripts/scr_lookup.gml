//looking up
if key_u && ground && action =0
{
    if abs(hsp) < 0.2 {hsp =0;action =-3; image_i = 0};
}
if (!key_u||!ground||key_r||key_l)&& (action=-3 && image_i >= 5)
    action=0;

