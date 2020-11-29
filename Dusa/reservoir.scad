// reservoir.scad
// coolant reservoir to mount directly ontop of the cooling pump


use <../Parts/threads.scad>


//------------------------------------
module bottomplug(tol=0,cut=0){

difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    translate([0,0,0.23*25.4])
    cylinder(r=7+tol,h=2,$fn=88);

    translate([0,0,0.23*25.4+1.9])
    cylinder(r=12+tol,h=3,$fn=6);

    // block off the alternative line in
    translate([0,0,0.23*25.4+2-13])
    cylinder(r=11/2,h=13,$fn=88);
  }
  if(cut==0){
    // bore hole
    translate([0,0,-5.5])
    cylinder(r=4.5,h=20,$fn=88);
    
    // taper to tank
    translate([0,0,8.5])
    cylinder(r1=4.5,r2=6.5,h=3,$fn=88);

    // taper to pump
    translate([0,0,-5.5])
    cylinder(r1=5.3,r2=4.5,h=1.5,$fn=88);
  }
}  

}

//------------------------------------
module bottomplug2(tol=0,cut=0){

difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    translate([0,0,0.23*25.4])
    cylinder(r=7+tol,h=2,$fn=88);

    translate([0,0,0.23*25.4+1.9])
//    cylinder(r=12+tol,h=3,$fn=6);
    difference(){
      cylinder(r=18+tol,h=3,$fn=66);
      translate([0,0,-0.01])
      difference(){
        cylinder(r=16+tol,h=2,$fn=66);
        cylinder(r=7+tol,h=2,$fn=66);
      }
    }
    
    // block off the alternative line in
    translate([0,0,0.23*25.4+2-13])
    cylinder(r=11/2,h=13,$fn=88);
  }
  if(cut==0){
    // bore hole
    translate([0,0,-5.5])
    cylinder(r=4.5,h=20,$fn=88);
    
    // taper to tank
    translate([0,0,8.5])
    cylinder(r1=4.5,r2=6.5,h=3,$fn=88);

    // taper to pump
    translate([0,0,-5.5])
    cylinder(r1=5.3,r2=4.5,h=1.5,$fn=88);
  }
}  

}

//--------------------------------------
module topplug(tol=0,cut=0){
  difference(){
    union(){
      metric_thread (diameter=24*2-0.5, pitch=2, length=8);
      translate([0,0,6.5])
      cylinder(r1=23,r2=25,h=2,$fn=122);
      translate([0,0,8.5])
      cylinder(r1=25,r2=25,h=1,$fn=122);
    }
    if(cut==0){
      difference(){
        translate([0,0,3])
        cylinder(r1=19,r2=21,h=7.1,$fn=122); 
        translate([0,0,3])
        cylinder(r1=9,r2=7,h=7.1,$fn=88); 
        translate([-21,-2,3])
        cube([42,4,7]);
        translate([0,-15,3])        
        cylinder(r1=7,r2=5,h=7,$fn=88);   
      }
      // threaded hole for the barb
      translate([0,0,-1])
      metric_thread(diameter=10.5, pitch=2, length=11);  
      // filler cap
      translate([0,-15,-1])
      metric_thread (diameter=8.5, pitch=2, length=11);
    }
  }
}  
//--------------------------------------
module fillercap(){

  difference(){
    union(){
      translate([0,0,3])
      metric_thread (diameter=7.5, pitch=2, length=8);
      translate([0,0,10])
      cylinder(r1=3.5,r2=5,h=1.5,$fn=88);
      translate([0,0,11.5])
      cylinder(r1=5,r2=5,h=1,$fn=88);
      translate([0,0,14])
      minkowski(){
        cube([7.5,1,4],center=true);
        sphere(1,$fn=44);
      }  
    }
    translate([0,0,2])
    cylinder(r1=2.0,r2=0.8,h=10,$fn=44);
    cylinder(r=0.8,h=30,$fn=22);
  }
}
      
//--------------------------------------
module topbarb(){
  difference(){
    union(){
      cylinder(r=8,h=2,$fn=6);
      translate([0,0,-4])
      cylinder(r1=4,r2=8,h=4,$fn=6);
      
      cylinder(r=8,h=2,$fn=6);
      translate([0,0,2])
      metric_thread(diameter=10.0, pitch=2, length=11);      
      for(i=[0:4]){
        translate([0,0,13+i*3])
        cylinder(r1=3.3,r2=3,h=3,$fn=88);
      }
      translate([0,0,28])
      cylinder(r1=3,r2=2.5,h=1,$fn=88);
      
      // tube down into liquid
      translate([0,0,-30])
      cylinder(r1=4,r2=5,h=31,$fn=88);
    }

    // main bore
    translate([0,0,-28])
    cylinder(r=2,h=60,$fn=44);

    // side vents
    for(i=[0:2]){
      translate([0,0,-27+i*5])
      rotate([90,0,0])
      cylinder(r=1,h=20,center=true,$fn=44);
    }
    for(i=[0:2]){
      translate([0,0,-27+i*5+2.5])
      rotate([0,90,0])
      cylinder(r=1,h=20,center=true,$fn=44);
    }
  }
  // bottom skirt to make it printable
  translate([0,0,-30])
  cylinder(r1=9,r2=8,h=1.5,$fn=88);    
}

//------------------------------------
module reservoir(){

difference(){
  // main cylinder
  union(){
    cylinder(r=30,h=50,$fn=222);
    translate([0,0,50])
    cylinder(r1=30,r2=25,h=5,$fn=222);
  }
  
  // bottom plug
  translate([0,0,-5.85])
  bottomplug(tol=0.15,cut=1);
  
  // bottom bevel
  translate([0,0,3])
  cylinder(r1=22,r2=27,h=2.1,$fn=222);
  
  // vertical section
  translate([0,0,5])
  cylinder(r=27,h=39.01,$fn=222);
  
  translate([0,0,44])
  cylinder(r1=27,r2=24,h=4.01,$fn=222);

  translate([0,0,48])
  metric_thread (diameter=24*2+0.2, pitch=2, length=8);

}  

}
//------------------------------------------------
module splitblockOld(){
  
// bottom barb
color("orange")
translate([0,0,18]){
mirror([0,0,1])
  difference(){
  union(){
    for(i=[0:5]){
      translate([0,0,10+i*3])
      cylinder(r1=3.6,r2=3.2,h=3,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=44);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// top barb 1    
translate([0,5,8]){
  difference(){
  union(){
    for(i=[0:5]){
      translate([0,0,10+i*3])
      cylinder(r1=3.6,r2=3.2,h=3,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=88);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// top barb 2
translate([0,-5,8]){
  difference(){
  union(){
    for(i=[0:5]){
      translate([0,0,10+i*3])
      cylinder(r1=3.6,r2=3.2,h=3,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=88);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// Y block
difference(){
  hull(){
    color("red")
    translate([0,5,17])
    cylinder(r=5,h=1.0,$fn=88);
    color("green")
    translate([0,-5,17])
    cylinder(r=5,h=1.0,$fn=88);
    color("cyan")
    translate([0,0,8])
    cylinder(r=5,h=1.0,$fn=88);
  }
  // inside cuts
  hull(){
    color("red")
    translate([0,5,18.0])
    cylinder(r=1.6,h=0.01,$fn=88);
    color("cyan")
    translate([0,0,7.99])
    cylinder(r=1.6,h=0.01,$fn=88);
  }
  hull(){
    color("red")
    translate([0,-5,18.0])
    cylinder(r=1.6,h=0.01,$fn=88);
    color("cyan")
    translate([0,0,7.99])
    cylinder(r=1.6,h=0.01,$fn=88);
  }
}


}

//------------------------------------------------
module splitblock(){
  
// bottom barb
color("orange")
translate([0,0,18]){
mirror([0,0,1])
  difference(){
  union(){
    for(i=[0:11]){
      translate([0,0,10+i*1.5])
      cylinder(r1=3.6,r2=3.2,h=1.5,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=44);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// top barb 1    
translate([0,5,8]){
  difference(){
  union(){
    for(i=[0:11]){
      translate([0,0,10+i*1.5])
      cylinder(r1=3.6,r2=3.2,h=1.5,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=88);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// top barb 2
translate([0,-5,8]){
  difference(){
  union(){
    for(i=[0:11]){
      translate([0,0,10+i*1.5])
      cylinder(r1=3.6,r2=3.2,h=1.5,$fn=88);
    }
    translate([0,0,28])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
    translate([0,0,10])
    cylinder(r1=5,r2=2.5,h=3,$fn=88);
  }
  translate([0,0,9])
  cylinder(r=1.6,h=20,$fn=88);
  translate([0,0,28])
  cylinder(r1=1.6,r2=2.3,h=1,$fn=44);
  }
}

// Y block
difference(){
  hull(){
    color("red")
    translate([0,5,17])
    cylinder(r=5,h=1.0,$fn=88);
    color("green")
    translate([0,-5,17])
    cylinder(r=5,h=1.0,$fn=88);
    color("cyan")
    translate([0,0,8])
    cylinder(r=5,h=1.0,$fn=88);
  }
  // inside cuts
  hull(){
    color("red")
    translate([0,5,18.0])
    cylinder(r=1.6,h=0.01,$fn=88);
    color("cyan")
    translate([0,0,7.99])
    cylinder(r=1.6,h=0.01,$fn=88);
  }
  hull(){
    color("red")
    translate([0,-5,18.0])
    cylinder(r=1.6,h=0.01,$fn=88);
    color("cyan")
    translate([0,0,7.99])
    cylinder(r=1.6,h=0.01,$fn=88);
  }
}


}

//------------------------------------------------------
module funnel(){

      difference(){
        union(){
          translate([0,-15,-6])
          cylinder(r=2.5,h=16,$fn=88);
          translate([0,-15,4])
          metric_thread (diameter=7.5, pitch=2, length=8);
          translate([0,-15,10])
          cylinder(r1=2.8,r2=10.0,h=11,$fn=88);
          translate([0,-15,21])
          cylinder(r=10.0,h=15,$fn=88);
        }
        color("cyan")
        translate([0,-15,-7])
        cylinder(r=1.6,h=18,$fn=88);

        translate([0,-15,9.99])
        cylinder(r1=1.6,r2=9.0,h=11.1,$fn=88);

        translate([0,-15,20.99])
        cylinder(r=9.0,h=15.2,$fn=88);
      }
}
//--------------------------------------------------
// tray on top of extruder motor to catch any drips from the quick
// connect fitting of the coolant lines
module driptray(){

difference(){
  cube([34,27.5,3.0]);

  translate([0.45,0.45,0.8])
  cube([34-0.9,27.5-0.9,3]);
}
translate([0,-2,0])
cube([8,2.5,3]);
translate([34-8,-2,0])
cube([8,2.5,3]);

}

//=========================================

//driptray();
 
//reservoir();

//bottomplug();

bottomplug2();    // A repair where original bottomplug broke off

//topplug();
//topbarb();

//fillercap();

//funnel();

// add support for printing splitblock
if(0){
difference(){
union(){
  // base plate
  translate([0,0,-7.8-3])
  cube([10,10,0.4],center=true);
  // fins
  translate([-5,-0.4,-8-3])
  cube([10,0.8,2.5]);
  translate([-0.4,-5,-8-3])
  cube([0.8,10,2.5]);
}
 translate([0,0,-9-3])
 cylinder(r=3,h=9,$fn=88);
}
}

//splitblock();


// cutaway for splitblock
if(0){
difference(){
splitblock();
translate([0,-10,-15])
cube([20,20,60]);
}
}



// cutaway
if(0){
  difference(){
    union(){
      //translate([0,-15,47])
      fillercap();
    //color("gray")
    //reservoir();
    //color("green")
    //translate([0,0,-5.8])
    //bottomplug();
    //color("green")
    //translate([0,0,48])
    //topplug(cut=0);
    //color("cyan")
    //translate([0,0,46])
    //rotate([0,0,180])
    //topbarb();
    }
    color("white")
    translate([-40,0,-20])
    cube([80,80,150]);
  }
}

//=========================================




