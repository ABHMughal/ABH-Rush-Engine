///draw_effect(sprite, angle, image_xscale, image_yscale, blend)

var fx = instance_create(x,y,obj_specialfx)
with(fx)
{
    sprite_index = argument0
    image_angle = argument1
    image_xscale = argument2
    image_yscale = argument3
    blend = argument4
}
