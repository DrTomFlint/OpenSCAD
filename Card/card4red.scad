module card4red_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 81/547 original points
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
 linear_extrude(height=1, convexity=81)
 union() {
  union() {
   polygon([[0,10988],[0,10545],[190,10526],[413,10568],[607,10678],[737,10810],[852,11008],[900,11274],[880,11430],[0,11430]], convexity=5);
   polygon([[15828,11414],[15825,11397],[15760,11303],[15577,11000],[15346,10662],[15235,10540],[15134,10415],[15064,10208],[14949,9798],[14900,9684],[14728,9248],[14665,9117],[14627,8921],[14480,8448],[14468,8135],[14476,7773],[14495,7720],[14495,7329],[14590,7061],[14715,6668],[14802,6505],[14875,6338],[14995,5975],[15020,5911],[15028,5805],[15055,5687],[15115,5463],[15141,5249],[15182,5133],[15230,4823],[15220,4606],[15199,4395],[15152,4143],[15113,3943],[15068,3819],[14960,3450],[14849,3224],[14615,2906],[14563,2820],[14530,2770],[14469,2711],[14164,2480],[13968,2335],[13849,2260],[13678,2155],[13549,2081],[12832,1650],[12575,1529],[12437,1473],[12203,1386],[12082,1367],[11974,1345],[11743,1254],[11227,930],[11035,765],[10900,623],[10705,293],[10668,196],[10686,0],[20000,0],[20000,11430],[15831,11430]], convexity=8);
   polygon([[0,403],[0,0],[593,0],[617,171],[559,422],[464,574],[316,707],[203,765],[0,805]], convexity=5);
  }
 }
}

module card4red()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) card4red_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
card4red();