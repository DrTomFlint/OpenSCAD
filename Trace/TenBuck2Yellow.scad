module TenBuck2Yellow_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 1864/3800 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=17640) /* polygon maxx=17640 */
 assign(maxy=20000) /* polygon maxy=20000 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=1864)
 union() {
  union() {
   polygon([[0,19608],[0,19215],[184,19215],[191,19225],[227,19225],[263,19236],[280,19245],[295,19245],[313,19254],[358,19266],[428,19301],[448,19320],[458,19320],[477,19340],[486,19340],[516,19363],[651,19493],[663,19514],[728,19613],[749,19658],[771,19733],[780,19750],[780,19769],[790,19776],[790,19824],[800,19831],[800,20000],[0,20000]], convexity=5);
   polygon([[16847,19894],[16849,19788],[16859,19733],[16876,19678],[16885,19660],[16885,19641],[16895,19634],[16895,19616],[16943,19530],[16970,19493],[16970,19482],[16990,19463],[16990,19452],[17123,19320],[17133,19320],[17152,19300],[17163,19300],[17218,19261],[17288,19225],[17304,19225],[17311,19215],[17330,19215],[17348,19206],[17405,19189],[17411,19180],[17454,19180],[17461,19170],[17640,19170],[17640,20000],[16845,20000]], convexity=15);
   polygon([[12348,17485],[12344,17480],[12322,17480],[12303,17465],[12281,17465],[12274,17455],[12251,17455],[12244,17445],[12222,17445],[12203,17425],[12192,17425],[12130,17362],[12130,17352],[12110,17333],[12110,17321],[12095,17309],[12080,17278],[12080,17261],[12070,17254],[12070,17232],[12058,17220],[12060,17170],[12025,17131],[12025,17122],[12005,17103],[12005,17081],[11995,17074],[11995,16981],[12005,16974],[12005,16952],[12025,16933],[12025,16922],[12063,16885],[12073,16885],[12092,16865],[12114,16865],[12121,16855],[12160,16855],[12198,16835],[12232,16800],[12244,16800],[12256,16785],[12293,16768],[12321,16745],[12344,16745],[12351,16735],[12368,16735],[12399,16720],[12411,16705],[12425,16705],[12425,16696],[12451,16664],[12533,16611],[12568,16600],[12649,16600],[12656,16610],[12676,16610],[12706,16633],[12768,16694],[12790,16724],[12790,16744],[12800,16751],[12800,16770],[12809,16788],[12821,16833],[12830,16850],[12830,16865],[12839,16883],[12850,16918],[12850,17020],[12881,17079],[12895,17091],[12895,17103],[12915,17122],[12915,17144],[12925,17151],[12925,17244],[12915,17251],[12915,17273],[12895,17292],[12895,17304],[12856,17338],[12828,17358],[12798,17366],[12753,17371],[12723,17398],[12636,17455],[12611,17455],[12604,17465],[12585,17465],[12560,17481],[12560,17475],[12530,17490],[12351,17490]], convexity=50);
   polygon([[9805,16585],[9798,16580],[9772,16580],[9753,16565],[9727,16565],[9663,16534],[9612,16501],[9598,16485],[9557,16465],[9544,16450],[9522,16450],[9503,16430],[9485,16430],[9456,16415],[9412,16386],[9393,16365],[9382,16365],[9352,16333],[9325,16292],[9325,16261],[9315,16254],[9315,16232],[9295,16213],[9295,16181],[9284,16174],[9296,16108],[9315,16084],[9315,16069],[9348,16056],[9361,16040],[9393,16040],[9412,16025],[9568,16025],[9578,16015],[9813,16011],[9881,16004],[9936,15975],[9957,15975],[10033,15953],[10075,15930],[10102,15930],[10193,15884],[10238,15850],[10278,15831],[10302,15805],[10313,15805],[10368,15765],[10388,15756],[10401,15740],[10415,15740],[10443,15699],[10454,15679],[10528,15603],[10546,15574],[10563,15569],[10620,15513],[10620,15502],[10655,15468],[10679,15418],[10709,15378],[10761,15275],[10769,15270],[10785,15238],[10785,15222],[10801,15200],[10796,15186],[10810,15159],[10810,15147],[10826,15115],[10836,15109],[10844,15086],[10891,15055],[10911,15055],[10939,15038],[10965,15055],[10996,15055],[11028,15080],[11060,15119],[11060,15150],[11076,15175],[11071,15188],[11085,15213],[11085,15244],[11095,15251],[11095,15504],[11105,15511],[11105,15537],[11116,15573],[11125,15590],[11125,15608],[11145,15627],[11145,15658],[11155,15668],[11155,15866],[11146,15878],[11141,15943],[11134,15985],[11125,15991],[11125,16020],[11105,16055],[11105,16080],[11040,16207],[11040,16224],[11025,16236],[10991,16309],[10979,16316],[10970,16340],[10946,16349],[10941,16370],[10915,16380],[10915,16394],[10858,16432],[10825,16460],[10811,16460],[10799,16475],[10691,16530],[10648,16545],[10621,16545],[10614,16555],[10581,16555],[10574,16565],[10543,16565],[10523,16580],[10111,16580],[10104,16590],[9813,16590]], convexity=48);
   polygon([[9210,15515],[9203,15510],[9165,15510],[9118,15484],[9078,15447],[9046,15434],[9028,15415],[9016,15415],[9004,15400],[8987,15400],[8890,15302],[8890,15290],[8851,15248],[8818,15183],[8820,15146],[8805,15134],[8805,14806],[8820,14793],[8818,14752],[8850,14693],[8850,14670],[8870,14630],[8870,14615],[8890,14580],[8890,14566],[8925,14501],[8925,14488],[8955,14428],[8955,14417],[8980,14368],[9034,14313],[9051,14278],[9102,14225],[9112,14225],[9209,14133],[9238,14112],[9288,14088],[9308,14072],[9357,14045],[9393,14047],[9414,14035],[9493,14035],[9503,14025],[9978,14028],[10028,14038],[10100,14076],[10105,14085],[10151,14105],[10186,14133],[10276,14218],[10295,14259],[10305,14265],[10325,14312],[10339,14328],[10365,14375],[10365,14394],[10375,14401],[10375,14418],[10405,14478],[10405,14563],[10416,14574],[10405,14768],[10396,14788],[10384,14878],[10375,14887],[10375,14944],[10365,14951],[10365,14994],[10355,15001],[10355,15023],[10340,15042],[10340,15084],[10330,15091],[10330,15108],[10296,15175],[10285,15189],[10254,15253],[10218,15291],[10145,15326],[10140,15334],[10088,15360],[10071,15360],[10064,15370],[10041,15370],[10034,15380],[9998,15380],[9953,15396],[9926,15421],[9878,15445],[9855,15445],[9815,15465],[9776,15465],[9769,15475],[9721,15475],[9714,15485],[9695,15485],[9671,15500],[9618,15520],[9218,15520]], convexity=34);
   union() {
    difference() {
     polygon([[8118,14825],[8114,14820],[8082,14820],[8063,14800],[8035,14800],[7995,14780],[7972,14780],[7953,14765],[7926,14765],[7888,14746],[7843,14734],[7823,14726],[7788,14719],[7743,14714],[7733,14705],[7606,14705],[7599,14695],[7556,14695],[7529,14681],[7515,14686],[7493,14670],[7451,14670],[7444,14660],[7361,14660],[7354,14650],[7316,14650],[7310,14641],[7230,14629],[7224,14620],[7205,14620],[7170,14600],[7141,14600],[7135,14591],[7086,14575],[7066,14575],[7009,14545],[6987,14545],[6945,14525],[6933,14525],[6868,14490],[6851,14490],[6845,14481],[6808,14476],[6773,14469],[6753,14461],[6673,14449],[6640,14430],[6616,14430],[6551,14395],[6521,14395],[6514,14385],[6491,14385],[6478,14370],[6437,14350],[6424,14335],[6411,14335],[6399,14320],[6338,14290],[6327,14290],[6276,14265],[6264,14250],[6254,14250],[6214,14218],[6140,14149],[6135,14132],[6113,14123],[6101,14099],[6073,14070],[6061,14070],[6023,14026],[5999,13995],[5987,13995],[5895,13902],[5895,13892],[5826,13828],[5789,13798],[5770,13790],[5753,13760],[5742,13760],[5705,13722],[5705,13714],[5630,13626],[5630,13617],[5609,13598],[5565,13531],[5565,13522],[5545,13503],[5545,13492],[5525,13473],[5525,13462],[5505,13443],[5505,13430],[5460,13381],[5460,13371],[5445,13359],[5420,13308],[5420,13281],[5410,13274],[5410,13211],[5420,13204],[5420,13172],[5440,13153],[5440,13140],[5479,13115],[5486,13105],[5518,13105],[5535,13087],[5535,13056],[5545,13049],[5573,13009],[5584,12989],[5638,12934],[5703,12891],[5752,12840],[5763,12840],[5782,12820],[5791,12820],[5831,12788],[5913,12705],[5964,12660],[5973,12660],[6000,12632],[6000,12622],[6021,12603],[6063,12541],[6088,12509],[6140,12452],[6140,12442],[6170,12413],[6170,12402],[6200,12373],[6200,12362],[6233,12330],[6245,12330],[6255,12311],[6255,12282],[6275,12263],[6275,12253],[6297,12230],[6299,12203],[6315,12150],[6321,12128],[6330,12110],[6330,12052],[6340,12042],[6336,11773],[6329,11724],[6264,11598],[6245,11574],[6245,11545],[6225,11510],[6225,11487],[6210,11456],[6194,11443],[6160,11391],[6160,11382],[6130,11353],[6130,11342],[6095,11308],[6095,11296],[6079,11283],[6046,11218],[6020,11193],[6020,11182],[6000,11163],[6000,11152],[5944,11098],[5931,11068],[5896,11034],[5817,10991],[5804,10975],[5792,10975],[5763,10945],[5752,10945],[5713,10905],[5703,10905],[5630,10833],[5630,10822],[5610,10803],[5610,10781],[5600,10774],[5600,10745],[5570,10686],[5561,10680],[5545,10648],[5545,10636],[5505,10559],[5505,10533],[5480,10489],[5480,10471],[5465,10459],[5440,10408],[5440,10388],[5425,10344],[5410,10315],[5410,10288],[5395,10269],[5400,10261],[5385,10249],[5385,10216],[5375,10209],[5375,10131],[5365,10124],[5365,10091],[5355,10084],[5355,10051],[5345,10044],[5345,10018],[5329,9973],[5299,9915],[5304,9896],[5291,9878],[5286,9833],[5274,9788],[5269,9750],[5260,9744],[5260,9681],[5251,9675],[5244,9633],[5239,9554],[5250,9543],[5250,9515],[5276,9463],[5297,9433],[5328,9399],[5394,9355],[5429,9355],[5435,9346],[5478,9339],[5563,9334],[5572,9325],[5658,9325],[5668,9315],[6043,9320],[6158,9325],[6178,9335],[6263,9339],[6303,9348],[6361,9392],[6393,9380],[6438,9380],[6449,9369],[6563,9370],[6583,9355],[6664,9355],[6671,9345],[6939,9345],[6946,9335],[6987,9315],[7014,9315],[7021,9305],[7044,9305],[7051,9295],[7079,9295],[7207,9230],[7230,9230],[7248,9221],[7283,9210],[7300,9210],[7343,9188],[7369,9190],[7381,9175],[7524,9175],[7531,9165],[7619,9165],[7626,9155],[7694,9155],[7701,9145],[7734,9145],[7741,9135],[7859,9135],[7866,9125],[7904,9125],[7911,9115],[7944,9115],[7951,9105],[7988,9105],[8056,9070],[8084,9070],[8091,9060],[8124,9060],[8131,9050],[8199,9050],[8206,9040],[8254,9040],[8261,9030],[8340,9030],[8388,9006],[8400,9011],[8425,8995],[8484,8995],[8541,8965],[8562,8965],[8598,8954],[8615,8945],[8644,8945],[8651,8935],[8683,8934],[8736,8899],[8764,8880],[8794,8880],[8801,8870],[8818,8870],[8906,8826],[8920,8831],[8945,8815],[8974,8815],[8981,8805],[9048,8805],[9059,8794],[9140,8806],[9146,8815],[9170,8815],[9210,8840],[9235,8840],[9303,8875],[9338,8897],[9361,8925],[9379,8925],[9410,8960],[9410,8974],[9425,8987],[9445,9029],[9455,9036],[9490,9105],[9505,9148],[9505,9174],[9515,9181],[9515,9214],[9525,9221],[9525,9253],[9536,9264],[9535,9358],[9549,9370],[9573,9368],[9620,9401],[9654,9453],[9717,9582],[9715,9602],[9734,9623],[9750,9655],[9750,9680],[9770,9715],[9770,9730],[9790,9765],[9790,9794],[9800,9801],[9800,9833],[9815,9853],[9815,9923],[9804,9934],[9836,9980],[9845,9986],[9845,10009],[9855,10016],[9875,10055],[9875,10073],[9899,10096],[9894,10111],[9938,10158],[9960,10190],[9960,10213],[9987,10268],[10004,10283],[10017,10318],[10034,10338],[10055,10380],[10055,10394],[10082,10443],[10099,10463],[10106,10485],[10148,10528],[10176,10569],[10184,10583],[10185,10614],[10195,10621],[10195,10794],[10185,10801],[10185,10978],[10208,11025],[10221,11040],[10264,11118],[10280,11131],[10280,11143],[10323,11183],[10368,11212],[10450,11292],[10450,11303],[10483,11335],[10493,11335],[10518,11361],[10638,11420],[10654,11420],[10661,11430],[10693,11430],[10712,11445],[10740,11445],[10775,11465],[10790,11465],[10825,11485],[10851,11485],[11003,11562],[11023,11579],[11073,11596],[11125,11628],[11146,11648],[11181,11700],[11189,11713],[11196,11753],[11201,11851],[11190,11862],[11190,11924],[11181,11930],[11174,11973],[11169,12038],[11155,12054],[11157,12095],[11145,12107],[11145,12136],[11125,12161],[11125,12175],[11095,12237],[11095,12264],[11085,12271],[11085,12300],[11060,12344],[11060,12364],[11050,12371],[11050,12434],[11041,12440],[11019,12595],[11010,12601],[11010,12793],[11000,12803],[10997,13058],[10987,13098],[10973,13123],[10958,13140],[10947,13162],[10925,13173],[10908,13188],[10863,13209],[10828,13216],[10749,13221],[10738,13210],[10711,13210],[10638,13162],[10622,13133],[10608,13126],[10563,13113],[10505,13085],[10480,13085],[10445,13065],[10431,13065],[10419,13050],[10388,13049],[10343,13015],[10302,12995],[10289,12980],[10277,12980],[10253,12955],[10220,12955],[10187,12936],[10100,12924],[10094,12915],[10061,12915],[10054,12905],[10031,12905],[10024,12895],[9994,12895],[9975,12885],[9424,12885],[9412,12895],[9253,12900],[9158,12908],[9154,12951],[9136,12984],[9163,13010],[9174,13010],[9208,13049],[9230,13079],[9230,13088],[9250,13107],[9250,13129],[9260,13136],[9260,13222],[9249,13258],[9240,13275],[9240,13324],[9230,13331],[9230,13350],[9210,13385],[9210,13413],[9230,13467],[9230,13579],[9220,13586],[9220,13606],[9169,13670],[9078,13726],[9053,13733],[9047,13783],[9026,13823],[8986,13861],[8963,13873],[8941,13916],[8898,13960],[8848,13985],[8760,13985],[8732,13999],[8719,14015],[8696,14015],[8689,14025],[8608,14025],[8567,14011],[8516,13976],[8490,13988],[8490,14013],[8517,14025],[8541,14025],[8595,14061],[8595,14073],[8614,14091],[8626,14164],[8615,14171],[8615,14204],[8605,14211],[8605,14228],[8567,14303],[8532,14356],[8527,14365],[8510,14383],[8510,14393],[8485,14416],[8425,14534],[8425,14548],[8391,14616],[8377,14633],[8350,14684],[8350,14704],[8340,14711],[8340,14742],[8323,14760],[8312,14782],[8290,14793],[8273,14808],[8248,14819],[8213,14826],[8121,14831]], convexity=282);
     polygon([[5749,13293],[5748,13280],[5738,13278],[5734,13301],[5740,13317],[5751,13306]], convexity=6);
    }
   }
   polygon([[3878,11572],[3843,11554],[3785,11498],[3745,11421],[3745,11400],[3731,11400],[3689,11368],[3626,11309],[3585,11226],[3585,11212],[3477,11105],[3467,11105],[3395,11032],[3395,11022],[3375,11003],[3375,10993],[3359,10976],[3320,10899],[3320,10281],[3310,10274],[3310,9691],[3320,9684],[3320,9642],[3335,9623],[3335,9242],[3319,9220],[3321,9142],[3310,9121],[3310,9051],[3300,9044],[3300,9011],[3290,9004],[3290,8971],[3280,8964],[3280,8832],[3271,8823],[3265,8743],[3259,8613],[3250,8603],[3250,8572],[3238,8560],[3240,8523],[3225,8500],[3225,8426],[3215,8419],[3215,8346],[3185,8289],[3185,8261],[3175,8254],[3175,8166],[3166,8160],[3154,8083],[3139,8060],[3144,8047],[3130,8023],[3130,7721],[3140,7714],[3140,7673],[3155,7653],[3155,7621],[3165,7614],[3165,7598],[3200,7527],[3225,7503],[3225,7492],[3393,7325],[3403,7325],[3453,7274],[3488,7258],[3528,7221],[3596,7185],[3850,7185],[3930,7226],[3941,7240],[3953,7240],[4019,7308],[4053,7373],[4053,7388],[4088,7458],[4108,7486],[4156,7540],[4190,7607],[4190,7620],[4220,7680],[4220,7700],[4255,7766],[4255,7809],[4265,7816],[4265,7894],[4275,7901],[4275,8114],[4285,8121],[4285,8154],[4295,8161],[4295,8294],[4305,8301],[4305,8349],[4330,8396],[4330,8418],[4379,8514],[4384,8548],[4396,8593],[4401,8628],[4416,8644],[4414,8713],[4436,8773],[4445,8782],[4445,8934],[4415,8991],[4415,9003],[4370,9046],[4370,9054],[4380,9061],[4380,9134],[4405,9185],[4435,9242],[4435,9265],[4465,9325],[4465,9353],[4474,9363],[4479,9438],[4488,9488],[4500,9510],[4494,9510],[4509,9533],[4515,9573],[4526,9628],[4530,9698],[4540,9718],[4545,9843],[4551,9923],[4560,9932],[4560,9949],[4595,10017],[4595,10044],[4605,10051],[4605,10079],[4635,10136],[4635,10160],[4665,10220],[4665,10245],[4680,10278],[4699,10308],[4700,10338],[4778,10415],[4788,10415],[4868,10495],[4923,10522],[4989,10585],[5003,10585],[5022,10605],[5044,10605],[5051,10615],[5079,10615],[5144,10650],[5177,10650],[5248,10685],[5310,10748],[5345,10817],[5345,10934],[5311,11008],[5248,11069],[5175,11105],[5057,11105],[5008,11081],[4980,11095],[4960,11095],[4900,11125],[4886,11125],[4829,11155],[4813,11156],[4748,11199],[4708,11240],[4691,11240],[4667,11268],[4554,11325],[4540,11325],[4505,11345],[4491,11345],[4479,11360],[4453,11360],[4378,11381],[4278,11430],[4255,11430],[4230,11446],[4215,11440],[4103,11556],[4035,11590],[3913,11590]], convexity=59);
   polygon([[11833,9912],[11823,9905],[11807,9909],[11783,9895],[11751,9895],[11744,9885],[11718,9885],[11647,9850],[11623,9825],[11611,9825],[11583,9803],[11498,9760],[11485,9760],[11450,9740],[11201,9740],[11194,9750],[11080,9750],[11020,9780],[11006,9780],[10949,9810],[10828,9810],[10748,9771],[10695,9717],[10660,9644],[10660,9527],[10699,9448],[10759,9393],[10789,9370],[10804,9370],[10810,9361],[10862,9335],[10885,9335],[10945,9305],[10973,9305],[10983,9296],[11038,9293],[11041,9250],[11075,9189],[11075,9181],[11141,9118],[11159,9111],[11166,9100],[11248,9059],[11353,8965],[11363,8965],[11382,8945],[11393,8945],[11503,8833],[11531,8778],[11560,8747],[11560,8737],[11645,8653],[11645,8643],[11777,8510],[11788,8510],[11835,8462],[11835,8452],[11855,8433],[11855,8422],[11958,8321],[12023,8288],[12063,8290],[12076,8275],[12323,8275],[12343,8290],[12384,8290],[12391,8300],[12469,8300],[12476,8310],[12598,8310],[12713,8366],[12805,8458],[12840,8528],[12836,8743],[12829,8781],[12800,8836],[12800,8864],[12790,8871],[12790,8900],[12755,8966],[12755,8988],[12721,9055],[12711,9068],[12660,9167],[12660,9178],[12580,9339],[12565,9351],[12565,9363],[12535,9392],[12535,9402],[12355,9593],[12355,9603],[12335,9622],[12335,9636],[12233,9740],[12220,9740],[12175,9781],[12175,9796],[12114,9860],[12093,9866],[12076,9881],[11999,9920],[11843,9920]], convexity=50);
   polygon([[6888,8370],[6848,8366],[6798,8350],[6659,8340],[6594,8330],[6576,8320],[6554,8320],[6488,8288],[6474,8291],[6458,8277],[6368,8233],[6330,8203],[6272,8150],[6262,8150],[6243,8130],[6229,8130],[6173,8077],[6118,8050],[6025,7957],[5990,7888],[5990,7856],[5980,7849],[5980,7816],[5970,7809],[5970,7761],[5960,7754],[5960,7681],[5950,7674],[5950,7406],[5980,7349],[5980,7335],[6016,7263],[6112,7165],[6123,7165],[6224,7056],[6245,7032],[6245,6951],[6275,6894],[6275,6809],[6216,6748],[6180,6679],[6180,6662],[6171,6653],[6166,6563],[6159,6520],[6150,6514],[6150,6481],[6140,6474],[6140,6301],[6130,6294],[6130,6068],[6050,5907],[6009,5868],[5950,5748],[5950,5722],[5913,5687],[5858,5659],[5743,5546],[5677,5516],[5658,5495],[5598,5465],[5493,5360],[5418,5323],[5401,5309],[5388,5314],[5313,5276],[5283,5244],[5238,5221],[5213,5195],[5202,5195],[5183,5175],[5172,5175],[5153,5155],[5140,5155],[5093,5112],[5057,5096],[5033,5070],[5022,5070],[5003,5050],[4992,5050],[4968,5024],[4869,4971],[4852,4955],[4843,4955],[4808,4921],[4668,4851],[4623,4805],[4611,4805],[4588,4786],[4499,4740],[4487,4740],[4428,4710],[4405,4710],[4283,4647],[4243,4621],[4196,4573],[4160,4498],[4160,4378],[4195,4308],[4258,4246],[4325,4211],[4358,4208],[4361,4163],[4370,4153],[4370,4127],[4429,4009],[4443,3993],[4471,3935],[4479,3930],[4511,3868],[4540,3835],[4540,3822],[4658,3705],[4673,3705],[4703,3674],[4763,3646],[4808,3599],[4868,3570],[4887,3549],[4933,3529],[4969,3494],[5037,3460],[5152,3460],[5188,3471],[5226,3490],[5267,3490],[5349,3530],[5372,3555],[5384,3555],[5396,3570],[5459,3600],[5472,3616],[5523,3649],[5573,3672],[5634,3728],[5676,3758],[5763,3840],[5774,3840],[5787,3856],[5927,3925],[5948,3925],[6097,4000],[6108,4000],[6266,4079],[6283,4093],[6380,4141],[6385,4149],[6539,4225],[6550,4239],[6618,4270],[6642,4295],[6653,4295],[6672,4315],[6684,4315],[6697,4331],[6758,4361],[6778,4378],[6833,4402],[6868,4435],[6879,4435],[6892,4451],[6949,4480],[6993,4509],[7208,4729],[7240,4769],[7240,4778],[7260,4797],[7260,4808],[7325,4872],[7325,4883],[7345,4902],[7345,4913],[7375,4942],[7375,4954],[7398,4983],[7414,5018],[7445,5047],[7505,5164],[7505,5179],[7535,5236],[7535,5264],[7545,5271],[7545,5289],[7570,5336],[7570,5359],[7600,5416],[7600,5429],[7675,5578],[7675,5604],[7685,5611],[7685,5640],[7715,5700],[7715,5725],[7740,5770],[7733,5770],[7749,5788],[7754,5823],[7763,5863],[7810,5958],[7810,6008],[7879,6146],[7895,6163],[7895,6173],[7948,6225],[8008,6190],[8087,6150],[8109,6150],[8214,6095],[8244,6095],[8251,6085],[8269,6085],[8324,6056],[8368,6051],[8410,6041],[8425,6029],[8450,6034],[8461,6020],[8489,6020],[8496,6010],[8584,6010],[8591,6000],[8664,6000],[8670,5991],[8746,5979],[8803,5949],[8829,5950],[8889,5916],[8961,5904],[9016,5875],[9044,5875],[9051,5865],[9079,5865],[9175,5816],[9190,5804],[9347,5725],[9374,5725],[9380,5716],[9418,5711],[9463,5699],[9493,5694],[9549,5666],[9560,5660],[9578,5660],[9607,5630],[9619,5630],[9632,5614],[9673,5594],[9711,5558],[9730,5521],[9759,5477],[9780,5458],[9780,5447],[9800,5428],[9800,5418],[9819,5398],[9894,5246],[9905,5240],[9950,5145],[9950,5122],[9984,5059],[9979,5040],[10012,4978],[10021,4938],[10026,4900],[10035,4894],[10035,4861],[10045,4854],[10045,4821],[10054,4815],[10059,4778],[10066,4748],[10140,4596],[10140,4586],[10235,4396],[10235,4377],[10244,4368],[10270,4320],[10270,4296],[10280,4289],[10280,4021],[10290,4014],[10290,3937],[10320,3875],[10320,3854],[10357,3783],[10422,3715],[10434,3715],[10446,3701],[10518,3663],[10558,3653],[10952,3650],[10962,3640],[11089,3640],[11096,3630],[11134,3630],[11141,3620],[11190,3620],[11234,3595],[11258,3595],[11397,3525],[11565,3525],[11633,3559],[11652,3581],[11693,3600],[11708,3609],[11743,3624],[11819,3703],[11855,3777],[11855,3954],[11846,3960],[11841,3998],[11832,4038],[11805,4090],[11804,4108],[11782,4145],[11731,4253],[11724,4288],[11719,4325],[11710,4331],[11710,4360],[11694,4385],[11699,4398],[11665,4467],[11665,4494],[11655,4501],[11655,4534],[11646,4540],[11641,4578],[11632,4618],[11600,4677],[11600,4709],[11591,4715],[11586,4753],[11574,4798],[11569,4843],[11560,4852],[11560,4884],[11551,4890],[11546,4928],[11534,4973],[11529,5008],[11515,5024],[11516,5053],[11485,5111],[11485,5129],[11475,5136],[11475,5168],[11445,5227],[11445,5249],[11410,5314],[11410,5344],[11400,5351],[11400,5424],[11391,5430],[11379,5510],[11370,5516],[11370,5564],[11360,5571],[11360,5604],[11350,5611],[11350,5640],[11334,5665],[11339,5679],[11285,5787],[11285,5808],[11255,5870],[11255,5883],[11240,5903],[11240,5938],[11201,6019],[11190,6026],[11190,6053],[11167,6100],[11155,6114],[11157,6143],[11120,6214],[11111,6220],[11070,6305],[11056,6333],[10991,6395],[10980,6395],[10941,6438],[10817,6500],[10797,6500],[10755,6520],[10755,6531],[10721,6583],[10700,6602],[10700,6613],[10680,6632],[10680,6643],[10613,6708],[10555,6736],[10550,6744],[10476,6780],[10464,6795],[10452,6795],[10403,6846],[10348,6882],[10310,6913],[10252,6965],[10242,6965],[10213,6995],[10202,6995],[10183,7015],[10170,7015],[10131,7050],[10122,7050],[10103,7070],[10092,7070],[10048,7116],[10003,7139],[9968,7175],[9957,7175],[9923,7210],[9912,7210],[9833,7290],[9822,7290],[9618,7496],[9505,7551],[9499,7561],[9305,7656],[9299,7665],[9103,7769],[9080,7770],[9018,7800],[8991,7800],[8984,7810],[8941,7810],[8934,7820],[8914,7820],[8849,7855],[8807,7855],[8765,7875],[8726,7875],[8719,7885],[8700,7885],[8638,7915],[8603,7915],[8583,7930],[8570,7930],[8468,7980],[8442,7980],[8423,8000],[8412,8000],[8393,8021],[8343,8053],[8198,8126],[8158,8136],[8124,8141],[8069,8170],[8046,8170],[7978,8205],[7951,8205],[7944,8215],[7915,8215],[7882,8234],[7822,8255],[7796,8255],[7789,8265],[7751,8265],[7744,8275],[7715,8275],[7690,8291],[7677,8286],[7653,8300],[7621,8300],[7614,8310],[7571,8310],[7564,8320],[7505,8320],[7467,8339],[7403,8362],[6928,8374]], convexity=150);
   polygon([[3635,4225],[3598,4205],[3540,4148],[3500,4069],[3500,3961],[3490,3954],[3490,3921],[3461,3866],[3454,3828],[3450,3603],[3460,3593],[3460,3561],[3470,3554],[3470,3524],[3525,3418],[3525,3405],[3584,3288],[3650,3228],[3783,3100],[3794,3100],[3807,3084],[3828,3075],[3890,3028],[3908,3016],[3947,2975],[3963,2975],[3993,2944],[4053,2914],[4068,2901],[4129,2869],[4141,2855],[4153,2855],[4176,2831],[4252,2794],[4374,2794],[4443,2829],[4505,2893],[4550,2982],[4550,3100],[4510,3179],[4501,3185],[4386,3418],[4370,3431],[4370,3443],[4340,3472],[4340,3483],[4315,3507],[4233,3673],[4200,3710],[4200,3723],[4180,3742],[4180,3754],[4166,3765],[4115,3865],[4115,3886],[4084,3953],[4018,4020],[4007,4020],[3978,4051],[3955,4060],[3955,4077],[3920,4148],[3858,4209],[3789,4245],[3673,4245]], convexity=28);
   polygon([[10389,3060],[10355,3042],[10294,2983],[10259,2914],[10260,2788],[10295,2718],[10348,2664],[10425,2625],[10438,2625],[10544,2570],[10590,2570],[10625,2550],[10654,2550],[10661,2540],[11154,2540],[11161,2530],[11385,2530],[11453,2564],[11514,2628],[11550,2696],[11550,2813],[11518,2873],[11516,2887],[11459,2944],[11378,2985],[11248,2990],[10768,2998],[10715,3025],[10659,3025],[10568,3069],[10540,3080],[10423,3079]], convexity=15);
   polygon([[17458,775],[17454,770],[17419,770],[17353,749],[17335,740],[17316,740],[17309,730],[17287,730],[17218,694],[17200,678],[17181,668],[17113,621],[16993,496],[16970,466],[16970,457],[16950,438],[16950,428],[16931,408],[16896,338],[16884,293],[16875,275],[16875,260],[16866,243],[16855,207],[16855,171],[16845,164],[16845,0],[17640,0],[17640,780],[17461,780]], convexity=20);
   polygon([[0,380],[0,0],[760,0],[760,144],[750,151],[750,194],[740,201],[740,224],[730,231],[730,253],[715,272],[715,294],[705,301],[705,317],[670,389],[655,401],[655,413],[635,432],[635,444],[610,474],[610,483],[482,610],[474,610],[444,635],[432,635],[413,655],[401,655],[389,670],[317,705],[301,705],[294,715],[272,715],[253,730],[231,730],[224,740],[201,740],[194,750],[151,750],[144,760],[0,760]], convexity=21);
  }
 }
}

module TenBuck2Yellow()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) TenBuck2Yellow_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}