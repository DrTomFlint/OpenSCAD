module mcGreen4_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 631/3494 original points
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
 linear_extrude(height=1, convexity=631)
 union() {
  union() {
   polygon([[0,19333],[0,18666],[218,18620],[346,18615],[568,18654],[793,18751],[1000,18918],[1172,19145],[1269,19368],[1327,19707],[1290,20000],[0,20000]], convexity=5);
   polygon([[19008,19969],[18999,19938],[18965,19720],[19002,19478],[19102,19263],[19243,19101],[19448,18971],[19623,18920],[19788,18905],[20000,18940],[20000,20000],[19017,20000]], convexity=6);
   union() {
    difference() {
     polygon([[11033,9932],[11008,9925],[10943,9898],[10790,9810],[10548,9603],[10315,9605],[10118,9684],[9930,9818],[9861,9835],[9762,9791],[9683,9735],[9510,9598],[9384,9521],[9318,9439],[9163,9346],[8999,9195],[8897,9136],[8782,9010],[8720,8911],[8344,8542],[8186,8458],[8033,8420],[7830,8374],[7663,8436],[7567,8432],[7453,8364],[7203,8107],[7163,8033],[6945,7830],[6833,7728],[6807,7693],[6744,7669],[6533,7482],[6323,7360],[6093,7262],[5913,7225],[5708,7216],[5563,7168],[4868,7157],[4665,7108],[4540,7072],[4421,7030],[4330,6967],[4063,6872],[3863,6785],[3468,6590],[3128,6500],[3042,6484],[2783,6422],[2713,6395],[2398,6254],[2303,6223],[1993,6214],[1849,6158],[1746,6083],[1705,6030],[1658,5888],[1669,5723],[1732,5558],[1788,5438],[2235,4738],[2710,4120],[3179,3598],[3828,2992],[4503,2470],[5195,2026],[5874,1667],[6531,1384],[7095,1185],[7805,990],[8516,855],[9163,778],[9956,738],[10845,785],[11467,865],[12150,1000],[12875,1203],[13533,1441],[14348,1819],[15063,2235],[15738,2708],[16305,3183],[16868,3738],[17358,4305],[17798,4910],[18184,5534],[18328,5819],[18346,5899],[18345,6126],[18305,6226],[18254,6298],[18202,6340],[18115,6380],[18070,6401],[17911,6400],[17765,6369],[17413,6414],[17118,6506],[16910,6599],[16639,6825],[16238,7052],[16044,7183],[15819,7365],[15715,7443],[15577,7565],[15441,7648],[15198,7745],[14994,7785],[14821,7830],[14562,7900],[14463,7981],[14109,8197],[13973,8373],[13813,8511],[13566,8685],[13403,8784],[13288,8916],[13080,9020],[12853,9014],[12612,8970],[12245,9009],[11997,9167],[11860,9318],[11633,9468],[11364,9722],[11309,9786],[11234,9875],[11182,9897],[11139,9920],[11058,9939]], convexity=14);
     polygon([[14409,6350],[14411,6338],[14452,6305],[14586,6190],[14645,6144],[14645,6103],[14568,6014],[14490,5936],[14355,5782],[14255,5662],[14194,5603],[14176,5585],[14100,5488],[14080,5453],[14177,5365],[14319,5245],[14353,5210],[14385,5195],[14435,5267],[14490,5313],[14570,5410],[14645,5475],[14657,5525],[14676,5525],[14745,5602],[14860,5738],[14883,5760],[14898,5774],[14937,5815],[15018,5755],[15057,5714],[15089,5679],[15128,5677],[15131,5651],[15193,5600],[15225,5566],[15143,5465],[15075,5387],[14960,5252],[14921,5213],[14900,5193],[14820,5093],[14783,5055],[14745,5027],[14738,4982],[14669,4931],[14724,4894],[14739,4879],[14799,4820],[14939,4700],[15033,4630],[15135,4743],[15230,4857],[15273,4900],[15288,4914],[15370,5018],[15406,5055],[15445,5081],[15457,5135],[15478,5135],[15526,5195],[15540,5209],[15585,5252],[15642,5310],[15783,5190],[15915,5058],[15868,4981],[15840,4975],[15834,4946],[15760,4863],[15717,4820],[15681,4793],[15678,4748],[15630,4722],[15583,4665],[15566,4650],[15445,4507],[15350,4392],[15312,4355],[15290,4333],[15209,4230],[15135,4158],[15000,4001],[14970,3969],[14883,4030],[14840,4065],[14764,4140],[14587,4279],[14511,4355],[14371,4475],[14237,4590],[14179,4648],[14104,4698],[14070,4745],[14028,4770],[14018,4803],[13946,4840],[13888,4900],[13747,5020],[13612,5135],[13553,5196],[13419,5300],[13475,5368],[13590,5503],[13615,5526],[13629,5540],[13695,5606],[13708,5608],[13724,5666],[13785,5717],[13864,5818],[13881,5834],[13925,5879],[14040,6013],[14081,6052],[14099,6070],[14175,6167],[14218,6210],[14255,6237],[14261,6285],[14284,6285],[14335,6349],[14342,6365],[14408,6363]], convexity=15);
     polygon([[6179,5994],[6189,5983],[6205,5956],[6308,5875],[6346,5835],[6418,5798],[6450,5742],[6535,5677],[6572,5630],[6500,5575],[6372,5409],[6318,5344],[6266,5295],[6185,5191],[6144,5153],[6125,5134],[6105,5081],[6053,5050],[5910,4870],[5870,4821],[5815,4766],[5773,4693],[5730,4670],[5640,4550],[5580,4494],[5488,4380],[5513,4375],[5603,4295],[5642,4254],[5660,4236],[5718,4213],[5744,4164],[5877,4060],[5994,3962],[6036,3921],[6050,3906],[6173,3805],[6190,3775],[6154,3730],[6110,3698],[6104,3650],[6083,3650],[6030,3589],[5934,3495],[5839,3570],[5800,3606],[5768,3650],[5720,3662],[5668,3730],[5647,3730],[5485,3885],[5455,3905],[5406,3936],[5397,3965],[5323,4020],[5272,4060],[5249,4085],[5235,4099],[5118,4195],[4997,4295],[4940,4353],[4911,4371],[4876,4386],[4845,4445],[4865,4486],[4891,4525],[4941,4559],[4951,4605],[4994,4632],[5137,4801],[5255,4938],[5314,4997],[5358,5069],[5409,5109],[5413,5147],[5476,5188],[5549,5283],[5605,5348],[5725,5488],[5798,5553],[5814,5606],[5880,5654],[5891,5703],[5955,5750],[5960,5795],[5983,5795],[6155,5996],[6168,6005]], convexity=10);
     polygon([[12711,5053],[12716,5033],[12699,4858],[12684,4394],[12683,4109],[12681,3991],[12679,3923],[12674,3875],[12662,3730],[12665,3603],[12648,3575],[12647,3445],[12635,3220],[12622,3127],[12613,3114],[12641,3092],[12642,3060],[12640,3002],[12634,2896],[12607,2870],[12519,2860],[12403,2820],[12353,2790],[12263,2780],[12213,2750],[12143,2740],[12039,2695],[11995,2715],[11983,2750],[11970,2786],[11931,2812],[11875,2891],[11833,2945],[11740,3060],[11708,3101],[11660,3130],[11651,3176],[11580,3242],[11525,3322],[11478,3405],[11428,3443],[11402,3489],[11370,3495],[11317,3572],[11189,3749],[11131,3806],[11110,3833],[11110,3859],[11038,3921],[11035,3955],[10942,4053],[10913,4099],[10838,4199],[10800,4253],[10660,4407],[10672,4430],[10758,4440],[10807,4470],[10876,4480],[10929,4510],[11013,4520],[11082,4550],[11175,4572],[11196,4519],[11240,4491],[11273,4423],[11299,4425],[11334,4366],[11392,4332],[11438,4250],[11460,4237],[11485,4199],[11502,4168],[11520,4138],[11575,4086],[11616,4009],[11653,3984],[11681,3914],[11715,3909],[11772,3810],[11815,3755],[11824,3731],[11858,3706],[11913,3631],[11949,3580],[12028,3490],[12045,3474],[12094,3393],[12140,3339],[12156,3511],[12158,3548],[12158,3610],[12160,3668],[12174,3887],[12174,3945],[12176,3983],[12191,4253],[12200,4343],[12179,4374],[12180,4413],[12195,4600],[12198,4623],[12197,4723],[12198,4760],[12198,4785],[12209,4912],[12263,4930],[12312,4960],[12383,4970],[12432,5000],[12514,5007],[12582,5035],[12623,5055],[12642,5075],[12707,5073]], convexity=21);
     polygon([[8632,4612],[8642,4605],[8672,4608],[8926,4557],[9052,4490],[9120,4478],[9243,4430],[9315,4370],[9365,4332],[9392,4310],[9492,4213],[9585,4108],[9597,4053],[9625,4009],[9674,3894],[9686,3821],[9712,3670],[9713,3649],[9715,3532],[9665,3291],[9655,3239],[9605,3133],[9585,3062],[9575,3025],[9510,2930],[9480,2868],[9430,2808],[9408,2759],[9371,2736],[9316,2675],[9231,2615],[9146,2555],[9010,2497],[8913,2473],[8763,2447],[8751,2448],[8633,2450],[8545,2464],[8483,2478],[8339,2509],[8292,2515],[8253,2555],[8162,2565],[8038,2635],[8004,2652],[7926,2709],[7888,2738],[7832,2790],[7737,2879],[7720,2933],[7656,3015],[7636,3080],[7638,3095],[7602,3122],[7574,3240],[7564,3395],[7563,3534],[7568,3570],[7588,3745],[7635,3859],[7665,3963],[7755,4146],[7832,4258],[7880,4306],[7899,4347],[7948,4374],[7993,4429],[8048,4451],[8105,4490],[8168,4525],[8206,4551],[8223,4563],[8378,4593],[8414,4597],[8534,4612],[8623,4619]], convexity=10);
    }
    polygon([[8623,4197],[8573,4191],[8478,4135],[8393,4088],[8344,4027],[8317,3990],[8303,3967],[8276,3949],[8269,3903],[8215,3853],[8191,3759],[8145,3671],[8112,3510],[8108,3470],[8095,3414],[8090,3363],[8094,3297],[8111,3208],[8130,3116],[8163,3068],[8218,3000],[8262,2960],[8403,2876],[8650,2865],[8720,2870],[8751,2900],[8858,2968],[8904,3022],[8960,3085],[8985,3122],[9039,3191],[9046,3247],[9118,3347],[9128,3464],[9160,3504],[9167,3555],[9176,3625],[9181,3660],[9186,3686],[9170,3833],[9133,3931],[9088,4029],[9039,4055],[9028,4084],[8913,4148],[8860,4189],[8673,4204]], convexity=6);
   }
   polygon([[55,1123],[13,1116],[0,1115],[0,0],[993,0],[1035,168],[1050,328],[1016,503],[918,718],[738,915],[558,1029],[308,1110],[98,1130]], convexity=6);
   polygon([[19638,1084],[19613,1080],[19440,1044],[19268,969],[19171,906],[19014,738],[18899,500],[18863,291],[18914,37],[18920,0],[20000,0],[20000,1034],[19790,1082],[19663,1089]], convexity=6);
  }
 }
}

module mcGreen4()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) mcGreen4_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
mcGreen4();