module C3text_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 582/3208 original points
 */
 color([0.5, 0.5, 0.5])
 assign(minx=0) /* polygon minx=0 */
 assign(miny=0) /* polygon miny=0 */
 assign(maxx=20000) /* polygon maxx=20000 */
 assign(maxy=19690) /* polygon maxy=19690 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=582)
 union() {
  union() {
   polygon([[1,18799],[3,17908],[221,17839],[472,17805],[701,17833],[908,17890],[1153,18025],[1430,18292],[1584,18588],[1629,18742],[1660,18993],[1623,19271],[1575,19428],[1438,19676],[1425,19690],[0,19690]], convexity=5);
   polygon([[18275,19684],[18275,19678],[18190,19480],[18139,19274],[18133,19174],[18133,19061],[18165,18838],[18210,18684],[18345,18443],[18390,18373],[18617,18160],[18878,18016],[19060,17965],[19152,17947],[19364,17930],[19474,17948],[19726,18011],[20000,18151],[20000,19690],[18275,19690]], convexity=7);
   polygon([[9885,17185],[9878,17180],[9748,17165],[9670,17170],[9620,17124],[9610,16888],[9588,16692],[9560,16416],[9525,16330],[9505,16233],[9496,16183],[9417,16183],[9397,16192],[9205,16588],[9081,16888],[9045,16941],[9035,17048],[8970,17095],[8728,17021],[8663,17000],[8603,16990],[8545,16933],[8545,16893],[8653,16782],[9180,15738],[9275,15478],[9334,15404],[9391,15414],[9753,15486],[9793,15495],[9840,15543],[9847,15835],[9896,16144],[9952,16173],[9998,16063],[10050,15905],[10100,15713],[10125,15637],[10135,15533],[10192,15475],[10310,15465],[10343,15448],[10661,15424],[10720,15482],[10720,15550],[10762,15665],[10814,15893],[10933,16243],[11065,16653],[11149,16893],[11220,17021],[11220,17093],[11176,17136],[10867,17130],[10794,17136],[10731,17074],[10727,16918],[10486,16197],[10439,16179],[10411,16185],[10355,16283],[10320,16355],[10291,16476],[10250,16578],[10242,16674],[10169,17030],[10176,17133],[10124,17181],[9978,17167],[9952,17190],[9893,17190]], convexity=20);
   union() {
    difference() {
     polygon([[11947,16883],[11896,16866],[11616,16749],[11463,16597],[11395,16499],[11385,16454],[11335,16388],[11247,16191],[11251,15753],[11284,15667],[11305,15603],[11414,15413],[11558,15280],[11643,15225],[11813,15140],[11962,15100],[12215,15110],[12394,15133],[12573,15207],[12757,15353],[12911,15563],[13025,15830],[13054,16023],[13040,16203],[12954,16419],[12817,16590],[12618,16735],[12378,16840],[12120,16895],[11998,16900]], convexity=6);
     polygon([[12350,16535],[12383,16524],[12530,16434],[12615,16294],[12638,16118],[12583,15893],[12461,15665],[12346,15536],[12198,15456],[12079,15443],[11928,15482],[11799,15574],[11716,15718],[11700,15878],[11762,16117],[11901,16360],[12050,16496],[12198,16549],[12318,16546]], convexity=7);
    }
   }
   polygon([[7470,16700],[7453,16690],[7378,16664],[7315,16635],[7213,16585],[7148,16530],[7107,16530],[7060,16482],[7074,16414],[6825,15863],[6735,15790],[6668,15807],[6608,15877],[6455,16129],[6412,16185],[6366,16185],[6276,16125],[6095,16024],[6075,15957],[6108,15870],[6168,15731],[6530,15077],[6642,14845],[6751,14636],[6799,14518],[6859,14460],[6973,14460],[7211,14670],[7220,14746],[7036,14911],[6990,15025],[6990,15164],[7031,15210],[7133,15212],[7720,14947],[7773,14930],[7819,14943],[7971,15007],[8168,15049],[8242,15124],[8240,15167],[8158,15235],[8030,15267],[7901,15280],[7099,15639],[7496,16498],[7585,16624],[7585,16664],[7535,16710],[7488,16710]], convexity=18);
   union() {
    difference() {
     polygon([[13768,15980],[13718,15971],[13513,15889],[13313,15718],[13153,15463],[13061,15198],[13050,15003],[13088,14813],[13179,14633],[13352,14450],[13472,14362],[13613,14271],[13803,14216],[13979,14209],[14213,14262],[14433,14389],[14639,14578],[14778,14800],[14829,14965],[14842,15103],[14806,15273],[14706,15470],[14484,15745],[14408,15827],[14120,15950],[13885,15988],[13818,15989]], convexity=6);
     polygon([[14095,15640],[14132,15631],[14241,15583],[14419,15379],[14468,15261],[14468,15140],[14406,14988],[14251,14808],[14027,14647],[13839,14590],[13655,14611],[13568,14665],[13484,14794],[13460,14941],[13495,15145],[13587,15348],[13699,15501],[13855,15620],[13958,15655],[14058,15650]], convexity=7);
    }
   }
   polygon([[5673,15680],[5669,15675],[5365,15563],[5140,15423],[4919,15198],[4835,15072],[4798,14923],[4795,14578],[4856,14414],[4967,14284],[5005,14222],[5162,14077],[5502,13899],[5726,13856],[5888,13894],[6149,14027],[6351,14183],[6560,14439],[6545,14513],[6470,14598],[6372,14715],[6340,14715],[6278,14643],[6268,14585],[6228,14500],[6142,14387],[5953,14260],[5848,14224],[5681,14227],[5508,14299],[5368,14431],[5239,14640],[5195,14778],[5200,14969],[5272,15122],[5415,15256],[5592,15342],[5735,15370],[5798,15360],[5853,15350],[5910,15405],[5900,15473],[5718,15685],[5676,15685]], convexity=12);
   union() {
    difference() {
     polygon([[15308,14624],[15288,14620],[15250,14610],[14272,13776],[14164,13608],[14190,13513],[14532,13078],[14735,12885],[14923,12823],[15335,12809],[15609,12896],[15861,13158],[15935,13286],[15999,13455],[16017,13608],[15988,13770],[15861,14038],[15468,14573],[15419,14630],[15328,14629]], convexity=7);
     polygon([[15456,14072],[15505,14008],[15602,13837],[15637,13718],[15626,13553],[15543,13393],[15382,13245],[15208,13161],[15028,13149],[14846,13226],[14702,13358],[14585,13529],[15400,14139],[15407,14137]], convexity=7);
    }
   }
   polygon([[4107,14409],[4085,14389],[4085,14372],[3980,14258],[3855,14113],[3855,14068],[3913,14025],[4060,13942],[4998,13174],[5122,13040],[5186,13040],[5235,13101],[5331,13245],[5440,13360],[5440,13403],[5367,13460],[5267,13510],[4220,14356],[4220,14383],[4172,14430],[4130,14430]], convexity=10);
   union() {
    difference() {
     polygon([[3668,13435],[3658,13431],[3508,13400],[3393,13338],[3325,13295],[3178,13122],[2896,12665],[2899,12588],[2941,12488],[2998,12410],[4080,11731],[4121,11705],[4201,11690],[4319,11801],[4395,11928],[4364,12064],[3918,12349],[4052,12536],[4157,12586],[4338,12586],[4718,12556],[4813,12593],[4934,12758],[4928,12804],[4884,12851],[4643,12902],[4167,12916],[4120,12963],[4104,13073],[4028,13253],[3851,13425],[3743,13440],[3678,13439]], convexity=11);
     polygon([[3639,13024],[3668,13013],[3793,12917],[3819,12837],[3809,12749],[3657,12500],[3285,12733],[3455,12982],[3516,13024],[3610,13035]], convexity=6);
    }
   }
   polygon([[16415,12785],[16398,12780],[16188,12705],[15991,12660],[15793,12570],[15621,12508],[15456,12445],[15218,12342],[15170,12281],[15125,12228],[15147,12068],[15161,11955],[15390,11272],[15390,11246],[15455,11200],[15608,11255],[15700,11296],[15725,11317],[15717,11404],[15674,11461],[15534,11932],[15559,12039],[15573,12055],[15831,12134],[15891,12094],[15953,11882],[15996,11623],[16015,11542],[16074,11484],[16243,11505],[16282,11525],[16315,11538],[16378,11588],[16393,11652],[16350,11715],[16211,12167],[16278,12265],[16417,12300],[16500,12268],[16610,11938],[16618,11860],[16658,11676],[16703,11628],[16885,11650],[16988,11694],[17030,11740],[17020,11808],[16963,11911],[16861,12113],[16628,12757],[16483,12788],[16433,12790]], convexity=14);
   polygon([[2555,12053],[2528,12025],[2429,11928],[2340,11780],[2303,11708],[2265,11604],[2225,11334],[2234,11115],[2280,10950],[2364,10733],[2575,10520],[2623,10490],[2794,10395],[3033,10326],[3413,10329],[3630,10385],[3738,10431],[3990,10643],[4085,10787],[4105,10863],[4135,10923],[4155,10942],[4165,11035],[4189,11117],[4216,11218],[4220,11435],[4174,11485],[3983,11491],[3834,11461],[3804,11462],[3758,11400],[3760,11295],[3765,11078],[3721,10937],[3632,10842],[3453,10770],[3218,10765],[2990,10825],[2835,10926],[2741,11068],[2705,11238],[2746,11493],[2854,11703],[2945,11792],[2945,11832],[2832,11935],[2618,12080],[2582,12080]], convexity=14);
   union() {
    difference() {
     polygon([[16888,11232],[16768,11196],[15595,10854],[15562,10855],[15515,10809],[15523,10760],[15565,10699],[15578,10603],[15610,10480],[15610,10452],[15669,10395],[15743,10411],[15808,10464],[16196,10577],[16282,10510],[16311,10357],[16275,10253],[16108,10072],[15830,9812],[15860,9575],[15892,9423],[15967,9360],[15998,9360],[16224,9608],[16243,9648],[16474,9885],[16540,10014],[16553,10058],[16601,10061],[16728,9957],[16828,9918],[16998,9918],[17196,9995],[17287,10073],[17355,10201],[17376,10383],[17305,10717],[17160,11203],[17118,11250],[17008,11269]], convexity=14);
     polygon([[16914,10769],[16933,10752],[16994,10726],[17042,10518],[17025,10421],[16947,10351],[16844,10314],[16719,10324],[16645,10385],[16549,10651],[16597,10700],[16895,10785]], convexity=6);
    }
   }
   polygon([[19317,1895],[19313,1891],[19054,1852],[18793,1743],[18637,1640],[18420,1407],[18319,1238],[18230,1004],[18192,716],[18215,488],[18257,332],[18390,63],[18428,3],[20000,0],[20000,1719],[19773,1825],[19567,1880],[19322,1900]], convexity=6);
   polygon([[417,1770],[413,1766],[194,1738],[3,1672],[0,0],[1498,0],[1595,225],[1629,342],[1650,479],[1655,643],[1623,863],[1544,1085],[1415,1303],[1173,1545],[875,1700],[665,1755],[422,1775]], convexity=5);
  }
 }
}

module C3text()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) C3text_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}
C3text();