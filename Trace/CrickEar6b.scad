//======================================================================
// CrickEar6b.scad
//
// New version of Crick Wooder Earrings
// Try to make the water have ripples
//
// DrTomFlint, 10 Sept 2024
//======================================================================


use <./CrickEar6.scad>


w = [[10358,15785],[10288,15782],[10077,15723],[9972,15541],[9998,15410],[10056,15350],[10093,15350],[10132,15310],[10366,15310],[10428,15270],[10490,15230],[10567,15230],[10605,15193],[10678,15196],[10717,15155],[10835,15155],[10897,15115],[10936,15095],[10975,15075],[11015,15052],[11015,15016],[11050,14983],[11051,14819],[10958,14725],[10917,14725],[10878,14685],[10682,14685],[10643,14645],[10449,14645],[10405,14605],[10287,14605],[10253,14570],[10137,14570],[10098,14530],[9980,14530],[9936,14490],[9862,14490],[9823,14450],[9782,14450],[9743,14410],[9469,14410],[9425,14369],[9351,14371],[9319,14335],[9240,14335],[9196,14295],[9081,14295],[9043,14255],[8962,14255],[8923,14215],[8802,14215],[8764,14175],[8689,14176],[8652,14140],[8495,14140],[8458,14100],[8417,14100],[8378,14060],[8337,14060],[8298,14020],[8182,14020],[8143,13980],[8103,13980],[8065,13943],[8030,13945],[7986,13905],[7948,13905],[7786,13745],[7750,13747],[7655,13653],[7655,13612],[7615,13573],[7615,13532],[7575,13493],[7575,13182],[7615,13143],[7615,13102],[7655,13063],[7655,13022],[7828,12850],[7868,12850],[7907,12810],[7948,12810],[8027,12730],[8067,12730],[8105,12693],[8139,12696],[8177,12655],[8218,12655],[8257,12615],[8298,12615],[8337,12575],[8456,12575],[8514,12535],[8569,12499],[8685,12500],[8747,12460],[8826,12420],[8903,12380],[8943,12360],[8962,12340],[9083,12340],[9122,12300],[9160,12300],[9192,12265],[9233,12265],[9272,12225],[9433,12225],[9472,12185],[9666,12185],[9707,12145],[9938,12145],[9979,12105],[10058,12105],[10092,12070],[10133,12070],[10172,12030],[10253,12030],[10292,11990],[10408,11990],[10447,11950],[10488,11950],[10527,11910],[10642,11910],[10679,11874],[10795,11875],[10839,11835],[10913,11835],[10952,11795],[11033,11795],[11072,11755],[11113,11755],[11152,11715],[11193,11715],[11231,11675],[11265,11677],[11365,11578],[11365,11542],[11405,11503],[11405,11389],[11365,11345],[11365,11307],[11267,11210],[11152,11210],[11113,11170],[10919,11170],[10875,11130],[10642,11130],[10603,11090],[10562,11090],[10523,11050],[10329,11051],[10292,11015],[10252,11015],[10213,10975],[9822,10975],[9783,10935],[9547,10935],[9508,10895],[9392,10895],[9353,10855],[9117,10855],[9083,10820],[8692,10820],[8653,10780],[8262,10780],[8223,10740],[8102,10740],[8063,10700],[7867,10700],[7828,10660],[7592,10660],[7553,10620],[7515,10622],[7477,10585],[7362,10585],[7323,10545],[7169,10545],[7125,10505],[7007,10505],[6968,10465],[6927,10465],[6890,10425],[6772,10425],[6738,10390],[6700,10390],[6656,10350],[6542,10350],[6503,10310],[6462,10310],[6423,10270],[6307,10270],[6266,10230],[6227,10230],[6193,10195],[6072,10195],[6033,10155],[5992,10155],[5953,10115],[5837,10115],[5798,10075],[5642,10075],[5603,10035],[5562,10035],[5523,9995],[5485,9997],[5447,9960],[5410,9960],[5366,9920],[5252,9920],[5213,9880],[5172,9880],[5133,9840],[5092,9840],[5053,9800],[5012,9800],[4980,9765],[4942,9765],[4783,9605],[4742,9605],[4410,9272],[4410,9233],[4373,9195],[4375,9161],[4335,9123],[4335,9082],[4295,9043],[4295,9002],[4255,8963],[4255,8922],[4215,8883],[4215,8380],[4255,8336],[4255,8222],[4295,8183],[4295,8142],[4335,8103],[4335,8062],[4375,8023],[4373,7985],[4410,7947],[4410,7910],[4450,7849],[4470,7812],[4490,7772],[4510,7733],[4530,7693],[4550,7653],[4570,7612],[4587,7575],[4605,7538],[4605,7519],[4685,7437],[4685,7399],[4725,7358],[4725,7322],[4765,7283],[4765,7242],[4880,7128],[4880,7087],[4920,7048],[4920,7008],[5000,6926],[4998,6890],[5115,6772],[5115,6739],[5155,6695],[5155,6579],[5195,6535],[5195,6422],[5230,6388],[5230,6350],[5270,6306],[5270,6189],[5310,6148],[5310,5952],[5270,5913],[5270,5797],[5172,5700],[5132,5700],[5035,5602],[5035,5563],[4978,5505],[4937,5505],[4858,5425],[4819,5427],[4783,5388],[4746,5390],[4708,5350],[4667,5350],[4628,5310],[4587,5310],[4548,5270],[4507,5270],[4468,5230],[4428,5230],[4390,5193],[4356,5196],[4318,5155],[4277,5155],[4238,5115],[4042,5115],[4003,5075],[3962,5075],[3923,5035],[3802,5035],[3763,4995],[3730,4997],[3692,4960],[3572,4960],[3533,4920],[3492,4920],[3453,4880],[3297,4880],[3258,4840],[3217,4840],[3178,4800],[2982,4800],[2948,4765],[2910,4765],[2866,4725],[2752,4725],[2713,4685],[2647,4673],[2543,4601],[2318,4367],[2215,4214],[2146,4048],[2112,3838],[2145,3650],[2185,3551],[2224,3455],[2316,3340],[2563,3078],[2672,3002],[2969,2805],[3353,2612],[3438,2572],[3514,2535],[3665,2478],[3716,2455],[4196,2300],[4313,2259],[4526,2200],[4584,2185],[4683,2160],[4740,2145],[4841,2120],[4859,2106],[4978,2101],[5063,2066],[5188,2051],[5408,2005],[5621,1967],[5725,1950],[5885,1923],[6151,1885],[6267,1870],[6460,1848],[6808,1815],[6888,1796],[7280,1780],[7363,1759],[8741,1720],[9898,1769],[10195,1793],[10395,1811],[10760,1848],[10954,1870],[11069,1885],[11250,1910],[11338,1923],[11495,1950],[11600,1967],[11818,2006],[12032,2051],[12200,2083],[12302,2104],[12361,2106],[12434,2140],[12517,2145],[12598,2180],[12673,2185],[12714,2215],[12846,2245],[12966,2276],[13390,2415],[13511,2455],[13706,2534],[14295,2826],[14673,3089],[14909,3343],[15003,3477],[15040,3553],[15082,3695],[15110,3874],[15069,4073],[15035,4139],[14996,4217],[14974,4259],[14860,4453],[14840,4493],[14820,4533],[14800,4570],[14783,4605],[14765,4643],[14765,4664],[14416,5015],[14159,5291],[14113,5314],[13826,5577],[13518,5847],[13437,5895],[13418,5895],[13338,5970],[13305,5970],[13128,6088],[12378,6552],[12113,6675],[11793,6786],[11308,7056],[11024,7234],[10733,7403],[10478,7630],[10307,7788],[10159,7914],[10015,8106],[9941,8293],[9925,8563],[9971,8817],[10090,9083],[10230,9246],[10428,9384],[10938,9586],[11620,9767],[12026,9868],[12125,9880],[12169,9920],[12283,9920],[12322,9960],[12403,9960],[12442,10000],[12596,9999],[12633,10035],[12748,10035],[12789,10075],[12908,10075],[12947,10115],[13143,10115],[13182,10155],[13336,10155],[13380,10195],[13496,10194],[13533,10230],[13645,10230],[13689,10270],[13806,10270],[13847,10310],[13963,10310],[14002,10350],[14196,10350],[14240,10390],[14278,10390],[14312,10425],[14428,10425],[14467,10465],[14626,10465],[14667,10505],[14896,10505],[14940,10545],[15173,10545],[15212,10585],[15373,10585],[15411,10625],[15526,10624],[15563,10660],[15643,10660],[15682,10700],[15718,10700],[15821,10804],[15816,10831],[15855,10874],[15855,10913],[15895,10952],[15895,10993],[15935,11032],[15935,11226],[15895,11270],[15895,11308],[15682,11520],[15642,11520],[15603,11560],[15562,11560],[15483,11640],[15442,11640],[15398,11676],[15373,11675],[15333,11715],[15292,11715],[15253,11755],[15212,11755],[15173,11795],[15132,11795],[15093,11835],[14978,11835],[14940,11872],[14902,11870],[14863,11910],[14747,11910],[14706,11950],[14669,11950],[14625,11990],[14507,11990],[14468,12030],[14427,12030],[14390,12070],[14312,12070],[14278,12105],[14200,12105],[14156,12145],[13962,12145],[13923,12185],[13882,12185],[13843,12225],[13532,12225],[13493,12265],[13453,12265],[13416,12301],[13222,12300],[13183,12340],[13027,12340],[12988,12380],[12712,12380],[12673,12420],[12437,12420],[12398,12460],[12283,12460],[12245,12497],[12210,12495],[12166,12535],[11932,12535],[11893,12575],[11812,12575],[11773,12615],[11659,12615],[11615,12655],[11537,12655],[11498,12695],[11302,12695],[11268,12730],[11152,12730],[11113,12770],[11072,12770],[11033,12810],[10952,12810],[10913,12850],[10839,12850],[10795,12890],[10757,12890],[10723,12925],[10642,12925],[10603,12965],[10567,12965],[10526,13005],[10489,13005],[10445,13045],[10367,13045],[10230,13183],[10230,13223],[10155,13297],[10155,13376],[10195,13420],[10194,13534],[10230,13566],[10230,13608],[10373,13750],[10411,13748],[10446,13785],[10483,13785],[10522,13825],[10563,13825],[10642,13905],[10723,13905],[10762,13945],[10838,13945],[10872,13980],[10953,13980],[10992,14020],[11033,14020],[11072,14060],[11186,14060],[11230,14100],[11503,14100],[11542,14140],[11582,14140],[11620,14177],[11656,14175],[11738,14255],[11853,14255],[11892,14295],[11933,14295],[11972,14335],[12013,14335],[12065,14375],[12090,14375],[12122,14410],[12203,14410],[12242,14450],[12323,14450],[12362,14490],[12403,14490],[12441,14530],[12476,14530],[12520,14570],[12555,14568],[12655,14667],[12655,14708],[12695,14747],[12693,14784],[12730,14816],[12715,14901],[12595,15061],[12113,15329],[11628,15518],[11038,15706],[10713,15784],[10428,15789]];
mag = 1000;

thick=2.1;

//----------------------------------------------------------------------
module purp_old(){
  scale([1/mag,1/mag,thick])
  linear_extrude(height=1, convexity=725)
  polygon(w,convexity=725);   
}

//----------------------------------------------------------------------
module purp1(){

  intersection(){
    scale([1/mag,1/mag,1])
    linear_extrude(height=thick, convexity=725)
    polygon(w,convexity=725);   
  
    translate([10,10,0])
    scale([45,45,thick]) CrickEar6();
  }

}

//----------------------------------------------------------------------
module purp2(){

  difference(){
    scale([1/mag,1/mag,1])
    linear_extrude(height=thick, convexity=725)
    polygon(w,convexity=725);   
  
    translate([10,10,0])
    scale([45,45,thick]) CrickEar6();
  }

}


//----------------------------------------------------------------------
module purpRim(){
  
  difference(){  
    scale([1/mag,1/mag,1])
    linear_extrude(height=thick, convexity=725)
    offset(r=500)
    polygon(w,convexity=725);   
    
    translate([0,0,-1])
    scale([1/mag,1/mag,1])
    linear_extrude(height=thick+2, convexity=725)
    polygon(w,convexity=725);   
  }

  // add hanger loop
  translate([10,17,0])
  difference(){
    cylinder(r=1.0,h=thick,$fn=44);
    translate([0,0,-1])
    cylinder(r=0.5,h=thick+2,$fn=44);
  }
  
}

//----------------------------------------------------------------------
module crick(){

r1=18;  
a1=19;
a2=8;
yoff = -r1;
tsize=3;

    rotate([0,0,-a1])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a1])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
}

//----------------------------------------------------------------------
module crickRim(){

m1=0.6;
r1=18;  
a1=19;
a2=8;
yoff = -r1;
tsize=3;


    rotate([0,0,-a1])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a1])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }




}

//----------------------------------------------------------------------
module wooder(){

r1=18;  
a1=27.5;
a2=15.5;
a3=5;
yoff = -r1;
tsize=3;

    rotate([0,0,-a1])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("W", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a3])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a3])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("D", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a1-2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
}

//----------------------------------------------------------------------
module wooderRim(){

m1=0.6;
r1=18;  
a1=27.5;
a2=15.5;
a3=5;
yoff = -r1;
tsize=3;


    rotate([0,0,-a1])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("W", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("W", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a3])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a3])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("D", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("D", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a1-2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("R", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }




}

//======================================================================

//~ purp();

purp1();
//~ purp2();
//~ purp_old();

//~ purpRim();

//~ translate([8.5,17.5,0])
//~ crick();

//~ translate([8.5,17.5,0])
//~ crickRim();

//~ translate([9,17.5,0])
//~ wooder();

//~ translate([9,17.5,0])
//~ wooderRim();



//~ translate([-20,0,0]){
  //~ purpRim();
  //~ translate([8.5,17.5,0])
  //~ crickRim();
//~ }


//======================================================================