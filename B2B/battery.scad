//=================================================================================
// battery.scad
// rework of the VRUZEND battery end caps which all broke
// can still use the hardware contacts and jumpers
//
// Dr Tom Flint, 22 November 2021
//
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>

//---------------------------------------------------------------------------------
module cell1(tol=0){
translate([0,0,-tol/2])
cylinder(r=18.40/2+tol/2,h=65.0+tol,$fn=22);

}

//---------------------------------------------------------------------------------
module end1(tol=0){

$fn=22;

  // main flat
  translate([0,0,-tol/2])
  cylinder(r=15.5/2+tol/2,h=0.75+tol);

  // make a cylindrical cut instead of 4 tabs
  translate([0,0,0])
  cylinder(r1=15.5/2+tol/2,r2=19.5/2+tol/2,h=2);

  // bolt
  translate([0,0,-7.5])
  cylinder(r=3/2+tol/2,h=7.5);
  cylinder(r=4.6/2+tol/2,h=5);
  
  // spring contact
  translate([0,0,6.2-tol/2])
  rotate([0,10,0])
  cylinder(r=12/2+tol/2,h=0.75+tol);
  translate([5-tol/2,-3+tol/2,-tol/2])
  cube([4+tol,6+tol,6+tol]);

}

//---------------------------------------------------------------------------------
module bar1(tol=0){

  difference(){
    translate([0,0,0.25+tol/2])
    cube([8+tol,33+tol,0.5+tol],center=true);

    translate([0,11,0])
    cylinder(r=2,h=3,center=true,$fn=33);

    translate([0,-11,0])
    cylinder(r=2,h=3,center=true,$fn=33);
  }

}

//---------------------------------------------------------------------------------
module bar1cut(tol=0){

    translate([0,-2,3+tol/2])
    cube([8+tol,33+tol+10,6+tol],center=true);

    translate([-8,11,3+tol/2])
    cube([8+tol,8+tol,6+tol],center=true);

    translate([0,-11,3+tol/2])
    cube([24+tol,8+tol,6+tol],center=true);

}

//---------------------------------------------------------------------------------
module wire1(tol=0){

  translate([0,0,-5.6/2])
  color("red"){
    // tab
    translate([0,0,-0.8+5.6/2-tol/2])
    cylinder(r=5.5/2+tol/2,h=0.80+tol,$fn=22);

    // tab to barrel
    translate([2,0,-0.4+5.6/2])
    cube([4+tol,3+tol,0.8+tol],center=true);

    // wire and insulator barrel
    translate([5.5/2,0,0])
    rotate([0,90,0]){
      cylinder(r=5.6/2+tol/2,h=13+tol,$fn=22);
      cylinder(r=1.6/2+tol/2,h=19+tol,$fn=22);
    }
  }
}
//---------------------------------------------------------------------------------
module wire1cut(tol=0){

  translate([0,0,-5.6/2])
  color("red"){
    // tab
    translate([0,0,-0.8+5.6/2-tol/2])
    cylinder(r=5.5/2+tol/2,h=0.80+tol,$fn=66);

    // tab to barrel
    translate([2,0,-0.4+5.6/2])
    cube([4+tol,3+tol,0.8+tol],center=true);

    // wire and insulator barrel
    translate([5.5/2,0,0])
    rotate([0,90,0]){
      hull(){
        cylinder(r=5.6/2+tol/2,h=13+tol,$fn=22);
        translate([-10,0,0])
        cylinder(r=5.6/2+tol/2,h=13+tol,$fn=22);
      }
      hull(){
        cylinder(r=1.6/2+tol/2,h=19+tol,$fn=22);
        translate([-10,0,0])
        cylinder(r=1.6/2+tol/2,h=19+tol,$fn=22);
      }
    }
  }
}

//---------------------------------------------------------------------------------
module two1(wire=3,tol=0.0){

  bar1(tol=tol);
  translate([0,11,0.5])
  end1(tol=tol);
  translate([0,-11,0.5])
  end1(tol=tol);

  // nuts
  if(wire==0){
    translate([0,11,-2.4])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    translate([0,-11,-2.4])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
  }
  
  if(wire==1){
    translate([0,11,-2.4-0.8])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    translate([0,11,0])
    wire1(tol=tol);
    
    translate([0,-11,-2.4])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
  }
  if(wire==2){
    translate([0,11,-2.4])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    
    translate([0,-11,-2.4-0.8])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    translate([0,-11,0])
    wire1(tol=tol);
  }
  if(wire==3){
    translate([0,11,-2.4-0.8])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    translate([0,11,0])
    wire1(tol=tol);
    
    translate([0,-11,-2.4-0.8])
    cylinder(r=6/2+tol,h=2.4+tol,$fn=6);
    translate([0,-11,0])
    wire1(tol=tol);
  }
}

//---------------------------------------------------------------------------------
module two1cut(wire=3,tol=0.25){

  bar1cut(tol=tol);
  translate([0,11,0.5])
  end1(tol=tol);
  translate([0,-11,0.5])
  end1(tol=tol);

  // nut
  translate([0,11,-2.4-0.8])
  cylinder(r=7/2+tol,h=4+tol,$fn=66);
  // wire  
  translate([0,11,0])
  wire1cut(tol=tol);

  // nut
  translate([0,-11,-2.4-0.8])
  cylinder(r=7/2+tol,h=4+tol,$fn=66);
  // wire
  translate([0,-11,0])
  wire1cut(tol=tol);
}


//--------------------------------------------------------------------------------
module support1(both=0){

  difference(){
    color("cyan")
    union(){
      translate([25,0,0])
      cube([6,22,22],center=true);
      if(both==1){
        translate([-25,0,0])
        cube([6,22,22],center=true);
      }
    }

    hull(){
      translate([65/2,0,0])
      rotate([0,-90,0])
      color("green")
      cell1(tol=0.25);   

      translate([65/2,0,20])
      rotate([0,-90,0])
      color("green")
      cell1(tol=0.25);   
    }
    // material reduction
    translate([0,-11,-11])
    rotate([0,-90,0])
    color("blue")
    cylinder(r=3,h=200,center=true,$fn=22);
    translate([0,11,-11])
    rotate([0,-90,0])
    color("blue")
    cylinder(r=3,h=200,center=true,$fn=22);
  }

}


//--------------------------------------------------------------------------------
module endblock1(){

  translate([79/2,0,0])
  difference(){
    translate([2.8,0,0])
    cube([8,22,22],center=true);

    translate([0,11,0])
    rotate([0,-90,0])
    two1cut(wire=3,tol=0.2);
  }      

}

 //--------------------------------------------------------------------------------
module single(nuts=0,print=0){

  if(nuts==1){  
    translate([79/2,0,0])
    rotate([0,-90,0])
    color("silver")
    //two1(wire=1,tol=0);
    end1(tol=0);

    translate([-79/2,11,0])
    rotate([0,0,180])
    rotate([0,-90,0])
    color("silver")
    two1(wire=1,tol=0);
    //end1(tol=0);
    
    translate([65/2,0,0])
    rotate([0,-90,0])
    color("green")
    cell1(tol=0);   
  }

  if(print==0){
    // cell support
    support1(both=1);
    
    // end block
    endblock1();
    rotate([0,0,180])
    endblock1();
  }
  if(print==1){
    // cell support
    support1(both=0);
  }
  if(print==2){
    // end block
    endblock1();
  }
  if(print==3){
    // other end block, not symmetric after cutting for 13s
    rotate([0,0,180])
    endblock1();
  }

}

//--------------------------------------------------------------------------------
module multi(numY=4,bars=0,print=0){

depth=3;

  for(i=[0:numY-1]){
    difference(){
      union(){
        translate([0,22*i,0])
        single(print=print);

        translate([0,22*i,-22])
        rotate([180,0,0])
        single(print=print);
      }
      // cuts for tension bars
      translate([0,-11+22*i,-depth])
      tension(tol=0.2);
      translate([0,11+22*i,-depth])
      tension(tol=0.2);

      // cuts for tension bars
      translate([0,-11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.2);
      translate([0,11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.2);
    }
    if(bars==1){
      // tension bars
      translate([0,-11+22*i,-depth])
      tension(tol=0);
      translate([0,11+22*i,-depth])
      tension(tol=0);

      translate([0,-11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0);
      translate([0,11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0);
    }  
  }
}

//--------------------------------------------------------------------------------
// pretty cap, but needs to also hold the BMS and control the wiring.  
// need strain relief for the main cable
module multiCap(numY=4,bars=0,print=0){

depth=3;

    difference(){
      minkowski(){
        difference(){
        union(){
          translate([79/2+10,11*9,-11])
          cube([3-2,22*9-2,44+6-2],center=true);
          // add legs, this assumes a 13s1p battery
          translate([79/2+10,22*1,-11])
          cube([3-2,12-2,44+20-2],center=true);
          translate([79/2+10,22*7,-11-11-5])
          cube([3-2,12-2,22+10-2],center=true);
          translate([79/2+10,22*6,5])
          cube([3-2,12-2,22+10-2],center=true);
        }
        // cut out 1 cell
        translate([-100,148,-7])
        cube([200,28,28]);

        // cut ends instead of using intersection?
        translate([-100,-54,-50])
        cube([200,60,80]);
        translate([-100,148+22,-50])
        cube([200,60,80]);
      }
      // minkowski
        sphere(r=2,$fn=22);
      }
      
  for(i=[0:numY-1]){
      // cuts for tension bars
      translate([0,-11+22*i,-depth])
      tension(tol=0.3);
      translate([0,11+22*i,-depth])
      tension(tol=0.3);

      // cuts for tension bars
      translate([0,-11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
      translate([0,11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
    }
    
    // text cut
    color("red")
    translate([47.6,80,-10])
    rotate([0,-90,0])
    rotate([0,0,-90])
    linear_extrude(height=0.6,scale=1)
    text("Aero Amp", font = "Open Sans:style=Bold", size=13,halign="center",valign="center",spacing=1.1);

    color("green")
    translate([47.6+4,80,-10])
    rotate([0,90,0])
    rotate([0,0,90])
    linear_extrude(height=0.6,scale=1)
    text("Aero Amp", font = "Open Sans:style=Bold", size=13,halign="center",valign="center",spacing=1.1);

  }
  
}


//--------------------------------------------------------------------------------
module tension(tol=0){

  difference(){
    
    union(){
    // beam
    translate([0,0,11])
    cube([104,3.5+tol,6+tol],center=true);

    // for anti-wracking
    difference(){
      translate([25,0,6])
      cube([6.3+10,3.5+tol,6+tol],center=true);

      translate([25+9,5,3])
      rotate([90,0,0])
      rotate([0,0,-90])
      cylinder(r=5,h=10,$fn=22);

      translate([25-9,5,3])
      rotate([90,0,0])
      rotate([0,0,-90])
      cylinder(r=5,h=10,$fn=22);
    }
    

    difference(){
      translate([-25,0,6])
      cube([6.3+10,3.5+tol,6+tol],center=true);

      translate([-25+9,5,3])
      rotate([90,0,0])
      rotate([0,0,-90])
      cylinder(r=5,h=10,$fn=22);  
            
      translate([-25-9,5,3])
      rotate([90,0,0])
      rotate([0,0,-90])
      cylinder(r=5,h=10,$fn=22);
    }
    
  }
  
    // end block
    translate([79/2,0,0])
    translate([2.8,0,0])
    cube([8.3,22.3,22.3],center=true);

    // end block
    rotate([0,0,180])
    translate([79/2,0,0])
    translate([2.8,0,0])
    cube([8.3,22.3,22.3],center=true);
          
    translate([25,0,0])
    cube([6.3,22.3,22.3],center=true);
    translate([-25,0,0])
    cube([6.3,22.3,22.3],center=true);
  }

}
//--------------------------------------------------------------------------------
module bms(tol=0){
    
    // body
    color("silver")
    translate([-tol/2,-tol/2,-tol/2])
    cube([108.7+tol,60.6+tol,10.5+tol]);
    
    // main wires
    color("black")
    translate([58,4,0])
    cylinder(r=4.6/2+tol/2,h=15,$fn=22);

    color("blue")
    translate([13,56,0])
    cylinder(r=4.6/2+tol/2,h=15,$fn=22);

    color("black")
    translate([84,56,0])
    cylinder(r=4.6/2+tol/2,h=15,$fn=22);
    
    // balance wires
    color("white")
    translate([101-tol/2,12.5-tol/2,4-tol/2])
    cube([10.5+tol,37.3+tol,6.5+tol]);
    
}
//--------------------------------------------------------------------------------
// BMS holder and feet
module multiCap2(numY=4,bars=0,print=0){

depth=3;

    difference(){
      union(){
        // add legs, this assumes a 13s1p battery
        translate([79/2+11.5,33,15])
        cube([33,12,14],center=true);

      }
      
      // cut for bms
      translate([62.5,135,-41])
      rotate([0,0,-90])
      rotate([90,0,0])
      bms(tol=0.3);
      
      // cut for endcap
      translate([79/2,0,0])
      translate([2.8,33,0])
      cube([8+0.4,22+0.4,22+0.4],center=true);

      // cut oval
      translate([79/2-11,33,23])
      rotate([90,0,0])
      scale([2,1,1])
      cylinder(r=9,h=40,center=true,$fn=89);

      translate([79/2+28,45,22])
      rotate([90,0,0])
      rotate([0,0,180])
      rounder(r=4,h=30,f=66);      
      
      i=1;
        
      // cuts for tension bars
      translate([0,-11+22*i,-depth])
      tension(tol=0.3);
      translate([0,11+22*i,-depth])
      tension(tol=0.3);

      // cuts for tension bars
      translate([0,-11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
      translate([0,11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
    }


  
}
//--------------------------------------------------------------------------------
// non-BMS holder and feet
module multiCap3(numY=4,bars=0,print=0){

depth=3;

    difference(){
      union(){
        // add legs, this assumes a 13s1p battery
        translate([79/2+10-7.75+1.5,33,15])
        cube([33-15.5,12,14],center=true);

      }
      
      // cut for bms
      translate([62.5,135,-41])
      rotate([0,0,-90])
      rotate([90,0,0])
      bms(tol=0.3);
      
      // cut for endcap
      translate([79/2,0,0])
      translate([2.8,33,0])
      cube([8+0.4,22+0.4,22+0.4],center=true);

      // cut oval
      translate([79/2-12,33,23])
      rotate([90,0,0])
      scale([2,1,1])
      cylinder(r=9,h=40,center=true,$fn=89);

      translate([79/2+12.5,45,22])
      rotate([90,0,0])
      rotate([0,0,180])
      rounder(r=3,h=30,f=66);      
      
      i=1;
        
      // cuts for tension bars
      translate([0,-11+22*i,-depth])
      tension(tol=0.3);
      translate([0,11+22*i,-depth])
      tension(tol=0.3);

      // cuts for tension bars
      translate([0,-11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
      translate([0,11+22*i,-22+depth])
      rotate([180,0,0])
      tension(tol=0.3);
    }


  
}


//=================================================================================


// disable cutaway views if printing or working single parts
if(0){
  
xcut=200;
ycut=200;
zcut=200;

cutcube = 400;

//intersection(){
//  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
//  cube([cutcube,cutcube,cutcube]);
  
//  union(){


  color("cyan")
  multiCap2(numY=9,bars=0);
  translate([0,22*4,0])
  multiCap2(numY=9,bars=0);

  translate([0,22*3,-22])
  rotate([180,0,0])
  multiCap2(numY=9,bars=0);
  translate([0,22*7,-22])
  rotate([180,0,0])
  multiCap2(numY=9,bars=0);

  mirror([1,0,0]){
    color("blue")
    multiCap3(numY=9,bars=0);
    translate([0,22*4,0])
    multiCap3(numY=9,bars=0);

    translate([0,22*3,-22])
    rotate([180,0,0])
    multiCap3(numY=9,bars=0);
    translate([0,22*7,-22])
    rotate([180,0,0])
    multiCap3(numY=9,bars=0);
  }
  
  
  color("green",alpha=0.5)
  translate([62.5,126,-41])
  rotate([0,0,-90])
  rotate([90,0,0])
  bms();
  
  if(1){
    difference(){
      // trim a larger block down to size so get places for the tension bars
      multi(numY=9,bars=1,print=0);

      // cut out 1 cell
      translate([-100,148,-7])
      cube([200,28,28]);

      // cut ends instead of using intersection?
      translate([-100,-54,-50])
      cube([200,60,80]);
      translate([-100,148+22,-50])
      cube([200,60,80]);
    }
  }

//  }



}

// for printing
//multi(numY=2,print=2);
//tension();
//endblock1();
//bms();  

multiCap3(numY=9,bars=0);

//multi(numY=2,print=2);

//=================================================================================


