module fan9red_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 243/3466 original points
 */
  minx=0; /* polygon minx=0 */
  miny=0; /* polygon miny=0 */
  maxx=20000; /* polygon maxx=20000 */
  maxy=12520; /* polygon maxy=12520 */
  dx=maxx-minx;
  dy=maxy-miny;
  maxd=((dx>dy)?dx:dy);
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=243)
 union() {
  union() {
   polygon([[0,11961],[0,11401],[191,11331],[379,11304],[638,11346],[842,11449],[1013,11603],[1135,11808],[1188,12015],[1188,12200],[1129,12418],[1078,12520],[0,12520]], convexity=5);
   polygon([[19072,12509],[19066,12498],[18988,12305],[18970,12127],[19017,11918],[19126,11741],[19293,11601],[19493,11526],[19683,11521],[19838,11555],[20000,11643],[20000,12520],[19078,12520]], convexity=6);
   polygon([[10685,12155],[10643,12151],[10298,12104],[10205,8453],[10274,8385],[10295,8199],[10311,8147],[10295,8109],[10302,7590],[10346,7340],[10360,7343],[11108,12074],[10766,12150],[10728,12159]], convexity=8);
   polygon([[9974,12072],[9971,12069],[9145,11965],[9593,9313],[9678,9289],[9768,9205],[9829,9103],[9918,8990],[9983,8911],[10059,8833],[9990,12075],[9977,12075]], convexity=5);
   polygon([[11480,11986],[11475,11976],[10443,7198],[10508,7193],[10626,7131],[12186,11849],[11485,11995]], convexity=6);
   polygon([[8869,11942],[8866,11939],[8080,11845],[9160,8730],[9217,8745],[9272,8758],[9330,8774],[9385,8792],[9385,8875],[9489,9105],[8889,11945],[8872,11945]], convexity=6);
   polygon([[7760,11810],[7753,11806],[6975,11531],[8681,8465],[8818,8590],[8962,8731],[8995,8748],[7771,11815],[7768,11815]], convexity=6);
   polygon([[12563,11764],[12556,11753],[10725,7123],[10867,7106],[10932,7108],[13475,11589],[12571,11775]], convexity=6);
   polygon([[13668,11359],[13564,11193],[11011,7094],[11134,7090],[11192,7067],[14550,11184],[14070,11464],[13772,11525]], convexity=6);
   polygon([[6643,11422],[6593,11404],[5845,11135],[8380,7987],[8377,8202],[8498,8323],[8570,8372],[6710,11440],[6693,11439]], convexity=8);
   polygon([[14715,11034],[14693,11008],[11306,7029],[11403,6996],[11500,6896],[15640,10518],[14746,11060],[14737,11060]], convexity=6);
   polygon([[5495,11023],[5463,11012],[4898,10809],[4757,10740],[4626,10640],[4570,10581],[8370,7335],[8615,7459],[8508,7578],[8420,7717],[8365,7769],[8350,7823],[5538,11035],[5528,11034]], convexity=7);
   polygon([[4343,10371],[4308,10338],[3665,9701],[8156,6969],[8172,6985],[8179,7122],[8289,7276],[4378,10405]], convexity=6);
   polygon([[15877,10348],[15858,10332],[11565,6847],[11623,6828],[12008,6819],[16834,9673],[16444,10090],[16390,10090],[16334,10127],[16248,10145],[16173,10185],[16108,10227],[15990,10315],[15897,10365]], convexity=6);
   polygon([[3425,9479],[3383,9438],[2594,8670],[7826,6659],[7979,6740],[8070,6815],[8118,6856],[8130,6889],[3468,9520]], convexity=6);
   polygon([[17003,9417],[16963,9395],[12252,6849],[12369,6870],[12463,6888],[12663,6945],[12922,7040],[13092,7105],[13212,7130],[13400,7049],[17715,8749],[17051,9440],[17043,9440]], convexity=7);
   polygon([[17843,8503],[17783,8481],[13505,6957],[13913,6726],[14070,6626],[14195,6564],[18420,7403],[18349,8050],[18320,8074],[18280,8137],[18280,8155],[17916,8525],[17903,8524]], convexity=9);
   polygon([[2326,8409],[2273,8358],[1719,7818],[1740,7482],[7298,6350],[7730,6594],[2379,8460]], convexity=6);
   polygon([[1746,7194],[1740,7187],[1788,5735],[5223,5720],[5311,5895],[5440,6042],[5588,6221],[5633,6265],[5752,6295],[6122,6285],[6230,6200],[6363,6140],[6419,6165],[6574,6242],[6642,6270],[6934,6303],[1751,7200]], convexity=8);
   polygon([[18375,7111],[18338,7104],[14349,6446],[14532,6350],[14778,6330],[14849,6336],[14929,6273],[14955,6171],[15010,6098],[15075,5990],[15233,5810],[15265,5667],[17832,5655],[18515,6383],[18440,7120],[18413,7119]], convexity=9);
   polygon([[19688,822],[19638,816],[19413,739],[19230,597],[19125,461],[19051,268],[19035,103],[19047,0],[20000,0],[20000,800],[19738,829]], convexity=6);
   polygon([[0,371],[0,0],[763,9],[704,218],[594,413],[414,591],[238,689],[63,732],[0,741]], convexity=5);
  }
 }
}

module fan9red()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) fan9red_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
fan9red();