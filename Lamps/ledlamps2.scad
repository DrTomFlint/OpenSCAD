// ledlamps1.scad
// Mounts to place chandelier crystals in front of cheap led lights
use <../Fractals/Lsystem.scad>

F1=88;
F2=22;




  // xtal, leds, retainer wire
  z1=4+2;   // height of crystal base
  z2=5;   // base to led z
  y1=4.5;   // y offset for leds
  a1=20;  // angle to tilt leds +=up
  rb=1.3/2;   // radius of brass wire
  rc=1.5;       // radius of cut for xtal hole, brass wire
  leg=6;
  t1=0.2;   // tol on xtral
  t2=0.25;  // tol on led
  
  
  rfoot=4;
  hfoot=3;
  rmid=6;
  hmid=8;
  rtop=8;
  htop=5;
  rlip=7;
  
  F3=88; // sides on foot
  s1=1.5;   // scaling in Y


// ----------------------------------------------------------
module xa(tol=0,hole=1,type=1){
  xtal(r1=3.3,zt=-4,r2=7,z2=21,r3=0,z3=31.6,tol=tol,hole=hole,type=type);
}

// ----------------------------------------------------------
module xb(tol=0,hole=1,type=2){
  xtal(r1=1.7,zt=-4,r2=11.5,z2=31,r3=6,z3=45,tol=tol,hole=hole,type=type);
}
  
// ----------------------------------------------------------
module xc(tol=0,hole=1,type=3){
  xtal(r1=1.7,zt=-4,r2=12.3,z2=15,r3=0,z3=23,tol=tol,hole=hole,type=type);
}
  
// ----------------------------------------------------------
module xd(tol=0,hole=2,type=4){
  xtal(r1=0.2,zt=-2,r2=3.5,z2=11,r3=9,z3=26,tol=tol,hole=hole,type=type);

}
  
// ----------------------------------------------------------
module xtal(
r1=3.3,
zt=-4,
r2=7,
z2=21,
r3=0,
z3=31.6,
hole=1,
tol=0,
type=1){

difference(){
  union(){
    if(type!=2){
    // base
    translate([0,0,zt-tol])
    rotate([0,0,180/8])
    cylinder(r1=r1+tol,r2=r2+tol,h=z2-zt+tol,$fn=8);
    }
    if(type==2){
    // base
    translate([0,0,zt-tol])
    //rotate([0,0,180/8])
    cylinder(r1=r1+tol,r2=r2+tol,h=z2-zt+tol,$fn=8);
    }
    if(type==4){
      rotate([0,0,180/8])
      rotate([90,0,0])
      cylinder(r=3.3+tol,h=2.6+tol,$fn=27,center=true);
    }
  }
  // the string hole
  if(hole){
    rotate([90,0,0])
    cylinder(r=1.3,h=20,$fn=23,center=true);
  }
}  
  // crown
  if(type!=4){
    translate([0,0,z2])
    cylinder(r1=r2+tol,r2=r3+tol,h=z3-z2+tol,$fn=8);
  }
  if(type==4){
    translate([0,0,z2])
    rotate([0,0,180/8])
    cylinder(r1=r2+tol,r2=r3+tol,h=z3-z2+tol,$fn=8);
  }
  // extra on type D
  if(type==4){
    translate([0,0,z3])
    cylinder(r1=r3,r2=0,h=18,$fn=8);
  }


}


//-----------------------------
module led1(tol=0,legs=0){
translate([-3,0,-0.5]){
  
hull(){
  translate([1,-1,0])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1,-1,1])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1.5,0,0.75])
  scale([1.5,1.5,1.25])
  sphere(r=tol+1,$fn=44);
}
hull(){
  translate([1,,1,0])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1,1,1])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1.5,0,0.75])
  scale([1.5,1.5,1.25])
  sphere(r=tol+1,$fn=44);
}

if(legs>01){
  
  translate([1,-1,0])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);

  translate([1,-1,1])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);
  translate([1,,1,0])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);

  translate([1,1,1])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);
} 
} // extra translate 
}

//--------------------------------------------
module basecuts(){

  // cuts for xtal, leds, retainer wire
  union(){
    // left led
    translate([0,y1,z1+z2])
    rotate([-a1,0,0])
    rotate([0,0,-90])
    led1(tol=t2,legs=leg);
    // right led
    translate([0,-y1,z1+z2])
    rotate([a1,0,0])
    rotate([0,0,90])
    led1(tol=t2,legs=leg);
    // crystal type1
    translate([0,0,z1])
    xa(tol=t1);
    // cut for brass retainer wire
    translate([0,0,z1])
    rotate([90,0,0])
    scale([1,1.2,1])
    cylinder(r=rc,h=26,$fn=12,center=true);
    // cut for light
    //color("cyan")
    translate([0,0,z1+z2])
    rotate([90,0,0])
    scale([1,1.2,1])
    cylinder(r=2,h=13,$fn=12,center=true);
    
  }
    
}
//--------------------------------------------
module basecuts2(){
t2=0.2;
  // cuts for xtal, leds, retainer wire
  union(){
    // led
    translate([0,0,0])
    rotate([0,-90,0])
    led1(tol=t2,legs=leg);
    // cut for light    
    translate([0,0,-1])
    scale([0.5,1,1])
    cylinder(r1=2,r2=4,h=3,$fn=88);
    
  }
    
}
//-----------------------------------------
module mid1(){
  
  difference(){
    union(){
      translate([-0.5,0,-4])
      cube([4,8,8],center=true);
      translate([1,0,2])
      cube([8,10,4],center=true);
    }
    
    basecuts2();
    translate([1.25,0,0])
    basecuts2();
    
    mid2(tol=0.15);
    
  }


}
//-----------------------------------------
module mid1cut(){
  
    union(){
      translate([-0.5,0,-4])
      cube([4,8,8],center=true);
      translate([1,0,2])
      cube([8,10,4],center=true);
    }


}
//-----------------------------------------
module front1(){
  
  difference(){
    union(){
      translate([-0.5,0,-4])
      cube([4,20,8],center=true);
      translate([1,0,2])
      cube([8,20,4],center=true);
    }
    
    // led
    translate([0,3,-3])
    rotate([90,0,0])
    rotate([0,-90,0])
    led1(tol=t2,legs=leg);
    // led
    translate([0,-3,-3])
    rotate([-90,0,0])
    rotate([0,-90,0])
    led1(tol=t2,legs=leg);
    // led
    translate([0.5,3,-3])
    rotate([90,0,0])
    rotate([0,-90,0])
    led1(tol=t2,legs=leg);
    // led
    translate([0.5,-3,-3])
    rotate([-90,0,0])
    rotate([0,-90,0])
    led1(tol=t2,legs=leg);
    
    // cut for light    
    translate([-1,0,-3])
    rotate([90,0,0])
    cylinder(r=5,h=10,$fn=22,center=true);
    
    front2(tol=0.15);
    
  }


}

//-----------------------------------------
module front1cut(){
  
    union(){
      translate([-0.5,0,-4])
      cube([4,8,8],center=true);
      translate([1,0,2])
      cube([8,10,4],center=true);
    }


}
//------------------------------------------------------
module front2(tol=0){
  
    translate([2.5,0,-3])
    cube([2+tol,15+tol,10+6+tol],center=true);
    
    translate([0,0,4.5])
    cube([3.5+tol,9+tol,7+tol],center=true);
    
    translate([1.5,0,4])
    rotate([0,90,0])
    cylinder(r1=15/2,r2=6/2,h=2,$fn=66);

/*    
    translate([1.5,0,-5-4])
    rotate([0,90,0])
    scale([0.5,1,1])
    cylinder(r1=15/2,r2=6/2,h=2,$fn=66);
    */
    
    translate([0,0,16])
    scale([0.16,1,1])
    sphere(r=15,$fn=400);
}


//------------------------------------------------------
module mid2(tol=0){
  
  difference(){
  union(){
    translate([2.5,0,-1])
    cube([2+tol,7+tol,9+tol],center=true);
    translate([0,0,3.5])
    cube([3.5+tol,7+tol,6+tol],center=true);
    translate([1.5,0,4])
    rotate([0,90,0])
    cylinder(r1=7/2,r2=6/2,h=2,$fn=66);
    translate([1.5,0,-5])
    rotate([0,90,0])
    cylinder(r1=7/2,r2=6/2,h=2,$fn=66);
    
    translate([-1.75,0,10])
    rotate([0,90,0])
    cylinder(r1=7,r2=6,h=3.5,$fn=66);
    
  }
  // cut a circle
    translate([-8,0,10])
    rotate([0,90,0])
    cylinder(r=5,h=12,$fn=66);
  // cut a circle
    translate([1,0,10])
    rotate([0,90,0])
    cylinder(r=6.8,h=4,$fn=66);
  
}
    if(1){
    // add back the rose
    translate([-1.75,0,10])
    rotate([0,90,0])
    linear_extrude(height=3.5,convexity=6)
    scale([2.6,2.4])
    penrose_tiling(n=2, w=0.3);
  }
}

//------------------------------------------------------
module mid3(tol=0){
  
    translate([2.5,0,-1])
    cube([2+tol,7+tol,9+tol],center=true);
    
    translate([0,0,4.0])
    cube([3.5+tol,6+tol,7+tol],center=true);
    
    translate([1.5,0,4])
    rotate([0,90,0])
    cylinder(r1=7/2,r2=6/2,h=2,$fn=66);
    
    translate([1.5,0,-5])
    rotate([0,90,0])
    cylinder(r1=7/2,r2=6/2,h=2,$fn=66);
    
    translate([0,0,10])
    //rotate([0,15,0])
    scale([0.38,1,1])
    sphere(r=5,$fn=88);
  
}

//---------------------------------------------
module base1(){
  
  // lower boss
  difference(){
  union(){
    // foot
    scale([1,s1,1])
    rotate([0,0,180/F3])
    cylinder(r1=rfoot,r2=rmid,h=hfoot,$fn=F3);


  }
  basecuts();
}


  
}
//---------------------------------------------
module base2(){
  
  // lower boss
  difference(){
  union(){
    // mid
    translate([0,0,hfoot])
    scale([1,s1,1])
    rotate([0,0,180/F3])
    cylinder(r1=rmid,r2=rtop,h=hmid,$fn=F3);
    
    // add a lip around xtal
    translate([0,0,hfoot+hmid])
    rotate([0,0,180/F3])
    cylinder(r1=7,r2=6.5,h=1.5,$fn=F3);


  }
  basecuts();

    // left led
    translate([0,y1,z1+z2+1])
    rotate([-a1,0,0])
    rotate([0,0,-90])
    led1(tol=t2,legs=leg);
    // right led
    translate([0,-y1,z1+z2+1])
    rotate([a1,0,0])
    rotate([0,0,90])
    led1(tol=t2,legs=leg);

}


  
}

//---------------------------------------------
module top2(){
  

  // top fastens the led in the pocket, xtal holds it down
  difference(){
    union(){
      // top
      translate([0,0,hfoot+hmid])
      scale([1,s1,1])
      rotate([0,0,180/F3])
      cylinder(r1=rtop,r2=rlip,h=htop,$fn=F3);
    }
    basecuts();
    // add a lip around xtal
    translate([0,0,hfoot+hmid-0.01])
    rotate([0,0,180/F3])
    cylinder(r1=7+0.25,r2=6.5+0.25,h=1.5+0.25,$fn=F3);
  }

}

//---------------------------------------------
module top3(type=1){
  

  // top fastens the led in the pocket, xtal holds it down
  difference(){
    union(){
      // top
      translate([0,0,hfoot+hmid])
      scale([1,s1,1])
      rotate([0,0,180/F3])
      cylinder(r1=rtop,r2=rlip,h=htop+2,$fn=88);
      
      // fancy 
      if(type!=2){
      hull(){
        translate([4,-10,hfoot+hmid+5])
        sphere(r=5,$fn=88);
        translate([-10,-22,hfoot+hmid+12])
        sphere(r=1,$fn=88);
      }
    }
    if(type!=3){
      hull(){
        translate([4,10,hfoot+hmid+5])
        sphere(r=5,$fn=88);
        translate([-10,22,hfoot+hmid+12])
        sphere(r=1,$fn=88);
      }
    }
      // front balls
        translate([7,3,hfoot+hmid+4])
        sphere(r=3.5,$fn=88);
        translate([7,-3,hfoot+hmid+4])
        sphere(r=3.5,$fn=88);
      
    }
    basecuts();
    // add a lip around xtal
    translate([0,0,hfoot+hmid-0.01])
    rotate([0,0,180/F3])
    cylinder(r1=7+0.25,r2=6.5+0.25,h=1.5+0.25,$fn=F3);
  }

}

//-------------------------------------------
module ledbattery(tol=0){


  // boss
  cube([6+tol,40+tol,23.8+tol]);
  // rounded end of boss
  translate([0,40,23.8/2])
  rotate([0,90,0])
  cylinder(r=23.8/2+tol/2,h=6+tol,$fn=88);
  
  // wires
  translate([3,0,3.5])
  rotate([90,0,0])
  cylinder(r=1+tol,h=6,$fn=22);
  translate([3,0,5.5])
  rotate([90,0,0])
  cylinder(r=1+tol,h=6,$fn=22);
  
  // switch
  translate([2,-4,11])
  cube([2+tol,4+tol,6+tol]);
}

//-------------------------------------------
module ledbattery2(tol=0){


  difference(){
    union(){
    // boss
    cube([6+tol,18.4+tol,23.8+tol]);

    // rounded end of boss
    translate([0,18,23.8/2])
    rotate([0,90,0])
    cylinder(r=23.8/2+tol/2,h=7.3+1+tol,$fn=88);
    // rounded end of boss
    translate([7.3+1,18,23.8/2])
    rotate([0,90,0])
    cylinder(r1=23.8/2+tol/2,r2=22/2,h=1+tol,$fn=88);
/*    
    // wires
    translate([3,0,3.5])
    rotate([90,0,0])
    cylinder(r=1+tol,h=6,$fn=22);
    translate([3,0,5.5])
    rotate([90,0,0])
    cylinder(r=1+tol,h=6,$fn=22);
    
    // switch
    translate([2,-4,11])
    cube([2+tol,4+tol,6+tol]);
  */  
  }
  
  // battery stack
  translate([1,18,23.8/2])
  rotate([0,90,0])
  cylinder(r=20/2+0.1,h=6.2+tol,$fn=88);
  
  // slice off the bottom, re-use the existing one
  translate([3-10,-10,-10])
  cube([10,40,40]);

    // switch
    translate([2.9,-1,10])
    cube([2+tol,4+tol,8+tol]);
    
    // switch box
    translate([2.9,1.6,1.6])
    cube([2+tol,8+tol,20.72+tol]);

    // power busbar
    translate([4.5,18,23.7/2])
    rotate([-60,0,0])
    cube([6+tol,3.1+tol,22],center=true);
  }
  
    // posts
    color("red")
    translate([6,4.7,2.7])
    rotate([0,-90,0])
    cylinder(r1=1.6,r2=1.3,h=4.7,$fn=22);
    color("red")
    translate([6,4.7,21.5])
    rotate([0,-90,0])
    cylinder(r1=1.6,r2=1.3,h=4.7,$fn=22);


}

//-------------------------------------------
module cutbattery2(tol=0){


    union(){
    // boss
    cube([6+tol,18.4+tol,23.8+tol]);

    // rounded end of boss
    translate([0,18,23.8/2])
    rotate([0,90,0])
    cylinder(r=23.8/2+tol/2,h=7.3+1+tol,$fn=88);
    // rounded end of boss
    translate([7.3+1,18,23.8/2])
    rotate([0,90,0])
    cylinder(r1=23.8/2+tol/2,r2=22/2,h=1+tol,$fn=88);
    
    // wires
    translate([3,0,3.5])
    rotate([90,0,0])
    cylinder(r=1+tol,h=6,$fn=22);
    translate([3,0,5.5])
    rotate([90,0,0])
    cylinder(r=1+tol,h=6,$fn=22);
    
    // switch
    translate([2,-4,11])
    cube([2+tol,4+tol,6+tol]);
    
  }
  

}


//===================================================

//ledbattery();

//ledbattery2();



translate([0,-120,0])
front2();

/*
translate([0,80,0]){
  translate([0,0,0]){
    color("cyan")
    base1();
  }

  translate([0,0,0]){
    color("gray")
    base2();
  }

  translate([0,0,0]){
    color("cyan")
    top2();
  }
}

translate([0,120,0])
basecuts();

translate([0,-40,0])
basecuts2();

translate([0,-80,0])
mid1();

*/


//translate([0,-80,0])
//mid2();
//mid3();

//top3();
//translate([0,60,0])
//top3(type=2);
//translate([0,-60,0])
//top3(type=3);

/*
led1();

translate([15,0,0])
difference(){
  led1(tol=0.2);
  led1(tol=0);
}


translate([30,0,0])
led1(legs=10);


translate([0,-40,0])
xa();

translate([15,-40,0])
difference(){
  xa(tol=0.6);
  xa(tol=0);
}

translate([0,-80,0])
xb();

translate([0,-120,0])
xc();

translate([0,-160,0])
xd();

translate([40,-160,0])
xd(tol=0.3,hole=0);

*/

//===============================================
