module HighLonesomeWater_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 955/5700 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=2390) /* polygon minx=2390 */
 assign(miny=2715) /* polygon miny=2715 */
 assign(maxx=17070) /* polygon maxx=17070 */
 assign(maxy=17190) /* polygon maxy=17190 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=955)
 union() {
  union() {
   polygon([[2392,17184],[2390,17178],[2393,16508],[2557,16521],[2745,16603],[2901,16769],[2975,16948],[2979,17178],[2969,17190],[2395,17190]], convexity=6);
   polygon([[16455,17183],[16449,17175],[16475,16970],[16560,16795],[16731,16640],[16914,16569],[17068,16568],[17068,17188],[16461,17190]], convexity=6);
   polygon([[4923,6485],[4913,6481],[4837,6450],[4630,6325],[4519,6307],[4434,6340],[4250,6467],[4188,6480],[4147,6480],[4119,6450],[4119,6404],[4165,6370],[4236,6332],[4331,6267],[4433,6198],[4638,6198],[4805,6288],[4948,6370],[5102,6374],[5230,6290],[5393,6198],[5638,6194],[5722,6238],[5838,6307],[6006,6316],[6072,6298],[6286,6180],[6507,6180],[6558,6216],[6675,6272],[6835,6360],[6941,6360],[7048,6291],[7121,6276],[7280,6215],[7377,6218],[7410,6298],[7381,6326],[7265,6355],[7163,6384],[7043,6426],[6988,6465],[6753,6459],[6613,6375],[6513,6327],[6449,6290],[6335,6298],[6218,6356],[6097,6420],[6007,6436],[5788,6413],[5709,6373],[5601,6304],[5432,6318],[5223,6428],[5145,6490],[4933,6489]], convexity=19);
   polygon([[14152,6482],[14136,6475],[14061,6415],[13869,6308],[13714,6304],[13565,6397],[13488,6425],[13248,6430],[13149,6383],[13096,6356],[12969,6290],[12860,6298],[12719,6357],[12637,6415],[12533,6465],[12303,6456],[12221,6401],[12148,6385],[12054,6358],[11956,6326],[11916,6308],[11898,6290],[11945,6214],[12043,6218],[12172,6267],[12243,6287],[12351,6343],[12375,6361],[12518,6349],[12702,6240],[12789,6198],[12808,6180],[13035,6187],[13279,6310],[13322,6318],[13478,6307],[13593,6238],[13678,6194],[13918,6198],[14080,6287],[14225,6380],[14384,6370],[14591,6238],[14678,6198],[14878,6198],[15045,6310],[15150,6370],[15195,6403],[15195,6448],[15162,6480],[15080,6472],[15034,6447],[14818,6308],[14706,6316],[14553,6400],[14413,6482],[14168,6489]], convexity=18);
   polygon([[4928,6250],[4924,6245],[4885,6245],[4636,6093],[4548,6065],[4475,6082],[4244,6232],[4225,6235],[4351,6035],[4428,5966],[4626,5959],[4750,6015],[4935,6137],[5103,6141],[5231,6052],[5423,5960],[5660,5966],[5838,6072],[5991,6083],[6069,6063],[6195,5998],[6286,5945],[6508,5945],[6555,5980],[6644,6010],[6765,6090],[6807,6118],[6953,6115],[7065,6053],[7122,6041],[7315,5979],[7328,6092],[7209,6138],[7043,6192],[6980,6231],[6757,6228],[6670,6179],[6574,6117],[6449,6055],[6335,6062],[6218,6120],[6088,6187],[5961,6200],[5933,6185],[5804,6181],[5714,6138],[5594,6065],[5436,6075],[5329,6138],[5232,6184],[5155,6249],[4931,6255]], convexity=19);
   polygon([[14157,6249],[14141,6244],[14069,6182],[13878,6079],[13724,6064],[13600,6139],[13556,6163],[13488,6186],[13368,6192],[13250,6192],[13172,6162],[13095,6120],[12974,6055],[12855,6064],[12740,6117],[12595,6200],[12558,6228],[12316,6231],[12221,6165],[12059,6125],[11983,6085],[11998,5983],[12098,6006],[12151,6028],[12308,6076],[12373,6120],[12509,6118],[12688,6010],[12790,5963],[12807,5945],[13034,5952],[13280,6075],[13322,6083],[13478,6071],[13596,6000],[13688,5960],[13935,5973],[14078,6052],[14212,6141],[14384,6129],[14513,6050],[14596,6000],[14697,5959],[14888,5966],[14994,6068],[15085,6235],[15029,6207],[14830,6074],[14799,6072],[14735,6072],[14618,6125],[14430,6245],[14173,6254]], convexity=17);
   polygon([[4920,6019],[4908,6015],[4844,5989],[4638,5865],[4583,5844],[4506,5843],[4595,5729],[4678,5755],[4755,5790],[4938,5905],[5102,5909],[5234,5822],[5333,5773],[5397,5736],[5637,5730],[5775,5808],[5861,5851],[5986,5854],[6009,5853],[6075,5828],[6286,5715],[6508,5715],[6556,5750],[6672,5805],[6807,5888],[6946,5891],[7048,5826],[7120,5812],[7245,5765],[7260,5769],[7282,5878],[7226,5908],[7080,5945],[6999,6001],[6758,5997],[6629,5921],[6575,5888],[6449,5825],[6335,5833],[6219,5890],[6098,5957],[6065,5963],[5945,5963],[5775,5942],[5722,5915],[5609,5843],[5426,5855],[5232,5954],[5155,6019],[4933,6024]], convexity=16);
   polygon([[14160,6020],[14153,6016],[14070,5953],[13853,5844],[13714,5839],[13553,5935],[13498,5956],[13370,5963],[13250,5962],[13158,5924],[13093,5890],[12974,5825],[12865,5825],[12740,5888],[12559,5998],[12316,6001],[12221,5935],[12056,5895],[12025,5873],[12059,5759],[12171,5802],[12315,5853],[12369,5891],[12522,5878],[12646,5803],[12746,5750],[12790,5733],[12807,5715],[13035,5722],[13287,5849],[13322,5855],[13479,5840],[13679,5730],[13928,5734],[14022,5795],[14168,5871],[14224,5915],[14384,5905],[14588,5775],[14720,5729],[14809,5843],[14705,5853],[14529,5953],[14428,6018],[14168,6025]], convexity=16);
   polygon([[4918,5784],[4913,5780],[4869,5770],[4682,5652],[4769,5566],[4897,5652],[4963,5676],[5091,5675],[5277,5560],[5430,5490],[5650,5500],[5712,5538],[5825,5607],[5983,5618],[6000,5618],[6189,5533],[6281,5480],[6501,5480],[6554,5515],[6661,5568],[6795,5652],[6933,5656],[7054,5587],[7195,5551],[7234,5540],[7235,5666],[7160,5682],[7070,5710],[6990,5765],[6767,5760],[6655,5714],[6576,5653],[6433,5585],[6333,5595],[6210,5655],[6083,5720],[6002,5735],[5774,5709],[5698,5667],[5593,5604],[5438,5608],[5321,5673],[5221,5720],[5151,5782],[4924,5788]], convexity=16);
   polygon([[14162,5782],[14148,5776],[14079,5717],[13878,5608],[13706,5614],[13617,5667],[13529,5717],[13369,5729],[13255,5728],[13125,5662],[12973,5585],[12864,5596],[12707,5671],[12643,5715],[12560,5757],[12325,5765],[12233,5700],[12078,5667],[12083,5540],[12288,5599],[12367,5653],[12522,5650],[12705,5540],[12797,5495],[12814,5479],[13050,5490],[13292,5610],[13332,5618],[13499,5598],[13703,5489],[13938,5504],[14075,5580],[14195,5652],[14243,5681],[14403,5658],[14515,5586],[14554,5565],[14633,5653],[14457,5765],[14393,5784],[14176,5788]], convexity=16);
   polygon([[4913,5553],[4888,5549],[4815,5507],[4888,5420],[4971,5450],[5101,5444],[5223,5360],[5347,5298],[5391,5268],[5638,5264],[5722,5308],[5838,5377],[6006,5386],[6073,5365],[6285,5250],[6507,5250],[6557,5285],[6673,5340],[6813,5421],[6950,5420],[7065,5358],[7205,5320],[7228,5310],[7231,5435],[7163,5454],[7050,5490],[6988,5535],[6753,5529],[6628,5455],[6583,5425],[6449,5360],[6335,5368],[6218,5426],[6096,5489],[6008,5506],[5776,5479],[5713,5445],[5601,5374],[5432,5388],[5330,5443],[5231,5490],[5157,5553],[4938,5558]], convexity=16);
   polygon([[14158,5553],[14140,5549],[14062,5485],[13985,5443],[13869,5378],[13700,5384],[13565,5467],[13530,5487],[13364,5499],[13251,5499],[13165,5463],[13097,5426],[12969,5360],[12860,5368],[12732,5425],[12634,5485],[12533,5535],[12315,5535],[12222,5471],[12152,5454],[12084,5435],[12095,5309],[12226,5354],[12332,5397],[12378,5428],[12530,5408],[12642,5341],[12758,5285],[12808,5250],[13034,5257],[13213,5350],[13285,5380],[13333,5381],[13478,5377],[13593,5308],[13678,5264],[13938,5278],[14022,5330],[14182,5421],[14223,5450],[14382,5440],[14429,5419],[14498,5508],[14408,5552],[14176,5558]], convexity=16);
   polygon([[4988,5319],[4983,5315],[5097,5209],[5284,5095],[5423,5030],[5660,5036],[5836,5142],[6006,5151],[6074,5128],[6296,5010],[6503,5010],[6556,5049],[6673,5105],[6803,5180],[6951,5184],[7064,5123],[7209,5082],[7237,5070],[7222,5205],[7043,5262],[6980,5301],[6757,5298],[6673,5247],[6575,5187],[6454,5125],[6347,5125],[6220,5190],[6088,5255],[6012,5270],[5807,5250],[5742,5233],[5629,5157],[5593,5135],[5436,5145],[5327,5208],[5199,5287],[5158,5317],[4994,5323]], convexity=13);
   polygon([[14158,5317],[14139,5312],[14061,5245],[13860,5143],[13724,5134],[13600,5209],[13555,5233],[13504,5255],[13365,5263],[13250,5263],[13148,5215],[13095,5190],[12974,5125],[12855,5133],[12717,5190],[12643,5247],[12559,5298],[12310,5295],[12218,5236],[12086,5198],[12081,5070],[12153,5098],[12313,5146],[12376,5190],[12524,5180],[12642,5105],[12759,5049],[12812,5010],[13032,5019],[13283,5145],[13333,5146],[13490,5133],[13596,5070],[13688,5030],[13935,5042],[14067,5115],[14226,5210],[14326,5316],[14176,5323]], convexity=13);
   polygon([[6781,5072],[6765,5067],[6632,4990],[6521,4937],[6461,4900],[6347,4911],[6235,4966],[6114,5035],[6075,5043],[5968,5044],[5791,5018],[5730,4987],[5609,4915],[5468,4924],[5375,4973],[5330,4984],[5532,4805],[5678,4818],[5863,4921],[6005,4933],[6095,4903],[6305,4790],[6523,4790],[6574,4829],[6682,4880],[6823,4960],[6954,4970],[7063,4901],[7220,4863],[7275,4843],[7226,4985],[7061,5038],[7013,5075],[6798,5078]], convexity=12);
   polygon([[12291,5069],[12278,5061],[12203,5011],[12075,4974],[12045,4838],[12155,4880],[12267,4913],[12361,4970],[12503,4960],[12728,4829],[12754,4829],[12792,4790],[13018,4796],[13204,4895],[13272,4925],[13310,4933],[13463,4917],[13673,4805],[13782,4805],[13982,4986],[13928,4962],[13848,4925],[13694,4921],[13510,5029],[13348,5043],[13235,5043],[13149,5005],[13079,4966],[12952,4900],[12845,4907],[12712,4966],[12624,5027],[12513,5075],[12304,5078]], convexity=14);
   polygon([[6778,4854],[6773,4850],[6633,4783],[6573,4743],[6449,4680],[6335,4688],[6218,4746],[6097,4810],[6007,4826],[5775,4797],[5709,4762],[5641,4719],[5738,4640],[5838,4697],[6006,4706],[6072,4688],[6284,4570],[6506,4569],[6557,4605],[6675,4662],[6835,4750],[6941,4750],[7048,4681],[7120,4667],[7307,4605],[7340,4614],[7288,4730],[7225,4762],[7163,4774],[7043,4816],[6993,4855],[6784,4858]], convexity=12);
   polygon([[12311,4849],[12298,4841],[12221,4791],[12148,4775],[12053,4747],[12010,4701],[11980,4608],[12043,4608],[12172,4657],[12243,4677],[12351,4733],[12375,4751],[12518,4739],[12702,4630],[12789,4588],[12808,4570],[13035,4577],[13279,4700],[13322,4708],[13478,4697],[13585,4646],[13674,4723],[13565,4787],[13488,4815],[13248,4820],[13149,4773],[13096,4746],[12969,4680],[12860,4688],[12719,4747],[12637,4805],[12533,4855],[12324,4858]], convexity=11);
   polygon([[6817,4610],[6814,4604],[6779,4597],[6664,4530],[6623,4503],[6495,4445],[6375,4443],[6255,4503],[6121,4568],[6048,4585],[5909,4570],[5845,4560],[5996,4458],[6046,4463],[6193,4400],[6324,4325],[6542,4325],[6597,4362],[6715,4422],[6842,4495],[6983,4503],[7097,4439],[7268,4385],[7317,4360],[7422,4370],[7422,4393],[7385,4474],[7291,4507],[7116,4556],[7034,4615],[6821,4615]], convexity=12);
   polygon([[12256,4593],[12231,4570],[12051,4518],[11928,4472],[11885,4376],[11901,4360],[11995,4360],[12099,4410],[12249,4451],[12332,4503],[12483,4494],[12600,4422],[12718,4362],[12773,4325],[12995,4335],[13249,4459],[13287,4466],[13339,4464],[13467,4566],[13325,4577],[13210,4575],[13133,4543],[13060,4504],[12934,4435],[12820,4445],[12692,4503],[12606,4560],[12510,4607],[12281,4615]], convexity=12);
   polygon([[6858,4395],[6854,4390],[6722,4335],[6665,4286],[6544,4233],[6476,4220],[6418,4230],[6231,4326],[6168,4355],[6130,4367],[6542,4110],[6584,4110],[6641,4148],[6753,4199],[6845,4257],[6918,4290],[7042,4278],[7133,4221],[7318,4168],[7358,4149],[7493,4140],[7530,4175],[7491,4248],[7343,4286],[7288,4307],[7127,4355],[7070,4400],[6861,4400]], convexity=9);
   polygon([[12228,4391],[12213,4382],[12124,4335],[11983,4295],[11883,4259],[11816,4238],[11784,4173],[11820,4140],[11986,4163],[12085,4200],[12193,4230],[12295,4290],[12433,4279],[12617,4173],[12674,4148],[12752,4110],[12995,4240],[13183,4368],[13090,4330],[13013,4287],[12884,4220],[12794,4220],[12660,4284],[12563,4347],[12454,4400],[12243,4400]], convexity=9);
   polygon([[6898,4160],[6894,4155],[6846,4148],[6798,4135],[6704,4050],[6665,4042],[6799,3974],[6908,4044],[6957,4040],[7044,4009],[7154,3956],[7295,3920],[7513,3929],[7595,3956],[7630,3972],[7647,3990],[7580,4075],[7508,4056],[7464,4030],[7326,4037],[7221,4060],[7087,4116],[7010,4150],[6993,4165],[6901,4165]], convexity=10);
   polygon([[12305,4150],[12288,4135],[12253,4125],[12082,4050],[11984,4037],[11845,4038],[11772,4066],[11726,4075],[11670,3987],[11704,3954],[11757,3946],[11814,3920],[12029,3926],[12201,3970],[12271,4009],[12358,4040],[12408,4044],[12515,3975],[12651,4050],[12600,4059],[12495,4138],[12414,4165],[12323,4165]], convexity=10);
   polygon([[7645,3892],[7623,3876],[7544,3845],[7498,3828],[7323,3824],[7287,3790],[7290,3743],[7322,3710],[7543,3721],[7635,3752],[7724,3807],[7750,3850],[7704,3910],[7668,3909]], convexity=7);
   polygon([[11588,3880],[11565,3850],[11591,3807],[11653,3765],[11721,3736],[11801,3710],[11993,3710],[12026,3744],[12026,3791],[11994,3824],[11804,3836],[11693,3876],[11628,3910],[11611,3910]], convexity=6);
   polygon([[7738,3746],[7723,3735],[7651,3720],[7605,3679],[7605,3620],[7633,3589],[7691,3598],[7760,3625],[7800,3636],[7845,3643],[7905,3648],[7915,3668],[7826,3756],[7754,3758]], convexity=6);
   polygon([[11489,3755],[11483,3753],[11400,3657],[11442,3639],[11502,3648],[11529,3625],[11597,3616],[11635,3588],[11682,3589],[11710,3620],[11710,3679],[11633,3728],[11577,3745],[11495,3758]], convexity=8);
   polygon([[2391,3056],[2393,2718],[2979,2725],[2975,2958],[2891,3144],[2764,3275],[2618,3359],[2432,3395],[2390,3395]], convexity=5);
   polygon([[16930,3390],[16923,3385],[16778,3355],[16643,3278],[16505,3124],[16439,2963],[16425,2778],[16437,2721],[17068,2718],[17063,3386],[16938,3395]], convexity=5);
  }
 }
}

module HighLonesomeWater()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) HighLonesomeWater_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
HighLonesomeWater();