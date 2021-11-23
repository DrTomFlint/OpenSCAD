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
cylinder(r=18.40/2+tol/2,h=65.0+tol,$fn=123);

}

//---------------------------------------------------------------------------------
module end1(tol=0){

$fn=77;

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
    cylinder(r=5.5/2+tol/2,h=0.80+tol,$fn=66);

    // tab to barrel
    translate([2,0,-0.4+5.6/2])
    cube([4+tol,3+tol,0.8+tol],center=true);

    // wire and insulator barrel
    translate([5.5/2,0,0])
    rotate([0,90,0]){
      cylinder(r=5.6/2+tol/2,h=13+tol,$fn=66);
      cylinder(r=1.6/2+tol/2,h=19+tol,$fn=66);
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
        cylinder(r=5.6/2+tol/2,h=13+tol,$fn=66);
        translate([-10,0,0])
        cylinder(r=5.6/2+tol/2,h=13+tol,$fn=66);
      }
      hull(){
        cylinder(r=1.6/2+tol/2,h=19+tol,$fn=66);
        translate([-10,0,0])
        cylinder(r=1.6/2+tol/2,h=19+tol,$fn=66);
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
    cylinder(r=3,h=200,center=true,$fn=67);
    translate([0,11,-11])
    rotate([0,-90,0])
    color("blue")
    cylinder(r=3,h=200,center=true,$fn=67);
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
module tension(tol=0){

  difference(){
    
    // beam
    translate([0,0,11])
    cube([104,3.5+tol,6+tol],center=true);

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

//=================================================================================


// disable cutaway views if printing or working single parts
if(1){
  
xcut=200;
ycut=200;
zcut=200;

cutcube = 400;

intersection(){
  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
  cube([cutcube,cutcube,cutcube]);
  
  union(){


  //single();
  //multi(numY=2,bars=1);
  
  difference(){
    // trim a larger block down to size so get places for the tension bars
    intersection(){
      multi(numY=9,bars=0,print=1);
      translate([-150,6,-50])
      cube([300,22*7+10,100]);
    }
    // cut out 1 cell
    translate([-100,148,-7])
    cube([200,28,28]);
  }

  //tension();

  if(0){
    translate([100,0,0])
    end1();

    translate([50,0,0])
    bar1();

    translate([150,0,0])
    cell1();

    two1();

    translate([-50,0,0])
    wire1();
  }


  //two1cut(wire=3,tol=0.25);

  if(0){
    difference(){
      translate([2.8,0,0])
      cube([8,42,18],center=true);

      translate([0,0,0])
      rotate([0,-90,0])
      two1cut(wire=3,tol=0.2);
    }
  }

  }
}
}


// for printing
//multi(numY=2,print=2);
//tension();
//endblock1();

//multi(numY=2,print=2);

//=================================================================================


