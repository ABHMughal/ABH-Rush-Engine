    
//rolling ducking
if key_d && ground && (action == 0 || action == 1)
{
    if abs(hsp) < 1.03125 {hsp=0; action = -1; image_i = 0}
    if abs(hsp) >= 1.03125 {action = 2; audio_play_sound(snd_roll,1,false)}    
}


if action == -1 && !key_d && image_i >= 5{action=0;}///un duck
if action == 2 && abs(hsp) < 0.5 && ground {action =0;}///un roll
if action == 2 && vsp > 0 && !ground && collision_script_ground(14)//un roll on ground
{action = 0;}

