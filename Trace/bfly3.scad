module bfly3_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 192/1244 original points
 */
 color([0.9375, 0.9375, 0.9375])
 assign(minx=144) /* polygon minx=144 */
 assign(miny=565) /* polygon miny=565 */
 assign(maxx=7487) /* polygon maxx=7487 */
 assign(maxy=4528) /* polygon maxy=4528 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=192)
 union() {
  union() {
   union() {
    difference() {
     polygon([[6725,4525],[6658,4521],[6323,4452],[5750,4267],[5173,4051],[4552,3723],[4225,3490],[4106,3395],[4075,3405],[4190,3555],[4179,3634],[4236,3773],[4213,3788],[4121,3583],[4130,3561],[4014,3423],[3999,3516],[3935,3565],[3925,3620],[3881,3638],[3870,3649],[3987,3944],[4031,4099],[4014,4131],[3973,4128],[3948,4078],[3936,3908],[3838,3672],[3710,4135],[3706,4270],[3736,4307],[3709,4388],[3668,4405],[3638,4382],[3700,3988],[3800,3633],[3770,3645],[3732,3573],[3655,3512],[3650,3453],[3655,3432],[3620,3408],[3524,3500],[3451,3623],[3296,3883],[3265,3886],[3303,3792],[3426,3593],[3496,3440],[3188,3668],[2755,3905],[2273,4119],[1429,4407],[985,4486],[628,4485],[366,4411],[199,4317],[144,4228],[219,4010],[305,3897],[363,3782],[435,3684],[478,3583],[605,3440],[682,3323],[780,3216],[832,3108],[962,2958],[1039,2824],[1170,2700],[1220,2616],[1409,2478],[1459,2435],[1652,2378],[1905,2399],[2027,2417],[2118,2461],[2256,2524],[2320,2555],[2335,2555],[2235,2454],[2226,2446],[2035,2197],[1953,2048],[1932,1979],[1904,1632],[2019,1574],[2088,1578],[2119,1520],[2131,1443],[2196,1403],[2378,1369],[2389,1258],[2520,1168],[2575,1128],[2596,1073],[2585,648],[2606,604],[2661,568],[2688,595],[2694,743],[2728,858],[2801,944],[2914,1000],[3063,1022],[3205,999],[3312,955],[3431,990],[3501,1066],[3545,1145],[3719,1262],[3793,1372],[3787,1488],[3754,1725],[3677,1868],[3620,1978],[3607,2128],[3620,2285],[3637,2285],[3788,2141],[3866,2128],[3974,2164],[4041,2241],[4072,2189],[4088,2099],[4056,1923],[3955,1714],[3913,1388],[3937,1248],[4008,1160],[4210,1100],[4216,1048],[4221,992],[4268,936],[4348,895],[4553,984],[4616,1001],[4828,1002],[4950,893],[5028,780],[5046,587],[5071,565],[5136,637],[5100,1028],[5138,1123],[5277,1214],[5327,1286],[5351,1335],[5510,1396],[5577,1486],[5618,1607],[5746,1657],[5780,1703],[5716,2148],[5588,2328],[5360,2575],[5428,2547],[5635,2450],[5800,2390],[5978,2409],[6215,2507],[6313,2580],[6439,2700],[6498,2780],[6620,2920],[6663,3038],[6785,3185],[6841,3300],[6917,3359],[7008,3491],[7025,3540],[7118,3613],[7180,3733],[7394,4006],[7445,4124],[7487,4260],[7441,4343],[7303,4433],[7098,4505],[6893,4526],[6793,4528]], convexity=55);
     polygon([[3544,3407],[3560,3391],[3527,3423]], convexity=4);
     polygon([[1294,2782],[1288,2770],[1281,2795],[1300,2795]], convexity=5);
     polygon([[2534,2667],[2525,2658],[2533,2675],[2542,2675]], convexity=4);
    }
   }
  }
 }
}

module bfly3_2()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 167/640 original points
 */
 color([0.8125, 0.8125, 0.8125])
 assign(minx=25) /* polygon minx=25 */
 assign(miny=90) /* polygon miny=90 */
 assign(maxx=1220) /* polygon maxx=1220 */
 assign(maxy=740) /* polygon maxy=740 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=167)
 union() {
  union() {
   union() {
    difference() {
     polygon([[1071,734],[1065,728],[993,715],[935,700],[932,684],[876,676],[708,588],[670,560],[675,587],[650,566],[628,589],[634,620],[582,560],[566,566],[460,630],[342,680],[303,684],[288,700],[194,730],[54,720],[25,683],[77,578],[227,395],[328,393],[379,415],[315,343],[315,303],[308,267],[345,248],[345,225],[384,225],[400,196],[425,175],[418,98],[440,94],[448,147],[508,166],[563,162],[605,205],[608,268],[586,338],[596,368],[628,345],[666,360],[647,283],[640,196],[687,168],[713,145],[787,165],[815,138],[824,90],[841,103],[830,178],[910,250],[941,266],[929,356],[880,414],[969,385],[1047,438],[1210,665],[1220,698],[1163,730],[1077,740]], convexity=38);
     polygon([[1062,639],[1059,635],[1050,640],[1013,646],[1064,643]], convexity=5);
     polygon([[202,640],[208,639],[180,638],[196,640]], convexity=5);
     polygon([[1139,625],[1133,615],[1145,635]], convexity=4);
     polygon([[110,618],[116,610],[100,618],[104,625]], convexity=5);
     polygon([[379,598],[370,591],[378,570],[381,583],[383,562],[360,581],[388,605]], convexity=8);
     polygon([[285,579],[285,576],[240,560],[240,583],[285,583]], convexity=5);
     polygon([[1005,575],[1005,570],[985,580],[1005,580]], convexity=5);
     polygon([[973,537],[969,528],[943,546],[976,546]], convexity=5);
     polygon([[285,535],[285,530],[270,540],[285,540]], convexity=5);
     polygon([[895,538],[895,536],[869,540],[895,540]], convexity=5);
     polygon([[319,500],[313,490],[300,504],[325,510]], convexity=5);
     polygon([[943,502],[946,495],[929,510],[940,510]], convexity=5);
     polygon([[407,478],[404,470],[406,485],[410,485]], convexity=4);
     polygon([[418,455],[408,445],[394,445],[427,465]], convexity=5);
     polygon([[855,448],[855,446],[824,465],[855,449]], convexity=5);
     polygon([[415,433],[415,425],[410,440],[415,440]], convexity=5);
     polygon([[255,410],[267,400],[243,420]], convexity=4);
     polygon([[380,245],[380,240],[365,250],[380,250]], convexity=5);
     polygon([[427,217],[437,210],[410,218],[418,225]], convexity=5);
     polygon([[845,215],[845,210],[818,210],[845,219]], convexity=5);
    }
   }
   polygon([[595,703],[595,695],[610,703],[595,710]], convexity=5);
   polygon([[595,658],[595,645],[610,658],[595,670]], convexity=5);
   polygon([[642,661],[639,653],[643,625],[654,670],[646,670]], convexity=6);
   polygon([[605,623],[605,615],[620,623],[605,630]], convexity=5);
   polygon([[535,613],[535,605],[550,613],[535,620]], convexity=5);
  }
 }
}

module bfly3_3()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 184/624 original points
 */
 color([0.6875, 0.6875, 0.6875])
 assign(minx=15) /* polygon minx=15 */
 assign(miny=60) /* polygon miny=60 */
 assign(maxx=780) /* polygon maxx=780 */
 assign(maxy=469) /* polygon maxy=469 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=184)
 union() {
  union() {
   union() {
    difference() {
     polygon([[41,462],[31,457],[15,424],[154,251],[208,252],[230,254],[205,205],[201,165],[219,156],[266,113],[278,60],[290,108],[345,106],[355,95],[396,141],[383,235],[402,220],[429,235],[413,129],[440,108],[455,95],[492,107],[526,71],[538,60],[535,120],[602,180],[596,214],[560,270],[575,281],[575,293],[562,275],[536,295],[535,335],[558,315],[575,300],[585,315],[581,255],[625,245],[637,261],[681,290],[780,438],[765,462],[631,460],[578,438],[441,371],[434,366],[411,377],[404,392],[390,365],[370,353],[335,378],[235,428],[125,466],[52,468]], convexity=33);
     polygon([[155,438],[155,430],[140,438],[155,445]], convexity=5);
     polygon([[655,438],[655,430],[640,438],[655,445]], convexity=5);
     polygon([[208,415],[211,410],[190,420],[204,420]], convexity=5);
     polygon([[615,412],[617,410],[601,417],[613,414]], convexity=5);
     polygon([[138,411],[128,409],[115,407],[148,414]], convexity=4);
     polygon([[679,412],[670,409],[648,414],[688,414]], convexity=5);
     polygon([[70,398],[76,390],[60,398],[64,405]], convexity=5);
     polygon([[195,389],[195,384],[188,400],[195,394]], convexity=5);
     polygon([[271,395],[275,395],[243,360],[230,369],[258,398],[266,395]], convexity=6);
     polygon([[564,374],[566,360],[540,381],[563,388]], convexity=5);
     polygon([[173,367],[159,360],[150,375],[188,375]], convexity=5);
     polygon([[645,370],[645,365],[629,375],[645,375]], convexity=5);
     polygon([[193,347],[179,340],[194,355],[208,355]], convexity=4);
     polygon([[625,347],[625,339],[598,354],[625,355]], convexity=5);
     polygon([[236,341],[225,339],[190,310],[190,335],[248,344]], convexity=4);
     polygon([[585,340],[585,335],[605,328],[590,328],[571,345],[585,345]], convexity=5);
     polygon([[265,323],[265,310],[263,335],[265,335]], convexity=5);
     polygon([[248,318],[246,311],[251,302],[253,285],[276,289],[335,285],[305,261],[230,284],[241,264],[218,281],[218,307],[226,308],[240,309],[251,325]], convexity=11);
     polygon([[492,286],[486,285],[484,265],[475,294],[497,288]], convexity=5);
     polygon([[469,255],[468,240],[469,270]], convexity=4);
     polygon([[521,260],[535,253],[522,240],[510,246],[502,247],[504,269],[508,267]], convexity=7);
     polygon([[270,248],[270,241],[305,245],[280,200],[270,235],[265,255],[270,255]], convexity=7);
     polygon([[523,228],[526,216],[504,202],[512,227],[520,240]], convexity=5);
     polygon([[494,223],[496,214],[486,234],[493,232]], convexity=5);
     polygon([[460,175],[460,171],[445,180],[460,180]], convexity=5);
    }
   }
   polygon([[377,453],[374,444],[388,442],[380,462]], convexity=5);
   polygon([[547,295],[544,289],[555,300],[551,300]], convexity=5);
  }
 }
}

module bfly3_4()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 184/644 original points
 */
 color([0.5625, 0.5625, 0.5625])
 assign(minx=15) /* polygon minx=15 */
 assign(miny=60) /* polygon miny=60 */
 assign(maxx=780) /* polygon maxx=780 */
 assign(maxy=469) /* polygon maxy=469 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=184)
 union() {
  union() {
   union() {
    difference() {
     polygon([[42,463],[31,457],[15,421],[130,269],[190,245],[226,264],[212,307],[265,335],[258,302],[257,294],[292,290],[337,293],[340,254],[345,178],[355,192],[350,170],[293,193],[249,260],[208,223],[202,165],[220,154],[245,149],[256,126],[268,94],[278,63],[297,110],[344,115],[355,97],[354,122],[390,143],[375,237],[410,225],[431,240],[410,137],[443,106],[464,94],[475,115],[502,110],[513,108],[533,60],[533,117],[580,159],[602,184],[594,216],[548,275],[502,190],[442,167],[430,180],[463,204],[455,267],[461,292],[469,302],[519,283],[535,307],[538,335],[595,301],[573,260],[630,251],[637,261],[706,328],[780,439],[766,461],[653,460],[567,432],[485,387],[461,378],[425,353],[407,378],[395,385],[395,361],[375,357],[198,442],[111,465],[53,468]], convexity=46);
     polygon([[155,438],[155,430],[140,438],[155,445]], convexity=5);
     polygon([[655,435],[655,425],[640,445],[655,445]], convexity=5);
     polygon([[96,424],[90,418],[96,436],[102,430]], convexity=5);
     polygon([[215,415],[215,411],[191,405],[188,384],[188,415],[215,419]], convexity=5);
     polygon([[609,417],[615,411],[605,390],[578,424],[603,423]], convexity=6);
     polygon([[685,412],[687,410],[650,421],[683,414]], convexity=5);
     polygon([[135,408],[123,402],[105,415],[148,415]], convexity=5);
     polygon([[70,398],[76,390],[55,405],[64,405]], convexity=5);
     polygon([[267,399],[276,392],[243,360],[230,371],[258,405]], convexity=6);
     polygon([[562,388],[570,371],[559,354],[535,398],[554,405]], convexity=6);
     polygon([[173,367],[159,360],[150,375],[188,375]], convexity=5);
     polygon([[645,367],[645,359],[608,374],[645,375]], convexity=5);
     polygon([[190,346],[173,336],[175,355],[207,355]], convexity=4);
     polygon([[625,348],[625,340],[611,354],[625,355]], convexity=5);
     polygon([[245,345],[245,340],[190,310],[199,335],[245,350]], convexity=5);
     polygon([[588,339],[591,335],[610,325],[560,341],[585,344]], convexity=5);
     polygon([[383,316],[380,313],[384,331],[386,319]], convexity=5);
     polygon([[425,320],[425,316],[411,292],[425,325]], convexity=5);
     polygon([[395,282],[395,280],[382,287],[381,311],[395,284]], convexity=5);
     polygon([[369,149],[363,145],[350,155],[370,161],[376,154]], convexity=6);
     polygon([[448,148],[455,141],[425,148],[441,155]], convexity=5);
    }
   }
   polygon([[377,453],[374,444],[388,442],[380,462]], convexity=5);
   polygon([[308,258],[306,251],[320,265],[311,265]], convexity=5);
   polygon([[498,237],[495,233],[489,205],[510,206],[501,240]], convexity=5);
   polygon([[295,213],[295,205],[310,213],[295,220]], convexity=5);
  }
 }
}

module bfly3_5()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 171/667 original points
 */
 color([0.4375, 0.4375, 0.4375])
 assign(minx=14) /* polygon minx=14 */
 assign(miny=58) /* polygon miny=58 */
 assign(maxx=694) /* polygon maxx=694 */
 assign(maxy=417) /* polygon maxy=417 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=171)
 union() {
  union() {
   union() {
    difference() {
     polygon([[47,410],[44,405],[17,398],[80,282],[118,240],[114,265],[148,226],[202,230],[135,335],[158,355],[176,384],[191,367],[154,318],[188,314],[209,300],[190,276],[246,295],[241,259],[307,277],[330,285],[344,318],[345,280],[317,257],[309,210],[308,190],[325,150],[261,171],[219,231],[184,185],[175,155],[230,126],[248,120],[235,108],[240,58],[256,103],[305,97],[314,90],[345,133],[336,145],[331,125],[284,139],[295,140],[330,148],[337,164],[332,203],[390,203],[389,165],[402,178],[407,212],[404,245],[400,287],[432,269],[463,255],[470,280],[482,295],[507,290],[502,317],[482,317],[475,357],[507,339],[503,314],[545,303],[536,319],[562,306],[527,282],[520,277],[515,231],[552,225],[577,245],[640,313],[694,395],[646,415],[606,411],[552,395],[539,391],[442,347],[429,342],[374,307],[390,260],[361,281],[354,348],[330,314],[295,333],[143,405],[50,414]], convexity=54);
     polygon([[135,392],[142,384],[125,365],[97,360],[129,400]], convexity=5);
     polygon([[583,396],[588,393],[610,361],[575,352],[578,370],[578,400]], convexity=5);
     polygon([[89,385],[87,379],[83,390],[91,390]], convexity=5);
     polygon([[57,375],[60,371],[43,375],[54,380]], convexity=5);
     polygon([[539,374],[544,368],[561,341],[575,326],[534,341],[530,359],[527,380],[534,380]], convexity=5);
     polygon([[654,360],[643,345],[642,358],[665,375]], convexity=5);
     polygon([[240,355],[244,355],[217,317],[195,332],[236,355]], convexity=5);
     polygon([[130,346],[130,342],[118,345],[130,350]], convexity=5);
     polygon([[84,317],[92,312],[75,315],[77,323]], convexity=5);
     polygon([[313,312],[326,299],[300,325]], convexity=4);
     polygon([[283,300],[292,290],[265,310],[273,310]], convexity=5);
     polygon([[610,288],[610,282],[586,271],[610,295]], convexity=5);
     polygon([[347,261],[351,253],[365,261],[381,230],[330,266],[344,270]], convexity=7);
    }
   }
   union() {
    difference() {
     polygon([[483,230],[479,216],[435,156],[410,151],[396,146],[370,145],[370,110],[400,102],[396,88],[455,110],[476,70],[478,107],[470,131],[514,131],[528,155],[525,203],[486,245]], convexity=11);
     polygon([[400,127],[406,120],[380,135],[394,135]], convexity=5);
    }
   }
   polygon([[257,203],[254,196],[279,180],[260,210]], convexity=5);
  }
 }
}

module bfly3_6()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 196/662 original points
 */
 color([0.3125, 0.3125, 0.3125])
 assign(minx=11) /* polygon minx=11 */
 assign(miny=69) /* polygon miny=69 */
 assign(maxx=616) /* polygon maxx=616 */
 assign(maxy=375) /* polygon maxy=375 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=196)
 union() {
  union() {
   union() {
    difference() {
     polygon([[539,369],[537,363],[490,354],[475,343],[500,303],[503,287],[453,215],[495,200],[529,238],[547,246],[540,268],[553,260],[613,352],[560,375],[541,375]], convexity=11);
     polygon([[565,358],[565,350],[545,358],[565,365]], convexity=5);
     polygon([[520,350],[520,340],[540,331],[510,310],[527,322],[505,342],[520,360]], convexity=7);
     polygon([[599,347],[596,344],[591,361],[602,350]], convexity=5);
     polygon([[584,324],[578,313],[555,300],[590,335]], convexity=4);
     polygon([[559,277],[556,274],[551,291],[562,280]], convexity=5);
    }
   }
   union() {
    difference() {
     polygon([[19,359],[11,353],[94,229],[110,234],[107,215],[125,208],[174,210],[142,279],[120,298],[140,308],[140,355],[127,348],[109,305],[83,320],[104,353],[28,364]], convexity=14);
     polygon([[85,357],[85,354],[65,335],[78,359],[85,360]], convexity=5);
     polygon([[50,332],[50,324],[42,340],[50,340]], convexity=5);
     polygon([[60,313],[60,307],[76,275],[57,299],[53,320],[60,320]], convexity=5);
     polygon([[100,252],[100,244],[92,260],[100,260]], convexity=5);
    }
   }
   polygon([[165,336],[171,327],[157,292],[180,280],[174,303],[199,326],[220,314],[183,285],[220,275],[230,274],[210,242],[230,237],[249,247],[261,240],[275,267],[238,297],[214,328],[160,345]], convexity=16);
   polygon([[443,336],[435,326],[450,290],[433,283],[409,312],[428,333],[399,315],[370,295],[388,295],[376,280],[412,270],[354,271],[339,265],[338,285],[338,258],[345,248],[359,268],[379,242],[420,237],[415,264],[463,287],[491,300],[461,338],[452,345]], convexity=20);
   polygon([[265,290],[265,285],[283,257],[288,247],[297,258],[305,275],[311,223],[318,295],[280,289],[265,295]], convexity=8);
   polygon([[330,236],[330,225],[335,240],[330,248]], convexity=5);
   polygon([[279,218],[270,206],[300,196],[324,180],[319,221],[301,200],[288,230]], convexity=7);
   union() {
    difference() {
     polygon([[428,207],[426,204],[400,148],[370,135],[374,108],[354,119],[359,80],[409,96],[415,69],[425,98],[444,123],[455,128],[475,151],[449,155],[465,172],[445,193],[431,209]], convexity=12);
     polygon([[430,153],[430,150],[405,130],[430,155]], convexity=5);
     polygon([[430,116],[430,112],[418,115],[430,120]], convexity=5);
    }
   }
   polygon([[181,192],[169,181],[167,173],[186,139],[189,126],[221,78],[230,100],[256,94],[282,89],[286,100],[307,116],[277,117],[265,119],[230,118],[257,135],[215,173],[197,184],[199,163],[193,204]], convexity=13);
   polygon([[273,180],[269,175],[285,165],[276,185]], convexity=5);
   polygon([[340,178],[340,171],[350,172],[340,186]], convexity=5);
   polygon([[283,135],[279,130],[298,135],[286,140]], convexity=5);
   polygon([[330,125],[330,114],[335,135],[330,135]], convexity=5);
  }
 }
}

module bfly3_7()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 159/551 original points
 */
 color([0.1875, 0.1875, 0.1875])
 assign(minx=10) /* polygon minx=10 */
 assign(miny=43) /* polygon miny=43 */
 assign(maxx=545) /* polygon maxx=545 */
 assign(maxy=325) /* polygon maxy=325 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=159)
 union() {
  union() {
   union() {
    difference() {
     polygon([[30,320],[30,315],[10,308],[45,270],[60,263],[50,242],[85,210],[130,180],[129,205],[154,182],[115,233],[120,208],[76,237],[65,242],[82,250],[61,271],[95,310],[50,285],[33,283],[39,300],[37,325],[30,325]], convexity=18);
     polygon([[90,223],[90,215],[75,223],[90,230]], convexity=5);
    }
   }
   polygon([[509,315],[506,305],[480,313],[470,310],[505,294],[489,279],[445,299],[435,310],[434,291],[448,270],[470,273],[468,253],[495,236],[492,263],[510,264],[545,318],[513,275],[515,302],[537,325],[511,325]], convexity=18);
   polygon([[110,301],[110,285],[88,285],[125,270],[118,310],[110,316]], convexity=6);
   polygon([[150,298],[150,290],[126,250],[150,254],[149,240],[165,288],[150,307]], convexity=8);
   polygon([[396,295],[390,285],[425,260],[405,299],[410,305],[402,305]], convexity=7);
   polygon([[190,270],[190,256],[183,246],[206,285],[190,285]], convexity=6);
   polygon([[212,271],[207,268],[210,243],[218,275]], convexity=5);
   polygon([[349,272],[340,269],[358,256],[385,244],[358,274]], convexity=5);
   polygon([[93,258],[96,250],[102,262],[90,266]], convexity=5);
   polygon([[311,252],[300,240],[311,220],[320,240],[323,264]], convexity=5);
   polygon([[274,249],[278,243],[288,200],[276,255],[269,255]], convexity=4);
   polygon([[434,252],[440,249],[448,230],[459,255],[428,254]], convexity=5);
   polygon([[256,235],[250,225],[262,245]], convexity=4);
   polygon([[461,233],[455,225],[445,209],[420,190],[410,188],[431,180],[473,211],[485,225],[468,240]], convexity=6);
   polygon([[190,220],[190,205],[201,223],[190,235]], convexity=5);
   polygon([[426,218],[420,210],[428,200],[433,225]], convexity=5);
   polygon([[270,180],[270,173],[285,163],[270,187]], convexity=4);
   polygon([[156,168],[150,161],[155,147],[160,126],[138,121],[180,112],[177,95],[200,93],[196,70],[220,90],[225,83],[219,95],[172,144],[169,175],[163,175]], convexity=12);
   polygon([[380,168],[380,160],[395,145],[370,155],[370,136],[390,133],[344,95],[318,70],[360,90],[372,60],[368,96],[385,105],[385,120],[406,125],[401,140],[415,150],[397,170],[380,176]], convexity=13);
   polygon([[237,97],[234,89],[245,78],[240,105]], convexity=5);
  }
 }
}

module bfly3_8()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 160/474 original points
 */
 color([0.0625, 0.0625, 0.0625])
 assign(minx=20) /* polygon minx=20 */
 assign(miny=93) /* polygon miny=93 */
 assign(maxx=775) /* polygon maxx=775 */
 assign(maxy=460) /* polygon maxy=460 */
 assign(dx=maxx-minx)
 assign(dy=maxy-miny)
 assign(maxd=((dx>dy)?dx:dy))
 scale([1/maxd, 1/maxd, 1])
 translate([-minx-dx/2, -miny-dy/2, 0])
 linear_extrude(height=1, convexity=160)
 union() {
  union() {
   polygon([[115,451],[115,443],[125,448],[115,460]], convexity=5);
   polygon([[30,447],[23,439],[30,416],[40,418],[36,449],[36,455]], convexity=7);
   polygon([[668,447],[665,439],[678,455],[671,455]], convexity=5);
   polygon([[619,437],[610,434],[622,403],[632,385],[643,405],[635,425],[631,414],[628,439]], convexity=8);
   polygon([[765,433],[765,424],[748,400],[770,435],[765,443]], convexity=6);
   polygon([[166,427],[160,424],[185,430],[173,429]], convexity=5);
   polygon([[236,414],[230,408],[215,395],[245,410],[242,420]], convexity=5);
   polygon([[562,409],[559,404],[580,388],[581,398],[590,389],[586,405],[566,415]], convexity=7);
   polygon([[161,395],[155,385],[175,393],[167,405]], convexity=5);
   polygon([[83,392],[80,386],[100,370],[98,385],[87,397]], convexity=5);
   polygon([[276,387],[269,379],[286,388],[283,394]], convexity=5);
   polygon([[735,390],[735,384],[709,349],[741,391],[735,397]], convexity=6);
   polygon([[52,380],[49,375],[63,371],[70,362],[55,385]], convexity=5);
   polygon([[525,370],[530,360],[527,377],[520,380]], convexity=4);
   polygon([[397,343],[392,331],[403,300],[403,355]], convexity=5);
   polygon([[96,320],[102,310],[90,330]], convexity=4);
   polygon([[142,303],[145,290],[165,278],[139,316]], convexity=4);
   polygon([[185,303],[185,300],[205,285],[185,305]], convexity=4);
   polygon([[110,296],[111,293],[140,275],[110,300]], convexity=4);
   polygon([[595,295],[588,291],[605,297],[602,299]], convexity=5);
   polygon([[637,290],[621,282],[629,269],[653,298]], convexity=5);
   polygon([[167,258],[161,251],[188,253],[173,264]], convexity=5);
   polygon([[248,241],[255,226],[264,206],[276,221],[241,255]], convexity=5);
   polygon([[536,235],[530,225],[510,185],[500,171],[535,207],[542,231],[542,245]], convexity=4);
   polygon([[227,228],[234,220],[227,235],[219,235]], convexity=4);
   polygon([[571,211],[560,198],[550,176],[515,140],[546,160],[571,173],[575,199],[590,225],[583,225]], convexity=5);
   polygon([[210,218],[210,215],[238,178],[271,154],[210,220]], convexity=4);
   polygon([[204,174],[198,170],[221,176],[211,179]], convexity=5);
   polygon([[310,168],[304,160],[327,174],[316,175]], convexity=5);
   polygon([[477,167],[485,159],[477,175],[469,175]], convexity=4);
   polygon([[308,130],[304,125],[275,120],[278,98],[293,120],[318,114],[345,131],[311,135]], convexity=8);
   polygon([[484,132],[481,129],[450,100],[465,110],[491,114],[519,120],[524,108],[514,128],[487,135]], convexity=6);
  }
 }
}

module bfly3()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/8])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) bfly3_1();
   scale([1,1,4]) translate([0,0,-0.5]) bfly3_2();
   scale([1,1,6]) translate([0,0,-0.5]) bfly3_3();
   scale([1,1,8]) translate([0,0,-0.5]) bfly3_4();
   scale([1,1,10]) translate([0,0,-0.5]) bfly3_5();
   scale([1,1,12]) translate([0,0,-0.5]) bfly3_6();
   scale([1,1,14]) translate([0,0,-0.5]) bfly3_7();
   scale([1,1,16]) translate([0,0,-0.5]) bfly3_8();
  }
  translate([0,0,-9]) cube([2,2,18],center=true);
 }
}
scale([10,10,0.1])
bfly3();
