module ms2orange_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 1171/8645 original points
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
 linear_extrude(height=1, convexity=1171)
 union() {
  union() {
   polygon([[0,19153],[0,18305],[1580,18312],[1580,20000],[0,20000]], convexity=5);
   polygon([[18276,19069],[18278,18138],[20000,18135],[20000,20000],[18275,20000]], convexity=5);
   polygon([[10818,18220],[10814,18215],[10776,18199],[10754,18140],[10810,17911],[10790,17854],[10780,17691],[10755,17548],[10738,17490],[10593,17271],[10527,17143],[10490,17059],[10480,16872],[10391,16732],[10180,16525],[10170,16350],[10311,16067],[10400,15913],[10476,15810],[10615,15678],[10705,15472],[10735,15413],[10745,15145],[10740,15048],[10689,14885],[10631,14865],[10475,14697],[10360,14541],[10359,14493],[10384,14453],[10406,14438],[10935,14424],[11050,14374],[11116,14348],[11175,14413],[11181,14445],[11152,14495],[11085,14591],[11050,14653],[10985,14791],[10965,14868],[10945,15029],[10958,15114],[10985,15168],[11032,15288],[11015,15563],[10930,15823],[10913,15990],[10818,16195],[10710,16412],[10724,16678],[10775,16847],[10964,17187],[11010,17319],[11030,17348],[11085,17482],[11091,17620],[11070,17660],[11059,17779],[11012,17860],[10956,17983],[10905,18180],[10860,18215],[10821,18225]], convexity=14);
   polygon([[8306,18088],[8290,18082],[8250,18029],[8240,17911],[8220,17760],[8238,17640],[8269,17552],[8295,17434],[8285,17231],[8240,17123],[8009,16807],[7850,16470],[7838,16137],[7993,15950],[8068,15904],[8213,15885],[8302,15840],[8460,15748],[8614,15395],[8663,15312],[8837,15205],[8860,15158],[8850,15050],[8814,14898],[8820,14650],[8840,14593],[8885,14438],[8965,14312],[9006,14271],[9060,14251],[9330,14327],[9443,14379],[9601,14401],[9615,14426],[9544,14523],[9475,14618],[9429,14738],[9375,14973],[9254,15068],[9210,15104],[9167,15203],[9151,15378],[9148,15513],[9083,15628],[8750,15818],[8583,15956],[8502,16033],[8434,16130],[8465,16778],[8484,16878],[8488,17222],[8595,17478],[8605,17595],[8628,17634],[8534,17833],[8405,17979],[8395,18053],[8351,18085],[8323,18094]], convexity=12);
   polygon([[13478,17540],[13474,17535],[13373,17500],[13305,17452],[13265,17373],[13225,17298],[13184,17237],[12999,17128],[12811,17051],[12678,16926],[12438,16833],[12345,16774],[12290,16650],[12270,16543],[12265,16148],[12307,15839],[12330,15608],[12325,15307],[12260,15192],[12000,14958],[11915,14807],[11680,14628],[11482,14545],[11430,14450],[11436,14333],[11677,14220],[11979,14090],[12058,14103],[12085,14143],[12110,14687],[12167,14858],[12257,14915],[12351,14939],[12449,14968],[12635,15159],[12765,15415],[12803,15622],[12820,15788],[12825,15808],[12745,16138],[12740,16513],[12765,16611],[12855,16725],[12963,16850],[13148,16940],[13228,16950],[13419,17053],[13460,17158],[13469,17275],[13490,17360],[13565,17441],[13571,17481],[13537,17535],[13481,17546]], convexity=10);
   polygon([[5788,16355],[5784,16350],[5749,16337],[5724,16291],[5745,16058],[5760,15997],[5705,15793],[5670,15609],[5660,15311],[5655,15098],[5673,15024],[5739,14970],[5800,14950],[6067,14965],[6183,14980],[6288,14970],[6533,14836],[6788,14645],[6859,14584],[6910,14493],[6970,14378],[6984,14229],[7005,14125],[7020,14038],[7050,13732],[7090,13672],[7253,13540],[7308,13515],[7435,13461],[7557,13365],[7642,13299],[7678,13306],[7843,13488],[7953,13560],[8078,13650],[8276,13841],[8110,13925],[7992,13940],[7908,13950],[7747,13970],[7653,14004],[7500,14077],[7380,14201],[7225,14388],[7177,14500],[7055,14723],[6978,14847],[6925,14885],[6705,14997],[6443,15113],[6333,15155],[6174,15208],[6006,15378],[5910,15516],[5870,15603],[5870,15810],[5920,15956],[5910,16067],[5888,16158],[5870,16323],[5831,16350],[5791,16360]], convexity=12);
   polygon([[15610,16072],[15593,16064],[15535,15970],[15490,15838],[15440,15703],[15342,15535],[15231,15443],[15150,15289],[15110,15208],[15036,15120],[14945,15041],[14730,14927],[14597,14876],[14487,14795],[14369,14735],[14110,14571],[13901,14555],[13755,14565],[13697,14565],[13640,14493],[13565,14258],[13545,14145],[13520,14038],[13463,13940],[13370,13786],[13246,13665],[13167,13639],[13070,13595],[13018,13565],[12910,13571],[12868,13550],[12855,13508],[12890,13412],[13020,13200],[13155,13066],[13182,13018],[13271,13004],[13300,13043],[13328,13100],[13406,13223],[13516,13285],[13695,13295],[13755,13355],[13745,13488],[13685,13668],[13685,13743],[13744,13843],[13755,14048],[13804,14153],[13877,14200],[13975,14210],[14063,14243],[14107,14318],[14166,14360],[14387,14346],[14565,14300],[14617,14314],[14653,14362],[15098,14605],[15137,14640],[15165,14768],[15235,15010],[15340,15168],[15445,15308],[15523,15530],[15599,15660],[15607,15699],[15711,16011],[15659,16070],[15628,16079]], convexity=14);
   polygon([[7824,15868],[7821,15865],[7770,15833],[7765,15778],[7795,15728],[7873,15612],[7972,15570],[8228,15462],[8303,15250],[8393,15001],[8420,14964],[8425,14718],[8400,14628],[8410,14370],[8445,14278],[8563,14064],[8629,14043],[8678,14048],[8795,14121],[8786,14185],[8695,14337],[8621,14509],[8605,14593],[8646,15033],[8630,15093],[8470,15285],[8405,15412],[8356,15555],[8306,15625],[8186,15704],[7975,15780],[7868,15864],[7828,15871]], convexity=10);
   polygon([[10413,15519],[10395,15504],[10364,15438],[10345,15295],[10275,15202],[10215,15128],[10196,14967],[10035,14743],[9980,14517],[9992,14467],[10060,14419],[10110,14438],[10155,14503],[10215,14681],[10430,14935],[10534,15023],[10569,15118],[10567,15318],[10495,15482],[10430,15535]], convexity=6);
   polygon([[12908,15265],[12904,15260],[12851,15223],[12765,14976],[12562,14805],[12482,14760],[12377,14750],[12313,14670],[12370,14514],[12321,14392],[12261,14282],[12301,14055],[12335,14002],[12390,13827],[12498,13748],[12574,13761],[12615,13828],[12637,13873],[12635,14045],[12610,14447],[12615,14638],[12641,14673],[12723,14726],[12915,14927],[12945,14995],[13000,15193],[12964,15254],[12911,15270]], convexity=10);
   polygon([[5938,14840],[5934,14835],[5890,14810],[5882,14745],[5944,14676],[6045,14650],[6279,14619],[6315,14595],[6415,14528],[6453,14500],[6513,14460],[6559,14432],[6620,14322],[6675,14067],[6685,13804],[6752,13603],[6848,13438],[6943,13350],[7103,13250],[7157,13220],[7251,13175],[7328,13136],[7412,13050],[7505,13113],[7514,13175],[7470,13225],[7363,13290],[7208,13365],[7016,13490],[6950,13556],[6870,13743],[6845,13850],[6851,13880],[6819,14158],[6764,14398],[6719,14493],[6620,14579],[6438,14705],[6323,14770],[6006,14820],[5941,14845]], convexity=8);
   union() {
    difference() {
     polygon([[10408,14231],[10404,14228],[10024,14214],[9953,14195],[9857,14200],[9670,14178],[9461,14129],[9326,14091],[9024,13990],[8494,13719],[8295,13567],[8146,13438],[8033,13270],[7940,13141],[7896,13101],[7770,12824],[7769,12611],[7831,12515],[7943,12453],[8068,12459],[8251,12550],[8412,12635],[8601,12690],[9010,12710],[9203,12642],[9372,12566],[9698,12349],[9890,12147],[10000,11939],[10028,11848],[10054,11783],[10081,11368],[10074,11234],[10050,11142],[9940,10931],[9847,10838],[9859,10782],[9889,10769],[9973,10806],[10243,10827],[10488,10752],[10917,10547],[10938,10552],[10981,10598],[11008,10625],[11083,10672],[11228,10681],[11427,10886],[11610,11001],[11723,11028],[11816,11015],[12243,10793],[12378,10696],[12449,10650],[12587,10590],[12688,10535],[12838,10404],[12942,10288],[13066,10068],[13288,9900],[13477,9780],[13510,9856],[13552,10000],[13567,10062],[13575,10101],[13589,10150],[13605,10244],[13630,10400],[13664,10779],[13665,10838],[13664,10906],[13664,10949],[13655,11081],[13653,11189],[13637,11260],[13595,11543],[13567,11666],[13499,11898],[13435,12093],[13255,12463],[13051,12793],[12985,12894],[12707,13227],[12600,13328],[12506,13412],[12193,13653],[11892,13834],[11568,13983],[11364,14067],[10945,14170],[10605,14225],[10412,14235]], convexity=18);
     polygon([[11898,12450],[11915,12440],[12161,12325],[12350,12250],[12540,12195],[12764,12110],[12815,12044],[12785,11990],[12698,12007],[12528,12072],[12372,12105],[12313,12115],[12134,12180],[12023,12211],[11804,12208],[11629,12160],[11544,12136],[11415,12114],[11323,12055],[11132,11999],[11058,11975],[11016,11987],[11008,12072],[11133,12130],[11280,12172],[11554,12322],[11773,12450],[11880,12460]], convexity=8);
     polygon([[12065,12063],[12088,12059],[12308,12005],[12787,11790],[12888,11744],[12900,11681],[12879,11655],[12784,11667],[12691,11694],[12515,11745],[12460,11765],[12281,11775],[12192,11795],[12186,11644],[12180,11630],[12232,11648],[12473,11662],[12611,11610],[12620,11571],[12594,11540],[12509,11550],[12393,11557],[12153,11483],[12028,11428],[11788,11439],[11608,11495],[11482,11516],[11403,11508],[11308,11455],[11250,11490],[11245,11553],[11348,11619],[11430,11650],[11621,11640],[11680,11618],[11739,11609],[11738,11638],[11708,11773],[11656,11785],[11575,11755],[11402,11734],[11200,11703],[11153,11760],[11184,11799],[11333,11839],[11510,11918],[11575,11969],[11853,12065],[12043,12066]], convexity=20);
    }
   }
   polygon([[14238,14163],[14208,14152],[14043,14055],[13966,14015],[13915,13973],[13900,13873],[13891,13810],[13870,13763],[13880,13622],[13935,13493],[13920,13337],[13904,13237],[13826,13161],[13752,13125],[13695,13095],[13661,13090],[13587,13085],[13510,13039],[13425,12903],[13380,12845],[13375,12803],[13468,12599],[13543,12550],[13605,12585],[13639,12708],[13830,12928],[13935,12993],[14041,13100],[14100,13181],[14130,13558],[14143,13743],[14210,13878],[14368,14052],[14391,14111],[14326,14169],[14268,14174]], convexity=8);
   polygon([[17218,14059],[17208,14053],[17125,14002],[17022,13925],[16960,13862],[16875,13733],[16780,13583],[16675,13392],[16603,13336],[16218,13350],[16114,13375],[15887,13385],[15809,13393],[15628,13370],[15521,13345],[15488,13350],[15446,13329],[15397,13265],[15323,13215],[15220,13109],[14987,12848],[14828,12785],[14666,12755],[14311,12595],[14225,12458],[14146,12356],[14035,12305],[13989,12285],[13683,12290],[13636,12264],[13615,12228],[13639,12163],[13710,11977],[13775,11748],[13807,11620],[13878,11615],[13961,11648],[14105,11728],[14220,11861],[14300,11994],[14376,12228],[14445,12374],[14525,12410],[14759,12420],[14798,12425],[14934,12407],[15144,12410],[15302,12457],[15478,12493],[15559,12474],[15615,12438],[15693,12380],[15780,12358],[15888,12420],[15965,12450],[16140,12491],[16258,12625],[16447,12700],[16588,12755],[16683,12819],[16860,13009],[16880,13102],[16893,13318],[16920,13385],[16976,13523],[17005,13620],[17132,13750],[17228,13785],[17340,13763],[17516,13684],[17575,13723],[17611,13806],[17569,13869],[17420,13980],[17325,14019],[17246,14065],[17228,14065]], convexity=18);
   polygon([[4403,14010],[4399,14005],[4298,13990],[4187,13925],[4120,13916],[3968,13948],[3846,13971],[3721,13903],[3655,13875],[3569,13845],[3440,13828],[3268,13765],[3032,13646],[2874,13575],[2790,13527],[2650,13459],[2539,13427],[2518,13357],[2563,13305],[2635,13295],[2755,13320],[2888,13336],[2996,13369],[3113,13422],[3242,13538],[3383,13550],[3548,13560],[3753,13645],[3958,13632],[4151,13510],[4251,13490],[4555,13483],[4661,13431],[4768,13303],[4888,13249],[5009,13225],[5193,13050],[5272,12813],[5414,12686],[5480,12655],[5733,12603],[6013,12419],[6178,12350],[6273,12335],[6395,12440],[6510,12440],[6663,12358],[6851,12170],[6898,12143],[6985,12326],[7118,12550],[7205,12703],[7203,12778],[6959,12908],[6838,12896],[6681,12865],[6584,12808],[6385,12818],[6214,12895],[6151,12913],[6144,12896],[6122,12916],[6118,12921],[5996,12929],[5844,12958],[5765,12980],[5635,13015],[5550,13088],[5459,13239],[5370,13275],[5188,13359],[4930,13555],[4771,13665],[4582,13828],[4530,13933],[4490,13992],[4406,14015]], convexity=16);
   polygon([[4512,13280],[4509,13275],[4455,13244],[4450,13188],[4508,13115],[4585,13048],[4640,12970],[4655,12925],[4843,12858],[4915,12775],[4966,12605],[5040,12492],[5167,12430],[5500,12307],[5638,12225],[5787,12115],[5890,12070],[6271,11930],[6536,11920],[6649,11805],[6674,11749],[6736,11724],[6795,11763],[6805,11835],[6775,11901],[6600,12102],[6532,12190],[6489,12216],[6385,12143],[6343,12100],[6265,12107],[5848,12260],[5632,12415],[5394,12525],[5187,12625],[5141,12673],[5054,12861],[5025,12957],[4972,13000],[4780,13051],[4657,13199],[4562,13270],[4515,13284]], convexity=8);
   union() {
    difference() {
     polygon([[7505,12771],[7494,12758],[7413,12625],[7297,12430],[7163,12183],[7083,11999],[7047,11887],[7007,11767],[6925,11445],[6905,11327],[6865,10947],[6865,10627],[6875,10467],[6905,10269],[6963,10032],[7048,9900],[7101,9900],[7305,9981],[7563,9948],[7795,9940],[7908,10005],[8115,10110],[8323,10218],[8863,10227],[9073,10363],[9204,10486],[9483,10641],[9543,10663],[9545,10838],[9584,10918],[9709,11019],[9766,11071],[9865,11238],[9885,11403],[9855,11658],[9845,11739],[9796,11860],[9740,11991],[9617,12135],[9468,12255],[9308,12347],[9190,12415],[9037,12441],[9004,12455],[8646,12445],[8390,12361],[8078,12221],[7905,12200],[7760,12243],[7615,12367],[7580,12485],[7566,12680],[7569,12758],[7529,12785],[7516,12785]], convexity=12);
     polygon([[8915,12220],[8978,12201],[9113,12141],[9350,12040],[9451,12032],[9460,11956],[9441,11928],[9539,11910],[9592,11896],[9605,11857],[9584,11805],[9372,11815],[9293,11850],[9162,11860],[8998,11890],[8981,11874],[8991,11844],[8970,11800],[8936,11727],[8976,11705],[9068,11730],[9166,11734],[9204,11700],[9178,11639],[8853,11530],[8705,11537],[8372,11638],[8190,11606],[8150,11627],[8150,11677],[8210,11720],[8384,11770],[8470,11740],[8441,11861],[8323,11880],[8068,11814],[7841,11795],[7820,11848],[7841,11900],[7967,11930],[8033,11952],[8408,12138],[8622,12230],[8650,12243],[8853,12239]], convexity=24);
    }
   }
   polygon([[14828,12280],[14824,12275],[14743,12255],[14593,12213],[14560,12172],[14460,11946],[14439,11873],[14360,11743],[14240,11605],[14043,11475],[13953,11440],[13892,11435],[13849,11365],[13870,11272],[13913,11240],[13947,11235],[13986,11234],[14134,11280],[14248,11355],[14413,11518],[14583,11665],[14735,11852],[14790,12023],[14796,12055],[14888,12117],[14921,12170],[14923,12216],[14869,12275],[14831,12285]], convexity=6);
   polygon([[4260,11300],[4253,11297],[4191,11264],[4113,11159],[3908,10985],[3781,10889],[3675,10835],[3518,10790],[3095,10580],[2980,10561],[2813,10515],[2598,10532],[2450,10553],[2310,10571],[2240,10601],[2180,10598],[2121,10645],[2078,10650],[2030,10622],[2021,10558],[2113,10460],[2308,10390],[2651,10349],[2758,10296],[2858,10194],[2948,10159],[3053,10192],[3142,10263],[3248,10302],[3370,10337],[3640,10500],[4035,10660],[4078,10675],[4269,10848],[4345,10895],[4430,10895],[4513,10855],[4703,10768],[5128,10383],[5268,10335],[5333,10310],[5463,10270],[5603,10260],[5613,10283],[5710,10340],[5840,10450],[6028,10510],[6408,10564],[6502,10555],[6645,10510],[6640,11073],[6659,11223],[6680,11305],[6662,11305],[6515,11143],[6444,11041],[6373,10985],[6233,10990],[6151,10953],[6030,10865],[5853,10805],[5628,10720],[5473,10713],[5250,10802],[5189,10835],[4976,10890],[4819,11005],[4720,11023],[4522,11095],[4418,11210],[4320,11305],[4268,11304]], convexity=20);
   polygon([[13950,11035],[13943,11030],[13910,11015],[13890,10952],[13900,10843],[13873,10549],[13865,10498],[13886,10456],[13992,10415],[14107,10414],[14253,10409],[14603,10531],[14672,10565],[14876,10554],[15039,10520],[15408,10336],[15663,10255],[15905,10281],[16164,10368],[16458,10357],[16668,10267],[16968,10150],[17049,10108],[17101,10054],[17184,10054],[17278,10096],[17453,10120],[18156,10137],[18258,10184],[18302,10245],[18445,10330],[18560,10424],[18624,10511],[18622,10609],[18581,10655],[18538,10660],[18496,10636],[18339,10495],[18255,10465],[17946,10437],[17798,10427],[17695,10392],[17648,10365],[17523,10378],[17325,10461],[17048,10665],[16780,10769],[16435,10952],[16315,11030],[16248,11035],[16180,10983],[16095,10918],[15876,10772],[15761,10685],[15573,10618],[15448,10596],[15313,10599],[15206,10640],[14954,10760],[14833,10776],[14675,10915],[14523,11028],[14497,11040],[14001,11032],[13958,11040]], convexity=18);
   polygon([[14661,10370],[14614,10361],[14469,10275],[14253,10230],[14154,10232],[14008,10255],[13918,10284],[13864,10260],[13840,10203],[13820,10155],[13811,9994],[13769,9850],[13803,9796],[13854,9784],[13923,9826],[14005,9918],[14128,9990],[14231,10030],[14361,10042],[14638,10106],[14783,10165],[14899,10209],[15042,10140],[15253,10085],[15315,10122],[15318,10183],[15107,10309],[14948,10380],[14708,10379]], convexity=11);
   polygon([[6318,10370],[6314,10365],[6108,10315],[5892,10242],[5773,10165],[5639,10109],[5488,10120],[5431,10083],[5431,10003],[5473,9970],[5521,9950],[5773,9960],[5938,10041],[6328,10055],[6487,10089],[6581,10120],[6675,10130],[6655,10165],[6655,10283],[6594,10335],[6478,10371],[6321,10375]], convexity=10);
   polygon([[18138,1522],[18135,1518],[18135,0],[20000,0],[20000,1525],[18142,1525]], convexity=6);
   polygon([[0,748],[0,0],[1750,0],[1744,1495],[0,1495]], convexity=5);
  }
 }
}

module ms2orange()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) ms2orange_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
ms2orange();