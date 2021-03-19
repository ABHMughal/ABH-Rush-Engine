    
//rolling ducking
if key_d && ground && (action == consPlayerActionNormal || action == consPlayerActionJump)
{
    if abs(hsp) < 1.03125 {hsp=0; action = consPlayerActionDuck; image_i = 0}
    if abs(hsp) >= 1.03125 {action = consPlayerActionRoll; audio_play_sound(snd_roll,1,false)}    
}


if action == consPlayerActionDuck && !key_d && image_i >= 5{action=consPlayerActionNormal;}///un duck
if action == consPlayerActionRoll && abs(hsp) < 0.5 && ground {action =consPlayerActionNormal;}///un roll
if action == consPlayerActionRoll && vsp > 0 && !ground && collision_script_ground(14)//un roll on ground
{action = consPlayerActionNormal;}

