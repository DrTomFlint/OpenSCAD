module TenBuck1Yellow_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 523/1054 original points
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
 linear_extrude(height=1, convexity=523)
 union() {
  union() {
   polygon([[0,19608],[0,19215],[184,19215],[191,19225],[227,19225],[263,19236],[280,19245],[295,19245],[313,19254],[358,19266],[428,19301],[448,19320],[458,19320],[477,19340],[486,19340],[516,19363],[651,19493],[663,19514],[728,19613],[749,19658],[771,19733],[780,19750],[780,19769],[790,19776],[790,19824],[800,19831],[800,20000],[0,20000]], convexity=5);
   polygon([[16847,19894],[16849,19788],[16859,19733],[16876,19678],[16885,19660],[16885,19641],[16895,19634],[16895,19616],[16943,19530],[16970,19493],[16970,19482],[16990,19463],[16990,19452],[17123,19320],[17133,19320],[17152,19300],[17163,19300],[17218,19261],[17288,19225],[17304,19225],[17311,19215],[17330,19215],[17348,19206],[17405,19189],[17411,19180],[17454,19180],[17461,19170],[17640,19170],[17640,20000],[16845,20000]], convexity=15);
   polygon([[12220,17432],[12198,17420],[12156,17378],[12130,17330],[12130,17312],[12085,17268],[12059,17215],[12059,17140],[12089,17078],[12118,17051],[12178,17020],[12238,17021],[12250,17020],[12274,16968],[12313,16931],[12367,16905],[12438,16905],[12487,16929],[12530,16972],[12555,17022],[12555,17174],[12574,17198],[12596,17241],[12596,17324],[12571,17373],[12533,17409],[12460,17445],[12243,17444]], convexity=11);
   polygon([[9210,15515],[9203,15510],[9165,15510],[9118,15484],[9078,15447],[9046,15434],[9028,15415],[9016,15415],[9004,15400],[8987,15400],[8890,15302],[8890,15290],[8851,15248],[8818,15183],[8820,15146],[8805,15134],[8805,14806],[8820,14793],[8818,14752],[8850,14693],[8850,14670],[8870,14630],[8870,14615],[8890,14580],[8890,14566],[8925,14501],[8925,14488],[8955,14428],[8955,14417],[8980,14368],[9034,14313],[9051,14278],[9102,14225],[9112,14225],[9209,14133],[9238,14112],[9288,14088],[9308,14072],[9357,14045],[9393,14047],[9414,14035],[9493,14035],[9503,14025],[9978,14028],[10028,14038],[10100,14076],[10105,14085],[10151,14105],[10186,14133],[10276,14218],[10295,14259],[10305,14265],[10325,14312],[10339,14328],[10365,14375],[10365,14394],[10375,14401],[10375,14418],[10405,14478],[10405,14563],[10416,14574],[10405,14768],[10396,14788],[10384,14878],[10375,14887],[10375,14944],[10365,14951],[10365,14994],[10355,15001],[10355,15023],[10340,15042],[10340,15084],[10330,15091],[10330,15108],[10296,15175],[10285,15189],[10254,15253],[10218,15291],[10145,15326],[10140,15334],[10088,15360],[10071,15360],[10064,15370],[10041,15370],[10034,15380],[9998,15380],[9953,15396],[9926,15421],[9878,15445],[9855,15445],[9815,15465],[9776,15465],[9769,15475],[9721,15475],[9714,15485],[9695,15485],[9671,15500],[9618,15520],[9218,15520]], convexity=34);
   polygon([[8736,13965],[8699,13946],[8642,13890],[8621,13845],[8616,13833],[8609,13788],[8605,13523],[8615,13513],[8615,13491],[8625,13484],[8625,13443],[8640,13423],[8640,13407],[8685,13318],[8848,13154],[8905,13125],[8988,13125],[9036,13149],[9075,13187],[9105,13245],[9105,13340],[9069,13402],[9030,13464],[9030,13503],[9019,13514],[9024,13623],[9031,13662],[9050,13695],[9050,13775],[9026,13823],[8986,13861],[8963,13873],[8941,13916],[8898,13960],[8848,13985],[8773,13984]], convexity=11);
   polygon([[6468,8875],[6464,8870],[6380,8870],[6345,8850],[6281,8850],[6274,8840],[6241,8840],[6234,8830],[6212,8830],[6189,8813],[6156,8831],[6125,8827],[6114,8840],[5824,8840],[5803,8828],[5769,8830],[5753,8816],[5663,8811],[5613,8804],[5603,8795],[5506,8795],[5499,8785],[5480,8785],[5420,8755],[5401,8755],[5394,8765],[5371,8765],[5364,8775],[5231,8775],[5224,8765],[5206,8765],[5138,8729],[5070,8663],[5070,8651],[5056,8640],[5020,8569],[5005,8528],[5005,8387],[4995,8377],[4999,7973],[5006,7930],[5015,7924],[5015,7905],[5040,7861],[5038,7825],[5050,7813],[5050,7797],[5084,7729],[5098,7713],[5181,7545],[5190,7540],[5207,7503],[5270,7424],[5270,7412],[5300,7383],[5300,7373],[5427,7235],[5508,7195],[5524,7195],[5531,7185],[5618,7185],[5738,7065],[5787,7040],[5868,7040],[5916,7064],[5951,7098],[5980,7155],[5980,7246],[5955,7320],[5920,7386],[5895,7425],[5895,7479],[5885,7486],[5885,7593],[5876,7603],[5871,7648],[5862,7698],[5854,7710],[5855,7882],[5865,7892],[5865,7934],[5875,7941],[5875,7985],[5895,8020],[5895,8036],[5911,8063],[5958,8085],[5970,8085],[6016,8111],[6029,8106],[6056,8120],[6068,8120],[6136,8154],[6163,8178],[6185,8190],[6199,8190],[6277,8230],[6333,8284],[6385,8310],[6402,8310],[6438,8321],[6503,8352],[6575,8422],[6575,8433],[6600,8445],[6613,8445],[6645,8461],[6651,8470],[6703,8468],[6745,8490],[7108,8485],[7288,8477],[7325,8465],[7331,8455],[7409,8455],[7416,8445],[7438,8445],[7470,8425],[7514,8425],[7521,8415],[7564,8415],[7571,8405],[7594,8405],[7600,8396],[7638,8391],[7681,8381],[7692,8370],[7709,8370],[7748,8351],[7793,8338],[7850,8310],[7924,8310],[7931,8300],[7950,8300],[7986,8280],[8028,8265],[8064,8265],[8071,8255],[8123,8255],[8133,8246],[8193,8225],[8304,8225],[8311,8215],[8328,8215],[8360,8199],[8365,8190],[8468,8140],[8484,8140],[8496,8126],[8577,8085],[8590,8085],[8625,8065],[8639,8065],[8696,8035],[8714,8035],[8744,8010],[8753,8010],[8797,7965],[8847,7940],[8928,7940],[8976,7964],[9011,7998],[9040,8055],[9040,8138],[9014,8193],[8953,8255],[8942,8255],[8918,8281],[8858,8310],[8848,8310],[8706,8380],[8700,8390],[8663,8407],[8646,8421],[8578,8455],[8563,8455],[8543,8470],[8525,8470],[8490,8490],[8476,8490],[8418,8519],[8382,8530],[8365,8530],[8268,8574],[8223,8586],[8205,8595],[8170,8595],[8130,8615],[8111,8615],[8104,8625],[8081,8625],[8074,8635],[8055,8635],[8032,8650],[7995,8648],[7983,8660],[7912,8660],[7903,8669],[7823,8674],[7773,8681],[7763,8690],[7731,8690],[7724,8700],[7695,8700],[7678,8709],[7642,8720],[7615,8720],[7586,8735],[7580,8728],[7563,8743],[7540,8755],[7516,8755],[7509,8765],[7431,8765],[7424,8775],[7381,8775],[7374,8785],[7331,8785],[7324,8795],[7270,8795],[7238,8815],[7165,8815],[7142,8830],[7095,8828],[7083,8840],[7035,8840],[7000,8860],[6946,8860],[6939,8870],[6861,8870],[6854,8880],[6471,8880]], convexity=90);
   polygon([[17458,775],[17454,770],[17419,770],[17353,749],[17335,740],[17316,740],[17309,730],[17287,730],[17218,694],[17200,678],[17181,668],[17113,621],[16993,496],[16970,466],[16970,457],[16950,438],[16950,428],[16931,408],[16896,338],[16884,293],[16875,275],[16875,260],[16866,243],[16855,207],[16855,171],[16845,164],[16845,0],[17640,0],[17640,780],[17461,780]], convexity=20);
   polygon([[0,380],[0,0],[760,0],[760,144],[750,151],[750,194],[740,201],[740,224],[730,231],[730,253],[715,272],[715,294],[705,301],[705,317],[670,389],[655,401],[655,413],[635,432],[635,444],[610,474],[610,483],[482,610],[474,610],[444,635],[432,635],[413,655],[401,655],[389,670],[317,705],[301,705],[294,715],[272,715],[253,730],[231,730],[224,740],[201,740],[194,750],[151,750],[144,760],[0,760]], convexity=21);
  }
 }
}

module TenBuck1Yellow()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) TenBuck1Yellow_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}