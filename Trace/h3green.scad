module h3green()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) h3green_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
h3green();
