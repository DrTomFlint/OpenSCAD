module Stealie4blue_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 590/4198 original points
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
 linear_extrude(height=1, convexity=590)
 union() {
  union() {
   polygon([[0,19425],[0,18849],[298,18886],[480,18956],[664,19074],[830,19258],[956,19523],[999,19753],[980,20000],[0,20000]], convexity=5);
   polygon([[18828,19977],[18825,19954],[18799,19813],[18818,19554],[18897,19325],[18983,19185],[19141,19010],[19325,18897],[19568,18811],[19870,18805],[20000,18831],[20000,20000],[18831,20000]], convexity=6);
   polygon([[6224,17106],[6191,17105],[6032,17010],[5867,16920],[5814,16882],[5718,16828],[5662,16790],[5418,16626],[5333,16570],[5252,16510],[5186,16457],[5073,16375],[5032,16345],[4944,16270],[4722,16090],[4549,15935],[4046,15432],[3896,15265],[3705,15032],[3575,14867],[3520,14792],[3465,14723],[3427,14666],[3243,14393],[3130,14217],[2965,13943],[2815,13663],[2670,13358],[2595,13193],[2490,12938],[2445,12822],[2418,12738],[2379,12643],[2365,12593],[2335,12507],[2305,12423],[2270,12296],[2243,12200],[2234,12164],[2205,12071],[2185,11998],[2158,11886],[2140,11813],[2123,11720],[2095,11596],[2085,11553],[2065,11451],[2048,11342],[2030,11239],[2010,11106],[1992,10979],[1976,10811],[1953,10589],[1959,9367],[1974,9190],[2010,8886],[2030,8756],[2047,8646],[2065,8534],[2085,8443],[2106,8345],[2120,8259],[2140,8182],[2160,8094],[2197,7946],[2215,7881],[2235,7812],[2280,7656],[2380,7351],[2400,7293],[2425,7215],[2465,7114],[2500,7027],[2605,6772],[2695,6573],[2925,6118],[3040,5922],[3075,5859],[3150,5738],[3222,5620],[3280,5533],[3445,5292],[3500,5223],[3557,5145],[3612,5072],[3803,4834],[3850,4777],[3970,4638],[4185,4408],[4406,4188],[4643,3965],[4793,3835],[4886,3760],[5071,3613],[5222,3500],[5351,3405],[5483,3315],[5532,3280],[5588,3242],[5738,3150],[5859,3075],[6017,2983],[6223,2870],[6676,2650],[6795,2595],[7029,2500],[7115,2465],[7213,2425],[7442,2345],[7514,2325],[7572,2306],[7683,2270],[7756,2252],[7812,2235],[7881,2215],[7962,2195],[8050,2170],[8182,2140],[8341,2105],[8443,2085],[8468,2075],[8493,2114],[8475,2155],[8420,2286],[8354,2444],[8285,2457],[8267,2440],[8106,2447],[8018,2465],[7905,2503],[7783,2570],[7737,2607],[7746,2992],[7745,3165],[7725,3238],[7680,3357],[7625,3488],[7520,3741],[7495,3802],[7383,4056],[7360,4085],[7290,4077],[6921,4076],[6706,4096],[6572,4115],[6407,4150],[6240,4205],[6182,4225],[6025,4307],[5898,4399],[5847,4440],[5770,4518],[5715,4593],[5630,4730],[5570,4887],[5560,4923],[5540,5016],[5522,5298],[5540,5472],[5545,5513],[5462,5540],[5273,5615],[5063,5734],[5014,5775],[4830,5940],[4740,6048],[4697,6108],[4585,6295],[4550,6380],[4510,6473],[4485,6553],[4465,6629],[4448,6702],[4430,6814],[4420,6946],[4440,6989],[4456,7052],[4475,7156],[4485,7203],[4505,7368],[4506,7574],[4484,7724],[4465,7813],[4430,7903],[4310,8172],[4290,8238],[4260,8333],[4252,8368],[4245,8402],[4225,8479],[4207,8556],[4190,8627],[4170,8721],[4151,8796],[4130,8889],[4116,8981],[4095,9092],[4076,9186],[4060,9298],[4041,9408],[4020,9540],[4004,9684],[3985,9819],[3965,9969],[3930,10283],[3910,10483],[3891,10656],[3873,10875],[3855,11093],[3835,11208],[3818,11325],[3800,11478],[3780,11661],[3762,11930],[3761,12408],[3781,12708],[3800,12879],[3818,13021],[3835,13132],[3855,13238],[3874,13338],[3890,13427],[3910,13514],[3930,13594],[3947,13665],[3967,13739],[3985,13813],[4011,13904],[4020,13942],[4040,13998],[4060,14053],[4095,14163],[4151,14313],[4189,14406],[4225,14498],[4254,14562],[4310,14685],[4355,14793],[4501,15068],[4650,15330],[4697,15405],[4790,15552],[4882,15683],[4975,15813],[5115,15987],[5205,16097],[5326,16240],[5788,16700],[5922,16815],[6053,16925],[6265,17096],[6258,17108]], convexity=18);
   polygon([[12747,16844],[12725,16824],[12699,16761],[12613,16588],[12575,16509],[12425,16208],[12278,15914],[12205,15772],[12170,15715],[12170,15650],[12223,15660],[12327,15676],[12403,15695],[12503,15715],[12640,15741],[12683,15750],[12776,15769],[12871,15789],[12957,15805],[13136,15845],[13269,15871],[13318,15880],[13406,15901],[13439,15902],[13445,15893],[13333,15790],[13183,15660],[13012,15510],[12850,15365],[12703,15235],[12532,15085],[12366,14935],[12193,14781],[12033,14640],[11850,14478],[11686,14330],[11633,14285],[11656,14261],[11791,14249],[12023,14237],[12313,14215],[12624,14193],[12858,14177],[13160,14157],[13424,14141],[13460,14137],[13550,14130],[13536,14097],[13463,14050],[13402,14010],[13347,13975],[13052,13770],[12653,13501],[12588,13455],[12504,13400],[12479,13383],[12423,13345],[12243,13220],[12183,13180],[12073,13105],[11908,12995],[11832,12940],[11750,12885],[11662,12825],[11483,12700],[11422,12660],[11287,12570],[11190,12487],[11738,12490],[12510,12508],[13292,12512],[13275,12490],[12998,12328],[12942,12290],[12628,12105],[12510,12033],[12414,11975],[12072,11772],[12036,11753],[11977,11715],[11915,11683],[11756,11585],[11702,11550],[11635,11513],[11388,11365],[11130,11208],[11042,11160],[10795,11013],[10595,10891],[10621,10870],[11588,10859],[12480,10849],[12442,10810],[12314,10745],[12163,10660],[11965,10557],[11772,10455],[11680,10407],[11573,10345],[11070,10075],[10942,10012],[10702,9885],[10533,9790],[10182,9605],[9874,9434],[9856,9413],[9916,9390],[10030,9363],[10210,9315],[10310,9290],[10505,9243],[10532,9235],[10608,9215],[10682,9195],[10756,9177],[10827,9160],[10830,9126],[10778,9115],[10718,9095],[10583,9050],[10431,8995],[10240,8930],[10183,8910],[10094,8882],[9985,8845],[9932,8827],[9851,8800],[9793,8780],[9616,8715],[9480,8670],[9423,8650],[9313,8615],[9066,8530],[9033,8520],[8910,8473],[8923,8446],[9054,8380],[9227,8295],[9293,8270],[9550,8140],[9522,8105],[9478,8095],[9370,8060],[9163,7985],[9053,7947],[8706,7827],[8628,7800],[8423,7725],[8338,7698],[8258,7670],[8180,7641],[8053,7595],[7997,7577],[7942,7560],[7770,7495],[7683,7465],[7628,7447],[7573,7430],[7427,7375],[7369,7357],[7383,7301],[7592,7185],[7677,7150],[7738,7122],[7840,7075],[7969,7020],[8091,6973],[8145,6955],[8225,6926],[8336,6890],[8399,6872],[8520,6835],[8588,6815],[8660,6799],[8697,6790],[8771,6770],[8901,6744],[8941,6735],[9032,6715],[9146,6695],[9278,6678],[9439,6659],[9627,6640],[10368,6630],[10398,6650],[10594,6660],[10742,6678],[10866,6695],[10981,6715],[11083,6735],[11181,6749],[11258,6770],[11333,6791],[11403,6805],[11534,6845],[11611,6864],[11662,6880],[11807,6927],[11943,6975],[12005,7000],[12140,7055],[12229,7095],[12369,7160],[12551,7250],[12712,7335],[12803,7390],[12868,7427],[12923,7465],[12990,7503],[13165,7623],[13203,7650],[13252,7685],[13329,7743],[13423,7815],[13519,7892],[13662,8020],[14125,8482],[14233,8604],[14327,8720],[14380,8793],[14440,8872],[14495,8943],[14568,9055],[14640,9162],[14735,9313],[14810,9443],[14883,9569],[14995,9811],[15085,10006],[15124,10095],[15150,10183],[15180,10249],[15205,10328],[15225,10388],[15245,10444],[15260,10495],[15280,10553],[15300,10629],[15329,10690],[15334,10755],[15355,10833],[15374,10907],[15389,10995],[15410,11091],[15430,11203],[15448,11297],[15465,11443],[15484,11611],[15503,11795],[15504,12466],[15484,12719],[15465,12858],[15448,12997],[15430,13093],[15410,13183],[15390,13295],[15365,13405],[15355,13443],[15325,13550],[15300,13644],[15253,13807],[15235,13857],[15205,13942],[15170,14039],[15125,14155],[15078,14275],[15050,14340],[14827,14795],[14678,15045],[14624,15128],[14585,15183],[14475,15340],[14400,15443],[14345,15517],[14270,15613],[14172,15725],[13982,15935],[13813,16105],[13609,16288],[13499,16382],[13403,16460],[13311,16530],[13181,16625],[13128,16660],[13070,16697],[12962,16770],[12800,16865],[12770,16865]], convexity=20);
   polygon([[19649,1250],[19636,1246],[19445,1212],[19208,1102],[19048,972],[18911,798],[18814,578],[18773,303],[18811,42],[18824,3],[20000,0],[20000,1214],[19725,1253],[19663,1255]], convexity=6);
   polygon([[11,1028],[0,1023],[0,0],[1023,0],[1033,86],[1008,283],[933,501],[848,639],[752,756],[563,902],[360,990],[143,1031],[23,1034]], convexity=6);
  }
 }
}

module Stealie4blue()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) Stealie4blue_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
Stealie4blue();