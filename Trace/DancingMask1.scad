module DancingMask1_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 1523/3248 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=19050) /* polygon maxx=19050 */
 assign(maxy=20000) /* polygon maxy=20000 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=1523)
 union() {
  union() {
   polygon([[0,19023],[0,18045],[213,18045],[262,18095],[499,18095],[542,18140],[643,18140],[691,18190],[786,18189],[833,18235],[877,18235],[929,18285],[978,18285],[1022,18330],[1068,18330],[1212,18475],[1263,18475],[1520,18733],[1520,18783],[1665,18927],[1665,18972],[1712,19020],[1710,19065],[1760,19118],[1760,19162],[1806,19209],[1805,19304],[1855,19352],[1855,19453],[1900,19496],[1900,19733],[1950,19782],[1950,20000],[0,20000]], convexity=11);
   polygon([[17095,19891],[17095,19782],[17145,19733],[17145,19496],[17190,19453],[17190,19352],[17240,19304],[17239,19209],[17285,19162],[17285,19118],[17335,19065],[17333,19020],[17380,18972],[17380,18927],[17525,18783],[17525,18732],[17783,18475],[17833,18475],[17977,18330],[18023,18330],[18067,18285],[18116,18285],[18168,18235],[18212,18235],[18259,18189],[18354,18190],[18402,18140],[18503,18140],[18546,18095],[18783,18095],[18832,18045],[19050,18045],[19050,20000],[17095,20000]], convexity=23);
   polygon([[6490,19130],[6438,19126],[6348,19105],[6213,19064],[6163,19033],[6118,19011],[6033,18949],[5963,18883],[5928,18837],[5881,18783],[5859,18738],[5820,18686],[5804,18638],[5786,18618],[5766,18578],[5759,18543],[5734,18505],[5702,18393],[5686,18362],[5666,18283],[5659,18213],[5645,18153],[5639,17977],[5662,17825],[5670,17768],[5686,17688],[5704,17643],[5731,17549],[5765,17473],[5833,17348],[5891,17263],[5911,17218],[5950,17166],[5969,17111],[5999,17068],[6016,17013],[6039,16968],[6071,16893],[6141,16763],[6199,16673],[6249,16583],[6281,16553],[6311,16493],[6343,16453],[6383,16393],[6461,16263],[6515,16128],[6534,16043],[6541,15983],[6564,15923],[6585,15818],[6605,15780],[6605,15769],[6666,15638],[6697,15593],[6720,15543],[6764,15493],[6781,15458],[6855,15370],[6888,15333],[6917,15293],[6949,15258],[6963,15218],[7073,15098],[7253,14924],[7454,14775],[7497,14760],[7543,14731],[7592,14718],[7673,14684],[7788,14654],[7828,14636],[8023,14609],[8058,14595],[8145,14570],[8160,14570],[8253,14496],[8278,14463],[8320,14394],[8320,14385],[8335,14356],[8351,14278],[8385,14153],[8400,14054],[8417,14028],[8424,13993],[8449,13910],[8464,13887],[8491,13808],[8564,13663],[8609,13598],[8662,13510],[8710,13453],[8744,13403],[8878,13255],[8943,13206],[9009,13148],[9129,13051],[9164,13045],[9177,13029],[9218,13001],[9293,12960],[9393,12909],[9455,12886],[9468,12876],[9499,12860],[9608,12846],[9663,12829],[9853,12824],[9963,12834],[10033,12849],[10158,12871],[10268,12914],[10308,12925],[10358,12958],[10398,12972],[10491,13036],[10573,13098],[10643,13147],[10711,13208],[10808,13303],[10873,13356],[10926,13415],[10984,13455],[11058,13537],[11123,13603],[11192,13688],[11315,13818],[11362,13882],[11503,14026],[11603,14113],[11758,14268],[11870,14418],[11918,14474],[11963,14532],[12023,14598],[12101,14698],[12365,14973],[12501,15158],[12528,15213],[12554,15258],[12569,15303],[12604,15378],[12630,15460],[12644,15483],[12679,15603],[12694,15638],[12730,15903],[12734,15938],[12762,16067],[12806,16128],[12826,16168],[12883,16228],[12948,16307],[13042,16408],[13139,16493],[13211,16551],[13257,16576],[13313,16623],[13348,16642],[13403,16680],[13491,16758],[13568,16834],[13614,16893],[13641,16918],[13660,16955],[13660,16968],[13682,16988],[13723,17053],[13753,17111],[13801,17171],[13834,17223],[13871,17258],[13902,17303],[13945,17351],[14025,17515],[14040,17543],[14060,17700],[14065,17733],[14060,17788],[14025,17996],[14014,18016],[14001,18068],[13990,18168],[13980,18318],[13931,18489],[13870,18601],[13828,18658],[13740,18748],[13688,18776],[13635,18814],[13453,18896],[13373,18909],[13353,18914],[13308,18929],[13205,18940],[12993,18940],[12904,18929],[12853,18915],[12688,18884],[12644,18865],[12627,18865],[12583,18851],[12533,18839],[12493,18821],[12408,18789],[12303,18739],[12148,18648],[12118,18627],[12083,18613],[12018,18576],[11818,18529],[11773,18520],[11668,18510],[11518,18500],[11463,18489],[11289,18465],[11211,18455],[11121,18464],[11066,18500],[11023,18517],[10979,18555],[10929,18570],[10893,18599],[10860,18615],[10835,18615],[10790,18650],[10753,18660],[10741,18660],[10676,18690],[10556,18722],[10478,18745],[10368,18761],[10298,18775],[10262,18785],[9968,18820],[9900,18835],[9580,18850],[9408,18846],[9294,18835],[9218,18814],[9085,18790],[9030,18767],[9018,18761],[9010,18766],[8916,18740],[8881,18716],[8848,18711],[8713,18681],[8683,18675],[8343,18650],[8153,18616],[8073,18605],[7908,18590],[7843,18580],[7788,18580],[7733,18607],[7698,18632],[7636,18690],[7598,18706],[7550,18748],[7518,18765],[7493,18775],[7403,18840],[7358,18863],[7273,18921],[7208,18957],[7178,18979],[7118,19008],[7093,19024],[7023,19051],[6978,19074],[6888,19095],[6794,19121],[6728,19129],[6543,19134]], convexity=16);
   polygon([[4328,15305],[4293,15301],[4268,15291],[4183,15279],[4123,15261],[4033,15224],[3932,15175],[3838,15115],[3798,15096],[3748,15056],[3593,14910],[3543,14881],[3376,14718],[3271,14561],[3240,14513],[3157,14343],[3129,14268],[3105,14218],[3091,14154],[3076,14131],[3045,14041],[3045,14026],[3016,13964],[3005,13893],[2995,13850],[2995,13830],[2973,13788],[2960,13738],[2960,13688],[2818,13545],[2820,13499],[2770,13448],[2770,13403],[2723,13355],[2725,13310],[2675,13257],[2675,13162],[2625,13113],[2626,12924],[2580,12877],[2580,12782],[2530,12733],[2530,12593],[2511,12539],[2403,12437],[2319,12384],[2234,12345],[2206,12330],[2201,12336],[2107,12306],[2067,12286],[1950,12274],[1920,12266],[1879,12230],[1831,12215],[1786,12186],[1723,12170],[1687,12145],[1672,12145],[1588,12116],[1548,12096],[1488,12079],[1376,12030],[1363,12030],[1298,11991],[1258,11979],[1213,11946],[1167,11931],[1073,11865],[1022,11823],[984,11780],[923,11736],[835,11627],[795,11603],[642,11443],[618,11403],[579,11359],[565,11325],[565,11307],[540,11278],[525,11246],[525,11210],[514,11163],[501,11123],[486,11013],[486,10928],[500,10828],[520,10759],[525,10735],[525,10705],[539,10672],[570,10636],[570,10609],[582,10588],[640,10524],[640,10517],[744,10422],[845,10370],[883,10347],[919,10335],[975,10294],[1029,10263],[1114,10206],[1213,10157],[1373,10110],[1478,10099],[1813,10099],[2023,10111],[2063,10121],[2262,10155],[2304,10174],[2398,10201],[2508,10244],[2543,10251],[2599,10285],[2619,10285],[2658,10300],[2698,10319],[2788,10356],[2953,10438],[3024,10480],[3078,10523],[3113,10539],[3241,10648],[3358,10727],[3498,10853],[3533,10877],[3593,10929],[3822,11193],[3915,11291],[3969,11368],[4023,11419],[4098,11507],[4223,11643],[4257,11688],[4358,11806],[4377,11833],[4423,11883],[4502,11981],[4524,12028],[4546,12048],[4599,12128],[4619,12168],[4656,12213],[4685,12263],[4758,12359],[4839,12453],[4924,12522],[4998,12534],[5198,12535],[5293,12525],[5358,12514],[5388,12504],[5463,12490],[5584,12490],[5653,12504],[5683,12516],[5786,12518],[5804,12496],[5810,12456],[5893,12366],[5969,12295],[5996,12285],[6023,12285],[6053,12254],[6080,12240],[6116,12240],[6202,12148],[6283,12070],[6319,12045],[6358,12039],[6395,12008],[6407,12000],[6451,12000],[6495,11964],[6521,11920],[6516,11914],[6529,11878],[6536,11823],[6565,11733],[6575,11623],[6575,11338],[6585,11218],[6600,11138],[6609,11026],[6600,10943],[6595,10928],[6580,10798],[6571,10583],[6570,10404],[6531,10343],[6518,10311],[6417,10195],[6396,10173],[6303,10030],[6268,9966],[6146,9793],[6111,9753],[6042,9663],[6028,9641],[5939,9524],[5915,9494],[5903,9453],[5869,9414],[5850,9373],[5850,9352],[5829,9333],[5805,9285],[5805,9261],[5789,9248],[5760,9190],[5760,9166],[5735,9139],[5715,9100],[5715,9074],[5684,9038],[5670,9005],[5670,8976],[5640,8918],[5615,8795],[5611,8768],[5590,8708],[5570,8589],[5548,8528],[5540,8503],[5520,8343],[5503,8007],[5540,7733],[5564,7643],[5575,7588],[5590,7483],[5604,7448],[5619,7393],[5626,7323],[5645,7239],[5659,7213],[5665,7173],[5680,7105],[5716,7018],[5726,6978],[5751,6933],[5817,6745],[5854,6633],[5902,6528],[5956,6443],[5989,6403],[5996,6378],[6017,6343],[6040,6317],[6068,6237],[6084,6213],[6096,6150],[6091,6107],[6050,6021],[5878,5857],[5843,5833],[5793,5792],[5652,5653],[5606,5590],[5523,5507],[5360,5338],[5300,5258],[5274,5208],[5217,5143],[5181,5092],[5160,5074],[5139,5018],[5106,4983],[5072,4928],[5030,4868],[4985,4813],[4941,4752],[4903,4683],[4866,4633],[4854,4595],[4831,4568],[4787,4488],[4683,4320],[4636,4258],[4623,4215],[4592,4178],[4571,4143],[4564,4120],[4526,4063],[4462,3944],[4451,3926],[4410,3823],[4385,3764],[4385,3749],[4345,3659],[4320,3588],[4290,3529],[4290,3513],[4255,3443],[4229,3378],[4224,3353],[4211,3338],[4190,3275],[4190,3260],[4164,3208],[4146,3123],[4131,3066],[4110,3026],[4092,2928],[4055,2830],[4049,2788],[4015,2699],[3992,2583],[3971,2538],[3947,2430],[3930,2378],[3920,2353],[3870,2138],[3860,1978],[3860,1799],[3871,1554],[3896,1458],[3924,1318],[3955,1252],[3955,1225],[3974,1188],[3995,1168],[3995,1146],[4010,1111],[4104,1008],[4223,892],[4273,853],[4316,815],[4351,809],[4397,768],[4438,750],[4454,750],[4468,733],[4528,705],[4549,705],[4563,688],[4613,665],[4642,665],[4683,640],[4813,615],[4888,605],[4933,590],[5238,575],[5423,561],[5488,545],[5563,535],[5818,525],[6383,525],[6569,535],[6643,545],[6698,564],[6828,586],[6888,605],[6930,605],[7033,576],[7186,563],[7348,576],[7383,594],[7402,615],[7425,615],[7459,629],[7533,696],[7615,786],[7621,833],[7658,875],[7671,993],[7672,1148],[7657,1264],[7624,1307],[7621,1313],[7614,1351],[7521,1453],[7460,1509],[7329,1575],[7311,1575],[7254,1605],[7236,1605],[7120,1634],[7083,1645],[6932,1660],[6874,1681],[6791,1720],[6783,1720],[6768,1734],[6623,1804],[6593,1812],[6548,1840],[6501,1849],[6458,1874],[6401,1894],[6346,1929],[6307,1978],[6280,2024],[6268,2187],[6281,2351],[6320,2438],[6320,2446],[6398,2533],[6688,2826],[6743,2867],[6878,2984],[6918,3004],[6973,3048],[7022,3077],[7150,3142],[7210,3169],[7368,3244],[7403,3255],[7452,3286],[7493,3300],[7548,3334],[7598,3353],[7643,3383],[7678,3397],[7936,3532],[7974,3565],[8018,3584],[8254,3791],[8404,3953],[8466,4025],[8487,4073],[8516,4108],[8580,4218],[8649,4358],[8662,4393],[8713,4508],[8730,4548],[8765,4616],[8765,4636],[8789,4668],[8815,4723],[8815,4738],[8878,4807],[9021,4673],[9043,4666],[9072,4665],[9110,4628],[9264,4612],[9301,4609],[9438,4621],[9498,4636],[9545,4665],[9583,4671],[9608,4684],[9645,4714],[9684,4720],[9738,4763],[9768,4780],[9850,4843],[9971,4943],[10014,4973],[10147,5090],[10197,5133],[10366,5313],[10508,5443],[10586,5503],[10645,5534],[10693,5579],[10717,5592],[10773,5638],[10888,5724],[10959,5788],[11128,5973],[11173,6024],[11187,6066],[11225,6113],[11235,6148],[11235,6163],[11265,6203],[11285,6268],[11323,6331],[11424,6450],[11532,6671],[11559,6729],[11579,6788],[11605,6836],[11605,6854],[11625,6923],[11649,6973],[11666,7063],[11695,7149],[11719,7263],[11744,7308],[11764,7408],[11789,7468],[11806,7538],[11832,7588],[11859,7671],[11869,7699],[11885,7729],[11911,7837],[11929,7873],[11950,7948],[11950,7973],[11984,8078],[12000,8158],[12029,8238],[12059,8418],[12074,8488],[12090,8678],[12105,8810],[12110,8848],[12120,8883],[12130,9268],[12140,9453],[12154,9553],[12174,9648],[12186,9788],[12196,9873],[12195,10238],[12185,10443],[12169,10663],[12155,10775],[12150,10823],[12150,11008],[12131,11138],[12095,11251],[12038,11358],[11932,11464],[11845,11507],[11823,11520],[11678,11550],[11591,11550],[11525,11535],[11449,11525],[11403,11492],[11357,11479],[11256,11393],[11212,11338],[11165,11257],[11149,11213],[11136,11125],[11116,11033],[11105,10863],[11090,10775],[11055,10707],[11024,10669],[10878,10676],[10739,10660],[10708,10644],[10693,10631],[10642,10615],[10555,10542],[10479,10453],[10465,10419],[10465,10401],[10449,10388],[10433,10358],[10413,10193],[10426,10048],[10445,9938],[10471,9833],[10472,9738],[10450,9696],[10438,9648],[10313,9394],[10271,9400],[10216,9422],[10123,9498],[10101,9542],[10087,9674],[10084,9695],[10050,9740],[10050,9760],[10034,9793],[9996,9833],[9941,9928],[9919,9973],[9901,10028],[9889,10103],[9874,10171],[9845,10253],[9834,10288],[9793,10343],[9743,10396],[9693,10428],[9645,10446],[9508,10442],[9458,10420],[9350,10313],[9331,10251],[9319,10169],[9331,9972],[9303,9928],[9224,9844],[9163,9765],[9140,9759],[9115,9765],[9060,9835],[8991,9893],[8923,9941],[8878,9953],[8801,10025],[8770,10172],[8770,10205],[8715,10315],[8693,10348],[8636,10413],[8588,10451],[8498,10501],[8458,10516],[8393,10525],[8273,10531],[8143,10520],[8112,10515],[8071,10480],[8022,10470],[7937,10393],[7868,10318],[7850,10278],[7850,10259],[7823,10228],[7810,10195],[7810,10167],[7770,10113],[7739,10085],[7734,10085],[7681,10100],[7633,10162],[7610,10211],[7612,10703],[7599,10793],[7576,10873],[7569,10918],[7526,11005],[7516,11028],[7448,11106],[7359,11184],[7305,11205],[7273,11223],[7248,11235],[7210,11235],[7178,11264],[7161,11313],[7139,11408],[7131,11798],[7124,11868],[7096,11978],[7078,12063],[7046,12123],[7035,12183],[7035,12250],[7054,12323],[7075,12449],[7075,12498],[7051,12643],[7000,12748],[6926,12838],[6879,12876],[6778,12932],[6713,12963],[6668,13013],[6552,13129],[6493,13158],[6445,13186],[6313,13213],[6285,13253],[6291,13302],[6319,13353],[6331,13398],[6355,13443],[6386,13588],[6406,13651],[6413,13783],[6405,13878],[6391,13923],[6375,14008],[6319,14127],[6273,14191],[6225,14249],[6124,14325],[6009,14380],[5971,14389],[5933,14417],[5896,14451],[5924,14493],[5956,14557],[5978,14593],[5995,14642],[6011,14778],[6005,14863],[5993,14975],[5956,15024],[5949,15066],[5873,15151],[5784,15230],[5743,15241],[5691,15275],[5633,15279],[5478,15299],[5238,15293],[4748,15294],[4585,15310],[4363,15309]], convexity=115);
   polygon([[14998,15240],[14953,15236],[14858,15224],[14804,15214],[14748,15189],[14691,15181],[14605,15140],[14480,15115],[14448,15101],[14398,15090],[14278,15074],[14228,15054],[14163,15040],[14131,15040],[14090,15026],[14023,14992],[13974,14979],[13929,14949],[13879,14936],[13828,14901],[13786,14890],[13734,14854],[13690,14841],[13643,14806],[13598,14794],[13548,14757],[13503,14739],[13463,14713],[13228,14594],[13213,14581],[13180,14571],[13130,14538],[13130,14529],[13075,14505],[12940,14388],[12888,14350],[12838,14321],[12696,14210],[12638,14179],[12603,14147],[12523,14093],[12372,13941],[12328,13876],[12291,13833],[12241,13744],[12199,13649],[12180,13548],[12164,13489],[12163,13388],[12191,13218],[12189,13160],[12137,13068],[12079,12994],[12060,12971],[12039,12923],[12005,12883],[11985,12830],[11954,12780],[11945,12723],[11925,12653],[11914,12588],[11920,12448],[11960,12304],[11982,12263],[12001,12213],[12009,11968],[12015,11948],[12036,11859],[12067,11788],[12101,11730],[12178,11646],[12208,11623],[12254,11581],[12291,11565],[12305,11565],[12350,11533],[12483,11515],[12573,11515],[12688,11530],[12740,11540],[12784,11570],[12805,11570],[12879,11594],[12919,11615],[13023,11636],[13071,11665],[13098,11665],[13159,11694],[13166,11705],[13185,11705],[13476,11845],[13514,11865],[13529,11865],[13593,11898],[13682,11926],[13735,11950],[13803,11966],[13883,12000],[13942,12015],[13978,12034],[14078,12066],[14122,12090],[14133,12090],[14203,12119],[14333,12187],[14398,12227],[14573,12323],[14638,12365],[14682,12385],[14733,12423],[14828,12475],[14878,12515],[14933,12540],[14973,12578],[15003,12597],[15073,12654],[15095,12661],[15171,12715],[15203,12731],[15264,12774],[15358,12852],[15403,12893],[15443,12917],[15512,12972],[15641,13098],[15743,13208],[15784,13268],[15801,13303],[15838,13353],[15851,13393],[15890,13453],[15904,13500],[15934,13548],[15941,13578],[15975,13658],[15985,13678],[15996,13728],[16015,13778],[16057,13918],[16081,13970],[16099,14080],[16105,14090],[16130,14208],[16136,14418],[16125,14528],[16105,14603],[16079,14688],[16026,14793],[15936,14923],[15888,14968],[15838,15007],[15770,15065],[15739,15081],[15686,15124],[15648,15131],[15598,15162],[15423,15210],[15363,15225],[15228,15241],[15043,15244]], convexity=14);
   polygon([[12144,7421],[12110,7417],[12003,7363],[11973,7337],[11932,7308],[11872,7243],[11839,7200],[11805,7138],[11780,7084],[11766,7018],[11733,6920],[11704,6838],[11665,6778],[11659,6743],[11637,6709],[11621,6685],[11615,6595],[11595,6548],[11587,6453],[11597,6361],[11578,6318],[11469,6209],[11430,6159],[11424,6119],[11401,6093],[11386,6063],[11373,5901],[11386,5743],[11401,5713],[11425,5684],[11425,5665],[11439,5633],[11509,5555],[11596,5476],[11643,5463],[11673,5441],[11718,5420],[11744,5420],[11751,5410],[11788,5391],[11828,5384],[11870,5359],[11926,5340],[11977,5303],[12020,5291],[12073,5250],[12118,5242],[12169,5206],[12205,5200],[12318,5146],[12368,5129],[12388,5117],[12445,5095],[12513,5061],[12536,5054],[12661,4995],[12693,4989],[12713,4971],[12753,4951],[12787,4944],[12818,4921],[12863,4900],[12883,4900],[12903,4879],[12953,4850],[12978,4850],[13001,4826],[13073,4793],[13098,4776],[13219,4708],[13278,4669],[13412,4589],[13445,4576],[13510,4529],[13548,4508],[13593,4479],[13643,4437],[13688,4408],[13753,4348],[13850,4264],[13875,4223],[14042,4058],[14073,4035],[14287,3843],[14504,3635],[14558,3592],[14600,3565],[14638,3531],[14714,3483],[14803,3423],[14830,3400],[14873,3388],[14938,3351],[14973,3344],[15113,3304],[15168,3295],[15348,3295],[15458,3315],[15488,3325],[15598,3346],[15643,3369],[15668,3374],[15743,3400],[15793,3424],[15883,3451],[15921,3471],[15988,3491],[16022,3511],[16091,3535],[16120,3544],[16165,3571],[16223,3586],[16257,3606],[16328,3631],[16408,3669],[16448,3681],[16498,3708],[16551,3725],[16608,3750],[16643,3769],[16685,3780],[16743,3815],[16758,3815],[16794,3829],[16833,3859],[16878,3866],[16933,3909],[16969,3915],[17028,3958],[17063,3972],[17116,4005],[17158,4022],[17210,4050],[17263,4071],[17309,4099],[17363,4122],[17403,4149],[17438,4165],[17493,4196],[17558,4239],[17592,4256],[17745,4353],[17832,4407],[17880,4432],[17933,4478],[17956,4491],[18123,4609],[18158,4627],[18255,4698],[18318,4734],[18459,4884],[18475,4925],[18509,4963],[18525,4995],[18525,5020],[18544,5038],[18565,5073],[18565,5103],[18579,5168],[18599,5218],[18610,5288],[18620,5398],[18620,5513],[18601,5643],[18581,5688],[18564,5748],[18506,5858],[18469,5921],[18403,5994],[18298,6087],[18255,6105],[18250,6114],[18163,6164],[18098,6190],[18075,6190],[18028,6214],[17963,6224],[17844,6237],[17693,6224],[17633,6214],[17538,6186],[17453,6169],[17404,6140],[17374,6140],[17293,6101],[17258,6086],[17208,6074],[17168,6053],[17123,6040],[17069,6030],[17018,6006],[16953,5986],[16923,5979],[16883,5961],[16833,5946],[16780,5935],[16743,5919],[16678,5895],[16658,5895],[16548,5869],[16468,5855],[16383,5845],[16268,5835],[16158,5816],[16023,5801],[15870,5788],[15698,5794],[15598,5806],[15489,5850],[15453,5856],[15393,5885],[15318,5906],[15238,5944],[15213,5951],[15173,5974],[15066,6021],[15035,6035],[14973,6056],[14942,6075],[14878,6091],[14837,6115],[14783,6134],[14731,6164],[14684,6185],[14644,6219],[14593,6232],[14551,6266],[14497,6278],[14449,6311],[14403,6325],[14355,6356],[14313,6369],[14250,6397],[14238,6404],[14178,6420],[13865,6574],[13833,6598],[13788,6616],[13731,6655],[13688,6670],[13672,6685],[13333,6871],[13030,7027],[12998,7046],[12968,7060],[12918,7091],[12878,7124],[12833,7147],[12801,7173],[12713,7236],[12671,7263],[12553,7366],[12529,7375],[12500,7375],[12461,7410],[12428,7420],[12178,7424]], convexity=20);
   polygon([[18951,1925],[18925,1900],[18689,1901],[18642,1855],[18548,1855],[18496,1805],[18402,1805],[18358,1760],[18309,1760],[18258,1710],[18212,1710],[18168,1665],[18118,1665],[17972,1520],[17927,1520],[17665,1257],[17665,1212],[17525,1073],[17525,1022],[17475,973],[17475,926],[17430,883],[17430,832],[17380,783],[17380,687],[17335,643],[17335,549],[17285,497],[17285,257],[17238,210],[17240,0],[19050,0],[19050,1950],[18978,1950]], convexity=34);
   polygon([[104,1901],[0,1900],[0,0],[1950,0],[1950,163],[1900,212],[1901,451],[1855,498],[1855,593],[1805,643],[1806,736],[1760,783],[1760,833],[1710,882],[1710,928],[1665,972],[1665,1023],[1520,1167],[1520,1213],[1257,1475],[1212,1475],[1073,1615],[1022,1615],[973,1665],[926,1665],[883,1710],[832,1710],[783,1760],[687,1760],[643,1805],[549,1805],[497,1855],[258,1855],[208,1903]], convexity=20);
  }
 }
}

module DancingMask1()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) DancingMask1_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}