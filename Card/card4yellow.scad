module card4yellow_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 88/549 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=20000) /* polygon maxx=20000 */
 assign(maxy=11430) /* polygon maxy=11430 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=88)
 union() {
  union() {
   polygon([[0,5715],[0,0],[3643,0],[3666,36],[3682,168],[3738,334],[3827,619],[3896,818],[3940,1056],[3967,1324],[3984,1441],[4025,1602],[4120,1945],[4228,2308],[4283,2447],[4390,2763],[4449,2848],[4585,3119],[4690,3362],[4752,3504],[4871,3673],[5118,4000],[5189,4054],[5250,4147],[5451,4415],[5698,4817],[5790,4940],[5849,4983],[6100,5283],[6549,5783],[6697,5966],[6873,6173],[6955,6351],[6998,6480],[7045,6648],[7058,6853],[7094,7055],[7108,7151],[7165,7358],[7165,7488],[7190,7541],[7190,7728],[7215,7802],[7309,8038],[7435,8235],[7640,8520],[7695,8560],[7762,8675],[7923,8858],[8296,9193],[8330,9234],[8426,9298],[8503,9445],[8570,9543],[8711,9798],[9008,10202],[9161,10383],[9241,10448],[9398,10565],[9658,10704],[9699,10711],[9820,10796],[9965,10871],[10055,11012],[10062,11163],[10070,11430],[0,11430]], convexity=5);
   polygon([[19311,11376],[19314,11323],[19362,11140],[19444,11006],[19554,10903],[19728,10830],[19864,10810],[20000,10830],[20000,11430],[19309,11430]], convexity=5);
   polygon([[19640,817],[19563,805],[19337,708],[19167,553],[19057,370],[19010,199],[19006,39],[19012,0],[20000,0],[20000,784],[19718,829]], convexity=6);
  }
 }
}

module card4yellow()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) card4yellow_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
card4yellow();