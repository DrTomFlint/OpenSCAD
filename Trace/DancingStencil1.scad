module DancingStencil1_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 2956/7172 original points
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
 linear_extrude(height=1, convexity=2956)
 union() {
  union() {
   polygon([[0,19023],[0,18045],[213,18045],[262,18095],[499,18095],[542,18140],[643,18140],[691,18190],[786,18189],[833,18235],[877,18235],[929,18285],[978,18285],[1022,18330],[1068,18330],[1212,18475],[1263,18475],[1520,18733],[1520,18783],[1665,18927],[1665,18972],[1712,19020],[1710,19065],[1760,19118],[1760,19162],[1806,19209],[1805,19304],[1855,19352],[1855,19453],[1900,19508],[1900,19733],[1950,19782],[1950,20000],[0,20000]], convexity=11);
   polygon([[17095,19891],[17095,19782],[17145,19733],[17145,19496],[17190,19453],[17190,19352],[17240,19304],[17239,19209],[17285,19162],[17285,19118],[17335,19065],[17333,19020],[17380,18972],[17380,18927],[17525,18783],[17525,18732],[17783,18475],[17833,18475],[17977,18330],[18023,18330],[18067,18285],[18116,18285],[18168,18235],[18212,18235],[18259,18189],[18354,18190],[18402,18140],[18503,18140],[18558,18095],[18783,18095],[18832,18045],[19050,18045],[19050,20000],[17095,20000]], convexity=23);
   polygon([[5475,19688],[5453,19665],[5402,19665],[5330,19592],[5330,19542],[5285,19498],[5285,19402],[5330,19358],[5340,19298],[5377,19285],[5403,19285],[5452,19235],[5548,19235],[5570,19212],[5570,19068],[5448,18950],[5403,18950],[5306,18855],[5262,18855],[5213,18805],[5162,18805],[5118,18760],[5058,18747],[5045,18687],[4950,18593],[4950,18542],[4807,18400],[4804,18353],[4760,18307],[4760,18264],[4665,18161],[4665,18118],[4615,18066],[4615,17978],[4665,17926],[4677,17866],[4736,17855],[4788,17805],[4923,17805],[4972,17855],[5022,17855],[5071,17903],[5095,17874],[5095,17739],[5045,17687],[5045,17592],[5000,17548],[5000,17499],[4950,17447],[4950,17403],[4903,17355],[4905,17310],[4855,17257],[4855,16973],[4809,16927],[4809,16784],[4855,16735],[4867,16676],[4926,16665],[4978,16615],[5067,16615],[5119,16665],[5169,16665],[5190,16715],[5190,16738],[5235,16782],[5243,16838],[5309,16901],[5503,16900],[5570,16828],[5572,16496],[5615,16453],[5615,16169],[5691,16088],[5973,16091],[6045,16162],[6045,16352],[6072,16380],[6163,16380],[6212,16330],[6264,16330],[6374,16214],[6396,16139],[6425,16053],[6426,15829],[6467,15760],[6681,15446],[6739,15420],[6923,15420],[6978,15444],[7040,15550],[7000,15592],[7000,15733],[6950,15782],[6950,15973],[6905,16017],[6905,16113],[6855,16162],[6855,16259],[6810,16302],[6810,16353],[6760,16402],[6760,16453],[6714,16508],[6716,16543],[6665,16574],[6570,16620],[6524,16643],[6375,16730],[6231,16818],[6066,16926],[6029,16995],[5981,17024],[5634,17561],[5621,17683],[5580,17790],[5585,18198],[5620,18285],[5642,18329],[5682,18403],[5935,18666],[6084,18829],[6104,18892],[6192,18934],[6238,18958],[6283,18980],[6303,18998],[6402,19005],[6454,19050],[6591,19050],[6644,19005],[6978,18989],[7087,18950],[7204,18905],[7323,18822],[7525,18628],[7616,18565],[7880,18385],[8064,18385],[8119,18430],[8254,18430],[8306,18474],[8453,18481],[8500,18525],[8636,18525],[8685,18567],[8830,18579],[8876,18615],[8926,18615],[8978,18664],[9117,18671],[9170,18715],[9305,18715],[9356,18763],[9455,18764],[9594,18845],[9621,18884],[9617,19123],[9540,19211],[9450,19265],[9403,19235],[9212,19235],[9168,19190],[9072,19190],[9023,19140],[8927,19140],[8883,19095],[8832,19095],[8783,19045],[8592,19045],[8543,18995],[8217,18995],[8166,19045],[8022,19045],[7973,19095],[7879,19094],[7832,19140],[7738,19140],[7685,19190],[7640,19188],[7592,19235],[7499,19235],[7402,19330],[7358,19330],[7306,19380],[7212,19380],[7168,19425],[7119,19425],[7067,19475],[6972,19475],[6928,19520],[6882,19520],[6833,19570],[6736,19570],[6693,19615],[6549,19615],[6497,19665],[6352,19665],[6308,19710],[5497,19710]], convexity=82);
   polygon([[13664,19313],[13642,19296],[13013,19249],[12725,19190],[12642,19190],[12593,19140],[12547,19140],[12498,19095],[12408,19095],[12356,19045],[12307,19045],[12263,19000],[12218,19000],[12166,18950],[11977,18950],[11926,18900],[11638,18901],[11592,18855],[11357,18855],[11313,18900],[11262,18900],[11213,18950],[11166,18950],[11122,18996],[10882,18995],[10833,19045],[10689,19045],[10637,19095],[10592,19095],[10548,19140],[10499,19140],[10447,19190],[10362,19190],[10163,19094],[10095,18978],[10110,18896],[10149,18771],[10213,18760],[10307,18665],[10356,18665],[10403,18618],[10728,18599],[10978,18469],[11071,18411],[11120,18427],[11163,18385],[11263,18379],[11311,18339],[11404,18334],[11454,18290],[11728,18283],[11881,18334],[12066,18473],[12114,18520],[12212,18520],[12302,18615],[12432,18696],[12593,18710],[12687,18748],[12818,18776],[12904,18805],[13033,18848],[13375,18841],[13480,18805],[13572,18795],[13773,18688],[13854,18616],[13934,18551],[13977,18468],[14084,18307],[14095,18210],[14137,18141],[14181,18008],[14173,17758],[14116,17626],[13995,17394],[13965,17285],[13831,17028],[13483,16731],[13359,16670],[13263,16664],[13211,16625],[13073,16599],[12815,16357],[12801,16293],[12765,16260],[12765,16213],[12720,16152],[12715,16072],[12665,16023],[12665,15972],[12620,15928],[12620,15882],[12570,15833],[12570,15736],[12525,15693],[12525,15592],[12475,15544],[12475,15498],[12428,15451],[12430,15402],[12285,15258],[12285,15212],[12235,15163],[12235,15121],[12303,15017],[12403,14950],[12525,14958],[12795,15186],[12921,15337],[12986,15496],[12975,15590],[13005,15669],[13023,15708],[13048,15761],[13049,15787],[13140,15878],[13140,15924],[13260,16039],[13403,16045],[13475,15972],[13475,15782],[13525,15733],[13537,15676],[13593,15665],[13642,15615],[13736,15615],[13788,15665],[13844,15677],[13855,15733],[13905,15782],[13905,15833],[13950,15877],[13950,16073],[13905,16117],[13905,16163],[13855,16212],[13855,16307],[14118,16570],[14177,16557],[14190,16498],[14237,16450],[14246,16392],[14306,16380],[14358,16330],[14453,16330],[14502,16380],[14559,16392],[14570,16447],[14620,16499],[14620,16876],[14570,16928],[14570,16973],[14402,17140],[14343,17154],[14348,17353],[14384,17427],[14386,17453],[14452,17520],[14497,17520],[14549,17570],[14643,17570],[14737,17475],[14783,17475],[14832,17425],[14973,17425],[15022,17475],[15084,17487],[15095,17546],[15141,17593],[15140,17693],[15095,17736],[15095,17783],[15045,17832],[15045,17883],[14976,17950],[14927,17950],[14855,18023],[14855,18073],[14786,18140],[14738,18140],[14650,18213],[14558,18371],[14403,18496],[14360,18567],[14335,18593],[14334,18691],[14402,18760],[14453,18760],[14497,18805],[14557,18818],[14570,18877],[14620,18929],[14620,19018],[14570,19069],[14570,19118],[14452,19235],[14402,19235],[14353,19285],[14307,19285],[14263,19330],[13686,19330]], convexity=76);
   polygon([[6527,18556],[6506,18543],[6307,18411],[6066,18153],[6039,18113],[6043,17833],[6093,17708],[6115,17663],[6137,17618],[6174,17548],[6225,17485],[6276,17418],[6397,17254],[6779,17030],[6852,17000],[6877,17000],[6990,17123],[6996,17165],[7039,17213],[7044,17260],[7135,17357],[7135,17401],[7185,17453],[7185,17498],[7229,17541],[7234,17597],[7280,17643],[7280,17688],[7324,17731],[7330,17781],[7420,17879],[7420,17919],[7470,17976],[7460,18133],[7380,18195],[7253,18280],[7190,18340],[7018,18498],[6929,18532],[6830,18570],[6548,18570]], convexity=6);
   polygon([[13135,18315],[13108,18300],[12902,18269],[12713,18223],[12598,18195],[12523,18173],[12220,18015],[12246,17921],[12290,17878],[12290,17833],[12340,17781],[12340,17737],[12429,17642],[12436,17593],[12480,17544],[12480,17499],[12575,17402],[12583,17349],[12720,17205],[12720,17162],[12833,17050],[12934,17048],[13038,17085],[13213,17110],[13483,17333],[13573,17530],[13661,17734],[13708,17787],[13702,18042],[13662,18106],[13599,18185],[13476,18252],[13313,18330],[13163,18330]], convexity=6);
   polygon([[11140,17403],[11118,17380],[11072,17380],[10905,17212],[10905,17167],[10855,17116],[10855,17022],[10810,16978],[10810,16877],[10855,16833],[10855,16738],[10905,16686],[10905,16637],[10973,16570],[11023,16570],[11117,16475],[11163,16475],[11212,16425],[11354,16425],[11402,16475],[11453,16475],[11525,16549],[11523,16593],[11570,16639],[11570,17022],[11523,17070],[11525,17113],[11475,17162],[11475,17257],[11425,17310],[11415,17367],[11378,17380],[11352,17380],[11308,17425],[11162,17425]], convexity=22);
   polygon([[8428,17165],[8403,17140],[8356,17140],[8311,17093],[8261,17095],[8235,17041],[8235,17017],[8190,16973],[8190,16879],[8140,16828],[8140,16402],[8190,16353],[8202,16296],[8257,16285],[8309,16235],[8499,16243],[8570,16288],[8593,16291],[8705,16417],[8711,16455],[8744,16475],[8833,16475],[8877,16520],[8937,16530],[8950,16567],[8950,16593],[9000,16642],[9000,16923],[8950,16972],[8950,17023],[8876,17095],[8830,17093],[8782,17140],[8689,17140],[8637,17190],[8452,17190]], convexity=18);
   polygon([[9668,16542],[9643,16520],[9549,16520],[9497,16470],[9399,16463],[9149,16210],[9144,16118],[9100,16066],[9100,16026],[9053,15968],[9055,15680],[9125,15620],[9402,15621],[9453,15670],[9503,15670],[9546,15714],[9687,15721],[9734,15760],[9881,15760],[9930,15719],[10071,15713],[10120,15670],[10356,15670],[10453,15765],[10515,15781],[10515,15825],[10565,15880],[10564,16261],[10358,16470],[10308,16470],[10256,16520],[10164,16520],[10113,16563],[9693,16565]], convexity=12);
   polygon([[3570,16213],[3548,16190],[3499,16190],[3448,16140],[3391,16128],[3380,16071],[3330,16023],[3330,15928],[3380,15876],[3392,15816],[3453,15805],[3497,15760],[3688,15760],[3712,15735],[3718,15681],[3745,15633],[3640,15615],[3117,15615],[3073,15570],[2977,15570],[2926,15520],[2877,15520],[2833,15475],[2738,15475],[2686,15425],[2637,15425],[2593,15380],[2548,15380],[2496,15330],[2446,15330],[2425,15280],[2425,15257],[2380,15213],[2380,15116],[2425,15073],[2425,15022],[2450,14998],[2496,15000],[2547,14950],[2842,14941],[2850,14922],[2782,14855],[2738,14855],[2685,14805],[2640,14807],[2497,14665],[2452,14665],[2358,14570],[2308,14570],[2162,14425],[2117,14425],[2093,14400],[2096,14358],[2045,14308],[2045,14162],[2095,14113],[2107,14056],[2162,14045],[2209,13999],[2309,14000],[2352,14045],[2403,14045],[2497,14140],[2547,14140],[2688,14273],[2770,14261],[2798,14189],[2801,14166],[2760,14117],[2760,13972],[2710,13923],[2710,13877],[2665,13833],[2665,13636],[2707,13558],[2785,13471],[2855,13443],[2928,13411],[2996,13413],[3095,13499],[3095,13643],[3140,13687],[3140,13783],[3190,13832],[3190,13883],[3235,13926],[3235,14023],[3285,14072],[3285,14168],[3380,14262],[3380,14308],[3425,14352],[3425,14403],[3475,14452],[3475,14497],[3547,14570],[3593,14570],[3617,14595],[3614,14636],[3642,14665],[3687,14665],[3878,14855],[3939,14867],[3960,14937],[3997,14950],[4023,14950],[4117,15045],[4163,15045],[4212,15095],[4262,15095],[4309,15141],[4542,15147],[4595,15190],[4854,15198],[4964,15270],[4995,15310],[4970,15360],[4970,15445],[5001,15501],[5000,15639],[4950,15689],[4950,15738],[4785,15902],[4739,15899],[4542,16096],[4500,16093],[4452,16140],[4308,16140],[4255,16190],[3828,16190],[3782,16235],[3592,16235]], convexity=62);
   polygon([[15190,15593],[15168,15570],[14978,15570],[14926,15520],[14737,15520],[14693,15475],[14549,15475],[14497,15425],[14402,15425],[14358,15380],[14262,15380],[14213,15330],[14117,15330],[14073,15285],[13979,15285],[13927,15235],[13879,15235],[13833,15188],[13790,15190],[13737,15140],[13690,15140],[13639,15093],[13599,15096],[13452,14950],[13402,14950],[13353,14900],[13310,14902],[13262,14855],[13167,14855],[13090,14795],[13024,14746],[12901,14594],[12901,14449],[13072,14330],[13117,14330],[13169,14380],[13215,14380],[13259,14425],[13403,14425],[13452,14475],[13503,14475],[13547,14520],[13593,14520],[13642,14570],[13693,14570],[13787,14665],[13832,14665],[13929,14760],[13978,14760],[14022,14805],[14067,14805],[14119,14855],[14168,14855],[14212,14900],[14353,14900],[14402,14950],[14497,14950],[14550,15000],[14595,14998],[14643,15045],[14784,15045],[14831,15094],[15069,15098],[15121,15137],[15168,15101],[15409,15094],[15452,15050],[15545,15050],[15609,15005],[15649,14995],[15740,14910],[15784,14910],[15815,14875],[15824,14823],[15877,14815],[15955,14737],[15955,14690],[16003,14639],[16004,14215],[15959,14160],[15954,14021],[15910,13978],[15910,13930],[15863,13852],[15837,13805],[15815,13761],[15790,13713],[15765,13685],[15765,13640],[15674,13546],[15669,13498],[15581,13404],[15574,13354],[15163,12948],[15120,12941],[14928,12756],[14876,12749],[14735,12614],[14690,12609],[14595,12519],[14548,12514],[14476,12467],[14380,12420],[14334,12397],[14286,12371],[14261,12369],[14166,12280],[14126,12280],[14047,12232],[14001,12209],[13980,12190],[13642,12190],[13593,12140],[13453,12140],[13406,12094],[13313,12095],[13263,12045],[12977,12045],[12926,11995],[12868,11985],[12855,11947],[12855,11922],[12810,11879],[12810,11782],[12855,11731],[12870,11672],[12900,11645],[12916,11571],[12978,11436],[13315,11560],[13693,11570],[13738,11615],[13973,11615],[14022,11665],[14073,11665],[14117,11710],[14257,11710],[14309,11760],[14402,11760],[14450,11807],[14495,11805],[14548,11855],[14594,11855],[14639,11901],[14736,11899],[14787,11950],[14833,11950],[14882,12000],[14931,11998],[15027,12095],[15073,12095],[15117,12140],[15167,12140],[15313,12285],[15358,12285],[15402,12330],[15453,12330],[15502,12380],[15548,12380],[15642,12475],[15693,12475],[15950,12733],[15962,12794],[16023,12805],[16095,12879],[16095,12928],[16140,12972],[16140,13017],[16241,13119],[16238,13165],[16285,13213],[16285,13257],[16335,13310],[16334,13403],[16380,13449],[16380,13543],[16430,13592],[16430,13643],[16475,13687],[16475,13734],[16525,13782],[16525,13883],[16570,13926],[16570,14067],[16620,14119],[16620,14263],[16665,14307],[16665,14833],[16620,14877],[16620,15018],[16570,15069],[16570,15118],[16430,15257],[16418,15318],[16357,15330],[16263,15425],[16212,15425],[16164,15475],[16067,15475],[16023,15520],[15978,15520],[15926,15570],[15782,15570],[15738,15615],[15212,15615]], convexity=74);
   polygon([[5934,15535],[5916,15530],[5694,15523],[5651,15532],[5568,15480],[5470,15400],[5478,15258],[5515,15213],[5515,15120],[5593,15045],[5642,15045],[5689,14999],[5781,15001],[5805,14966],[5721,14877],[5714,14829],[5581,14692],[5563,14631],[5480,14544],[5480,14500],[5436,14452],[5443,14393],[5547,14381],[5591,14330],[5643,14330],[5687,14285],[5876,14285],[5928,14235],[6023,14235],[6067,14190],[6116,14190],[6167,14140],[6212,14140],[6260,14093],[6317,14084],[6336,14025],[6291,13972],[6285,13875],[6244,13830],[6238,13693],[6190,13642],[6190,13592],[6140,13543],[6140,13352],[6101,13305],[6094,13163],[6050,13115],[6050,13022],[6006,12973],[6001,12879],[6078,12821],[6215,12811],[6304,12814],[6356,12858],[6542,12861],[6589,12900],[6838,12900],[6860,12877],[6866,12498],[6900,12447],[6855,12403],[6855,11928],[6905,11876],[6910,11683],[6949,11587],[6964,11474],[6977,11450],[6948,11391],[6964,11153],[7115,11149],[7162,11188],[7258,11190],[7287,11166],[7290,11070],[7334,11023],[7338,10882],[7383,10829],[7388,10685],[7429,10643],[7434,10500],[7475,10452],[7475,10307],[7520,10263],[7520,10211],[7574,10164],[7579,10071],[7621,10020],[7626,9928],[7670,9873],[7670,9834],[7715,9783],[7715,9740],[7765,9685],[7777,9631],[7833,9620],[7945,9740],[7945,9783],[7995,9832],[7995,9878],[8040,9927],[8040,9971],[8135,10069],[8135,10115],[8230,10214],[8230,10256],[8275,10322],[8285,10361],[8429,10538],[8476,10602],[8531,10663],[8665,10827],[8648,10895],[8506,11083],[8406,11104],[8354,11106],[8309,11140],[8117,11140],[8073,11095],[8022,11095],[7872,10955],[7855,10973],[7855,11308],[7810,11352],[7810,11638],[7760,11687],[7760,11786],[7679,11926],[7675,12032],[7644,12098],[7537,12108],[7498,12149],[7409,12056],[7308,12056],[7290,12072],[7296,12263],[7346,12343],[7338,12530],[7330,12637],[7380,12689],[7380,12833],[7425,12877],[7425,13213],[7380,13257],[7370,13317],[7334,13330],[7309,13330],[7222,13394],[6923,13376],[6828,13345],[6580,13351],[6593,13413],[6617,13446],[6615,13496],[6674,13572],[6715,13642],[6713,13691],[6760,13736],[6760,13783],[6810,13832],[6818,14096],[6823,14293],[6725,14450],[6623,14495],[6405,14615],[6270,14660],[6250,14707],[6268,14758],[6301,14830],[6284,15023],[6235,15072],[6235,15213],[6190,15257],[6180,15317],[6144,15330],[6119,15330],[6033,15428],[5978,15540],[5953,15539]], convexity=71);
   polygon([[10998,15252],[10973,15230],[10928,15230],[10831,15135],[10787,15135],[10593,14946],[10456,14941],[10404,14900],[10355,14945],[10264,14945],[10212,14989],[10115,14996],[10064,15040],[9931,15040],[9876,15085],[9786,15085],[9728,15041],[9593,15034],[9522,14990],[9449,14945],[9170,14945],[9073,15034],[9023,15041],[8976,15084],[8877,15090],[8833,15135],[8780,15135],[8764,15110],[8747,14946],[8674,14785],[8715,14736],[8738,14626],[8836,14448],[8855,14343],[8861,14260],[8905,14200],[8910,14163],[8955,14115],[8955,14067],[9068,13943],[9308,13776],[9496,13714],[9765,13698],[9829,13665],[10023,13665],[10074,13710],[10154,13730],[10258,13760],[10307,13760],[10455,13873],[10693,14078],[10854,14270],[10914,14322],[11078,14548],[11140,14715],[11140,14738],[11185,14782],[11185,15163],[11072,15275],[11023,15275]], convexity=14);
   polygon([[7335,15085],[7308,15077],[7236,14975],[7233,14687],[7261,14650],[7308,14650],[7352,14605],[7401,14605],[7501,14515],[7546,14515],[7614,14465],[7672,14432],[7686,14414],[7776,14408],[7790,14405],[7801,14350],[7855,14309],[7855,14212],[7905,14163],[7905,14067],[7950,14023],[7950,13928],[8000,13876],[8000,13782],[8045,13738],[8045,13689],[8095,13637],[8095,13593],[8190,13496],[8190,13447],[8235,13403],[8235,13358],[8285,13306],[8285,13257],[8380,13163],[8392,13106],[8448,13095],[8592,12950],[8643,12950],[8761,12845],[8905,12767],[8976,12705],[9021,12705],[9065,12666],[9213,12648],[9297,12610],[9408,12562],[9548,12515],[9846,12509],[9995,12525],[10058,12552],[10259,12558],[10310,12606],[10351,12599],[10403,12649],[10479,12677],[10571,12748],[10619,12786],[10720,12889],[10950,13080],[11013,13138],[11093,13216],[11188,13277],[11230,13295],[11290,13364],[11395,13471],[11535,13617],[11573,13653],[11619,13690],[11651,13760],[11713,13835],[11865,13971],[11974,14140],[12027,14159],[12071,14238],[12095,14261],[12095,14308],[12140,14352],[12140,14453],[12071,14521],[11878,14522],[11641,14401],[11576,14315],[11525,14262],[11525,14212],[11475,14163],[11475,14117],[11285,13928],[11285,13879],[11213,13805],[11162,13805],[10905,13547],[10905,13499],[10833,13425],[10782,13425],[10643,13285],[10598,13285],[10546,13235],[10498,13235],[10355,13093],[10312,13095],[10263,13045],[10167,13045],[10116,12995],[9549,12995],[9497,13045],[9358,13045],[9305,13096],[9214,13094],[9068,13218],[9019,13236],[8945,13308],[8945,13353],[8806,13498],[8801,13548],[8586,13760],[8529,13852],[8509,13895],[8444,13951],[8353,14118],[8323,14230],[8290,14355],[8244,14498],[8209,14547],[8172,14720],[8137,14789],[8024,14804],[7972,14855],[7927,14855],[7883,14900],[7832,14900],[7783,14950],[7687,14950],[7639,14998],[7598,14994],[7548,15045],[7452,15045],[7403,15095],[7363,15094]], convexity=47);
   polygon([[14850,14801],[14833,14799],[14782,14756],[14693,14753],[14640,14705],[14592,14705],[14548,14660],[14503,14660],[14403,14565],[14359,14565],[14263,14471],[14213,14463],[14118,14375],[14068,14369],[13829,14135],[13790,14135],[13151,13500],[13144,13447],[13100,13403],[13100,13353],[13150,13301],[13156,13251],[13213,13239],[13260,13193],[13784,13196],[13832,13238],[14258,13243],[14308,13284],[14686,13290],[14737,13333],[14975,13338],[15038,13384],[15166,13385],[15263,13480],[15313,13480],[15357,13525],[15403,13525],[15565,13688],[15565,13731],[15613,13798],[15615,13925],[15660,13974],[15660,14256],[15615,14309],[15615,14400],[15565,14453],[15565,14498],[15427,14644],[15420,14688],[15357,14750],[15261,14756],[15213,14805],[14868,14803]], convexity=19);
   polygon([[12420,13792],[12388,13775],[12259,13743],[11966,13435],[11938,13378],[11940,13263],[11995,13212],[11952,13195],[11909,13178],[11890,13138],[11879,13109],[11670,13090],[11496,12950],[11480,12924],[11504,12883],[11523,12637],[11560,12598],[11564,12228],[11563,12143],[11555,12071],[11607,12023],[11604,11964],[11548,11955],[11495,12010],[11417,12020],[11361,12055],[11308,12055],[11257,12110],[11014,12105],[10917,12040],[10855,11920],[10848,11237],[10842,11060],[10825,11050],[10707,11150],[10678,11172],[10659,11223],[10589,11250],[10478,11260],[10435,11282],[10348,11294],[10277,11254],[10268,11206],[10235,11163],[10235,11112],[10190,11069],[10184,10255],[10129,10212],[10119,9970],[10101,10123],[10045,10190],[10026,10233],[9917,10393],[9865,10454],[9865,10498],[9799,10576],[9794,10598],[9684,10750],[9621,10843],[9495,10960],[9430,10973],[9351,10985],[9270,10925],[9261,10826],[9166,10811],[9119,10760],[9072,10760],[9045,10732],[9045,10687],[9000,10643],[8992,10491],[8941,10450],[8932,10398],[8828,10376],[8783,10330],[8726,10318],[8715,10262],[8665,10213],[8665,9972],[8715,9923],[8715,9877],[8760,9833],[8760,9738],[8810,9686],[8810,9637],[8855,9593],[8855,9546],[9005,9402],[9005,9353],[9055,9301],[9055,9258],[9144,9163],[9149,9114],[9212,9050],[9230,9090],[9230,9114],[9280,9169],[9280,9258],[9324,9308],[9331,9452],[9372,9502],[9380,9743],[9419,9785],[9425,10023],[9451,10046],[9525,9973],[9523,9924],[9760,9687],[9760,9642],[9833,9570],[9878,9570],[9909,9519],[9914,9495],[10050,9354],[10050,9308],[10096,9261],[10101,9213],[10145,9164],[10163,9102],[10195,9065],[10195,9023],[10245,8971],[10245,8927],[10334,8832],[10357,8765],[10403,8765],[10514,8878],[10520,8927],[10565,8973],[10565,9021],[10615,9073],[10615,9165],[10661,9214],[10658,9588],[10615,9641],[10615,9975],[10656,10019],[10616,10070],[10621,10218],[10658,10262],[10661,10594],[10699,10609],[10758,10574],[10808,10545],[10833,10520],[10883,10520],[10927,10475],[11023,10475],[11118,10387],[11217,10380],[11309,10290],[11416,10299],[11425,10451],[11470,10500],[11470,10925],[11426,10973],[11422,11209],[11375,11261],[11369,11493],[11409,11520],[11454,11480],[11598,11472],[11643,11436],[11753,11416],[11782,11385],[11831,11385],[11929,11290],[11974,11290],[12005,11255],[12014,11203],[12135,11170],[12285,11107],[12332,11090],[12407,11109],[12431,11179],[12504,11251],[12521,11308],[12415,11609],[12325,11702],[12325,11781],[12280,11831],[12280,11875],[12237,11924],[12230,12021],[12185,12071],[12185,12163],[12141,12206],[12135,12307],[12090,12355],[12090,12452],[12045,12498],[12043,12634],[12072,12665],[12118,12665],[12162,12710],[12257,12710],[12309,12760],[12358,12760],[12430,12833],[12428,12880],[12475,12928],[12475,13020],[12391,13163],[12384,13280],[12427,13450],[12430,13499],[12525,13592],[12525,13783],[12497,13810],[12453,13809]], convexity=65);
   polygon([[2428,13070],[2403,13045],[2341,13033],[2330,12972],[2285,12928],[2285,12878],[2117,12710],[2017,12710],[1973,12665],[1928,12665],[1876,12615],[1782,12615],[1738,12570],[1688,12570],[1542,12425],[1447,12425],[1403,12380],[1309,12380],[1257,12330],[1212,12330],[1168,12285],[1119,12285],[1067,12235],[1023,12235],[926,12140],[877,12140],[783,12045],[737,12045],[643,11950],[592,11950],[235,11592],[235,11542],[190,11498],[190,11452],[140,11403],[140,11353],[94,11306],[95,11213],[45,11163],[45,10832],[95,10783],[95,10732],[140,10688],[140,10592],[190,10543],[190,10497],[354,10308],[458,10199],[907,9983],[997,9942],[1068,9901],[1210,9890],[1255,9856],[1680,9845],[2213,9856],[2259,9901],[2403,9900],[2452,9950],[2497,9950],[2550,10000],[2595,9998],[2643,10045],[2688,10045],[2783,10129],[2990,10204],[3398,10457],[3620,10640],[3620,10778],[3538,10939],[3423,10957],[3305,10971],[3231,10923],[3209,10900],[3163,10900],[3066,10804],[3020,10807],[2922,10710],[2877,10710],[2833,10665],[2782,10665],[2688,10570],[2642,10570],[2593,10520],[2542,10520],[2448,10425],[2402,10425],[2358,10380],[2309,10380],[2257,10330],[2117,10330],[2073,10285],[1352,10285],[1308,10330],[1212,10330],[1163,10380],[1067,10380],[1023,10425],[972,10425],[879,10520],[832,10520],[643,10710],[581,10722],[570,10782],[520,10833],[520,11024],[559,11068],[566,11119],[610,11162],[610,11208],[749,11353],[756,11405],[1021,11665],[1118,11665],[1162,11710],[1213,11710],[1306,11805],[1353,11805],[1402,11855],[1452,11855],[1500,11902],[1543,11900],[1592,11950],[1643,11950],[1692,12000],[1735,11998],[1833,12096],[1926,12094],[1973,12140],[2023,12140],[2072,12190],[2118,12190],[2162,12235],[2213,12235],[2262,12285],[2308,12285],[2402,12380],[2453,12380],[2570,12498],[2570,12548],[2665,12642],[2665,12688],[2710,12732],[2710,12881],[2593,13046],[2471,13095],[2452,13095]], convexity=72);
   polygon([[5096,12510],[5079,12500],[4978,12477],[4900,12459],[4683,12379],[4639,12358],[4620,12307],[4390,12071],[4380,12023],[4308,11950],[4261,11950],[4213,11900],[4151,11888],[4128,11817],[4067,11805],[3950,11687],[3950,11639],[3904,11593],[3898,11436],[3890,11402],[3996,11321],[4025,11309],[4073,11236],[4174,11195],[4267,11258],[4450,11509],[4492,11516],[4548,11570],[4592,11570],[4689,11665],[4738,11665],[4832,11760],[4879,11760],[4922,11805],[5066,11805],[5118,11855],[5213,11855],[5262,11805],[5309,11805],[5352,11760],[5453,11760],[5497,11805],[5543,11805],[5570,11833],[5570,11878],[5643,11950],[5783,11950],[5877,11855],[5926,11855],[6000,11783],[6000,11732],[6045,11688],[6045,11592],[6000,11548],[6000,11402],[6045,11358],[6045,11262],[6095,11213],[6095,10689],[6045,10637],[6045,10592],[6000,10548],[6000,10499],[5950,10447],[5938,10391],[5832,10380],[5783,10330],[5737,10330],[5403,9995],[5354,9997],[5162,9805],[5116,9805],[5073,9760],[5022,9760],[4709,9447],[4712,9400],[4665,9352],[4665,9308],[4615,9256],[4615,9168],[4665,9116],[4665,9066],[4714,9045],[4737,9045],[4783,8999],[4926,8999],[4973,9045],[5034,9057],[5057,9128],[5070,9140],[5263,9140],[5330,9072],[5330,8827],[5285,8783],[5285,8738],[5235,8686],[5235,8637],[5190,8593],[5190,8499],[5140,8447],[5140,8352],[5095,8308],[5095,8168],[5045,8116],[5045,8070],[5000,8021],[5000,7685],[5053,7575],[5170,7525],[5373,7713],[5481,7883],[5547,8087],[5565,8113],[5570,8309],[5611,8360],[5616,8448],[5712,8545],[5710,8593],[5760,8642],[5770,9093],[5830,9234],[5900,9356],[5906,9593],[5927,9615],[5973,9615],[6000,9643],[6000,9689],[6045,9732],[6045,9783],[6190,9927],[6190,9973],[6261,10045],[6319,10057],[6330,10114],[6425,10207],[6425,10256],[6475,10308],[6475,10356],[6522,10403],[6520,10445],[6570,10498],[6570,10592],[6615,10638],[6615,11262],[6570,11308],[6570,11403],[6520,11452],[6521,11787],[6475,11833],[6475,11877],[6425,11929],[6425,11978],[6335,12067],[6321,12133],[6291,12161],[6271,12226],[6161,12289],[6091,12315],[5956,12381],[5885,12385],[5800,12430],[5735,12474],[5598,12493],[5545,12520],[5113,12520]], convexity=68);
   polygon([[12154,10651],[12146,10643],[12140,10498],[12096,10453],[12095,9543],[12052,9478],[12050,8690],[12006,8643],[11999,8303],[11959,8261],[11953,7928],[11908,7864],[11905,7781],[11863,7721],[11860,7599],[11810,7547],[11810,7499],[11760,7447],[11760,7353],[11720,7305],[11713,7209],[11626,7114],[11619,7020],[11575,6971],[11575,6930],[11531,6883],[11524,6829],[11435,6733],[11421,6673],[11340,6593],[11340,6549],[11295,6498],[11289,6449],[11151,6308],[11146,6259],[11059,6171],[11048,6115],[10910,5971],[10910,5929],[10720,5734],[10720,5693],[10522,5472],[10471,5373],[10430,5235],[10430,5206],[10542,5099],[10613,5116],[10753,5186],[10872,5179],[10996,5085],[11032,5072],[11044,5024],[11140,4927],[11140,4881],[11190,4833],[11190,4732],[11235,4689],[11235,4642],[11285,4593],[11285,4542],[11331,4488],[11329,4454],[11402,4380],[11448,4380],[11499,4330],[11593,4330],[11642,4380],[11704,4392],[11715,4453],[11760,4497],[11760,4688],[11715,4732],[11715,4833],[11783,4900],[11904,4891],[11955,4855],[12343,4378],[12604,4165],[12620,3972],[12665,3928],[12665,3879],[12715,3827],[12715,3782],[12760,3738],[12770,3678],[12807,3665],[12833,3665],[12882,3615],[12973,3615],[13022,3665],[13074,3665],[13095,3715],[13095,3738],[13140,3782],[13140,4162],[13212,4235],[13263,4235],[13357,4140],[13402,4140],[13448,4094],[13596,4094],[13762,4355],[13715,4403],[13697,4600],[13596,4613],[13498,4705],[13455,4705],[13354,4800],[13311,4800],[13263,4844],[13213,4851],[13170,4892],[13070,4900],[12977,4988],[12928,4995],[12883,5039],[12833,5042],[12720,5134],[12692,5135],[12628,5180],[12592,5190],[12484,5275],[12444,5285],[12356,5370],[12311,5370],[12258,5418],[12165,5423],[12117,5470],[12072,5470],[11977,5558],[11928,5565],[11874,5610],[11835,5610],[11785,5656],[11738,5661],[11669,5705],[11593,5755],[11547,5755],[11473,5831],[11715,6073],[11715,6118],[11855,6257],[11855,6306],[11905,6358],[11905,6403],[11950,6447],[11950,6496],[12045,6593],[12045,6637],[12095,6689],[12095,6783],[12140,6827],[12140,6876],[12190,6928],[12190,7022],[12237,7070],[12235,7113],[12285,7162],[12285,7212],[12332,7260],[12330,7303],[12380,7352],[12380,7448],[12431,7499],[12429,7596],[12475,7641],[12475,7736],[12525,7787],[12525,7928],[12570,7972],[12570,8213],[12620,8262],[12620,8358],[12665,8402],[12665,9548],[12620,9592],[12620,10208],[12570,10259],[12570,10403],[12525,10447],[12525,10496],[12453,10570],[12402,10570],[12359,10614],[12213,10638],[12162,10660]], convexity=48);
   polygon([[13163,7428],[13123,7411],[12976,7305],[12945,7257],[12956,6973],[12972,6955],[13022,6955],[13081,6907],[13118,6905],[13213,6817],[13260,6811],[13314,6765],[13355,6765],[13403,6721],[13451,6715],[13547,6625],[13591,6625],[13643,6575],[13685,6575],[13740,6530],[13834,6524],[13882,6475],[13933,6475],[13977,6430],[14023,6430],[14121,6338],[14168,6334],[14213,6290],[14260,6290],[14308,6246],[14357,6240],[14403,6196],[14499,6192],[14550,6145],[14591,6145],[14689,6054],[14784,6049],[14833,6006],[14883,5999],[14930,5955],[14975,5955],[15023,5911],[15122,5903],[15169,5860],[15211,5860],[15259,5817],[15356,5810],[15409,5765],[15545,5765],[15595,5719],[15739,5714],[15790,5669],[16401,5670],[16452,5715],[16546,5719],[16593,5759],[16735,5766],[16782,5805],[16833,5805],[16882,5855],[17022,5855],[17070,5902],[17115,5900],[17168,5950],[17307,5950],[17360,6000],[17501,5999],[17548,6045],[17737,6045],[17789,6095],[18126,6086],[18212,6008],[18275,5987],[18296,5923],[18380,5835],[18380,5782],[18430,5733],[18430,5592],[18475,5548],[18475,5208],[18435,5161],[18435,5120],[18344,5021],[18338,4973],[18290,4911],[18281,4871],[18212,4800],[18160,4791],[18149,4782],[18196,4717],[18285,4637],[18297,4581],[18356,4570],[18408,4520],[18593,4520],[18642,4570],[18704,4582],[18715,4643],[18760,4687],[18760,4733],[18788,4760],[18844,4772],[18855,4827],[18905,4879],[18905,5642],[18861,5688],[18854,5884],[18810,5927],[18810,6023],[18760,6072],[18760,6168],[18715,6212],[18715,6258],[18592,6380],[18547,6380],[18503,6425],[18452,6425],[18403,6475],[18357,6475],[18313,6520],[17687,6520],[17643,6475],[17408,6475],[17356,6425],[17262,6425],[17218,6380],[17027,6380],[16976,6330],[16927,6330],[16883,6285],[16789,6285],[16737,6235],[16548,6235],[16502,6190],[15833,6190],[15787,6235],[15597,6235],[15546,6285],[15451,6285],[15406,6330],[15358,6330],[15306,6380],[15212,6380],[15168,6425],[15119,6425],[15068,6475],[14972,6475],[14928,6520],[14882,6520],[14833,6570],[14737,6570],[14693,6615],[14642,6615],[14593,6665],[14547,6665],[14453,6760],[14402,6760],[14308,6855],[14263,6855],[14215,6902],[14170,6900],[14117,6950],[14073,6950],[13976,7045],[13927,7045],[13833,7140],[13787,7140],[13736,7190],[13687,7190],[13643,7235],[13592,7235],[13544,7285],[13497,7285],[13453,7330],[13402,7330],[13354,7380],[13307,7380],[13241,7435],[13203,7445]], convexity=60);
   polygon([[5660,7250],[5642,7246],[5545,7236],[5426,7168],[5378,7144],[5354,7141],[5190,6978],[5190,6929],[5140,6877],[5140,6829],[5095,6784],[5095,6739],[5045,6687],[5045,6639],[5000,6594],[5000,6549],[4950,6497],[4950,6357],[5000,6306],[5012,6246],[5074,6235],[5112,6193],[5211,6188],[5259,6235],[5307,6235],[5359,6285],[5593,6285],[5615,6262],[5615,6212],[5665,6163],[5665,6068],[5547,5950],[5497,5950],[5163,5615],[5117,5615],[5023,5520],[4972,5520],[4928,5475],[4882,5475],[4833,5425],[4782,5425],[4548,5190],[4502,5190],[4213,4900],[4163,4900],[4066,4804],[4020,4807],[3972,4760],[3927,4760],[3709,4542],[3710,4496],[3665,4453],[3665,4402],[3615,4353],[3615,4262],[3665,4213],[3665,4161],[3714,4140],[3760,4118],[3783,4095],[3926,4094],[3973,4140],[4022,4140],[4070,4187],[4140,4118],[4140,4069],[4187,4023],[4185,3973],[4118,3905],[4072,3905],[4023,3855],[3972,3855],[3923,3805],[3877,3805],[3833,3760],[3782,3760],[3733,3710],[3687,3710],[3643,3665],[3592,3665],[3235,3307],[3235,3257],[3190,3213],[3190,3168],[3140,3116],[3140,3067],[3095,3023],[3095,2929],[3045,2877],[3045,2642],[3095,2593],[3095,2541],[3145,2520],[3168,2520],[3212,2475],[3308,2475],[3352,2520],[3414,2532],[3425,2593],[3475,2642],[3475,2688],[3520,2732],[3532,2794],[3618,2805],[3702,2795],[3711,2689],[3665,2642],[3665,2452],[3615,2403],[3615,2262],[3693,2186],[3806,2154],[3829,2140],[3972,2140],[4045,2212],[4045,2257],[4095,2309],[4095,2358],[4140,2402],[4140,2593],[4190,2642],[4190,2879],[4235,2922],[4235,3069],[4279,3144],[4285,3213],[4330,3257],[4330,3354],[4371,3405],[4389,3506],[4424,3520],[4448,3520],[4570,3643],[4570,3688],[4615,3732],[4615,4020],[4660,4070],[4660,4115],[4704,4163],[4711,4214],[4800,4309],[4800,4351],[4850,4403],[4858,4456],[4945,4550],[4945,4592],[5040,4689],[5040,4731],[5135,4834],[5135,4876],[5325,5071],[5325,5114],[5653,5446],[5675,5508],[5733,5520],[6043,5830],[6046,5878],[6131,5976],[6152,6034],[6214,6053],[6274,6117],[6280,6164],[6324,6213],[6281,6257],[6274,6310],[6135,6454],[6135,6497],[6090,6543],[6083,6593],[6040,6642],[6040,6685],[5945,6786],[5945,6833],[5901,6877],[5894,6929],[5850,6972],[5842,7075],[5678,7254]], convexity=80);
   polygon([[9333,7112],[9313,7095],[9262,7095],[9213,7045],[9165,7045],[9140,7020],[9140,6972],[9095,6928],[9095,6262],[9045,6213],[9045,6022],[9000,5978],[9000,5832],[8950,5783],[8950,5637],[8905,5593],[8905,5499],[8855,5447],[8855,5352],[8810,5308],[8810,5212],[8760,5163],[8760,5117],[8665,5023],[8665,4973],[8619,4926],[8620,4833],[8570,4783],[8570,4738],[8520,4685],[8522,4640],[8475,4592],[8475,4547],[8425,4496],[8427,4450],[8380,4402],[8380,4356],[8285,4263],[8285,4213],[8140,4067],[8140,4017],[8095,3974],[8095,3879],[8000,3782],[8000,3737],[7832,3570],[7785,3570],[7715,3515],[7669,3495],[7618,3475],[7592,3475],[7544,3425],[7447,3425],[7403,3380],[7358,3380],[7306,3330],[7257,3330],[7163,3235],[7117,3235],[7043,3161],[7039,2930],[7188,2773],[7263,2760],[7307,2805],[7513,2795],[7520,2740],[7570,2687],[7570,2642],[7520,2593],[7520,2542],[7475,2498],[7475,2403],[7522,2355],[7530,2298],[7567,2285],[7593,2285],[7642,2235],[7736,2235],[7788,2285],[7833,2285],[7877,2330],[7937,2340],[7950,2377],[7950,2403],[8045,2497],[8045,2543],[8095,2592],[8095,2643],[8140,2687],[8140,2733],[8190,2782],[8190,2833],[8235,2877],[8235,2973],[8285,3022],[8285,3068],[8357,3140],[8404,3140],[8454,3179],[8501,3161],[8475,3095],[8475,3069],[8425,3017],[8425,2882],[8475,2833],[8487,2771],[8546,2760],[8598,2710],[8686,2710],[8738,2760],[8783,2760],[8905,2882],[8905,2928],[8950,2972],[8950,3067],[9000,3119],[9000,3498],[9045,3542],[9045,3686],[9095,3738],[9095,3783],[9140,3827],[9140,3876],[9190,3928],[9190,3973],[9235,4017],[9235,4066],[9332,4165],[9330,4209],[9453,4324],[9496,4329],[9617,4419],[9712,4467],[9785,4516],[9878,4521],[9929,4570],[9978,4570],[10022,4615],[10068,4615],[10098,4665],[10118,4706],[10160,4736],[10125,4833],[10023,4971],[9981,4995],[9783,4995],[9737,4950],[9642,4950],[9593,4900],[9542,4900],[9498,4855],[9408,4845],[9375,4878],[9368,4928],[9330,4973],[9330,5165],[9374,5214],[9385,5506],[9420,5549],[9420,5593],[9470,5642],[9470,5783],[9429,5830],[9475,5880],[9475,6117],[9520,6163],[9520,6927],[9475,6973],[9475,7023],[9353,7130]], convexity=90);
   polygon([[17706,4383],[17690,4375],[17632,4361],[17594,4330],[17547,4330],[17503,4285],[17408,4285],[17356,4235],[17307,4235],[17263,4190],[17217,4190],[17123,4095],[17072,4095],[17023,4045],[16978,4045],[16925,3995],[16880,3997],[16832,3950],[16787,3950],[16693,3855],[16643,3855],[16591,3804],[16503,3799],[16453,3756],[16394,3741],[16329,3705],[16285,3683],[16262,3662],[16164,3656],[16120,3613],[16023,3609],[15977,3567],[15878,3560],[15840,3523],[15690,3511],[15643,3471],[15549,3466],[15503,3427],[15359,3415],[15309,3375],[15071,3375],[15023,3418],[14978,3420],[14933,3464],[14878,3471],[14470,3878],[14470,3924],[14405,3967],[14118,3949],[14053,3850],[14018,3724],[14000,3664],[14000,3638],[14285,3352],[14285,3307],[14403,3190],[14448,3190],[14592,3045],[14642,3045],[14789,2899],[14833,2902],[14879,2855],[14928,2855],[15022,2760],[15073,2760],[15121,2710],[15168,2710],[15212,2665],[15738,2665],[15782,2710],[15833,2710],[15882,2760],[15928,2760],[15972,2805],[16022,2805],[16219,3001],[16258,2997],[16309,3045],[16358,3045],[16502,3190],[16559,3202],[16584,3272],[16642,3285],[16739,3380],[16788,3380],[16882,3475],[16928,3475],[17022,3570],[17073,3570],[17117,3615],[17164,3615],[17257,3710],[17306,3710],[17358,3760],[17404,3760],[17449,3807],[17495,3805],[17548,3855],[17642,3855],[17689,3901],[17783,3900],[17832,3950],[17894,3962],[17905,4023],[17950,4067],[17950,4168],[17833,4333],[17723,4390]], convexity=46);
   polygon([[6355,2708],[6308,2661],[6258,2654],[6195,2593],[6195,2551],[6147,2473],[6122,2425],[6100,2401],[6093,2303],[6053,2259],[6053,2071],[6100,2004],[6100,1973],[6146,1926],[6152,1878],[6235,1783],[6235,1737],[6403,1570],[6448,1570],[6499,1520],[6548,1520],[6592,1475],[7309,1475],[7377,1433],[7429,1410],[7618,1215],[7615,916],[7483,803],[7359,799],[7263,711],[6925,699],[6883,666],[6261,660],[6210,706],[5734,712],[5665,750],[5570,710],[5520,730],[5494,751],[5164,757],[5115,800],[4829,807],[4783,844],[4641,851],[4591,895],[4492,904],[4444,945],[4402,945],[4359,989],[4309,995],[4135,1164],[4126,1219],[4040,1309],[4040,1401],[4000,1445],[3988,1645],[3926,1713],[3639,1713],[3616,1662],[3617,1640],[3570,1592],[3570,926],[3615,883],[3615,832],[3665,783],[3665,736],[3712,691],[3710,642],[3760,593],[3760,542],[3830,475],[3878,475],[3927,425],[3978,425],[4022,380],[4116,380],[4167,330],[4308,330],[4352,285],[4876,285],[4928,235],[5402,235],[5448,190],[6642,190],[6688,235],[7497,235],[7549,285],[7643,285],[7687,330],[7736,330],[7788,380],[7833,380],[7877,425],[7926,425],[7978,475],[8022,475],[8140,592],[8140,637],[8190,689],[8190,738],[8235,782],[8235,1263],[8190,1307],[8190,1447],[8140,1499],[8140,1548],[7927,1760],[7877,1760],[7833,1805],[7788,1805],[7736,1855],[7643,1855],[7597,1900],[6740,1900],[6687,1950],[6642,1950],[6615,1978],[6616,2071],[6570,2118],[6570,2213],[6665,2307],[6665,2353],[6715,2402],[6715,2496],[6665,2547],[6653,2604],[6598,2615],[6500,2710],[6402,2755]], convexity=46);
   polygon([[18951,1925],[18925,1900],[18689,1901],[18642,1855],[18548,1855],[18496,1805],[18402,1805],[18358,1760],[18309,1760],[18258,1710],[18212,1710],[18168,1665],[18118,1665],[17972,1520],[17927,1520],[17665,1257],[17665,1212],[17525,1073],[17525,1022],[17475,973],[17475,926],[17430,883],[17430,832],[17380,783],[17380,687],[17335,643],[17335,549],[17285,497],[17285,257],[17238,210],[17240,0],[19050,0],[19050,1950],[18978,1950]], convexity=34);
   polygon([[104,1901],[0,1900],[0,0],[1950,0],[1950,163],[1900,212],[1901,451],[1855,498],[1855,593],[1805,643],[1806,736],[1760,783],[1760,833],[1710,882],[1710,928],[1665,972],[1665,1023],[1520,1167],[1520,1213],[1257,1475],[1212,1475],[1073,1615],[1022,1615],[973,1665],[926,1665],[883,1710],[832,1710],[783,1760],[687,1760],[643,1805],[549,1805],[497,1855],[258,1855],[208,1903]], convexity=20);
  }
 }
}

module DancingStencil1()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) DancingStencil1_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}