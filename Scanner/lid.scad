// lid.scad
// scanner part

F1=99;
F2=55;

use <../Parts/threads.scad>

//---------------------------------------------------------------------
module dome(Rin=91,thick=1){
  
  difference(){
    sphere(r=Rin+thick,$fn=F1);
    sphere(r=Rin,$fn=F1);
    translate([0,0,-50])
    cube([200,200,100],center=true);    
  }
}

//-------------------------------------------------------------------
// 1 = back lid
// 2 = back lid + front lip
// 3 = front lid
// 4 = front lid + front lip

module lid(type=1,tol=0){
  Rin=92;
  
  difference(){
    union(){
      // dome part
      difference(){
        dome(Rin=Rin-tol,thick=1+2*tol);
        rotate([-60,0,0])         // here is the cut angle
        translate([0,-100,50])    
        cube([200,200,100],center=true);    
        translate([0,-100,40])    
        cube([200,200,100],center=true);    
      }
      // overlapping lip
      color("green")
      translate([0,0,-2])
      difference(){
        // outer
        cylinder(r=Rin+2+tol,h=4,$fn=F1);
        // lower cut
        translate([0,0,-1])
        cylinder(r=Rin+1.2-tol,h=3,$fn=F1);
        // cut flush with innner dome
        translate([0,0,0.9])
        cylinder(r=Rin-tol,h=6,$fn=F1);
        // remove front part
        translate([0,-97,40])
        cube([200,200,100],center=true);    
      }
      if(type==2){
        // add front lip
        color("orange")
        rotate([30,0,0])
        translate([0,0,-2])
        difference(){
          // outer
          union(){
            cylinder(r=Rin+2+tol,h=4+tol,$fn=F1);
            translate([0,0,-1])
            cylinder(r1=Rin+1+tol,r2=Rin+2+tol,h=1,$fn=F1);
          }
          // lower cut
          translate([0,0,2])
          cylinder(r=Rin+1-tol,h=2.2,$fn=F1);
          // cut flush with innner dome
          translate([0,0,-1.5])
          cylinder(r=Rin-tol,h=6,$fn=F1);
          // remove front part
          translate([0,-97,40])
          cube([200,200,100],center=true);    
        }
      }        
    } // end union
      
    // cuts for left tower sleve
    translate([-Rin-10,0,0])
    rotate([0,90,0])
    cylinder(r=30,h=20,$fn=F2);   

    // cuts for hinge spot
    translate([Rin-5,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);
  } 
}

//---------------------------------------------------------------
// assemble lid parts to make total top
module lid2(tol=0){
  union(){
    lid(type=1,tol=tol);
    rotate([30,0,0])
    lid(type=1,tol=tol);
    rotate([60,0,0])
    lid(type=1,tol=tol);
    
    rotate([90,0,0])
    lid(type=1,tol=tol);
    rotate([120,0,0])
    lid(type=1,tol=tol);
    rotate([150,0,0])
    lid(type=2,tol=tol);
  }
}


//-----------------------------------------------------------
// single part lid
module lid3(tol=0){
  Rin=92;   // inner radius
  Rtop=10;  // radius of top peak cut
  Rflat=12; // radius of the flat top 
  T1=1.2;   // thickness for shell part
  T2=1.4;   // thickness for the lip
  F3=40;
  F4=20;

difference(){
union(){

  // lip overlapping the shell  
  if(1){
    color("cyan")
    difference(){
      // boss
      translate([0,0,-10])
      cylinder(r1=Rin+T1+T2+1,r2=Rin+T1+T2,h=13,$fn=F3);
      // taper cut
      translate([0,0,-11])
      cylinder(r1=Rin+T1+1,r2=Rin+T1+0.2,h=10,$fn=F4);
      // support cut
      translate([0,0,-1.01])
      cylinder(r1=Rin+T1+0.2,r2=Rin-0.2,h=1.1,$fn=F4);
      // center bore
      translate([0,0,-11])
      cylinder(r=Rin,h=15,$fn=F4);
    }
  }

  // upper shell
  if(1){
  difference(){
    // outer shape
    union(){
      hull(){
        difference(){
          sphere(r=Rin+T1,$fn=F3);
          
          translate([0,0,-1.5*Rin])
          cube([3*Rin,3*Rin,3*Rin],center=true);
        }
        translate([0,0,1.3*Rin])
        cylinder(r=Rflat,h=1,$fn=F4);
      }
      // reinforce the left sleve 
      difference(){
        translate([-Rin+1.8,0,0])
        rotate([0,90,0])
        cylinder(r=33,h=3,$fn=F1);  
         
        translate([0,0,-60])
        cube([200,200,100],center=true);

        // taper cut
        translate([0,0,-11])
        cylinder(r1=Rin+T1+1,r2=Rin+T1+0.2,h=10,$fn=F4);
      
      }
      // reinforce the pivot
      difference(){
        translate([Rin,0,0])
        rotate([0,90,0])
        cylinder(r=15,h=3,$fn=F2);   

        translate([0,0,-60])
        cube([200,200,100],center=true);

        // taper cut
        translate([0,0,-11])
        cylinder(r1=Rin+T1+1,r2=Rin+T1+0.2,h=10,$fn=F4);
      }
      
      // decorative arms?  ***************************************
      Narms=12;
      for(i=[0:Narms-1]){
        rotate([0,0,360/Narms*i]){
          //color("red")
          translate([10,0,1.3*Rin+2])
          rotate([0,-45+180,0])
          scale([1,3,1])
          cylinder(r=1.0,h=89,$fn=F4);
          //color("pink")
          rotate([90,0,0])
          rotate_extrude(angle=39,$fn=F3)
          translate([Rin+1.6,0,0])
          scale([1,3])
          circle(r=1.0,$fn=F4);
        }
      }
      
      
    } // end of outer union

    // inner shape for the cut
    hull(){
      difference(){
        sphere(r=Rin,$fn=F3);
        
        translate([0,0,-Rin-0.01])
        cube([2*Rin,2*Rin,2*Rin],center=true);
      }

      translate([0,0,1.15*Rin])
      sphere(r=Rtop,$fn=F4);
      }
    }
  }
}


    // cuts for left tower sleve
    hull(){
      translate([-Rin-10,0,0])
      rotate([0,90,0])
      cylinder(r=30,h=20,$fn=F2);   

      translate([-Rin-10,0,-50])
      rotate([0,90,0])
      cylinder(r=30,h=20,$fn=F2);   
    }

    // cuts for hinge spot
    hull(){
      translate([Rin-5,0,0])
      rotate([0,90,0])
      cylinder(r=12.1,h=15,$fn=F2);
      
      translate([Rin-5,0,-50])
      rotate([0,90,0])
      cylinder(r=12.1,h=15,$fn=F2);
    }
}

// add the grab-knob
if(1){
  color("cyan")
  translate([0,0,1.3*Rin])
  knob();
}



}

//----------------------------------------------------------
module knob(){
F4=222;
Rflat=12;

    difference(){
      cylinder(r=Rflat,h=16,$fn=F4);
      
      // rounded grip cut
      translate([0,0,8.5])
      scale([1,1,2])
      rotate_extrude($fn=200){
        translate([13,0])
        circle(r=3,$fn=44);
      }
      
      // threaded hole
      translate([0,0,0])
      metric_thread (diameter=10, pitch=2, length=17, leadin=3, n_starts=1);

      
    }
  
}

//------------------------------------------------------------
module endcap1(r1=16,r2=12){

difference(){
  union(){
    color("red")
    translate([0,0,0])
    cylinder(r=r1,h=3,$fn=44);
      
    color("blue")
    translate([0,0,3])
    cylinder(r=r2,h=2.5,$fn=44);

    color("green")
    translate([0,0,5.5])
    cylinder(r=r1,h=3,$fn=44);
  }
  translate([-1.5*r1-2,0,0])
  cube([3*r1,3*r1,40],center=true);
  
  // center hole
  translate([0,0,-1])
  cylinder(r=r2-2,h=14);
  }
}


//==============================================================

// the single part lid
lid3(tol=0);

// add adhesion feet for printing
if(1){
  color("pink")
  for(i=[1:8]){
    rotate([0,0,360/8*i+180/8])
  translate([94,0,-10])
  cylinder(r=6,h=0.6);
}
}

// the whole lid
//lid2(tol=0.2);

// for assembly
/*
endcap1();
translate([30,0,0])
endcap1(r1=34,r2=30);
*/

// just the sections
//lid(type=1);
// printing support for the lip
if(0){
  Rin=92;
  color("pink")
  translate([0,0,-2])
  difference(){
    cylinder(r=Rin+1,h=2,$fn=F1);
    translate([0,0,-1])
    cylinder(r=Rin,h=4,$fn=F1);
    translate([0,-97,40])
    cube([200,200,100],center=true);    
  }
}

//lid(type=2);


//=========================================================
