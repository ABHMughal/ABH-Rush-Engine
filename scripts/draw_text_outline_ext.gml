/// draw_text_outline_ext(x, y, text, *thickness, *outline_color, *inner_color, xscale, yscale);

var x1,y1,text,size,ol_color,in_col,xscale,yscale; 
x1 = argument[0];
y1 = argument[1];
text = argument[2];
size = 1;
ol_col = c_black;
var draw_col;
draw_col = draw_get_color();

if (argument_count >= 4)
{
  size = argument[3];
}

if (argument_count >= 5)
{
  ol_col = argument[4];
}
if (argument_count >= 6)
{
  in_col = argument[5];
}
if (argument_count >= 7)
{
  xscale = argument[6];
}

yscale = argument[7];

draw_set_color(ol_col);

var x2,y2; 
x2 = -size;
y2 = -size;

repeat (1 + (size * 2))
{
  repeat (1 + (size * 2))
  {
  if (x2 == 0) and (y2 == 0)
  {
    x2 = x2 + 1;
  continue;
  }
   
  draw_text_transformed(x1 + x2, y1 + y2, text,xscale,yscale,0);
   
    x2 = x2 + 1;
  }
   
  y2 = y2 + 1;
  x2 = -size;
}
   
draw_set_color(draw_col);



draw_text_transformed_color(x1, y1, text,xscale,yscale,0,in_col,in_col,in_col,in_col,1);

