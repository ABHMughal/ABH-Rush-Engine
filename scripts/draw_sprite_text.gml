//@function
var sprite, numberLayout, _x, _y, _string, i, offsetX, offsetY, alpha

_x = argument0
_y = argument1
_string = argument2
sprite = argument3
alpha = argument4

numberLayout = "abcdefghijklmnopqrstuvwxyz1234567890 "

if (!variable_global_exists("_charMap"))
{
    for(i = 0; i <= 255; i+=1)
        global._charMap[i] = -1
    
    for(i = 1; i <= string_length(numberLayout); i+=1)
        global._charMap[ord(string_char_at(numberLayout,i))] = i
}

offsetX = 0
offsetY = 0

for(i = 1; i <= string_length(_string); i+= 1)
{
    var c
    c = ord(string_char_at(_string,i))
    
    if (global._charMap[c] != -1)
        draw_sprite_ext(sprite, global._charMap[c] - 1,_x+offsetX,_y+offsetY,1,1,0,c_white,alpha)
    offsetX += sprite_get_width(sprite)
}
