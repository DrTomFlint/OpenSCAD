module card5yellow_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 203/417 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=20000) /* polygon maxx=20000 */
 assign(maxy=8000) /* polygon maxy=8000 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=203)
 union() {
  union() {
   polygon([[0,4000],[0,0],[3638,0],[3655,18],[3670,61],[3670,100],[3705,165],[3705,178],[3729,211],[3736,253],[3749,268],[3756,299],[3775,316],[3781,353],[3836,462],[3844,473],[3851,503],[3882,558],[3894,573],[3899,633],[3909,673],[3925,718],[3942,747],[3951,828],[3958,918],[3970,939],[3970,999],[3992,1026],[4012,1093],[4020,1113],[4020,1133],[4045,1167],[4045,1178],[4083,1258],[4090,1301],[4110,1328],[4117,1382],[4145,1436],[4145,1456],[4231,1629],[4273,1688],[4281,1728],[4376,1918],[4428,1973],[4485,2051],[4506,2087],[4553,2151],[4601,2206],[4621,2251],[4654,2288],[4709,2400],[4730,2426],[4730,2440],[4768,2470],[4837,2550],[4890,2587],[4923,2630],[5047,2743],[5078,2774],[5151,2826],[5179,2836],[5216,2880],[5270,2921],[5308,2958],[5376,3018],[5443,3085],[5515,3168],[5561,3225],[5582,3253],[5663,3333],[5753,3432],[5769,3448],[5828,3476],[5883,3528],[5965,3592],[6048,3664],[6138,3726],[6184,3773],[6238,3802],[6315,3870],[6348,3886],[6385,3920],[6393,3920],[6453,3981],[6506,4012],[6603,4108],[6666,4158],[6717,4188],[6788,4258],[6840,4291],[6886,4343],[6921,4398],[6944,4423],[6961,4468],[6990,4519],[6990,4544],[7015,4580],[7022,4623],[7040,4657],[7040,4750],[7065,4816],[7065,4853],[7082,4883],[7088,4983],[7115,5021],[7115,5053],[7160,5153],[7160,5233],[7180,5270],[7180,5394],[7210,5450],[7210,5478],[7219,5488],[7262,5568],[7303,5623],[7329,5664],[7443,5773],[7507,5843],[7548,5883],[7645,5969],[7699,6000],[7728,6042],[7763,6078],[7803,6113],[7879,6170],[7892,6186],[7933,6206],[7988,6243],[8054,6279],[8125,6330],[8193,6364],[8265,6416],[8278,6424],[8322,6465],[8331,6465],[8413,6501],[8431,6517],[8475,6580],[8475,6588],[8565,6679],[8565,6686],[8604,6734],[8658,6798],[8691,6850],[8699,6850],[8733,6883],[8803,6958],[8850,6996],[8978,7123],[9074,7196],[9133,7257],[9183,7280],[9227,7305],[9248,7324],[9368,7386],[9459,7419],[9478,7430],[9549,7460],[9563,7460],[9648,7490],[9697,7500],[9743,7527],[9888,7579],[9954,7608],[10050,7710],[10050,7798],[10065,7823],[10065,8000],[0,8000]], convexity=5);
   polygon([[19315,7966],[19315,7931],[19335,7869],[19335,7857],[19361,7808],[19394,7758],[19458,7696],[19546,7639],[19624,7606],[19723,7581],[19803,7570],[19888,7570],[19971,7583],[20000,7586],[20000,8000],[19315,8000]], convexity=5);
   polygon([[19623,567],[19568,561],[19493,544],[19408,519],[19333,489],[19243,439],[19178,393],[19106,324],[19056,252],[19031,200],[19005,96],[19005,50],[19016,0],[20000,0],[20000,545],[19933,560],[19799,575],[19678,574]], convexity=7);
  }
 }
}

module card5yellow()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) card5yellow_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
card5yellow();