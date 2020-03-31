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

//--------------------------------------
module topplug(tol=0,cut=0){
  difference(){
    union(){
      metric_thread (diameter=24*2+tol, pitch=2, length=8);
      translate([0,0,7.5])
      cylinder(r=25,h=2,$fn=122);
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
      metric_thread(diameter=10.1, pitch=2, length=11);  
      // filler cap
      translate([0,-15,-1])
      metric_thread (diameter=8.1, pitch=2, length=11);
    }
  }
}  
//--------------------------------------
module fillercap(){

  difference(){
    union(){
      translate([0,0,3])
      metric_thread (diameter=8.1, pitch=2, length=8);
      translate([0,0,11])
      cylinder(r1=5,r2=4.5,h=1.5,$fn=88);
      translate([0,0,14])
      minkowski(){
        cube([6,1,4],center=true);
        sphere(1,$fn=44);
      }  
    }
    translate([0,0,2])
    cylinder(r1=2.0,r2=0.5,h=10,$fn=44);
    cylinder(r=0.5,h=30,$fn=22);
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
  topplug(tol=0.2,cut=1);

}  

}

//=========================================
 
//reservoir();

//bottomplug();
//topplug();
//topbarb();

fillercap();

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




