module DancingMask4_1()
{
 /* Generated by trace2scad version 20150415
    http://aggregate.org/MAKE/TRACE2SCAD/
    Optimized model has 930/1862 original points
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
 linear_extrude(height=1, convexity=930)
 union() {
  union() {
   polygon([[0,19023],[0,18045],[213,18045],[262,18095],[499,18095],[542,18140],[643,18140],[691,18190],[786,18189],[833,18235],[877,18235],[929,18285],[978,18285],[1022,18330],[1068,18330],[1212,18475],[1263,18475],[1520,18733],[1520,18783],[1665,18927],[1665,18972],[1712,19020],[1710,19065],[1760,19118],[1760,19162],[1806,19209],[1805,19304],[1855,19352],[1855,19453],[1900,19496],[1900,19733],[1950,19782],[1950,20000],[0,20000]], convexity=11);
   polygon([[17095,19891],[17095,19782],[17145,19733],[17145,19496],[17190,19453],[17190,19352],[17240,19304],[17239,19209],[17285,19162],[17285,19118],[17335,19065],[17333,19020],[17380,18972],[17380,18927],[17525,18783],[17525,18732],[17783,18475],[17833,18475],[17977,18330],[18023,18330],[18067,18285],[18116,18285],[18168,18235],[18212,18235],[18259,18189],[18354,18190],[18402,18140],[18503,18140],[18546,18095],[18783,18095],[18832,18045],[19050,18045],[19050,20000],[17095,20000]], convexity=23);
   polygon([[12762,19630],[12736,19605],[12687,19605],[12643,19560],[12598,19560],[12546,19510],[12498,19510],[12355,19368],[12313,19370],[12167,19225],[12117,19225],[12023,19130],[11976,19130],[11883,19035],[11832,19035],[11783,18985],[11735,18985],[11641,18890],[11593,18890],[11496,18795],[11447,18795],[11353,18700],[11257,18700],[11213,18655],[10737,18655],[10693,18700],[10598,18700],[10546,18750],[10497,18750],[10453,18795],[10212,18795],[10163,18845],[9309,18845],[9257,18795],[9162,18795],[9118,18750],[9022,18750],[8973,18700],[8927,18700],[8883,18655],[8692,18655],[8643,18605],[8352,18605],[8308,18560],[8117,18560],[8023,18655],[7972,18655],[7928,18700],[7882,18700],[7833,18750],[7782,18750],[7593,18940],[7547,18940],[7453,19035],[7402,19035],[7308,19130],[7261,19130],[7216,19177],[7170,19175],[7117,19225],[7070,19225],[6880,19415],[6832,19415],[6783,19465],[6503,19465],[6357,19320],[6162,19320],[5923,19080],[5878,19080],[5580,18783],[5580,18736],[5485,18643],[5485,18593],[5339,18446],[5342,18406],[5295,18355],[5295,17927],[5340,17883],[5340,17785],[5390,17735],[5390,17593],[5437,17545],[5434,17499],[5535,17398],[5534,17303],[5580,17259],[5580,17212],[5630,17163],[5628,17114],[6023,16720],[6071,16722],[6213,16580],[6258,16580],[6483,16355],[6486,16308],[6535,16256],[6535,16162],[6580,16118],[6580,15879],[6630,15826],[6630,15402],[6675,15356],[6675,15308],[6725,15256],[6725,15210],[6865,15070],[6865,15022],[7308,14580],[7354,14580],[7406,14530],[7453,14530],[7497,14485],[7643,14485],[7692,14435],[7788,14435],[7832,14390],[7877,14390],[7929,14340],[7978,14340],[8055,14262],[8055,14212],[8105,14163],[8105,13640],[8151,13590],[8149,13500],[8200,13447],[8200,13403],[8346,13256],[8343,13210],[8441,13112],[8438,13070],[8690,12818],[8732,12821],[8929,12624],[8975,12627],[9023,12580],[9067,12580],[9120,12530],[9356,12531],[9403,12485],[10022,12485],[10070,12532],[10115,12530],[10168,12580],[10213,12580],[10307,12675],[10358,12675],[10750,13068],[10750,13116],[10845,13213],[10845,13257],[10895,13310],[10893,13355],[10940,13403],[10940,13447],[10990,13499],[10990,13593],[11035,13637],[11035,13828],[11085,13879],[11085,14023],[11130,14067],[11130,14116],[11180,14167],[11180,14213],[11225,14257],[11225,14307],[11402,14485],[11453,14485],[11547,14580],[11642,14580],[11690,14627],[11734,14625],[11784,14675],[11832,14675],[11880,14722],[11926,14720],[11977,14770],[12023,14770],[12073,14820],[12166,14819],[12610,15263],[12608,15305],[12655,15353],[12655,15403],[12705,15453],[12704,15546],[12750,15593],[12750,16306],[12800,16358],[12800,16403],[12928,16530],[12973,16530],[13022,16580],[13118,16580],[13212,16675],[13262,16675],[13310,16722],[13353,16720],[13452,16820],[13501,16818],[14130,17447],[14130,17497],[14320,17688],[14320,17733],[14370,17782],[14370,17832],[14510,17973],[14511,18307],[14465,18353],[14465,18403],[14414,18453],[14416,18488],[14415,18500],[14370,18543],[14370,18593],[14320,18642],[14320,18693],[14275,18736],[14275,18783],[14225,18832],[14225,18883],[14180,18927],[14180,18973],[13990,19162],[13990,19213],[13737,19466],[13690,19463],[13592,19560],[13447,19560],[13403,19605],[13262,19605],[13213,19655],[12788,19655]], convexity=126);
   polygon([[12048,12535],[12023,12510],[11927,12510],[11833,12415],[11782,12415],[11688,12320],[11642,12320],[11453,12130],[11402,12130],[11023,11750],[10978,11750],[10926,11700],[10877,11700],[10738,11560],[10642,11560],[10593,11510],[10497,11510],[10453,11465],[10216,11465],[10164,11415],[10023,11415],[9976,11369],[9783,11370],[9737,11415],[9642,11415],[9593,11465],[9449,11464],[9402,11510],[9358,11510],[9306,11560],[9022,11560],[8978,11605],[8740,11605],[8685,11655],[8592,11655],[8548,11700],[8499,11700],[8448,11750],[8022,11750],[7928,11655],[7832,11655],[7783,11605],[7738,11605],[7547,11415],[7498,11415],[7356,11274],[7263,11275],[7213,11225],[7069,11225],[7018,11175],[6642,11175],[6593,11225],[6402,11225],[6200,11022],[6200,10732],[6245,10688],[6245,10447],[6212,10415],[6180,10448],[6180,10496],[6130,10548],[6130,10688],[6085,10732],[6085,10877],[5833,11130],[5642,11130],[5434,10922],[5436,10829],[5403,10795],[5352,10795],[5258,10700],[5212,10700],[5168,10655],[5118,10655],[4915,10453],[4915,10402],[4832,10320],[4783,10320],[4636,10174],[4598,10178],[4546,10130],[4497,10130],[4353,9985],[4307,9985],[4263,9940],[4212,9940],[4163,9890],[4067,9890],[3973,9795],[3877,9795],[3833,9750],[3782,9750],[3733,9700],[3687,9700],[3643,9655],[3592,9655],[3448,9510],[3402,9510],[2485,8592],[2485,8547],[2295,8358],[2295,8309],[2245,8257],[2245,7642],[2295,7593],[2295,7542],[2783,7055],[2877,7055],[2923,7010],[3977,7010],[4023,7055],[4213,7055],[4262,7105],[4308,7105],[4352,7150],[4448,7150],[4499,7200],[4548,7200],[4592,7245],[4688,7245],[4737,7295],[4785,7295],[4830,7340],[4875,7340],[4930,7390],[5073,7390],[5117,7435],[5163,7435],[5560,7833],[5560,7878],[5605,7922],[5605,7973],[5700,8067],[5700,8163],[5750,8212],[5750,8356],[5797,8403],[5795,8445],[5845,8498],[5845,8547],[5940,8642],[5940,8687],[5990,8740],[5988,8785],[6017,8815],[6025,8815],[6055,8783],[6055,8738],[6105,8686],[6105,8452],[6055,8403],[6055,7782],[6010,7738],[6010,7402],[6055,7358],[6055,7262],[6150,7168],[6150,7118],[6295,6972],[6295,6927],[6390,6833],[6390,6782],[6725,6448],[6725,6401],[7260,5868],[7308,5865],[7402,5770],[7498,5770],[7592,5675],[7643,5675],[7692,5625],[7738,5625],[7782,5580],[7877,5580],[7930,5530],[7975,5532],[8023,5485],[8067,5485],[8119,5435],[8168,5435],[8262,5340],[8308,5340],[8592,5055],[8643,5055],[8782,4915],[8923,4915],[9019,4819],[9115,4820],[9165,4770],[9213,4770],[9263,4720],[9356,4721],[9403,4675],[9688,4675],[9725,4637],[9725,4592],[9770,4548],[9770,4452],[9960,4263],[9960,4213],[9828,4080],[9738,4080],[9592,4225],[9548,4225],[9495,4275],[9449,4273],[9257,4465],[9072,4465],[8833,4225],[8782,4225],[8543,4465],[8497,4465],[8263,4700],[8067,4700],[7928,4560],[7882,4560],[7833,4510],[7687,4510],[7643,4465],[7597,4465],[7546,4415],[7497,4415],[7453,4370],[7405,4368],[7117,4079],[7069,4082],[6865,3878],[6865,3828],[6725,3688],[6725,3643],[6628,3545],[6630,3499],[6580,3448],[6580,2212],[6630,2163],[6629,2019],[6675,1972],[6675,1879],[6725,1827],[6725,1782],[6770,1738],[6770,1642],[6820,1593],[6820,1542],[6865,1498],[6865,1452],[6915,1403],[6915,1352],[6960,1308],[6960,1262],[7055,1168],[7055,1072],[7150,978],[7150,928],[7295,782],[7295,737],[7547,485],[7592,485],[7738,340],[7788,340],[7832,295],[8548,295],[8940,688],[8940,1213],[8845,1307],[8845,1353],[8415,1782],[8415,1833],[8320,1927],[8320,1976],[8180,2114],[8180,2163],[8130,2212],[8130,2308],[8085,2352],[8085,2445],[8035,2500],[8035,2593],[7990,2637],[7990,2733],[7940,2782],[7940,3023],[7973,3055],[8118,3055],[8167,3105],[8403,3105],[8452,3055],[10358,3055],[10402,3010],[10833,3010],[11022,2820],[11312,2820],[11358,2865],[11592,2865],[11638,2820],[11833,2820],[11879,2865],[11976,2865],[12023,2819],[12163,2821],[12212,2770],[12498,2770],[12642,2915],[12686,2915],[12785,2818],[12828,2820],[12929,2719],[12975,2722],[13023,2675],[13073,2675],[13121,2625],[13165,2627],[13358,2435],[13408,2435],[13502,2340],[13548,2340],[13592,2295],[13643,2295],[13692,2245],[13738,2245],[13782,2200],[13877,2200],[13929,2150],[13978,2150],[14022,2105],[14163,2105],[14212,2055],[14263,2055],[14307,2010],[14738,2010],[14940,2213],[14940,2258],[15035,2352],[15035,2403],[15085,2452],[15085,2593],[15130,2637],[15130,2827],[15180,2879],[15180,3068],[15225,3112],[15225,3208],[15275,3259],[15275,3355],[15322,3402],[15320,3445],[15370,3498],[15370,3546],[15416,3592],[15415,3733],[15465,3782],[15465,3973],[15515,4022],[15514,4211],[15560,4258],[15560,4447],[15610,4499],[15610,4548],[15655,4592],[15655,4638],[15705,4689],[15705,4738],[15750,4782],[15750,4877],[15800,4929],[15800,4978],[15895,5072],[15895,5118],[15940,5162],[15940,5211],[15990,5261],[15990,5308],[16035,5352],[16035,5403],[16085,5452],[16085,5498],[16130,5542],[16130,5593],[16180,5642],[16180,5688],[16225,5732],[16225,5827],[16275,5879],[16275,6257],[16225,6310],[16227,6356],[16023,6560],[15972,6560],[15878,6655],[15502,6655],[15453,6605],[15262,6605],[15218,6560],[15169,6560],[15117,6510],[15071,6510],[14974,6415],[14927,6415],[14390,5877],[14390,5830],[14250,5690],[14250,5642],[14200,5593],[14200,5542],[14155,5499],[14154,5488],[14155,5453],[14055,5353],[14055,5163],[14023,5130],[13976,5176],[13883,5175],[13833,5225],[13738,5225],[13686,5275],[13592,5275],[13548,5320],[13452,5320],[13403,5370],[13352,5370],[13308,5415],[13262,5415],[13213,5465],[13162,5465],[13118,5510],[13072,5510],[13023,5560],[12927,5560],[12883,5605],[12832,5605],[12643,5795],[12598,5795],[12406,5987],[12360,5985],[12307,6035],[12263,6035],[12121,6177],[12072,6175],[12023,6225],[11977,6225],[11753,6450],[11749,6496],[11800,6549],[11800,6643],[12370,7212],[12370,7261],[12465,7355],[12465,7402],[12610,7548],[12610,7973],[12262,8320],[12168,8320],[12116,8370],[11972,8370],[11928,8415],[11883,8415],[11737,8560],[11548,8560],[11343,8356],[11345,8310],[11295,8257],[11295,8213],[11249,8166],[11250,8073],[11200,8023],[11200,7972],[11167,7940],[11117,7940],[10928,8130],[10737,8130],[10535,7927],[10535,7687],[10580,7643],[10580,7592],[10630,7543],[10630,7499],[10535,7402],[10535,7308],[10408,7180],[10402,7180],[10263,7320],[10212,7320],[10130,7403],[10130,7548],[10085,7592],[10085,7686],[10035,7738],[10035,7833],[9990,7877],[9990,7973],[9940,8022],[9940,8068],[9895,8112],[9895,8210],[9799,8305],[9800,8403],[9700,8501],[9702,8545],[9655,8593],[9655,8643],[9560,8737],[9560,8783],[9470,8872],[9470,8883],[9548,8960],[9643,8960],[9692,9010],[9833,9010],[9877,9055],[9928,9055],[9977,9105],[10118,9105],[10162,9150],[10260,9150],[10310,9200],[10408,9200],[10452,9245],[10497,9245],[10549,9295],[10598,9295],[10642,9340],[10687,9340],[10739,9390],[10832,9390],[10929,9485],[10977,9485],[11025,9532],[11066,9529],[11119,9580],[11168,9580],[11212,9625],[11257,9625],[11309,9675],[11358,9675],[11452,9770],[11497,9770],[11550,9821],[11640,9818],[11739,9916],[11786,9913],[11978,10105],[12024,10105],[12069,10150],[12118,10150],[12262,10295],[12308,10295],[12447,10435],[12497,10435],[12643,10580],[12691,10580],[13035,10922],[13035,10973],[13130,11067],[13130,11783],[13085,11829],[13085,11973],[13035,12022],[13035,12073],[12544,12560],[12072,12560]], convexity=298);
   polygon([[18951,1925],[18925,1900],[18689,1901],[18642,1855],[18548,1855],[18496,1805],[18402,1805],[18358,1760],[18309,1760],[18258,1710],[18212,1710],[18168,1665],[18118,1665],[17972,1520],[17927,1520],[17665,1257],[17665,1212],[17525,1073],[17525,1022],[17475,973],[17475,926],[17430,883],[17430,832],[17380,783],[17380,687],[17335,643],[17335,549],[17285,497],[17285,257],[17238,210],[17240,0],[19050,0],[19050,1950],[18978,1950]], convexity=34);
   polygon([[104,1901],[0,1900],[0,0],[1950,0],[1950,163],[1900,212],[1901,451],[1855,498],[1855,593],[1805,643],[1806,736],[1760,783],[1760,833],[1710,882],[1710,928],[1665,972],[1665,1023],[1520,1167],[1520,1213],[1257,1475],[1212,1475],[1073,1615],[1022,1615],[973,1665],[926,1665],[883,1710],[832,1710],[783,1760],[687,1760],[643,1805],[549,1805],[497,1855],[258,1855],[208,1903]], convexity=20);
  }
 }
}

module DancingMask4()
{
 /* all layers combined, scaled to within a 1mm cube */
 scale([1, 1, 1/1])
 difference() {
  union() {
   scale([1,1,2]) translate([0,0,-0.5]) DancingMask4_1();
  }
  translate([0,0,-2]) cube([2,2,4],center=true);
 }
}