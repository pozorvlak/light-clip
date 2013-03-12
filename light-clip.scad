outer_r = 10;
inner_r = 8.4;
length = 40;
gap = 3;
slide_width = 20;
rail_width = 18;
overhang = 2;
rail_thickness = 2;
overhang_thickness = 2;
rail_wall = (slide_width - rail_width)/2;
slide_thickness = 6;
top_thickness = slide_thickness - rail_thickness - overhang_thickness;

$fn=100;

module grip()
{
  difference()
  {
    cylinder(r=outer_r, h=length);
    cylinder(r=inner_r, h=length);
    translate([0, -gap/2, 0])
      cube([outer_r, gap, length]);
  }
}

module slide()
{
  difference()
  {
    cube([slide_thickness, slide_width, length]);
    translate([overhang_thickness, rail_wall, 0])
      cube([rail_thickness, rail_width, length]);
    translate([0, overhang + rail_wall, 0])
      cube([overhang_thickness, slide_width-2*(rail_wall + overhang), length]);
  }

}

translate([inner_r, 0, 0]) grip();
translate([-slide_thickness, -slide_width/2, 0]) slide();
