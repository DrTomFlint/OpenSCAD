// xctest
// x carriage test for belt attach


// Height of x rods, 62-304
High0=150;        

// Left extruder position, 150+
LeftX0=150; 

// Right extruder position, 82+
RightX0=82+50;

// Show frame
frameOn=1;

// Show top z brackets
tops=1;  

// Show ybed ------------------
ybed=1;    

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers -----------
z1=380;       

// Center to Tower 
ytower=-57.2; 

// Tower to Z-axis, >0
ybracket=6;            

// Height of z rods
zoff2=43;   

// Distance zrod to zscrew
xrodscrew=26;     

// Offset of zscrew
zscrew = -7;

// Height of bottom x motor
zmotor1=45;    

// Delta between x motors
zmotorD=19;    

// Offset x motors from center of towers
xmot0=-2;

//---------------------------------
// Computed values based on parameters
zmotor2=zmotor1+zmotorD;

x2=x1/2;
y2=y1/2;
F2=88;



//---------------------------------------
// fixed part
module belt1(){
difference(){
    // base block
    translate([-5,-9,25]) cube([12,22,14]);

    // belt entry 
    translate([-7.5,-10,34.9]) rotate([0,45,0]) cube([3,32,3]);
    
    // belt slot
    translate([-8.5,-16,34.2]) cube([11.5,32,0.75]);
    translate([-8.5,-16,35.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
    translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
    
    // belt teeth
    for (_step =[-16:2:16]){
      translate([-8.5,_step+0.5,33]) cube([11.5,1,1.5]);
    }

    // nut clearance
    translate([-6,-10,24]) 
    cube([9,6,8]);

    // screw hole
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=1.6,h=30,$fn=22);

  }
}

//---------------------------------------
// movable part
module belt2(){
difference(){
  union(){
    // base block
    translate([-5,-9,29]) cube([10,21,8]);
    // extra for the screw
    translate([-5,-9,25]) cube([8,18,10]);
  }

    // belt entry 
    translate([-7.5,-10,34.9]) rotate([0,45,0]) cube([3,32,3]);
    
    // belt slot
    translate([-8.5,-16,34.2]) cube([11.5,32,0.75]);
    translate([-8.5,-16,35.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
    translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
    
    // belt teeth
    for (_step =[-16:2:16]){
      translate([-8.5,_step+0.5,33]) cube([11.5,1,1.5]);
    }
    
    // screw head clearance M3x?
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=3,h=8,$fn=22);

    // screw hole
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=1.6,h=30,$fn=22);
    
  }
  
}
//---------------------------------------
// movable part slot cutter
module belt3(){
    // base block
    translate([-5,-12,29-0.2]) cube([10,26,8.4]);

}


//==============================================

type=1;
X0=LeftX0;

if(1){
difference(){
    // vertical block
    color("cyan")
    translate([+480/2-X0+42,4.5,High0+35])
    cube([50,6.5,15]);

    
    // slot for movable part of belt attach
    if(type==1){
      translate([+480/2-X0+57,14.5,High0+74])
      rotate([0,180,90])
      belt3();
    }
}
      // belt attach solid
      difference(){
        translate([+480/2-X0+81,14.5,High0+74])
        rotate([0,180,90])
        belt1();  
        
        // cut for the lm8u
        translate([+480/2-X0+80+22,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=15/2+0.1,h=68,$fn=F2);
        
      }
}



// left extruder belt slider
if(0){
X5=LeftX0;
difference(){
// belt attach movable
  translate([+480/2-X5+57,14.5,High0+74])
  rotate([0,180,90])
  belt2();  
// cut for lm8u clearance
  translate([+480/2-X5+70,0+16,High0+30])
  rotate([-90,0,90])
  cylinder(r=15/2+0.1,h=10,$fn=F2);
}
}

if(0){
// test tension screw
  color("orange")
  translate([+480/2-LeftX0+88,15.5,High0+46])
  rotate([-90,0,90])
  cylinder(r=1.5,h=40,$fn=22);
}
