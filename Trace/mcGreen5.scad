module mcGreen5_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 731/3592 original points
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
 linear_extrude(height=1, convexity=731)
 union() {
  union() {
   polygon([[0,19333],[0,18666],[218,18620],[346,18615],[568,18654],[793,18751],[1000,18918],[1172,19145],[1269,19368],[1327,19707],[1290,20000],[0,20000]], convexity=5);
   polygon([[19008,19969],[18999,19938],[18965,19720],[19002,19478],[19102,19263],[19243,19101],[19448,18971],[19623,18920],[19788,18905],[20000,18940],[20000,20000],[19017,20000]], convexity=6);
   union() {
    difference() {
     polygon([[10796,11275],[10784,11265],[10747,11265],[10660,11167],[10602,11110],[10515,11033],[10479,11035],[10390,10940],[10354,10875],[10317,10875],[10213,10780],[9960,10537],[9950,10489],[9940,10440],[9883,10390],[9823,10350],[9753,10310],[9732,10310],[9653,10390],[9612,10390],[9530,10465],[9473,10505],[9392,10565],[9343,10585],[9304,10604],[9268,10621],[9188,10660],[9149,10680],[9069,10700],[9023,10710],[8737,10720],[8698,10700],[8677,10700],[8590,10603],[8483,10465],[8435,10417],[8435,10378],[8142,10095],[8083,10055],[7817,9800],[7780,9802],[7712,9745],[7663,9725],[7588,9705],[7486,9605],[7376,9595],[7265,9560],[7176,9510],[7157,9510],[7070,9412],[7030,9363],[7030,9322],[6910,9185],[6910,9147],[6775,9013],[6775,8972],[6715,8903],[6522,8710],[6422,8630],[6353,8570],[6312,8570],[6258,8515],[6222,8515],[6092,8395],[6043,8375],[6023,8375],[5965,8318],[5930,8320],[5796,8210],[5618,8135],[5467,8075],[5366,8050],[5228,8054],[5057,8098],[4953,8156],[4496,8156],[4393,8115],[4108,7964],[4020,7868],[3903,7720],[3845,7662],[3845,7622],[3552,7340],[3437,7245],[3389,7225],[3369,7225],[3297,7165],[3248,7145],[3169,7125],[3092,7050],[3058,7050],[2967,6970],[2897,6930],[2732,6775],[2652,6715],[2603,6695],[2564,6676],[2527,6659],[2509,6660],[2270,6439],[2260,6446],[2215,6405],[2168,6395],[2097,6345],[1986,6265],[1943,6230],[1893,6220],[1816,6200],[1738,6180],[1678,6160],[1609,6130],[1493,6090],[1459,6061],[1844,5343],[2335,4598],[2891,3908],[3428,3352],[4062,2801],[4564,2428],[5253,1993],[5932,1640],[6580,1365],[7220,1148],[7833,986],[8516,855],[9163,778],[9956,738],[10845,785],[11467,865],[12150,1000],[12875,1203],[13533,1441],[14348,1819],[15063,2235],[15738,2708],[16305,3183],[16844,3713],[17358,4305],[17798,4910],[18184,5534],[18557,6270],[18412,6405],[18298,6500],[18230,6540],[18183,6570],[18153,6600],[18103,6610],[18033,6640],[17974,6659],[17936,6677],[17899,6695],[17843,6715],[17742,6755],[17653,6785],[17563,6835],[17524,6854],[17488,6871],[17453,6890],[17343,6900],[17312,6910],[17202,7010],[17143,7050],[16949,7225],[16892,7280],[16835,7347],[16825,7398],[16795,7486],[16715,7579],[16640,7672],[16502,7810],[16368,7925],[16267,8005],[16218,8045],[16177,8045],[16128,8085],[16071,8122],[15992,8180],[15857,8280],[15763,8335],[15712,8355],[15574,8475],[15554,8475],[15460,8553],[15335,8650],[15070,8927],[14899,9100],[14800,9168],[14630,9313],[14410,9533],[14355,9622],[14255,9743],[14175,9842],[14077,9940],[13953,10055],[13903,10065],[13542,10075],[13503,10055],[13482,10055],[13423,9995],[13376,9988],[13283,9950],[13232,9940],[13182,9900],[13133,9880],[13052,9860],[13013,9820],[12963,9810],[12900,9783],[12883,9765],[12813,9755],[12753,9735],[12549,9725],[12506,9745],[12430,9783],[12393,9800],[12353,9820],[12253,9880],[12207,9914],[11855,10287],[11775,10378],[11775,10418],[11735,10457],[11725,10508],[11688,10565],[11660,10610],[11640,10649],[11570,10758],[11452,10895],[11372,10915],[11230,11050],[11173,11090],[11092,11150],[11013,11200],[10972,11230],[10910,11265],[10837,11285],[10808,11285]], convexity=54);
     polygon([[15048,7105],[15089,7065],[15108,7065],[15272,6910],[15350,6833],[15193,6650],[15115,6562],[14980,6408],[14840,6247],[14705,6093],[14623,6001],[14762,5870],[14918,5735],[15012,5665],[15115,5788],[15195,5878],[15330,6033],[15465,6187],[15605,6348],[15698,6440],[15747,6420],[15898,6280],[16054,6145],[16065,6136],[16015,6072],[15875,5913],[15720,5738],[15447,5430],[15373,5333],[15546,5187],[15703,5050],[15808,4960],[16070,5248],[16210,5408],[16345,5562],[16500,5737],[16580,5815],[16757,5660],[16914,5525],[16931,5500],[16890,5432],[16755,5291],[16620,5137],[16480,4977],[16345,4823],[16210,4668],[16070,4507],[15935,4353],[15780,4179],[15729,4124],[15642,4200],[15488,4335],[15328,4475],[15152,4630],[14999,4765],[14841,4905],[14687,5040],[14533,5175],[14372,5315],[14218,5450],[14063,5585],[13882,5745],[13815,5816],[13885,5898],[14020,6052],[14160,6213],[14295,6367],[14585,6693],[14725,6853],[14860,7007],[14997,7145],[15007,7145]], convexity=16);
     polygon([[5851,6635],[5908,6580],[6051,6461],[6188,6345],[6295,6240],[6222,6150],[6105,6012],[5990,5878],[5868,5735],[5755,5604],[5635,5466],[5540,5353],[5420,5212],[5305,5078],[5187,4939],[5070,4803],[4960,4672],[5038,4605],[5172,4490],[5310,4373],[5448,4255],[5582,4140],[5723,4020],[5837,3915],[5740,3808],[5620,3667],[5515,3553],[5427,3630],[5293,3745],[5152,3865],[5038,3960],[4898,4080],[4629,4313],[4493,4430],[4352,4550],[4218,4665],[4140,4743],[4160,4793],[4280,4921],[4395,5054],[4514,5191],[4630,5328],[4745,5462],[4865,5603],[4980,5737],[5100,5878],[5215,6012],[5335,6153],[5450,6287],[5548,6405],[5665,6543],[5785,6681],[5795,6690]], convexity=8);
     polygon([[13022,5434],[13025,5423],[13014,5277],[13013,5250],[13012,5192],[13005,5000],[12996,4917],[12993,4861],[12984,4814],[13006,4791],[12985,4727],[12990,4703],[12976,4589],[12998,4494],[12995,4430],[12992,4391],[12984,4298],[12976,4199],[12973,4091],[12972,4062],[12972,4033],[12970,4003],[12959,3926],[12955,3756],[12953,3644],[12950,3595],[12937,3405],[12935,3377],[12935,3318],[12925,3063],[12909,2995],[12930,2950],[12936,2908],[12930,2850],[12927,2763],[12922,2715],[12833,2685],[12773,2665],[12713,2645],[12633,2625],[12486,2575],[12398,2545],[12320,2525],[12263,2505],[12174,2480],[12140,2493],[12113,2538],[12070,2598],[12002,2683],[11976,2714],[11953,2742],[11933,2770],[11891,2828],[11786,2952],[11705,3043],[11658,3111],[11623,3128],[11600,3176],[11548,3241],[11505,3299],[11465,3355],[11381,3468],[11352,3465],[11325,3513],[11255,3602],[11212,3655],[11170,3711],[11115,3784],[11074,3842],[11053,3865],[11032,3888],[10959,3985],[10937,4014],[10822,4159],[10782,4214],[10735,4276],[10664,4374],[10645,4393],[10626,4412],[10543,4519],[10510,4543],[10466,4611],[10492,4625],[10583,4655],[10643,4675],[10723,4695],[10869,4745],[10999,4784],[11033,4792],[11123,4796],[11153,4743],[11224,4642],[11233,4618],[11260,4619],[11272,4579],[11377,4497],[11400,4452],[11425,4417],[11435,4399],[11460,4406],[11487,4351],[11537,4275],[11560,4242],[11578,4217],[11629,4174],[11655,4106],[11693,4073],[11734,4013],[11740,3989],[11770,3988],[11837,3868],[11865,3858],[11890,3808],[11918,3758],[11946,3758],[11980,3686],[12028,3629],[12067,3574],[12164,3451],[12184,3423],[12202,3397],[12245,3337],[12315,3254],[12332,3467],[12333,3493],[12333,3555],[12332,3579],[12333,3615],[12337,3687],[12348,3886],[12350,3942],[12351,4021],[12352,4082],[12356,4136],[12364,4277],[12367,4384],[12373,4510],[12380,4543],[12357,4554],[12369,4845],[12372,4882],[12374,4940],[12373,5000],[12372,5034],[12378,5132],[12388,5197],[12381,5224],[12426,5250],[12556,5290],[12593,5300],[12653,5320],[12713,5340],[12773,5360],[12833,5380],[12898,5390],[12943,5425],[12996,5445],[13020,5445]], convexity=36);
     polygon([[8222,5043],[8231,5036],[8277,5045],[8427,5034],[8608,5002],[8683,4975],[8766,4950],[8835,4920],[8893,4900],[9024,4842],[9071,4800],[9119,4787],[9216,4721],[9243,4700],[9265,4686],[9290,4663],[9312,4645],[9384,4573],[9500,4435],[9586,4282],[9620,4213],[9649,4123],[9684,3946],[9692,3864],[9693,3838],[9696,3808],[9692,3687],[9657,3473],[9642,3406],[9615,3316],[9586,3247],[9550,3136],[9525,3090],[9490,3004],[9449,2940],[9390,2844],[9350,2790],[9313,2740],[9297,2716],[9215,2640],[9196,2615],[9150,2577],[9027,2495],[8958,2445],[8849,2403],[8787,2377],[8699,2356],[8552,2332],[8513,2333],[8337,2333],[8279,2334],[8219,2351],[8183,2353],[8093,2369],[8063,2375],[7999,2400],[7866,2450],[7808,2470],[7753,2490],[7653,2538],[7603,2580],[7560,2590],[7523,2615],[7359,2745],[7310,2787],[7301,2810],[7190,2942],[7089,3112],[7045,3221],[7032,3268],[7024,3301],[7005,3392],[7000,3414],[7001,3513],[6996,3571],[6997,3689],[7002,3751],[7013,3833],[7027,3877],[7041,3963],[7070,4033],[7087,4087],[7135,4213],[7155,4273],[7190,4348],[7202,4373],[7314,4550],[7345,4599],[7427,4691],[7454,4718],[7501,4763],[7625,4855],[7692,4900],[7759,4935],[7830,4973],[7918,4998],[7977,5014],[7999,5004],[8043,5023],[8213,5050]], convexity=12);
    }
    polygon([[8405,4527],[8405,4519],[8338,4527],[8295,4512],[8213,4485],[8150,4452],[8084,4407],[8025,4354],[7945,4267],[7876,4166],[7825,4069],[7763,3945],[7734,3857],[7707,3757],[7682,3639],[7679,3612],[7659,3566],[7672,3530],[7659,3479],[7662,3422],[7667,3370],[7679,3284],[7689,3250],[7733,3141],[7759,3082],[7805,3059],[7825,3021],[7875,2980],[7976,2917],[8072,2874],[8162,2856],[8256,2843],[8319,2839],[8469,2883],[8603,2955],[8643,3001],[8708,3049],[8738,3103],[8768,3139],[8790,3173],[8850,3272],[8924,3427],[8960,3523],[8973,3580],[8980,3612],[9005,3682],[9014,3738],[9032,3864],[9029,3921],[9014,4067],[8978,4185],[8939,4255],[8893,4317],[8864,4347],[8796,4404],[8701,4462],[8601,4504],[8515,4520],[8475,4525],[8405,4535]], convexity=10);
   }
   polygon([[55,1123],[13,1116],[0,1115],[0,0],[993,0],[1035,168],[1050,328],[1016,503],[918,718],[738,915],[558,1029],[308,1110],[98,1130]], convexity=6);
   polygon([[19638,1084],[19613,1080],[19440,1044],[19268,969],[19171,906],[19014,738],[18899,500],[18863,291],[18914,37],[18920,0],[20000,0],[20000,1034],[19790,1082],[19663,1089]], convexity=6);
  }
 }
}

module mcGreen5()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) mcGreen5_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
mcGreen5();