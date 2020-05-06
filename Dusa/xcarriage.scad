// xcarriage
// x motor attachments

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/bltouch.scad>
use <../Parts/blower.scad>
use <../Parts/switch.scad>

use <frame.scad>
use <zaxis.scad>
use <xends2.scad>

// repeat params from dusa1.scad

// Height of x rods, 62-304
High0=150;        

// Left extruder position, 153+
LeftX0=152; 

// Right extruder position, +82 +328
RightX0=328;

// Show frame
frameOn=0;

// Show top z brackets
tops=0;  

// Show ybed ------------------
ybed=0;    

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


//------------------------------------------------------
// xcarriages
// type 1 is left, type 2 is right
module xmain1(
X0=150,
type=1
){

  difference(){
    
  // Boss  
  union(){

    // vertical block
    color("cyan")
    translate([+480/2-X0+35,4.5,High0+31.5])
    cube([65,12,65]);
        
    // surround upper rail and lm8us
    translate([+480/2-X0+100,16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2+4,h=65,$fn=F2);
    
    // surround lower rail and lm8us
    if(type==1){
      translate([+480/2-X0+100,0+16,High0+30])   
      rotate([-90,0,90])
      cylinder(r=15/2+4,h=24+7,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+68,0+16,High0+30])   
      rotate([-90,0,90])
      cylinder(r=15/2+4,h=24,$fn=F2);
    }

    // boss to mount the blowers      
    if(type==1){
      // upper mount with heat-set M3 brass
      color("pink")
      translate([+480/2-X0+48.5+3,25,High0+zmotor1+37.5])
      rotate([-98,0,0])
      cylinder(r=4,h=3.5,$fn=22);
    }
    if(type==2){
      // upper mount with heat-set M3 brass  
      color("pink")
      translate([+480/2-X0+84,25,High0+zmotor1+37.5])
      rotate([-98,0,0])
      cylinder(r=4,h=3.5,$fn=22);
    }
 
  } // end Boss union -----------

    // trim front vertical block
//    translate([+480/2-X0+34,16.5,High0+zmotor1+45.5])
//    rotate([45,0,0])
//    #cube([67,20,20]);
    translate([+480/2-X0+34,16.5,High0+zmotor1+45.5])
    rotate([30,0,0])
    cube([67,20,20]);

    // trim corners
    translate([+480/2-X0+91,0,High0+zmotor1+55])
    rotate([0,45,0])
    cube([20,60,20]);
    translate([+480/2-X0+16,0,High0+zmotor1+55])
    rotate([0,45,0])
    cube([20,60,20]);
    translate([+480/2-X0+16,0,High0+26.5])
    rotate([0,45,0])
    cube([14,60,20]);
    if(type==2){
      translate([+480/2-X0+91,0,High0+26.5])
      rotate([0,45,0])
      cube([20,60,20]);
    }

    // cut for thumbscrew
    if(type==1){
      translate([+480/2-X0+105,-3,High0+zmotor1+32])
      rotate([-90,0,90])
      cylinder(r=15/2+2,h=22,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+50,-3,High0+zmotor1+32])
      rotate([-90,0,90])
      cylinder(r=15/2+2,h=22,$fn=F2);
    }

    // extruder motor shaft clearance
    translate([+480/2-X0+41.1+53/2,-25,High0+54])
    rotate([-90,0,0])
    cylinder(r=4,h=50,$fn=44);

    // extruder mounting, M4x30 
    translate([+480/2-X0+41.1,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=50,$fn=44);
    translate([+480/2-X0+41.1+53,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    // don't cut 4th hole, left is BLtouch
    if(type==2){
      translate([+480/2-X0+41.1+53,-25,High0+89.9-53])
      rotate([-90,0,0])
      cylinder(r=2,h=60,$fn=44);
    }

    // countersink for flathead M4x30 
    // head is 8mm tapering at 45 degrees to 4mm
    translate([+480/2-X0+41.1,11,High0+89.9])
    rotate([90,0,0])
    cylinder(r1=4,r2=2,h=2.1,$fn=44);
    translate([+480/2-X0+41.1,27,High0+89.9])
    rotate([90,0,0])
    cylinder(r=4,h=16.1,$fn=44);

    translate([+480/2-X0+41.1+53,11,High0+89.9])
    rotate([90,0,0])
    cylinder(r1=4,r2=2,h=2.1,$fn=44);
    translate([+480/2-X0+41.1+53,27,High0+89.9])
    rotate([90,0,0])
    cylinder(r=4,h=16.1,$fn=44);

    translate([+480/2-X0+41.1,11,High0+89.9-53])
    rotate([90,0,0])
    cylinder(r1=4,r2=2,h=2.1,$fn=44);
    translate([+480/2-X0+41.1,13,High0+89.9-53])
    rotate([90,0,0])
    cylinder(r=4,h=2.1,$fn=44);
    
    // dont cut 4th hole
    if(type==2){
      translate([+480/2-X0+41.1+53,11,High0+89.9-53])
      rotate([90,0,0])
      cylinder(r1=4,r2=2,h=2.1,$fn=44);
      translate([+480/2-X0+41.1+53,13,High0+89.9-53])
      rotate([90,0,0])
      cylinder(r=4,h=2.1,$fn=44);
    }
    // cut for upper rail and lm8us
    translate([+480/2-X0+80+22,0+16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2+0.1,h=68,$fn=F2);
    
    // cut for lower rail
    translate([+480/2-X0+80+22,0+16,High0+30])
    rotate([-90,0,90])
    cylinder(r=5.5,h=68,$fn=F2);
    
    // cut for lower lm8us
    if(type==1){
      translate([+480/2-X0+80+22,0+16,High0+30])
      rotate([-90,0,90])
      cylinder(r=15/2+0.1,h=26.1,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+68,0+16,High0+30]) 
      rotate([-90,0,90])
      cylinder(r=15/2+0.1,h=26+10,$fn=F2);
    }      
    // cut for belts
    color("green")
    translate([+480/2-X0+31,11,High0+33])
    cube([73,18,43]);
    color("green")
    translate([+480/2-X0+31,11,High0+30])
    cube([73,10,10]);
    
    // slot for movable part of belt attach
    if(type==1){
      translate([+480/2-X0+64,14.5,High0+74])
      rotate([0,180,90])
      belt3();
    }    
    if(type==2){      
      translate([+480/2-X0-57+135,14.5,High0+34.8])
      rotate([0,0,-90])
      belt3();
    }  

    // BLtouch attach
    if(type==1){
      // flat head M3 to mount the BLtouch block
      translate([+480/2-X0+41.1+53,11,High0+62])
      rotate([90,0,0])
      cylinder(r=2,h=30,$fn=44);
      translate([+480/2-X0+41.1+53,11,High0+62])
      rotate([90,0,0])
      cylinder(r1=4,r2=2,h=2.1,$fn=44);
      translate([+480/2-X0+41.1+53,13,High0+62])
      rotate([90,0,0])
      cylinder(r=4,h=2.1,$fn=44);      
    }    
    if(type==2){      
    }  

    // upper mounting holes for blowers heat-set M3 brass
    if(type==1){
      // hole for the blower attach brass part
      translate([+480/2-X0+48.6+3,28.5-3.5,High0+zmotor1+37.6])
      rotate([-98,0,0])
      cylinder(r=2.3,h=3.6+15,$fn=22);
      // clearance for M3 screw past the brass
      translate([+480/2-X0+48.6+3,28.5-6.5,High0+zmotor1+38.1])
      rotate([-98,0,0])
      cylinder(r=1.8,h=3.6+18,$fn=22);
    }
    if(type==2){
      // hole for the blower attach brass part
      translate([+480/2-X0+84,28.5-3.5,High0+zmotor1+37.6])
      rotate([-98,0,0])
      cylinder(r=2.3,h=3.6+15,$fn=22);
      // clearance for M3 screw past the brass
      translate([+480/2-X0+84,28.5-6.5,High0+zmotor1+38.1])
      rotate([-98,0,0])
      cylinder(r=1.8,h=3.6+18,$fn=22);
    }
    
    // topside brass mounts for wire retainers *******************************************
    if(type==1){
      translate([+480/2-X0+75,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
      translate([+480/2-X0+90.3,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
    }
    if(type==2){
      translate([+480/2-X0+45.5,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
      translate([+480/2-X0+60,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
    }
    
    
} // end diff ------------------------------------------------------------

    // topside clips for the cooling lines
    if(type==1){
      color("pink")
      translate([+480/2-X0+61,4.5,High0+zmotor1+55])
      difference(){
        union(){
          rotate([-90,0,0])
          cylinder(r=3.5,h=6,$fn=22);
          translate([-3.5,0,-5])
          cube([7,6,5]);
        }
        translate([0,-1,0])
        rotate([-90,0,0])
        cylinder(r=2.2,h=8,$fn=22);
        translate([-2.8,-1,3.5])
        rotate([0,45,0])
        cube([4,8,4]);
      }
          
      color("pink")
      translate([+480/2-X0+69,4.5,High0+zmotor1+55])
      difference(){
        union(){
          rotate([-90,0,0])
          cylinder(r=3.5,h=6,$fn=22);
          translate([-3.5,0,-5])
          cube([7,6,5]);
        }
        translate([0,-1,0])
        rotate([-90,0,0])
        cylinder(r=2.2,h=8,$fn=22);
        translate([-2.8,-1,3.5])
        rotate([0,45,0])
        cube([4,8,4]);
      }
    }
    if(type==2){
      color("red")
      translate([(480/2-X0+67),4.5,High0+zmotor1+55])
      difference(){
        union(){
          rotate([-90,0,0])
          cylinder(r=3.5,h=6,$fn=22);
          translate([-3.5,0,-5])
          cube([7,6,5]);
        }
        translate([0,-1,0])
        rotate([-90,0,0])
        cylinder(r=2.2,h=8,$fn=22);
        translate([-2.8,-1,3.5])
        rotate([0,45,0])
        cube([4,8,4]);
      }
          
      color("pink")
      translate([(480/2-X0+75),4.5,High0+zmotor1+55])
      difference(){
        union(){
          rotate([-90,0,0])
          cylinder(r=3.5,h=6,$fn=22);
          translate([-3.5,0,-5])
          cube([7,6,5]);
        }
        translate([0,-1,0])
        rotate([-90,0,0])
        cylinder(r=2.2,h=8,$fn=22);
        translate([-2.8,-1,3.5])
        rotate([0,45,0])
        cube([4,8,4]);
      }
    }
    
    // touch box, just for reference, do not print
    if(0){
      if(type==1){
        translate([+480/2-X0+95.1,-2.7,High0+19.5]){
          touchbox();

          color("red")
          translate([1,0,0])
          rotate([0,0,-90])
          bltouch(up=1);
        }
      }
    }
    
    if(type==1){   
      difference(){
        union(){
          // belt attach solid part
          translate([+480/2-X0+91,14.5,High0+74])
          rotate([0,180,90])
          belt1();  
          // lower mount for blower heat-set M3 brass
          color("pink")
          translate([+480/2-X0+95,19,High0+44.5])
          rotate([-98,0,0])
          cylinder(r=4,h=3.5+2,$fn=22);
        }
        // cut for the lm8u
        translate([+480/2-X0+80+22,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=15/2+0.1,h=68,$fn=F2);
        // hole for the blower attach brass part
        translate([+480/2-X0+95,19+2,High0+43.8])
        rotate([-98,0,0])
        cylinder(r=2.3,h=3.5+15,$fn=22);
        // clearance for M3 screw past the brass
        translate([+480/2-X0+95,16+2,High0+44.2])
        rotate([-98,0,0])
        cylinder(r=1.8,h=3.5+18,$fn=22);
        
      }

    }
    if(type==2){
      // belt attach solid
      difference(){
        translate([+480/2-X0+53,14.5,High0+34.8])
        rotate([0,0,-90])
        belt1();  
        
        // cut for the lm8u
        translate([+480/2-RightX0-35,16,High0+zmotor1+34])
        rotate([-90,0,90])
        cylinder(r=15/2,h=65,$fn=F2);

        // clearance near the extruder motor hole
        translate([+480/2-RightX0-73,7,High0+zmotor1+11])
        rotate([0,55,0])
        cube([10,16,10]);
      }

    }
  
    // add rounding to the upper lm8u surrounds
    translate([+480/2-X0+100,25,High0+zmotor1+31])
    rotate([-90,0,90])
    cylinder(r=2,h=65,$fn=F2);
    
    // rounding for lower lm8u surrounds, depends on type
    if(type==1){
      translate([+480/2-X0+100,25,High0+33]) 
      rotate([-90,0,90])
      cylinder(r=2,h=24+7,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+68,25,High0+33]) 
      rotate([-90,0,90])
      cylinder(r=2,h=24,$fn=F2);
    }

    // lower attachment for blower fan Right side
    if(type==2){
      difference(){
        // boss
        translate([+480/2-X0+37.0,9,High0+44.5])
        rotate([-8,0,0])
        minkowski(){
        cube([8,6,4]);
        rotate([-90,0,0])
        cylinder(r=2,h=6,$fn=22);
        }
        // hole for the blower attach brass part
        translate([+480/2-X0+40.5,16,High0+44.3])
        rotate([-98,0,0])
        cylinder(r=2.3,h=3.5+18,$fn=22);
        // clearance for M3 screw past the brass
        translate([+480/2-X0+40.5,13,High0+44.8])
        rotate([-98,0,0])
        cylinder(r=1.8,h=3.5+21,$fn=22);
      }
    }
    
    // Duct Left
    if(type==1){
      if(1){
      difference(){
        union(){
          color("pink")
          translate([+480/2-X0+45,26,High0+36]) 
          rotate([0,90,0])
          cylinder(r=18,h=24+0,$fn=F2);
          color("green")
          translate([+480/2-X0+45,9.5,High0+15.5]) 
          rotate([8,0,0])
          cube([24+0,19,28]);
        }
        translate([+480/2-X0+44,-2,High0+36.5]) 
        rotate([0,0,0])
        cube([26+12,25,28]);
        translate([+480/2-X0+44,20,High0+36.5]) 
        rotate([-9,0,0])
        cube([26+16,25,28]);
        // cut for rail
        translate([+480/2-X0+80+22,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=5.5,h=68,$fn=F2);

        color("gray")
        difference(){
          translate([+480/2-X0+48,26,High0+36]) 
          rotate([0,90,0])
          cylinder(r=16,h=17,$fn=F2);

          translate([+480/2-X0+46,14,High0+32]) 
          rotate([0,90,0])
          cylinder(r=10,h=22,$fn=F2);
        }       
        
        translate([+480/2-X0+48,8,High0+17.5]) 
        rotate([8,0,0])
        cube([17,18,3.8]);
        
        // cut for visibility
        //translate([+480/2-X0+30,6,High0+10]) 
        //cube([20,40,30]);
      }
      }

        
    }      
      
    // Duct Right  
    if(type==2){
      if(1){
      difference(){
        union(){
          color("pink")
          translate([+480/2-X0+66,26,High0+36]) 
          rotate([0,90,0])
          cylinder(r=18,h=24+0,$fn=F2);
          color("green")
          translate([+480/2-X0+66,9.5,High0+15.5]) 
          rotate([8,0,0])
          cube([24+0,19,28]);
          
        }
        translate([+480/2-X0+65,-2,High0+36.5]) 
        rotate([0,0,0])
        cube([26+12,25,28]);
        translate([+480/2-X0+65,20,High0+36.5]) 
        rotate([-9,0,0])
        cube([26+16,25,28]);
        // cut for rail
        translate([+480/2-X0+80+22,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=5.5,h=68,$fn=F2);

        color("gray")
        difference(){
          translate([+480/2-X0+69,26,High0+36]) 
          rotate([0,90,0])
          cylinder(r=16,h=17,$fn=F2);

          translate([+480/2-X0+69,14,High0+32]) 
          rotate([0,90,0])
          cylinder(r=10,h=22,$fn=F2);
        }       
        
        translate([+480/2-X0+69,8,High0+17.5]) 
        rotate([8,0,0])
        cube([17,18,3.8]);
        
        // re-cut for the lm8u into the duct side
        translate([+480/2-X0+69,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=15/2+0.1,h=26,$fn=F2);

      }
    }        
  }      
}

//---------------------------------------
// fixed part
module belt1(){
difference(){
    // base block
    color("orange")
    translate([-5,-9,25]) cube([12,24,14]);

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
    translate([-1,-4,28]) 
    rotate([90,0,0])
    cylinder(r=3,h=6,$fn=22);

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

//--------------------
module standoff(){

  rotate([0,0,180/8])
    difference(){
      cylinder(r=5.3,h=16,$fn=8);        
      translate([0,0,-0.5])
      cylinder(r=2.2,h=17,$fn=8);        
    }
  
}

// ---------------------
module touchbox(){
  
  difference(){
    union(){
    translate([-0.8,-0.7,19])
    cube([10,15.8,30],center=true);
    color("green")
    translate([-0.8,-0.7,41.7])
    cube([10,15.8,10.4],center=true);
    color("orange")
    translate([5,-0.6,37])
    cube([6,6,2],center=true);

    color("gray")
    translate([5-1,-0.6,42.5])
    cube([3,14,8],center=true);

    color("blue")
    translate([-3.8,-0.7,37.7])
    cube([4,15.8,18],center=true);
    
    color("cyan")
    translate([5.5,6.2,9])
    cube([4,2,7],center=true);
    
    color("pink")
    translate([5.5,-7.4,9])
    cube([4,2.4,7],center=true);
    
    }
    translate([1,-0.6,0])
    rotate([0,0,-90])
    bltouch(up=1,tol=0.15);
    
    // upper flat head M4 
    translate([-1,11,62-19.5])
    rotate([90,0,0])
    cylinder(r=2,h=30,$fn=44);

    // lower M4x12 from backside of extruder
    translate([-1,0,17.35])
    rotate([90,0,0])
    cylinder(r=2,h=10,$fn=44);

  }
  
}
//--------------------------------------------------------------------------
module shockmount(){
  
  difference(){
  union(){
    cylinder(r=4,h=1,$fn=22);
    cylinder(r=2.1,h=2.5+1,$fn=22);
  }
  translate([0,0,-0.5])
  cylinder(r=1.6,h=5,$fn=22);
  }  
}
//-------------------------------------------------------
// blower shock mount left side lower
module blowerS1(){
  difference(){
    cylinder(r=4,h=5.7,$fn=22);
    translate([0,0,-1])
    cylinder(r=1.6,h=8,$fn=22);
  }
}
//-------------------------------------------------------
// blower shock mount left side upper
module blowerS2(){
  difference(){
    cylinder(r=4,h=7.8,$fn=22);
    translate([0,0,-1])
    cylinder(r=1.6,h=9,$fn=22);
    translate([-2.0,5,-1])
    rotate([0,0,-45])
    cube([10,10,10]);
  }
}
//-------------------------------------------------------
// blower shock mount right side lower
module blowerS3(){
  difference(){
    cylinder(r=4,h=8.2,$fn=22);
    translate([0,0,-1])
    cylinder(r=1.6,h=10,$fn=22);
  }
}
//-------------------------------------------------------
// blower shock mount right side upper
module blowerS4(){
  difference(){
    cylinder(r=4,h=6.6,$fn=22);
    translate([0,0,-1])
    cylinder(r=1.6,h=10,$fn=22);
    translate([-5,-1,-1])
    rotate([0,0,45])
    cube([10,10,10]);
  }
}
//----------------------------------------------
// wire clips on topside
module wireclip(type=1,X0=0){

h1=6;
  
    if(type==1){

      difference(){
        union(){
          // right foot
          translate([+480/2-X0+76.5,8.75,High0+zmotor1+51.5])
          cylinder(r=4.25,h=7,$fn=200);
          // left foot
          translate([+480/2-X0+90,8.75,High0+zmotor1+51.5])
          cylinder(r=4.25,h=7,$fn=200);
          // central block
        color("green")
          translate([+480/2-X0+76,4.5,High0+zmotor1+51.5])
          cube([13.5,8.5,h1]);
          // curved top of block
          translate([+480/2-X0+76+13.5/2,4.5,High0+zmotor1+51.5+h1])
          rotate([-90,0,0])
          cylinder(r=13.5/2,h=8.5,$fn=88);
        }
        
        // right screw hole
        translate([+480/2-X0+75,8.5,High0+zmotor1+50])
        cylinder(r=1.8,h=20,center=true,$fn=22);
        // right head clearance
        translate([+480/2-X0+75,8.5,High0+zmotor1+58.5])
        cylinder(r=5.8/2,h=20,$fn=22);
        
        // left screw hole
        translate([+480/2-X0+90.3,8.5,High0+zmotor1+50])
        cylinder(r=1.8,h=20,center=true,$fn=22);
        // left head clearance
        translate([+480/2-X0+90,8.5,High0+zmotor1+58.5])
        cylinder(r=5.8/2,h=20,$fn=22);
        
        // central hole
        color("red")
        hull(){
          // upper
          translate([+480/2-X0+76+13.5/2,3.5,High0+zmotor1+51.5+h1])
          rotate([-90,0,0])
          cylinder(r=8/2,h=10,$fn=88);
          // lower
          translate([+480/2-X0+76+13.5/2,4.5,High0+zmotor1+54.0])
          rotate([-90,0,0])
          cylinder(r=8/2,h=10,$fn=88);
        }
      }
    }
    if(type==2){
/*
      translate([+480/2-X0+45.5,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
      translate([+480/2-X0+60,8.5,High0+zmotor1+48.1]){
        cylinder(r=2.3,h=3.5,$fn=22);
        cylinder(r=1.8,h=3.5+5,center=true,$fn=22);
      }
      */

      difference(){
        union(){
          // right foot
          translate([+480/2-X0+45.5,8.75,High0+zmotor1+51.5])
          cylinder(r=4.25,h=7,$fn=200);
          // left foot
          translate([+480/2-X0+60,8.75,High0+zmotor1+51.5])
          cylinder(r=4.25,h=7,$fn=200);
          // central block
        color("green")
          translate([+480/2-X0+45.5,4.5,High0+zmotor1+51.5])
//          cube([14,8.5,h1]);
          cube([14.5,8.5,7]);
          // curved top of block
          translate([+480/2-X0+45.5+14/2,4.5,High0+zmotor1+51.5+h1])
          rotate([-90,0,0])
          cylinder(r=13.0/2,h=8.5,$fn=88);
        }

        // trim the left foot
        translate([+480/2-X0+63.4,4.5,High0+zmotor1+51.5])
        cube([6,8.5,h1+10]);
        
        // right screw hole
        translate([+480/2-X0+45.5,8.5,High0+zmotor1+50])
        cylinder(r=1.8,h=20,center=true,$fn=22);
        // right head clearance
        translate([+480/2-X0+45.5,8.5,High0+zmotor1+58.5])
        cylinder(r=5.8/2,h=20,$fn=22);
        
        // left screw hole
        translate([+480/2-X0+60,8.5,High0+zmotor1+50])
        cylinder(r=1.8,h=20,center=true,$fn=22);
        // left head clearance
        translate([+480/2-X0+60,8.5,High0+zmotor1+58.5])
        cylinder(r=5.8/2,h=20,$fn=22);
        
        // central hole
        color("red")
        hull(){
          // upper
          translate([+480/2-X0+45.5+14.0/2,3.5,High0+zmotor1+51.5+h1])
          rotate([-90,0,0])
          cylinder(r=7.5/2,h=10,$fn=88);
          // lower
          translate([+480/2-X0+45.5+14.0/2,4.5,High0+zmotor1+54.0])
          rotate([-90,0,0])
          cylinder(r=7.5/2,h=10,$fn=88);
        }
      }
    }
}

//==========================================================================================

//standoff();
//touchbox();

//wireclip(type=1,X0=LeftX0);
wireclip(type=2,X0=RightX0+135);

// printing for the blower standoffs
if(0){
  blowerS1();
  translate([10,0,0])
  blowerS2();
  translate([20,0,0])
  blowerS3();
  translate([30,0,0])
  blowerS4();
}

// printing for the blower shock mounts, use ninja-flex
if(0){
  for(kk=[0:7]){
    translate([kk*9,0,0]){
      shockmount();
      color("red")
      translate([3.5,-0.4,0])
      cube([2,0.85,0.6]);
    }
  }
}



// left blower
if(0){
color("cyan")
translate([+480/2-LeftX0+99,22,High0+37])
rotate([9,0,180])
blower();  
}
// left blower flex box
if(0){
//color("red")
translate([+480/2-LeftX0+99,22,High0+37])
rotate([9,0,180])
flexboxL();  
}

// left blower standoffs
if(0){
  // lower
  color("red")
  translate([+480/2-LeftX0+95,24.5,High0+43.75])
  rotate([-98,0,0])
  blowerS1();
  color("green")
  translate([+480/2-LeftX0+95,30.2,High0+42.9])
  rotate([-98,0,0])
  shockmount();
  color("blue")
  translate([+480/2-LeftX0+95,38.2,High0+41.6])
  rotate([82,0,0])
  shockmount();

  // upper
  color("red")
  translate([+480/2-LeftX0+48.5+3,28.5,High0+zmotor1+37.0])
  rotate([-98,0,0])
  blowerS2();
  color("green")
  translate([+480/2-LeftX0+48.5+3,36.3,High0+zmotor1+36])
  rotate([-98,0,0])
  shockmount();
  color("blue")
  translate([+480/2-LeftX0+48.5+3,44.5,High0+zmotor1+35])
  rotate([82,0,0])
  shockmount();
}

// left extruder belt slider
if(0){
X5=LeftX0;
difference(){
// left belt attach movable
  translate([+480/2-X5+65,14.5,High0+74])
  rotate([0,180,90])
  belt2();  
}
}

// support for printing left belt slider 
if(0){
  X5=LeftX0;
  color("pink")
  translate([+480/2-X5+45,9.5,High0+44])
  cube([21,2,5]);
}

// Left x carriage   *********************************
//xmain1(X0=LeftX0,type=1);

// support for printing Left xmain1
if(0){
  // upper rail and lm8us
  translate([+480/2-LeftX0+35,4.5,High0+zmotor1+29])
  color("pink")
  cube([65,20,11]);
  
  // lower rail and lm8us 
  color("pink")
  translate([+480/2-LeftX0+45,4.5,High0+15])
  cube([55,20,20]);

}

// Right x carriage ******************************************************
//xmain1(X0=RightX0+135,type=2);

// support for printing Right xmain1
if(0){
  // upper rail and lm8us
  translate([+480/2-RightX0+35-135,4.5,High0+zmotor1+29])
  color("pink")
  cube([65,20,11]);
  
  // lower rail and lm8us
  color("pink")
  translate([+480/2-RightX0+45-135,4.5,High0+18])
  cube([45,20,16.5]);
}

// right blower 
if(0){
color("cyan")
translate([+480/2-RightX0-98.5,43,High0+33.5])
rotate([-9,0,0])
blower();  
}

// right blower standoffs 
if(0){
  // lower
  color("red")
  translate([480/2-RightX0-95,21.0,High0+43.9])
  rotate([-98,0,0])
  blowerS3();
  color("green")
  translate([+480/2-RightX0-95,29.2,High0+42.9])
  rotate([-98,0,0])
  shockmount();
  color("blue")
  translate([+480/2-RightX0-95,37.2,High0+41.6])
  rotate([82,0,0])
  shockmount();

  // upper
  color("red")
  translate([+480/2-RightX0-51,28.5,High0+zmotor1+37.0])
  rotate([-98,0,0])
  blowerS4();
  color("green")
  translate([+480/2-RightX0-51,35.0,High0+zmotor1+36])
  rotate([-98,0,0])
  shockmount();
  color("blue")
  translate([+480/2-RightX0-51,43.3,High0+zmotor1+35])
  rotate([82,0,0])
  shockmount();
}

// right belt attach movable
if(0){
  X6=RightX0;
  color("pink")
  difference(){
    translate([+480/2-X6-56,14.5,High0+34.8])
    rotate([0,0,-90])
    belt2();  
    
    translate([+480/2-RightX0-35,16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2,h=65,$fn=F2);
  }

}


// standoffs are no longer part of the carriage
if(0){ // left side
    // four legs to attach extruder
    X3=LeftX0;
    color("pink")
    translate([+480/2-X3+41.1,-11.4,High0+89.9])
    rotate([-90,0,0])
    standoff();
    translate([+480/2-X3+41.1+53,-11.4,High0+89.9])
    rotate([-90,0,0])
    standoff();
    translate([+480/2-X3+41.1,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    standoff();
    //translate([+480/2-X3+41.1+53,-11.4,High0+89.9-53])
    //rotate([-90,0,0])
    //standoff();
}
if(0){  // right side
    // four legs to attach extruder
    X4=RightX0+135;
    color("pink")
    translate([+480/2-X4+41.1,-11.4,High0+89.9])
    rotate([-90,0,0])
    standoff();
    translate([+480/2-X4+41.1+53,-11.4,High0+89.9])
    rotate([-90,0,0])
    standoff();
    translate([+480/2-X4+41.1,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    standoff();
    translate([+480/2-X4+41.1+53,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    standoff();
}

if(0){
// left extruder
color("gray")
translate([+480/2-LeftX0,2,High0+26+10])
rotate([90,0,180])
import("aqua5.stl");
}

if(0){
// left emotor
color("orange")
translate([+480/2-LeftX0+67,-59.5,High0+44+10])
rotate([90,-90,180])
emotor();
}

if(0){  // left side bearings
// x rod lm8u bearing low
color("gray")
translate([+480/2-LeftX0+100,0+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80+20,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80-21,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);
}

// main frame
if(0){
frame(yoff=ytower,x1=x1,y1=y1,z1=z1);
}

// left x-end "Prusa Dusa"
if(0){
translate([0,0,High0-150])
xleft1();
}

// left limit switch 
if(0){
  color("red")
  translate([x2-28+zscrew,-5,High0+90-48])
  rotate([0,-90,90]){
    switch(ang1=0); 
    switch(ang1=12); 
  }
}

// left x motor
if(0){
color("gray")
translate([480/2-30-xmot0,0+76,High0+zmotor1])
rotate([90,90,0])
xymotor();
}

// left pulley and idler
if(0){
color("pink")
translate([480/2-30-xmot0,0+24,High0+zmotor1])
rotate([90,90,0])
pulley();

color("yellow")
translate([480/2-30-xmot0,0+24-5,High0+zmotor2-1.5])
rotate([90,90,0])
idler();
}

// right x-end "Tom Flint"
translate([0,0,High0-150])
//xright1();

// right limit switch 
if(0){
  translate([-(x2-28+zscrew-2),-6.5,High0+90-34])
  rotate([90,90,0]){
    switch(ang1=0);
    switch(ang1=12);
  }
}

// right x motor
if(0){
color("blue")
translate([-480/2+30+xmot0,0+76,High0+zmotor2])
rotate([90,90,0])
xymotor();
}

if(0){
// right x motor pulley
color("orange")
translate([-480/2+30+xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
pulley();

color("orange")
translate([-480/2+30+xmot0,0+24-5,High0+zmotor1+1.5])
rotate([90,90,0])
idler();
}

if(0){
// belt upper right
color("blue")
difference(){
    hull(){ // outer
        // pulley
        translate([-480/2+30+xmot0,0+17-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);
    }
    hull(){  // inner
        // pulley
        translate([-480/2+30+xmot0,0+17-0.5-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=7,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17-0.5-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=7,$fn=F2);
    }
}
}
if(0){
// belt lower left
color("gray")
difference(){
    hull(){  // outer
        // right x idler
        translate([-480/2+30+xmot0,0+17-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+30+xmot0,0+17-0.5-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=7,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17-0.5-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=7,$fn=F2);
    }
}
}

if(0){
// upper x rod
color("orange")
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);


}

if(0){
// right extruder
color("gray")
translate([+480/2-RightX0,2,High0+26+10])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
}
if(0){
// right emotor
color("gray")
//translate([+480/2-LeftX0+67,-59.5,High0+44+10])
translate([+480/2-RightX0-68,-59.5,High0+44+10])
rotate([90,-90,180])
emotor();
}


if(0){  // right side bearings
// x rod lm8u bearing low
color("gray")
translate([+480/2-RightX0-76,16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-RightX0-56+21,16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-RightX0-56-20,16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);
}


//===============================================


