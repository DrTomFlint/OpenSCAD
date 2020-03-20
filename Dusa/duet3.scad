// duet3.scad
// controller board, simple model for mounting

// backside thru holes stick out 2.5 mm
// 4.3 radius clearance around the mounting holes for posts

// note the thermal vias mean the hot parts could be water cooled from
// the backside of the pcb, these are marked in pink

use <../Parts/tslot.scad>


// locations for front rail of the shelf vs PCB zero
x0front=-30;
y0front=-20;


//----------------------------------
module duet3(
tol=0,
type=0
){
  
  // ---- PCB ----------
  difference(){
    // PCB,
    color("blue")
    cube([134+tol,140+tol,1.5+tol]);
    
    // mounting holes
    translate([4.5,4.5,-1])
    cylinder(r=4.2/2-tol/2,h=4,$fn=22);
    translate([4.5,140-4.5,-1])
    cylinder(r=4.2/2-tol/2,h=4,$fn=22);
    translate([134-4.5,4.5,-1])
    cylinder(r=4.2/2-tol/2,h=4,$fn=22);
    translate([134-4.5,140-4.5,-1])
    cylinder(r=4.2/2-tol/2,h=4,$fn=22);
  
  }
  
  // ------- driver connectors, tall enough to include wires
  translate([0,55,1.5])     // 0
  cube([11,16.5,21]);
  translate([0,84,1.5])     // 1
  cube([11,16.5,21]);
  translate([0,113,1.5])    // 2
  cube([11,16.5,21]);
  
  translate([32.5,55,1.5])     // 5
  cube([11,16.5,21]);
  translate([32.5,84,1.5])     // 4
  cube([11,16.5,21]);
  translate([32.5,113,1.5])    // 3
  cube([11,16.5,21]);

  // Out_x connectors
  translate([0,10,1.5])     // 3
  cube([11,8.5,21]);
  translate([0,22.3,1.5])     // 2
  cube([11,8.5,21]);
  translate([0,35.3,1.5])     // 1
  cube([11,8.5,21]);

  // ---------- bottom edge connectors
  translate([21,0,1.5])     // gnd v+
  cube([5.6,6.2,19]);
  color("red")
  translate([27.6,-0.3,1.5])     // reset button
  cube([4.6,4.6,2]);
  translate([34.4,0,1.5])     // external reset
  cube([5.6,6.2,19]);
  
  color("red")
  translate([47.8,0.5,1.5])     // SD card holder
  cube([15,15,2.3]);

  color("cyan")
  translate([48.6,-2.2,2.2])     // SD card holder
  cube([11.2,15.6,1.3]);
  
  color("red")
  translate([66.2,-0.5,1.5])     // micro USB type B
  cube([8.5,6,3.4]);
  
  color("red")
  translate([80.4,0.5,1.5])     // ethernet
  cube([16,21.5,13.5]);
  
  // --------- right corner I/O 0-8
  translate([99.3,0,1.5])     // i/o_0
  cube([6.5,13.2,19]);
  translate([109.3,0,1.5])     // i/o_1
  cube([6.5,13.2,19]);
  translate([118.5,0,1.5])     // i/o_2
  cube([6.5,13.2,19]);
  
  translate([99.3,14.5,1.5])     // i/o_3
  cube([6.5,13.2,19]);
  translate([109.3,14.5,1.5])     // i/o_4
  cube([6.5,13.2,19]);
  translate([118.5,14.5,1.5])     // i/o_5
  cube([6.5,13.2,19]);
  translate([127.8,14.5,1.5])     // i/o_6
  cube([6.5,13.2,19]);
  
  translate([118.5,28.6,1.5])     // i/o_7
  cube([6.5,13.2,19]);
  translate([127.8,28.6,1.5])     // i/o_8
  cube([6.5,13.2,19]);
  
  translate([111.2,28.6,1.5])     // DS_LED
  cube([6.5,10.2,19]);
  
  // ---------- ribbon cable
  color("green")
  translate([134-9.5,46,1.5])     // R-Pi ribbon
  cube([9.5,40.6,13.5]);
  
  color("red")
  translate([134-18.2,90,1.5])     // RJ45 for Canbus
  cube([18.2,14,13.3]);
  
  //------------ power block
  color("red")
  translate([65,122,1.5])     // Power block
  cube([58.5,16.2,18]);
  
  translate([65,115,1.5])     // fuse
  cube([15,6,18.5]);
  translate([96,115,1.5])     // fuse
  cube([15,6,18.5]);
  
  //-------- hot parts with thermal vias
  color("pink")
  translate([19,12,-0.2])     // Out_13D4184 40 volt N channel mosfet
  cube([7,6,2]);
  color("pink")
  translate([19,25,-0.2])     // Out_2 D4184 40 volt N channel mosfet
  cube([7,6,2]);
  color("pink")
  translate([19,37,-0.2])     // Out_1 D4184 40 volt N channel mosfet
  cube([7,6,2]);
  color("pink")
  
  translate([119.2,110.8,-0.2])     // Out_0 036N04L mosfet 40 volt 90 amp
  cube([6.5,6,2]);
  
  color("pink")
  translate([23.2,60.3,-0.2])     // Stepper driver 0, TMC 5160
  cube([5,5,2]);
  color("pink")
  translate([23.2,89.4,-0.2])     // Stepper driver 1
  cube([5,5,2]);
  color("pink")
  translate([23.2,118.5,-0.2])     // Stepper driver 2
  cube([5,5,2]);
  
  color("pink")
  translate([55.3,60.3,-0.2])     // Stepper driver 5
  cube([5,5,2]);
  color("pink")
  translate([55.3,89.4,-0.2])     // Stepper driver 4
  cube([5,5,2]);
  color("pink")
  translate([55.3,118.5,-0.2])     // Stepper driver 3
  cube([5,5,2]);
  
}
//---------------------------------
module duet3bracket(){
// this is the left side only, use a mirror to get right side

  difference(){
    // corners
    union(){
      color("pink")
      translate([-8,140-10,-4])
      cube([16,14,10]);

      color("green")
      translate([134-10,140-10,-4])
      cube([12,12,5.5]);

    }
    
    // cut out for the PCB
    tol=0.15;
    cube([134+tol,140+tol,1.5+tol]);

    // trim corner off bottom slot
    translate([5,115,-4])
    rotate([0,0,30])
    cube([16,16,11]);

    // trim corner off top slot
    translate([134-8,140-19,-4])
    rotate([0,0,45])
    cube([10,12,5.5]);
    
    // hole for M4x18 
    translate([129.5,135.5,-16.5])
    cylinder(r=2,h=18,$fn=22);


  }
  
  // left side vertical
  color("red")
  difference(){
    hull(){
      translate([-15,130,-24])
      cube([10,20,20]);

      color("green")
      translate([126,130,-14])
      cube([10,12,10]);
    }

    // hole for M4x18 
    translate([129.5,135.5,-16.5])
    cylinder(r=2,h=18,$fn=22);
    // cut a flat for M4 nylock 
    translate([123,129,-16.5])
    cube([14,14,5]);
  }


  // foot
  difference(){
    translate([-16+1,130+1,-40+1])
    minkowski(){
      cube([10-2,30-2,60-2]);
      sphere(r=1,$fn=22);
    }

    // cut for back rail
    translate([x0front,y0front+30+120+15,-50])
    tslot1(type=1,len=100,tol=0.2);
    
    // cut for front M4 to rail
    translate([-20,145,11])
    rotate([0,90,0])
    cylinder(r=2,h=18,$fn=22);  

    // cut for back M4 to rail
    translate([-20,145,-31])
    rotate([0,90,0])
    cylinder(r=2,h=18,$fn=22);  

  }
}

//=================================

duet3();

duet3bracket();

translate([0,140,0])
mirror([0,1,0])
duet3bracket();

if(1){
// top rail
translate([x0front,y0front,-50])
rotate([0,0,0])
tslot1(type=2,len=100);

// back rail
translate([x0front,y0front+30+120+15,-50])
rotate([0,0,0])
tslot1(type=1,len=100);
}
//=================================
