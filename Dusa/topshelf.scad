// topshelf.scad
// all the stuff that attaches to the top shelf

use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/pi4.scad>
use <../Parts/switch2.scad>

use <duet3.scad>

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers 
z1=380;       

// Length of side rails
y5=120;

x2=x1/2;
y2=y1/2;
yoff=-62;       // tower and top offset from center

// fan and radiator
t1=4.25;   // thickness box intake side
t2=17.7;   // thickness of circular section
t3=4.0;    // thickness box outlet side
t4=t1+t2+t3;

tB=5.5;     // thickness radiator bracket

//--------------------------------
module topshelf(tol=0){

    // left tower
    translate([x2-30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // right tower
    translate([-x2+30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // top rail
    translate([-x2,yoff,15+z1+15])
    rotate([0,90,0])
    tslot1(type=2,len=x1);

    // left side rail
    translate([x2-15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // left side rail
    translate([-x2+15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // back rail
    translate([-x2,yoff-165,15+z1+15])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    //---------- triangle corners shelf ---------------

    // left shelf corner
    color("red")
    translate([x2-15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();

    // right shelf corner
    color("green")
    translate([-x2+15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();
    
    //---------- L braces shelf ------------------

    // tower to shelf left
    color("gray")
    translate([x2,yoff,z1+45])
    rotate([-90,0,-90])
    lbrace();
    
    // tower to shelf right
    color("gray")
    translate([-x2,yoff,z1+45])
    rotate([90,90,-90])
    lbrace();
    
    // left side rail to back rail
    color("gray")
    translate([x2,yoff-180,z1+15])
    rotate([0,180,0])
    lbrace();
    
    // right side rail to back rail
    color("gray")
    translate([-x2,yoff-180,z1+15])
    rotate([0,180,-90])
    lbrace();

}

//-------------------------------------------------------
module brace(){
  intersection(){
    rotate([0,-90,0])
    difference(){ 
      cylinder(r=7.8,h=t4,$fn=22);
      cylinder(r=5.5,h=t4,$fn=22);
    } 
    translate([-t4,-2,-2])
    cube([ t4,12,12]);
  }
}
  
//---------------------------------------------
module fan(tol=0){

 
  // Fan body
  translate([-t1,0,0])
  cube([t1+tol,121+tol,120+tol]);
  translate([-(t1+t2),60,60])
  rotate([0,90,0])
  cylinder(r=60,h=t2,$fn=88);  
  translate([-t4,0,0])
  cube([t3+tol,120+tol,120+tol]);

  // Corner screws
  translate([0,7,7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);

  translate([0,120-7,7])    // double up to tolerate offset errors
  rotate([0,-90,0])
  cylinder(r=1.6,h=t4,$fn=22);
  translate([0,120-7.5,7])
  rotate([0,-90,0])
  cylinder(r=1.6,h=t4,$fn=22);

  translate([0,7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);
  translate([0,120-7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);

  // Corner braces
  translate([0,7,7])
  brace();
  translate([0,120-7,7])
  rotate([90,0,0])
  brace();
  translate([0,120-7,120-7])
  rotate([180,0,0])
  brace();
  translate([0,7,120-7])
  rotate([-90,0,0])
  brace();

  // reminder for wiring
  color("red")
  translate([0,120-7,15.5])
  scale([1,4,1])
  rotate([0,90,0])
  cylinder(r=0.7,h=10,$fn=22);
}

//-------------------------------------------------
module radiator(tol=0){
  // fan
  fan(tol=tol);
  
  // radiator main box, holes on backside are accurate location
  difference(){
    translate([-(t4+32.5),-5.5,0])
    cube([32.5+tol,129+tol,120+tol]);

    translate([-t4-10,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    translate([-t4-10,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
  }
    
  // short side
  color("cyan")
  translate([-(t4+29.5-4),-14+4,3+4])
  minkowski(){
    cube([26-8,20-8,114-8]);
    sphere(r=4,$fn=44);
  }
  
  // long side - actually more rounded than this model
  // also this side may stick out a bit more or less, not exact
  color("cyan")
  translate([-(t4+29.5-4),117,3+4])
  minkowski(){
    cube([26-8,30-8,114-8]);
    sphere(r=4,$fn=44);
  }
  
  // approximate locations only!
  translate([-t4-10,132,25])
  rotate([0,90,0])
  cylinder(r=5,h=35,$fn=33);
  translate([-t4-10,132,92])
  rotate([0,90,0])
  cylinder(r=5,h=35,$fn=33);
  
  
}

//-----------------------------------------------------------
module radiatorBracket1(){

  // main attach
  difference(){
    union(){
      translate([-(t4+32.5+6.2),-12,-tB])
      cube([t4+32.5+12,24,tB+2]);
      translate([-(t1+t2+-0.5),4,0])
      cube([t2-1,7,10]);
    }
    radiator(tol=0.2);
    
    // back rail
    translate([-70,0,-20])
    rotate([0,90,0])
    tslot1(type=1,len=x1,tol=0.2);
    
    // M4 screw for rail attach
    translate([-12,0,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-12,0,0])
    cylinder(r=7.2/2,h=4.3,$fn=33);

  }

  // backside screw attach
  difference(){
    translate([-(t4+32.5+6.2),-12,0])
    cube([6,24,14]);

    // trim corner
    translate([-(t4+32.5+6.5),-12,3])
    rotate([45,0,0])
    cube([8,16,12]);
    
    translate([-t4-10,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    // countersink
    translate([-t4-35,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=3.3,h=5,$fn=33);
  }
  
}    

//-----------------------------------------------------------
module radiatorBracket2(){

  // main attach
  difference(){
    union(){
      // main base
      translate([-(t4+32.5+6.2),104,-tB])
      cube([t4+32.5+12,116,tB+2]);
      // extra base under pump
      color("pink")
      translate([-(t4+32.5+6.2),144-5,-tB])
      cube([80,76+5,tB+16]);
      // tab for radiator front
      translate([-(t1+t2+-0.5),110,0])
      cube([t2-1,7,10]);
      // backside radiator screw attach
      translate([-(t4+32.5+6.2),104,0])
      cube([6,40,16]);
    }
    // cut for radiator
    radiator(tol=0.25);
  
    // cut for pump and foam anti-vibration pads
    translate([-62,147-5.1,0])
    cube([65+10.2,65+10.2,30]);

    // cut for radiator clearance
    translate([-58.65,140-5,2])
    cube([35,10,30]);
    
    // top rail
    translate([-70,120+45,-20])
    rotate([0,90,0])
    tslot1(type=2,len=x1,tol=0.2);
   
    // cut for side rail
    translate([-70,100,-tB-1.3])
    cube([80,40,2]);
       
    // round off pump corners
    translate([-64.8,220,-5.5])
    rotate([0,0,-90])
    rounder(r=2,h=30,f=88);
    translate([15.4,220,-5.5])
    rotate([0,0,180])
    rounder(r=2,h=30,f=88);
    translate([15.4,144-5,-5.5])
    rotate([0,0,90])
    rounder(r=2,h=30,f=88);
   
    // M4 screw for rail attach
    translate([-10,120+30,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-10,120+30,-1])
    cylinder(r=7.2/2,h=24.3,$fn=33);

    // M4 screw for rail attach
    translate([-50,120+60,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-50,120+60,-1])
    cylinder(r=7.2/2,h=4.3,$fn=33);

    // screw on back of radiator
    translate([-t4-10,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    
   // countersink
    translate([-t4-35,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=3.3,h=5,$fn=33);

    // trim corner near radiator screw
    translate([-t4-40,103,9])
    rotate([45,0,0])
    cube([8,14,14]);
    
    // material reduction, cut out some baseplate under the pump
    translate([-35,163,-10])
    minkowski(){
      cube([30,40,20]);
      cylinder(r=4,h=20,$fn=44);
    }
    
  }  // end of difference
  
  // extra brace on pump surround near radiator outlet
  translate([0.3,120,0])
  difference(){
    cube([5.5,20,16]);
    translate([-1,0,2])
    rotate([45,0,0])
    cube([8,22,22]);
  }  
  
  
  // text label
  color("red")
    translate([-26,218.6,6])
  rotate([90,0,180])
  linear_extrude(height=2,scale=1)
  text("SUPERCOOL", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
  
}    

//-----------------------------------------------------------
module pump(tol=0){

  // box
  translate([-62+5.1-tol/2,147-tol/2,0]){
    cube([64.8+tol,64.8+tol,56]);
    // reservoir
    translate([32,32,56])
    cylinder(r=30,h=59,$fn=88);
  }

}    

//-------------------------------------------------------
module reelAxle(tol=0){
  
  // main shaft with 1 flat side
  difference(){
    cylinder(r=7.65/2+tol/2,h=127.9+tol,$fn=88);
    translate([2.775,-4,-1])
    cube([8,8,130]);
  }
  
  // box at lower end
  translate([-6.8,-7.8/2,0])
  cube([6.8,7.8,5.4]);

  // ramp on box end
  difference(){
    color("cyan")
    translate([-6.8,-5.25,0])
    rotate([0,0,45])
    cube([7.5,7.5,5.4]);

    color("gray")
    translate([-21.8,-7.5,-1])
    cube([15,15,7]);
  }
  
  // ridges on sides of box
  color("pink")
  translate([-6.8,-3.3,2.7])
  rotate([0,90,0])
  scale([1,2,1]){
    cylinder(r1=1.1,r2=1,h=7.3,$fn=22);
    translate([0,0,7.29])
    cylinder(r2=0.7,r1=1,h=2.27,$fn=22);
  }

  color("orange")
  translate([-6.8,3.3,2.7])
  rotate([0,90,0])
  scale([1,2,1]){
    cylinder(r=1,h=7.3,$fn=22);
    translate([0,0,7.29])
    cylinder(r2=0.7,r1=1,h=2.27,$fn=22);
  }

}
//-------------------------------------------
// axle box for the active side
module axleBoxA(){
  
  difference(){
    translate([0,0,2])
    cube([13,16,10],center=true);

    reelAxle(tol=0.15);
    
    translate([-4,0,6])
    cube([7.7,7.8,4],center=true);
    
  }
  
}
//-------------------------------------------
// axle box for the passive side
module axleBoxP(){
  
  difference(){
    translate([-2,0,2])
    cube([13+4,16,10],center=true);

    hull(){
      translate([0,0,-5])
      cylinder(r=7.8/2,h=20,$fn=88);
      translate([-4,0,-5])
      cylinder(r=7.8/2,h=20,$fn=88);
    }
    
    // round off top edges
    translate([-10.5,-8,-6])
    rounder(r=4,h=20,f=44);
    translate([-10.5,8,-6])
    rotate([0,0,-90])
    rounder(r=4,h=20,f=44);
  }
  
}
//----------------------------------------
module reelPlus(){

// model reel and rewinder hub
h1=1.2;   // axle sticking out of the hub
h2=16.3;  // knobby adjustment wheel with clutch and spring
h3=5;     // thickness of reel sides
h4=46+0;    // width of hub fiber part
h5=h1+h2+h3+h4+h3;  // total height to the wingnuts
h6=16;    // thickness of wingnuts
  
  // adjustable side of hub
  color("red")
  cylinder(r=11.9/2,h=h1,$fn=22);
  
  color("gray"){
  translate([0,0,h1])
  cylinder(r=105/2,h=h2,$fn=88);

  // main reel
  translate([0,0,h1+h2])
  cylinder(r=200/2,h=h3,$fn=88);
  translate([0,0,h1+h2+h3])
  cylinder(r=150/2,h=h4,$fn=88);
  translate([0,0,h1+h2+h3+h4])
  cylinder(r=200/2,h=h3,$fn=88);
  
  // wing nuts
  translate([0,0,h5])
  cylinder(r=42,h=h6,$fn=88);
  // threaded shaft
  translate([0,0,h1])
  cylinder(r=30/2,h=108-h1,$fn=88);
  }
  
  // add the axle
  color("orange")
  translate([0,0,-6.5])
  reelAxle();

  
}
//-----------------------------------------------------------------------------
module reelLegs(){

  difference(){
    //color("cyan")
    union(){
      hull(){
        // tab near axle
        translate([-9.5,6,0])
        rotate([0,90,0])
        cylinder(r=6.8,h=10,$fn=89);
        // tab on front rail
        translate([-9.5,63,-85.5])
        cube([10,25,8]);
      }
      hull(){  
        // tab near axle
        translate([-9.5,-6,0])
        rotate([0,90,0])
        cylinder(r=6.8,h=10,$fn=89);
        // tab on back rail
        translate([-9.5,-87,-85.5])
        cube([10,25,8]);
      }
      // crossbrace
      translate([-9.5,-50,-55])
      cube([10,100,10]);
      
      // top crossbrace fillet
      translate([-9.5,-10,-10])
      cube([10,20,10]);
      
      // front crossbrace fillet
      translate([-9.5,33,-53])
      rotate([60,0,0])
      cube([10,10,10]);
      
      // back crossbrace fillet
      translate([-9.5,-33,-53])
      rotate([30,0,0])
      cube([10,10,10]);
      
      // front foot
      translate([-9.5,63,-85.5])
      cube([20,25,8]);
      translate([-2.4,63,-78.5])
      rotate([0,45,0])
      cube([4,23,4]);

      // back foot
      translate([-9.5,-87,-85.5])
      cube([20,25,8]);
      translate([-2.4,-87+2,-78.5])
      rotate([0,45,0])
      cube([4,23,4]);
    
    }  // end of union
     
    // cut for the axlebox
    translate([-4.5,0,3.5])
    cube([12,16,20],center=true);

    // cuts for the rails
    // undo the translate for reelBracket
    translate([0,-(yoff-90),-(z1+130)]){
      // top rail
      translate([-x2,yoff,15+z1+15])
      rotate([0,90,0])
      tslot1(type=2,len=x1,tol=0.2);
        
      // back rail
      translate([-x2,yoff-165,15+z1+15])
      rotate([0,90,0])
      tslot1(type=1,len=x1,tol=0.2);
    }
    
    // M4 screws for rail attach
    translate([6,60+15,-90])
    cylinder(r=2,h=20,$fn=22);
    translate([6,-(60+15),-90])
    cylinder(r=2,h=20,$fn=22);
    
    // M3x20 screws in front foot to prevent layers delaminating
    // use M3x40 when joining center pair
    translate([-6.5,(60+8),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,(60+8),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    translate([-6.5,(60+22),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,(60+22),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    
    // M3x20 screws in back foot to prevent layers delaminating
    // use M3x40 when joining center pair
    translate([-6.5,-(60+8),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,-(60+8),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    translate([-6.5,-(60+22),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,-(60+22),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    
    
    // holes for raw fiber to bind 2 center legs together
    translate([-11,9,-8]) // upper front
    rotate([0,90,0])
    cylinder(r=1,h=20,$fn=77); 
    translate([-11,-9,-8]) // upper back
    rotate([0,90,0])
    cylinder(r=1,h=20,$fn=77); 
    translate([-11,30,-44]) // middle front
    rotate([0,90,0])
    cylinder(r=1,h=20,$fn=77); 
    translate([-11,-30,-44]) // middle back
    rotate([0,90,0])
    cylinder(r=1,h=20,$fn=77); 
    
    // front material reduction, create ribs
    hull(){
      translate([-7,12,-12]) // upper inside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77); 
      translate([-7,61,-72])  // lower inside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }
    hull(){
      translate([-7,13,-4])  // upper outside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77);
      translate([-7,74,-72])   // lower outside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }

    // back material reduction, create ribs
    hull(){
      translate([-7,-12,-12]) // upper inside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77); 
      translate([-7,-61,-72])  // lower inside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }
    hull(){
      translate([-7,-13,-4])  // upper outside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77);
      translate([-7,-74,-72])   // lower outside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }

    // crossbar material reduction, create ribs
    hull(){
      translate([-7,31,-50])  // front
      rotate([0,90,0])
      cylinder(r1=2,r2=3,h=8,$fn=77); 
      translate([-7,-31,-50])   // back
      rotate([0,90,0])
      cylinder(r1=2,r2=3,h=8,$fn=77); 
    }




  }

}

//-----------------------------------------------------------------------------
// increase height to keep reels inside box
module reelLegs2(){

  difference(){
    //color("cyan")
    union(){
      hull(){
        // tab near axle
        translate([-9.5,6,20])
        rotate([0,90,0])
        cylinder(r=6.8,h=10,$fn=89);
        // tab on front rail
        translate([-9.5,63,-85.5])
        cube([10,25,8]);
      }
      hull(){  
        // tab near axle
        translate([-9.5,-6,20])
        rotate([0,90,0])
        cylinder(r=6.8,h=10,$fn=89);
        // tab on back rail
        translate([-9.5,-87,-85.5])
        cube([10,25,8]);
      }
      
      // crossbrace
      translate([-9.5,-50,-45])
      cube([10,100,10]);
      
      // top crossbrace fillet
      translate([-9.5,-10,10])
      cube([10,20,10]);
      
      // front crossbrace fillet
      translate([-9.5,33,-43])
      rotate([60,0,0])
      cube([10,10,10]);
      
      // back crossbrace fillet
      translate([-9.5,-33,-43])
      rotate([30,0,0])
      cube([10,10,10]);
      
      // front foot
      translate([-9.5,63,-85.5])
      cube([20,25,8]);
      translate([-2.4,63,-78.5])
      rotate([0,45,0])
      cube([4,23,4]);

      // back foot
      translate([-9.5,-87,-85.5])
      cube([20,25,8]);
      translate([-2.4,-87+2,-78.5])
      rotate([0,45,0])
      cube([4,23,4]);
    
    }  // end of union
     
    // cut for the axlebox
    translate([-4.5,0,3.5+20])
    cube([12,16,20],center=true);

    // cuts for the rails
    // undo the translate for reelBracket
    translate([0,-(yoff-90),-(z1+130)]){
      // top rail
      translate([-x2,yoff,15+z1+15])
      rotate([0,90,0])
      tslot1(type=2,len=x1,tol=0.2);
        
      // back rail
      translate([-x2,yoff-165,15+z1+15])
      rotate([0,90,0])
      tslot1(type=1,len=x1,tol=0.2);
    }
    
    // M4 screws for rail attach
    translate([6,60+15,-90])
    cylinder(r=2,h=20,$fn=22);
    translate([6,-(60+15),-90])
    cylinder(r=2,h=20,$fn=22);
    
    // M3x20 screws in front foot to prevent layers delaminating
    // use M3x40 when joining center pair
    translate([-6.5,(60+8),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,(60+8),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    translate([-6.5,(60+22),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,(60+22),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    
    // M3x20 screws in back foot to prevent layers delaminating
    // use M3x40 when joining center pair
    translate([-6.5,-(60+8),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,-(60+8),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    translate([-6.5,-(60+22),-81])   // screw
    rotate([0,90,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([-9.6,-(60+22),-81])   // countersink
    rotate([0,90,0])
    cylinder(r=3,h=3.1,$fn=22);
    
    
    // front material reduction, create ribs
    hull(){
      translate([-7,12,-12+20]) // upper inside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77); 
      translate([-7,61,-72])  // lower inside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }
    hull(){
      translate([-7,13,-4+20])  // upper outside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77);
      translate([-7,74,-72])   // lower outside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }

    // back material reduction, create ribs
    hull(){
      translate([-7,-12,-12+20]) // upper inside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77); 
      translate([-7,-61,-72])  // lower inside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }
    hull(){
      translate([-7,-13,-4+20])  // upper outside
      rotate([0,90,0])
      cylinder(r1=1,r2=2,h=8,$fn=77);
      translate([-7,-74,-72])   // lower outside
      rotate([0,90,0])
      cylinder(r1=3,r2=4,h=8,$fn=77);
    }

    // crossbar material reduction, create ribs
    hull(){
      translate([-7,31,-50+10])  // front
      rotate([0,90,0])
      cylinder(r1=2,r2=3,h=8,$fn=77); 
      translate([-7,-31,-50+10])   // back
      rotate([0,90,0])
      cylinder(r1=2,r2=3,h=8,$fn=77); 
    }




  }

}
//-----------------------------------------
module reelBracket1(){
  
  // active box
  rotate([0,90,0])
  translate([0,0,-6.5])
  axleBoxA();
  
  // legs 
  reelLegs();
 
}
//-----------------------------------------
module reelBracket2(){
  
  // passive box
  rotate([0,90,0])
  translate([0,0,-6.5+9.0])
  axleBoxP();
  
  // legs 
  mirror([1,0,0])
  reelLegs();
 
}
//-----------------------------------------
// increase height to keep reel inside box
module reelBracket3(){
  
  // active box
  rotate([0,90,0])
  translate([-20,0,-6.5])
  axleBoxA();
  
  // legs 
  reelLegs2();
 
}
//-----------------------------------------
// increase height to keep reel inside box
module reelBracket4(){
  
  // passive box
  rotate([0,90,0])
  translate([-20,0,-6.5+9.0])
  axleBoxP();
  
  // legs 
  mirror([1,0,0])
  reelLegs2();
 
}


//-----------------------------------------
module estop(){
  
  difference(){
    hull(){
      // base
      translate([0,0,-1])
      linear_extrude(height=2)
      offset(r=5,$fn=200)
      square([50,50], center=true);

 
      // top plate
      translate([0,0,40])
      cylinder(r=20,h=3,$fn=200);
    
    }

    // top rail
    color("cyan")
    translate([-30,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=60);

    // cut for switch barrel
    translate([0,0,-10])
    cylinder(r=6,h=60,$fn=88);
    
    // cut for switch body
    translate([0,0,-10])
    cylinder(r1=25,r2=16,h=47,$fn=200);
    
    // cut for bolts
    translate([-25,15,-10])
    cylinder(r=2,h=80,$fn=44);
    translate([25,-15,-10])
    cylinder(r=2,h=80,$fn=44);

    // Cut for the bolt head, use also for support
    translate([-25,15,6])
    cylinder(r=4,h=39,$fn=44);
    translate([25,-15,6])
    cylinder(r=4,h=39,$fn=44);
    
    // cut for the wires
    hull(){
      translate([0,0,17])
      rotate([90,0,0])
      cylinder(r=6,h=40,$fn=200);
      rotate([90,0,0])
      cylinder(r=12,h=40,$fn=200);
    }
    
    // cross section cut
    if(0){
      translate([0,0,-40])
      cube([200,200,200]);
    }
      
  }
  

}

//-----------------------------------------------------------
// support for printing the estop 
module estop_sup(){
    // Cut for the bolt head, use also for support
    translate([-25,15,6])
    cylinder(r=4,h=39,$fn=44);
    translate([25,-15,6])
    cylinder(r=4,h=39,$fn=44);
}

//----------------------------------------------------------------
module estop_topa(){

    difference(){
      // top plate
      cylinder(r1=20,r2=18,h=2,$fn=200);
      // cut for switch barrel
      translate([0,0,-10])
      cylinder(r=6,h=60,$fn=88);
    }
    
  }
//----------------------------------------------------------------
module estop_topb(){
      color("red")
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("S", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,35])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("T", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,70])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("O", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,105])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("P", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------------------
// 12" x 12" x 3mm blanks = 304.8 mm x 304.8 mm x 3 mm
// Actual size 299 mm square, 3 mm thick.
module dryBox(){

x0=280;
y0=230;
z0=110;
c0=40;

z1=2*z0;

  // base
  color("silver")
  translate([0,0,1.5])
  cube([x0,y0,3],center=true);

if(0){
  // left side
  translate([-x0/2+1.5,0,z0+1.5])
  cube([3,y0-6,z1-3],center=true);
}
  
  // right side
  translate([x0/2-1.5,0,z0+1.5])
  cube([3,y0-6,z1-3],center=true);

if(0){
  // front side
  color("cyan")
  translate([0,-y0/2+1.5,z0+1.5])
  cube([x0,3,z1-3],center=true);
}

  // back side
  color("green")
  translate([0,y0/2-1.5,z0+1.5])
  cube([x0,3,z1-3],center=true);
  
  // center wall
  color("pink")
  translate([0,0,z0+1.5-c0/2])
  cube([3,y0-6,c0],center=true);
  
  // heater
  color("red")
  translate([0,0,0.2+3])
  cube([250,220,0.4],center=true);

if(1){
  // reels
  x1=12;    
  translate([x1,0,z0])
  rotate([0,90,0])
  reelPlus();

  translate([-x1,0,z0])
  mirror([1,0,0])
  rotate([0,90,0])
  reelPlus();
}
  
  
}

//----------------------------------------------------------------------------------
// 12" x 12" x 3mm blanks = 304.8 mm x 304.8 mm x 3 mm
// ??? Is there enough scrap from the box to make lips for the lid ?

module dryLid(){

  // top
  translate([-3,-3,220])
  cube([x0+6,y0+6,3]);

  // left side
  translate([-3,-3,220-33])
  cube([3,y0+6,30]);

if(0){  
  // right side
  translate([x0-3,3,3])
  cube([3,y0-6,30]);
  
  // front side
  color("cyan")
  translate([0,0,3])
  cube([x0,3,30]);
  
  // back side
  color("green")
  translate([0,y0-3,3])
  cube([x0,3,30]);
}
  
}

//--------------------------------------------------------------------
// inner corners
module inner(){
  
u=25;
t=1.5;  
$fn=99;

intersection(){ 
  union(){
  difference(){ 
    cube([u,u,u]);
    
    translate([t,t,t])
    cube([u,u,u]);
    
    translate([u/2,u/2,0])
    cylinder(r=1.7,h=2*u,center=true);

    translate([u/2,0,u/2])
    rotate([90,0,0])
    cylinder(r=1.7,h=2*u,center=true);

    translate([0,u/2,u/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=2*u,center=true);
  }
  
  translate([t,t,0])
  rounder(r=t,h=u,f=99);
  translate([t,u,t])
  rotate([90,0,0])
  rounder(r=t,h=u,f=99);
  translate([u,t,t])
  rotate([0,-90,0])
  rounder(r=t,h=u,f=99);
}

  sphere(u);
}
  
}

//--------------------------------------------------------------------
// outer corners
module outer(){
  
u=25;
t=1.5;  
$fn=99;

intersection(){ 
  union(){
  difference(){ 
    cube([u,u,u]);
    
    translate([t,t,t])
    cube([u,u,u]);
    
    translate([u/2,u/2,0])
    cylinder(r=1.7,h=2*u,center=true);

    translate([u/2,0,u/2])
    rotate([90,0,0])
    cylinder(r=1.7,h=2*u,center=true);

    translate([0,u/2,u/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=2*u,center=true);

    rounder(r=t,h=u,f=99);
    translate([0,u,0])
    rotate([90,0,0])
    rounder(r=t,h=u,f=99);

    translate([u,0,0])
    rotate([0,-90,0])
    rounder(r=t,h=u,f=99);
  }
  
}

  sphere(u);
}
  
}

//===============================

//inner();
outer();

//translate([-x2+90,yoff-220,30+z1+15]){
//  dryBox();
  //dryLid();
//}

//estop();

//translate([0,0,43])
//estop_topa();

//translate([0,0,43])
//estop_topb();

//color("green")
//estop_sup();

if(0){
color("red")
translate([0,0,36])
switch2();
}

//axleBoxP();

//reelBracket1();
//reelBracket2();

// reels
if(0){
  
translate([0,yoff-90,z1+150+3])
rotate([0,90,0])
reelPlus();

translate([-19.1,yoff-90,z1+150+3])
mirror([1,0,0])
rotate([0,90,0])
reelPlus();
}

// reel brackets
if(0){
translate([0,yoff-90,z1+130+3])
reelBracket3();

translate([110,yoff-90,z1+130+3])
reelBracket4();

color("green")
translate([-19.1,yoff-90,z1+130+3])
mirror([1,0,0])
reelBracket3();

color("green")
translate([-19.1-110,yoff-90,z1+130+3])
mirror([1,0,0])
reelBracket4();


}

// t-slot frame
//topshelf();

// radiator and pump
if(0){
translate([-x2+70,yoff-165,30+z1+20]){
  color("gray")
  radiator();
  color("green")
  radiatorBracket1();
  color("cyan")
  radiatorBracket2(); 
  color("orange")
  pump();
}
}

// Pi4 bracket case...
if(0){
translate([x2-70,-82,z1+60])
rotate([0,-90,180]){
translate([2,0,0]){
  post1();
  post2();
  pi4bracket();
}}

translate([x2-70,-82,z1+60])
rotate([0,-90,180]){
translate([58,112.75,-15])
rotate([0,180,90])
pi4case();
}}

// Duet bracket board...
if(0){
translate([x2-65,-82,z1+60])
rotate([0,-90,180]){
  duet3();
  duet3bracket();
  translate([0,140,0])
  mirror([0,1,0])
  duet3bracket();

}
}

//===============================
