module Stealie4disk_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 319/2869 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=20000) /* polygon maxx=20000 */
 assign(maxy=20000) /* polygon maxy=20000 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=319)
 union() {
  union() {
   polygon([[0,19425],[0,18849],[298,18886],[480,18956],[664,19074],[830,19258],[956,19523],[999,19753],[980,20000],[0,20000]], convexity=5);
   polygon([[18828,19977],[18825,19954],[18799,19813],[18818,19554],[18897,19325],[18983,19185],[19141,19010],[19325,18897],[19568,18811],[19870,18805],[20000,18831],[20000,20000],[18831,20000]], convexity=6);
   polygon([[9850,18550],[9778,18546],[9365,18525],[9138,18507],[8962,18487],[8814,18470],[8682,18451],[8514,18425],[8460,18415],[8353,18395],[8261,18378],[8166,18358],[7998,18320],[7925,18303],[7849,18285],[7776,18265],[7648,18230],[7574,18210],[7329,18135],[7223,18100],[7163,18080],[7014,18025],[6868,17970],[6813,17950],[6723,17915],[6650,17885],[6423,17785],[6293,17730],[5920,17543],[5682,17405],[5577,17345],[5286,17165],[5203,17110],[5142,17070],[5033,16995],[4868,16875],[4833,16850],[4755,16793],[4481,16575],[4199,16337],[3575,15699],[3345,15438],[3070,15086],[2850,14777],[2775,14663],[2535,14273],[2480,14182],[2350,13943],[2165,13567],[2070,13344],[2035,13267],[1960,13079],[1925,12990],[1860,12813],[1810,12670],[1785,12593],[1730,12406],[1701,12311],[1665,12179],[1635,12073],[1617,11995],[1600,11920],[1580,11833],[1555,11710],[1545,11664],[1525,11566],[1508,11465],[1489,11354],[1470,11238],[1451,11109],[1432,10960],[1415,10785],[1395,10554],[1377,10148],[1378,9793],[1395,9385],[1415,9151],[1432,8982],[1451,8831],[1470,8703],[1489,8585],[1507,8475],[1525,8373],[1545,8276],[1563,8185],[1580,8108],[1618,7944],[1635,7869],[1655,7795],[1712,7591],[1730,7532],[1785,7349],[1840,7182],[1905,7005],[1950,6888],[1970,6833],[2025,6702],[2045,6642],[2248,6200],[2405,5895],[2572,5601],[2793,5250],[2850,5162],[2925,5053],[3045,4888],[3130,4771],[3393,4445],[3584,4218],[4217,3592],[4368,3460],[4758,3145],[4832,3090],[5141,2870],[5312,2755],[5642,2555],[5943,2385],[6315,2200],[6423,2155],[6575,2090],[6645,2055],[6723,2025],[6812,1990],[6982,1925],[7135,1870],[7249,1830],[7354,1795],[7515,1747],[7572,1730],[7646,1710],[7737,1685],[7849,1655],[8040,1610],[8166,1582],[8261,1562],[8351,1545],[8458,1525],[8684,1488],[8814,1470],[8961,1451],[9137,1432],[9354,1416],[9775,1395],[10125,1395],[10541,1415],[10764,1431],[10940,1451],[11086,1470],[11221,1488],[11337,1508],[11444,1525],[11551,1545],[11731,1580],[11865,1610],[11979,1637],[12053,1655],[12256,1710],[12330,1730],[12571,1804],[12683,1840],[13036,1970],[13093,1990],[13183,2025],[13313,2080],[13443,2135],[13797,2305],[14022,2422],[14414,2648],[14560,2738],[14812,2905],[15073,3090],[15476,3413],[15709,3606],[16330,4237],[16715,4698],[16830,4848],[17055,5167],[17125,5272],[17165,5333],[17440,5792],[17570,6032],[17738,6378],[17812,6542],[17870,6678],[17970,6923],[18070,7207],[18100,7292],[18135,7406],[18175,7537],[18200,7627],[18210,7662],[18255,7827],[18275,7906],[18285,7943],[18322,8110],[18350,8235],[18396,8479],[18415,8586],[18431,8699],[18451,8834],[18470,8983],[18487,9155],[18506,9383],[18525,9793],[18525,10148],[18506,10557],[18487,10787],[18470,10956],[18450,11109],[18433,11238],[18415,11353],[18396,11461],[18358,11662],[18340,11753],[18302,11921],[18285,11996],[18265,12073],[18210,12276],[18192,12346],[18175,12403],[18135,12534],[18100,12643],[18080,12703],[17980,12985],[17905,13178],[17870,13265],[17765,13499],[17655,13739],[17498,14043],[17370,14273],[17200,14552],[17055,14772],[17015,14833],[16830,15093],[16508,15496],[16330,15702],[15691,16343],[15533,16480],[15144,16795],[15072,16850],[14812,17035],[14488,17245],[14220,17405],[13845,17610],[13503,17775],[13253,17885],[13158,17925],[13093,17950],[12970,17995],[12768,18070],[12683,18100],[12573,18135],[12413,18184],[12291,18220],[12165,18255],[12053,18285],[11980,18302],[11901,18321],[11814,18340],[11598,18385],[11550,18395],[11443,18415],[11335,18433],[11223,18450],[11086,18470],[10942,18487],[10766,18506],[10540,18525],[10135,18542],[9923,18553]], convexity=6);
   polygon([[19649,1250],[19636,1246],[19445,1212],[19208,1102],[19048,972],[18911,798],[18814,578],[18773,303],[18811,42],[18824,3],[20000,0],[20000,1214],[19725,1253],[19663,1255]], convexity=6);
   polygon([[11,1028],[0,1023],[0,0],[1023,0],[1033,86],[1008,283],[933,501],[848,639],[752,756],[563,902],[360,990],[143,1031],[23,1034]], convexity=6);
  }
 }
}

module Stealie4disk()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) Stealie4disk_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
Stealie4disk();