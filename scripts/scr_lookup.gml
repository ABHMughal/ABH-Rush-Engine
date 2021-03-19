//looking up
if key_u && ground && action =consPlayerActionNormal
{
    if abs(hsp) < 0.2 {hsp =0;action =consPlayerActionLookUp; image_i = 0};
}
if (!key_u||!ground||key_r||key_l)&& (action=consPlayerActionLookUp && image_i >= 5)
    action=consPlayerActionNormal;

