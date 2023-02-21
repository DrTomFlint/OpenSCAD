//=================================================================================
// Fastex.scad
//
//
// Dr Tom Flint, 18 Feb 2023
//=================================================================================


use <../Parts/rounder.scad>

f1=99;
wide = 20;    // width of the webbing
long = 26;    // length of the male side tongue
thick = 2.1;

//---------------------------------------------------------------------------------
module ladder(){

  // end bar
  translate([13,0,0])
  difference(){
    translate([0,0,thick/2])
    rotate([0,45,0])
    cube([2.4,wide+2*thick,2*thick],center=true);
    translate([0,0,-5])
    cube([2*wide,2*wide,10],center=true);
  }

  // mid bar
  translate([7,0,1.5*thick])
  rotate([90,0,0])
  rotate([0,0,30])
  cylinder(r=thick,h=wide+2*thick,center=true,$fn=3);
  
  // back bar
  translate([0,0,thick])
  cube([2.4,wide+2*thick,2*thick],center=true);
    
  translate([thick/2,wide/2,0])
  rotate([0,0,-90])
  rounder(r=3,h=2*thick,f=77);
  translate([thick/2,-wide/2,0])
  rotate([0,0,0])
  rounder(r=3,h=2*thick,f=77);
  
  // sides
  difference(){
    hull(){
      translate([0,wide/2+thick/2,thick])
      rotate([90,0,0])
      cylinder(r=thick,h=thick,center=true,$fn=f1);
      
      translate([13.5,wide/2+thick/2,thick])
      rotate([90,0,0])
      cylinder(r=thick,h=thick,center=true,$fn=f1);
    }
    translate([-2.4,0,thick])
    cube([2.4,wide+2*thick+2,2*thick],center=true);
  }
  
  difference(){
    hull(){
      translate([0,-wide/2-thick/2,thick])
      rotate([90,0,0])
      cylinder(r=thick,h=thick,center=true,$fn=f1);
      
      translate([13.5,-wide/2-thick/2,thick])
      rotate([90,0,0])
      cylinder(r=thick,h=thick,center=true,$fn=f1);
    }
    translate([-2.4,0,thick])
    cube([2.4,wide+2*thick+2,2*thick],center=true);
  }
}


//---------------------------------------------------------------------------------
module tongue(){

  // flex section
    difference(){
      union(){
        translate([-long/2+thick,wide/2-thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=thick,h=long-2*thick,center=true,$fn=f1);
      }
      
      translate([-long/2,wide/2-2.5*thick,thick])
      cube([long+1,2*thick,2*thick],center=true);

      translate([-long,wide/2+thick,0])
      rotate([0,0,-90])
      scale([1,1.5,1])
      rounder(r=6,h=2*thick,f=77);
    }
    
    // fillet inside tonge
    translate([-thick/2,wide/2-1.5*thick,0.2*thick])
    rotate([0,0,180])
    rounder(r=3,h=1.6*thick,f=77);

    difference(){
      hull(){
        translate([-0.75*long,wide/2,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=thick,h=long/2,center=true,$fn=f1);

        translate([-0.75*long,wide/2-thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=thick,h=long/2,center=true,$fn=f1);
      }
      
      translate([-0.4*long,wide/2-thick,thick])
      rotate([0,0,-20])
      cube([4*thick,4*thick,4*thick],center=true);

      translate([-long,wide/2-2*thick,0])
      rotate([0,0,0])
      rounder(r=2.5,h=2*thick,f=77);

      translate([-long,wide/2+thick,0])
      rotate([0,0,-90])
      scale([1,1.5,1])
      rounder(r=6,h=2*thick,f=77);
    }
}

//---------------------------------------------------------------------------------
module male(){

  difference(){
    ladder();
    translate([-thick/2-0.25,wide/2+thick,0])
    rotate([0,0,-90])
    rounder(r=3,h=2*thick,f=77);
    translate([-thick/2-0.25,-wide/2-thick,0])
    rotate([0,0,0])
    rounder(r=3,h=2*thick,f=77);
  }
  
  difference(){
    union(){
      tongue();
      mirror([0,1,0])
      tongue();
      // center tongue
      difference(){
        translate([-long/2,0,thick])
        cube([long,2*thick,2*thick],center=true);
        
        translate([-long/2-thick,0,thick+0.67*thick])
        cube([long,1*thick,0.67*thick],center=true);
        translate([-long/2-thick,0,thick-0.67*thick])
        cube([long,1*thick,0.67*thick],center=true);
      }
    }
    translate([-long,wide/2+thick,0])
    scale([1.5,1,1])
    rotate([90,0,0])
    rotate([0,0,0])
    rounder(r=thick,h=wide+2*thick,f=77);
    translate([-long,wide/2+thick,2*thick])
    scale([1.5,1,1])
    rotate([90,0,0])
    rotate([0,0,-90])
    rounder(r=thick,h=wide+2*thick,f=77);
  }
}

//---------------------------------------------------------------------------------
module female(tol=0.15){

  difference(){
    translate([-long-2*thick,0,0])
    mirror([1,0,0])
    ladder();

    // center cut to help remove support
    translate([-1.1*long,0,1*thick-tol/2])
    //rotate([0,0,45])
    cube([3*thick,wide-3*thick,2*thick+tol],center=true);
  }
  
  translate([-long-1.5*thick,wide/2+thick,0])
  rotate([90,0,0])
  rotate([0,0,180])
  rounder(r=2,h=wide+2*thick,f=77);

  translate([-long-1.5*thick,wide/2+thick,2*thick])
  rotate([90,0,0])
  rotate([0,0,90])
  rounder(r=2,h=wide+2*thick,f=77);

    difference(){
      hull(){
        translate([-long/2-thick,wide/2,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=2*thick,h=long+thick,center=true,$fn=f1);
  
        translate([-long/2-thick,-wide/2,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=2*thick,h=long+thick,center=true,$fn=f1);
      }

      hull(){
        translate([-long/2-thick,wide/2-thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=thick+tol,h=long+thick+1,center=true,$fn=f1);
  
        translate([-long/2-thick,-wide/2+thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r=thick+tol,h=long+thick+1,center=true,$fn=f1);
      }
      // taper entryway
      hull(){
        translate([-thick,wide/2-thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r1=thick+tol,r2=1.5*thick+tol,h=1.5*thick,center=true,$fn=f1);
  
        translate([-thick,-wide/2+thick,thick])
        rotate([0,90,0])
        scale([1,0.8,1])
        cylinder(r1=thick+tol,r2=1.5*thick+tol,h=1.5*thick,center=true,$fn=f1);
      }

      // side cut
      translate([-0.68*long,wide/2+3,thick])
      rotate([0,0,-20])
      cube([5*thick,5*thick,5*thick],center=true);
      translate([-0.73*long,wide/2+1,thick])
      rotate([0,0,0])
      cube([4.2*thick,5*thick,5*thick],center=true);
      translate([-0.83*long,wide/2+2,thick])
      rotate([0,0,20])
      cube([4*thick,5*thick,5*thick],center=true);
      
      // mirror side cut
      mirror([0,1,0]){
        translate([-0.68*long,wide/2+3,thick])
        rotate([0,0,-20])
        cube([5*thick,5*thick,5*thick],center=true);
        translate([-0.73*long,wide/2+1,thick])
        rotate([0,0,0])
        cube([4.2*thick,5*thick,5*thick],center=true);
        translate([-0.83*long,wide/2+2,thick])
        rotate([0,0,20])
        cube([4*thick,5*thick,5*thick],center=true);
      }
            
    }
    
    // center ridge inside
    translate([-long/2-thick,0,2*thick])
    cube([long,1*thick-2*tol,thick],center=true);
    translate([-long/2-thick,0,-tol])
    cube([long,1*thick-2*tol,thick],center=true);
    
    // top text
    translate([-0.58*long,0,3*thick])
    linear_extrude(height=0.3)
    text("LOVE", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.2);

    
}

//=================================================================================

//color("gray")
//ladder();

//color("cyan")
//male();

//color("silver",alpha=0.4)
female();

//=================================================================================
