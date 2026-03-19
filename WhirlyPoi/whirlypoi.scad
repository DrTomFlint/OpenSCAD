//======================================================================
// whirlypoi.scad
//
//
// DrTomFlint 14 March 2026
//======================================================================

use <../Parts/threads.scad>

thick=1.2;    // thickness of holder walls

rshaft = 7/2;
zshaft = 40;
//~ ywing = 200;
ywing = 270;

F1=299;
F2=155;

// axle 
alen = 40;
athick = 2;
tangle=45;


// whirly1
wlen = 88;
wthick = 3*0.15;

Version="B";

//----------------------------------------------------------------------
module wing1(tol=0){

  difference(){
    union(){
      translate([rshaft+thick,0,-zshaft/2])
      cube([1*thick,ywing,1.5*thick]);
      translate([0,0,0])
      cylinder(r=rshaft+thick+tol,h=zshaft,$fn=F1,center=true);
      // ring
      translate([rshaft+thick,25,-zshaft/2])
      rotate([0,90,0])
      cylinder(r=24.5/2+thick,h=2*thick,$fn=F1,center=true);
      // wing
      hull(){
        translate([rshaft+tol,0,-zshaft/2])
        cube([thick,rshaft,zshaft]);
        difference(){
          translate([rshaft+tol,ywing,-zshaft/2])
          rotate([0,90,0])
          cylinder(r=4,h=thick,$fn=F1);
          translate([rshaft+tol,ywing-20,-zshaft/2-40])
          cube([40,40,40]);
        }
      }
    }
    // cut for shaft
    cylinder(r=rshaft+tol,h=zshaft+100,$fn=F1,center=true);      
    // main slot
    translate([-0.4*rshaft,0,-zshaft/2-10/2])
    cube([1.2*rshaft,ywing,zshaft+20]);
    // remove lower lip
    translate([0,0,-zshaft/2-20])
    cube([60,60,20]);


    translate([0,ywing,18])
    scale([1,5.75,1])
    rotate([0,90,0])
    cylinder(r=34,h=5*rshaft,$fn=F1,center=true);

    translate([0,25,-zshaft/2])
    rotate([0,90,0])
    cylinder(r=24.5/2,h=5*rshaft,$fn=F1,center=true);
  }
  
}

//----------------------------------------------------------------------
module wing2(tol=0){

  difference(){
    union(){
      // add a manual raft
      translate([-7,-8,-zshaft/2])
      cube([20,16,2*0.24]);
      
      // footer
      hull(){
        translate([rshaft+0,0,-zshaft/2])
        sphere(r=3,$fn=F2);
        translate([rshaft+0,ywing+1,-zshaft/2])
        sphere(r=3,$fn=F2);
      }
      
      // vertical pipe
      translate([0,0,0])
      cylinder(r=rshaft+thick+tol,h=zshaft,$fn=F1,center=true);
      // coin hole ring
      translate([rshaft+thick,20,-zshaft/2])
      scale([1,1,1.1])
      rotate([0,90,0])
      cylinder(r=24.5/2+2*thick,h=4*thick,$fn=F1,center=true);
      // wing
      hull(){
        translate([rshaft+tol-thick,0,-zshaft/2])
        cube([2*thick,rshaft,zshaft]);
        difference(){
          translate([rshaft+tol-1,ywing,-zshaft/2])
          rotate([0,90,0])
          cylinder(r=4,h=thick,$fn=F1);
          translate([rshaft+tol,ywing-20,-zshaft/2-40])
          cube([40,40,40]);
        }
      }
    }
    // cut for shaft
    cylinder(r=rshaft+tol,h=zshaft+100,$fn=F1,center=true);      
    // main slot
    translate([-0.4*rshaft,0,-zshaft/2-10/2])
    cube([1.2*rshaft,ywing+5,zshaft+20]);
    // remove lower lip
    translate([-20,-20,-zshaft/2-20])
    cube([60,350,20]);

    // top cut
    //~ translate([0,ywing,18])
    //~ scale([1,5.75,1])
    //~ rotate([0,90,0])
    //~ cylinder(r=34,h=5*rshaft,$fn=F1,center=true);
    translate([0,ywing,20])
    scale([1,7.8,1])
    rotate([0,90,0])
    cylinder(r=34,h=5*rshaft,$fn=F1,center=true);

    // coin hole
    translate([0,20,-zshaft/2])
    scale([1,1,1.1])
    rotate([0,90,0])
    cylinder(r=24.5/2,h=5*rshaft,$fn=F1,center=true);
  }
  
   
}

//----------------------------------------------------------------------
module bearing(tol=0.15){

  rotate([0,90,0])
  difference(){
    cylinder(r=12.0/2+tol,h=3.5+tol,center=true,$fn=F2);
    cylinder(r=7.9/2-tol,h=3.5+2*tol,center=true,$fn=F2);
    
  }
}

//----------------------------------------------------------------------
module bearing2(tol=0.15){

  rotate([0,90,0])
  difference(){
    cylinder(r=22.0/2+tol,h=7+tol,center=true,$fn=F2);
    cylinder(r=8/2-tol,h=3.5+2*tol,center=true,$fn=F2);
    
  }
}

//----------------------------------------------------------------------
module roller(tol=0.15){

  difference(){
    union(){
      rotate([0,90,0])
      cylinder(r=12.0/2+athick,h=alen+3.5,center=true,$fn=F2);
      translate([alen/2+athick/2-2.25,0,0])
      rotate([0,90,0])
      cylinder(r1=6+athick,r2=6+athick+6,h=6,center=true,$fn=F2);
      translate([-(alen/2+athick/2-2.25),0,0])
      rotate([0,90,0])
      cylinder(r2=6+athick,r1=6+athick+6,h=6,center=true,$fn=F2);
    }
    rotate([0,90,0])
    cylinder(r=5,h=alen+3.5+2*tol,center=true,$fn=F2);

    translate([alen/2,0,0])
    bearing();
    translate([-alen/2,0,0])
    bearing();
  }
  
    // center tabs
    translate([-alen/2-2,0,0])
    rotate([0,-90,0])
    for (i=[0:7]){
      rotate([0,0,45*i-30])
      translate([0.13*wlen,0,0.75])
      cylinder(r1=1.9,r2=2.1,h=3,$fn=F2,center=true);
    }

    // tip tabs
    translate([alen/2+2,0,0])
    rotate([0,-90,0])
    for (i=[0:7]){
      rotate([0,0,45*i-30])
      translate([0.13*wlen,0,-0.5])
      cylinder(r2=1.9,r1=2.1,h=2,$fn=F2,center=true);
      
      
    }
  
  
}


//----------------------------------------------------------------------
module axle(tol=0.15){

  difference(){
    union(){
      // main shaft
      translate([0,0,0])
      rotate([0,90,0])
      cylinder(r=7.9/2-tol+0.5,h=alen+3.5+0,center=true,$fn=F2);

      // front side washer
      translate([alen/2+3.5/2+7/2,0,0])
      rotate([0,90,0])
      cylinder(r1=9.5/2+tol,r2=9.5/2+2,h=7,center=true,$fn=F2);

      // front side button
      translate([alen/2+3.5/2+5/2+9/2+4,0,0])
      rotate([0,90,0])
      cylinder(r1=14,r2=12,h=9,center=true,$fn=F2);
      
      
      translate([-alen/2,0,0])
      rotate([0,-90,0])
      //~ mirror([1,0,0])
      metric_thread (diameter=6.5, pitch=3, length=15, internal=false, n_starts=1,
                      thread_size=-1, groove=false, square=false, rectangle=0,
                      angle=tangle, taper=0, leadin=2, leadfac=1.0, test=false);
    }
    
    translate([alen/2+12,0,0])
    rotate([0,90,0])
    for(i=[0:5]){
      rotate([0,0,360/6*i])
      translate([17,0,0])
      cylinder(r1=6,r2=7,h=15,center=true, $fn=F2);
    }      
    
    // Center bore
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=0.5,h=10*alen,center=true,$fn=F2);

    // cut for bearings
    translate([alen/2,0,0])
    bearing(tol=0.2);
    translate([-alen/2,0,0])
    bearing(tol=0.2);

  }
}

//----------------------------------------------------------------------
module handle(tol=0.15){

    difference(){
      union(){
        translate([-alen/2-5/2-3.5/2-2,0,0])
        rotate([0,-90,0])
        cylinder(r1=9.5/2+tol,r2=9.5/2+2,h=9,$fn=F2,center=true);
      
        translate([-alen/2-7/2-8-9,0,0])
        rotate([0,-90,0])
        cylinder(r=7,h=20,$fn=F2,center=true);
        translate([-alen/2-7/2-5-14-10+2,0,0])
        sphere(r=7,$fn=F2);

        translate([-alen/2-7/2-13,0,0])
        rotate([0,-90,0])
        cylinder(r1=14,r2=14-10,h=10,$fn=F2,center=true);

        translate([-alen/2-7/2-7,0,0])
        rotate([0,-90,0])
        cylinder(r=14,h=2,$fn=F2,center=true);


        translate([-10,0,0])
        hull(){
          translate([-alen/2-7/2-5-12,0,10])
          sphere(r=6,$fn=F2);

          translate([-alen/2-7/2-5-12,0,-10])
          sphere(r=6.5,$fn=F2);
        }
      }
      translate([-alen/2-0,0,0])
      rotate([0,-90,0])
      //~ mirror([1,0,0])
      metric_thread (diameter=7, pitch=3, length=30, internal=true, n_starts=1,
                      thread_size=-1, groove=false, square=false, rectangle=0,
                      angle=tangle, taper=0, leadin=0, leadfac=1.0, test=false);


          translate([-alen/2-7/2-5-12-10,0,0])
          cylinder(r1=rshaft+0.4,r2=rshaft-0.4,h=40,$fn=F2,center=true);
    }
    



}

//----------------------------------------------------------------------
module whirly1(tol=0.15){
  

  difference(){
    hull(){
      for (i=[0:3]){
        rotate([0,0,90*i+45])
        translate([wlen,0,0])
        cylinder(r=12,h=wthick,$fn=F2);
      }  
    }


    for (i=[0:3]){
      rotate([0,0,90*i])
      translate([0,0,-1])
      cutter1();
    }

    //~ for (i=[0:3]){
      //~ rotate([0,0,90*i+50])
      //~ translate([wlen,0,0])
      //~ #cylinder(r=4,h=10,center=true);
    //~ }
  }
}

//----------------------------------------------------------------------
module cutter1(){

mag=0.1;
thick=3;

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,3])
    surface(file="./Whirly1.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module whirly2(tol=0.15){
  

  difference(){
    hull(){
      for (i=[0:3]){
        rotate([0,0,90*i+45])
        translate([wlen,0,0])
        cylinder(r=12,h=wthick,$fn=F2);
      }  
    }


    for (i=[0:3]){
      rotate([0,0,90*i])
      translate([0,0,-1])
      cutter2();
    }

    // tip tabs
    for (i=[0:3]){
      rotate([0,0,90*i+59])
      translate([0.93*wlen,0,0])
      cylinder(r=2,h=10,$fn=F2,center=true);
    }
    
    // center hole
    cylinder(r=7,h=10,$fn=F2,center=true);
    
    // center tabs
    for (i=[0:7]){
      rotate([0,0,45*i+30])
      translate([0.13*wlen,0,0])
      cylinder(r=2,h=10,$fn=F2,center=true);
    }
    
  }
}

//----------------------------------------------------------------------
module cutter2(){

mag=0.1;
thick=3;

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,3])
    surface(file="./Whirly2.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}
//----------------------------------------------------------------------
module whirly3(tol=0.15){
  
  difference(){
    hull(){
      for (i=[0:3]){
        rotate([0,0,90*i+45])
        translate([wlen+21,0,0])
        cylinder(r=12,h=wthick,$fn=F2);
      }  
    }

    for (i=[0:3]){
      rotate([0,0,90*i])
      translate([0,0,-1])
      cutter3();
    }

    // tip tabs
    for (i=[0:3]){
      rotate([0,0,90*i+59])
      translate([0.93*wlen,0,0])
      cylinder(r=2,h=10,$fn=F2,center=true);
    }
    
    // center hole
    cylinder(r=7,h=10,$fn=F2,center=true);
    
    // center tabs
    for (i=[0:7]){
      rotate([0,0,45*i+30])
      translate([0.13*wlen,0,0])
      cylinder(r=2,h=10,$fn=F2,center=true);
    }
    
  }
}

//----------------------------------------------------------------------
module cutter3(){

mag=0.1;
thick=3;

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,3])
    surface(file="./Whirly3.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module whirly1a(tol=0.15){

  difference(){
    whirly1();
    
    translate([0,0,-1])
    linear_extrude(height=3)
    offset(r=-2)
    projection()
    whirly1();
  }
  
}  

//----------------------------------------------------------------------
module whirly1b(tol=0.15){

  difference(){
    whirly1();
    whirly1a();
  }
  
}  

//----------------------------------------------------------------------
module whirly1c(tol=0.15){

  difference(){
    whirly1();
    whirly1a();
    
    for (i=[0:3]){
      rotate([0,0,90*i+30])
      translate([20,0,0])
      rotate([0,0,20])
      scale([2,1,1])
      cylinder(r=20,h=wthick,$fn=F2);
    }
  }
  
}  

//----------------------------------------------------------------------
module whirly1d(tol=0.15){

  intersection(){
    difference(){
      whirly1();
      whirly1a();

      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=13,h=wthick,$fn=F2);
      }
    }

    union(){
      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=20,h=wthick,$fn=F2);
      }
    }
  }
}  

//----------------------------------------------------------------------
module whirly1e(tol=0.15){

  intersection(){
    difference(){
      whirly1();
      whirly1a();

    }

    union(){
      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=13,h=wthick,$fn=F2);
      }
    }
  }
}  

//----------------------------------------------------------------------
module whirly2a(tol=0.15){

  intersection(){
    whirly2();
    
    translate([-100,-100,0])
    cube([200,200,0.15]);
  }
  
}  

//----------------------------------------------------------------------
module whirly2b(tol=0.15){

  intersection(){
    whirly2();
    
    translate([-100,-100,0.15])
    cube([200,200,0.15]);
  }
}  

//----------------------------------------------------------------------
module whirly2b1(tol=0.15){


  difference(){
    whirly2b();
    
    translate([0,0,-1])
    linear_extrude(height=3)
    offset(r=-2)
    projection()
    whirly2b();
  }
}

//----------------------------------------------------------------------
module whirly2b2(tol=0.15){


  intersection(){
    whirly2b();
    
    translate([0,0,-1])
    linear_extrude(height=3)
    offset(r=-2)
    projection()
    whirly2b();
  }
}

//----------------------------------------------------------------------
module whirly2c(tol=0.15){

  intersection(){
    whirly2();
    
    translate([-100,-100,0.30])
    cube([200,200,0.15]);
  }
}  

//----------------------------------------------------------------------
module whirly2d(tol=0.15){

  difference(){
    whirly2b2();
    
    for (i=[0:3]){
      rotate([0,0,90*i+30])
      translate([20,0,0])
      rotate([0,0,20])
      scale([2,1,1])
      cylinder(r=20,h=wthick,$fn=F2);
    }
  }

 }  

//----------------------------------------------------------------------
module whirly2e(tol=0.15){

 intersection(){
    difference(){
      whirly2b2();

      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=13,h=wthick,$fn=F2);
      }
    }

    union(){
      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=20,h=wthick,$fn=F2);
      }
    }
  }
}  

//----------------------------------------------------------------------
module whirly2f(tol=0.15){

 intersection(){
    difference(){
      whirly2b2();

    }

    union(){
      for (i=[0:3]){
        rotate([0,0,90*i+30])
        translate([20,0,0])
        rotate([0,0,20])
        scale([2,1,1])
        cylinder(r=13,h=wthick,$fn=F2);
      }
    }
  }
}  

//----------------------------------------------------------------------
module rollerA(tol=0.25){

    intersection(){
      roller();
      
      union(){
        rotate([0,90,0])
        cylinder(r=40,h=24,center=true,$fn=8);
        rotate([0,90,0])
        cylinder(r=6.75-tol,h=32-tol,center=true,$fn=8);
      }
    }
    
}

//----------------------------------------------------------------------
module rollerB(tol=0.15){

    difference(){
      roller();
      
      union(){
        rotate([0,90,0])
        cylinder(r=40,h=24,center=true,$fn=8);
        rotate([0,90,0])
        cylinder(r=6.75,h=32,center=true,$fn=8);
      }
      
      translate([50,0,0])
      cube([100,100,100],center=true);
    }
    
}
//----------------------------------------------------------------------
module rollerC(tol=0.15){

    difference(){
      roller();
      
      union(){
        rotate([0,90,0])
        cylinder(r=40,h=24,center=true,$fn=8);
        rotate([0,90,0])
        cylinder(r=6.75,h=32,center=true,$fn=8);
      }
      
      translate([-50,0,0])
      cube([100,100,100],center=true);
    }
    
}

//----------------------------------------------------------------------
module axleA(tol=0.15){

    difference(){
      axle();
            
      translate([51.7+alen/2,0,0])
      cube([100,100,100],center=true);
    }
    
    difference(){
      translate([alen/2+16,0,0])
      rotate([0,-90,0])
      //~ mirror([1,0,0])
      metric_thread (diameter=6.5, pitch=3, length=20, internal=false, n_starts=1,
                        thread_size=-1, groove=false, square=false, rectangle=0,
                        angle=tangle, taper=0, leadin=2, leadfac=1.0, test=false);

      // Center bore
      translate([0,0,0])
      rotate([0,90,0])
      cylinder(r=0.5,h=10*alen,center=true,$fn=F2);
    }
}

//----------------------------------------------------------------------
module axleB(tol=0.15){

    difference(){
      axle();
            
      translate([-50+alen/2+2,0,0])
      cube([100,100,100],center=true);

      translate([alen/2+20,0,0])
      rotate([0,-90,0])
      rotate([0,0,90])
      //~ mirror([1,0,0])
      metric_thread (diameter=7, pitch=3, length=20, internal=true, n_starts=1,
                        thread_size=-1, groove=false, square=false, rectangle=0,
                        angle=tangle, taper=0, leadin=2, leadfac=1.0, test=false);

}
    
    
    
}
//======================================================================

//~ wing1();
//~ translate([15,0,0])
//~ mirror([1,0,0])
//~ wing1();

//~ wing2();
//~ translate([rshaft+thick-0.6,56,-10])
//~ rotate([0,90,0])
//~ rotate([0,0,90])
//~ linear_extrude(height=0.8)
//~ text("Flint's", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);


//~ translate([18,0,0])
//~ mirror([1,0,0])
//~ wing2();
//~ mirror([1,0,0])
//~ translate([rshaft+thick+0.2-18,56,-10])
//~ rotate([0,-90,0])
//~ rotate([0,0,90])
//~ linear_extrude(height=0.8)
//~ text("Finest", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);


//~ bearing();
//~ cutter1();

//~ cutter1b();
//~ cutter2();


//~ whirly1();

//~ translate([-alen/2-2-0.4,0,0])
//~ rotate([0,90,0])
//~ whirly2();

//~ whirly2a();
//~ whirly2b();
//~ whirly2b1();
//~ whirly2b2();

//~ whirly2c();

//~ whirly2d();
//~ whirly2e();
//~ whirly2f();

//~ translate([-alen/2-2-0.4,0,0])
//~ rotate([0,90,0])
//~ translate([0,0,-0.5])
//~ rotate([0,0,45])
//~ whirly2();


//~ translate([0,0,0.25])
//~ rotate([0,0,45])
//~ whirly2();

//~ whirly3();

//~ whirly1b();

//~ whirly1a();
//~ whirly1c();
//~ whirly1d();
//~ whirly1e();

difference(){
  union(){

    //~ roller();
    rollerA();
    rollerB();
    rollerC();
    //~ translate([0,20,0])
    //~ axle();
    axleA();
    axleB();
    translate([-0.1,0,0])
    handle();

    translate([alen/2,0,0])
    bearing(tol=0);
    translate([-alen/2,0,0])
    bearing(tol=0);

  }
  translate([0,-50,0])
  cube([200,100,100],center=true);
}


//======================================================================
