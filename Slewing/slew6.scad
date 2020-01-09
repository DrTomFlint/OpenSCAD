// slew1
// slewing joint with cross roller bearings


F1=200;              // $fn for rollers
F2=44;              // $fn for less critical

// TEST !!
//rod=9.0;           // roller outer diameter
// 9.0 too loose, #5 build first solid

// 9.1 is good, use that extra 0.1 on the rollers only!!
rod=9.0;           // roller outer diameter
rodx=9.1;

rid=5.8;            //  roller inner diameter
//rhi=rod-0.5;      // roller height
rhi=rod-0.6;      // roller height

rbevel=1.2;           // z height of bevels
Nr = 6;            // half the number rollers
    
ofill=0;        // outer race fillet
ood=36-ofill;        // outer race outer rad
oid=10+ofill;         // outer race inner rad
ohi=14-2*ofill;         // outer race height

iooff=0.51;     // offset race in the boss

iogap=4;        // inner outer gap

Nholei=8;     // number holes inner
rholei=1.55;     // radius of holes inner
oholei=3;       // offset from edge

Nholeo=8;     // number holes inner
rholeo=1.55;     // radius of holes inner
oholeo=3;       // offset from edge

//CutAngle=180/Nr;   // cutaway view if < 360
CutAngle=360;   // cutaway view if < 360

//-------------------------------
module roller1(tol=0){

difference(){
union(){
    // boss is stack of 3 cylinders
    translate([0,0,-tol])
    cylinder(r1=rodx/2-rbevel,  r2=rodx/2+tol, h=rbevel+tol, $fn=F1);

    translate([0,0,rbevel])
    cylinder(r=rodx/2+tol, h=rhi-2*rbevel, $fn=F1);
        
    translate([0,0,rhi-rbevel])
    cylinder(r1=rodx/2+tol,  r2=rodx/2-rbevel, h=rbevel, $fn=F1);
}


}
}

//-------------------------------
module roller1cut(tol=0){

difference(){
union(){
    translate([0,0,rbevel])
    cylinder(r=rod/2+tol, h=rhi-2*rbevel, $fn=F1);
}


}
}


//------------------------------------
module ring1(tol=0.1){
    
    difference(){
        union(){
        // main ring
        rotate_extrude(angle=CutAngle,$fn=F1){
        translate([(ood+oid)/2,0,0])
        //offset(r=ofill,$fn=F2)
        square([ood-oid,ohi],center=true);
        }

    } // end union
    
        // cut for races
        rotate_extrude($fn=F1){
        translate([(ood+oid)*iooff,0,0])
        rotate([0,0,45])
        offset(r=rbevel,$fn=F2)
        square([rod-rbevel*2+tol,
            rod-rbevel*2+tol],center=true);
        }
        
        // cut for bolts inner
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholei,h=ohi*2,center=true,$fn=16);
        }

    }
}

//---------------------------------
module outer1(){

lip=0;
    
    difference(){
        union(){
        ring1();  

        color("cyan")
        translate([0,0,ohi/2+1])
        cylinder(r1=ood+lip,r2=ood+lip,h=2,center=true,$fn=F1);
    }// end union
    
    // cut for outer ring
    cylinder(r=(ood+oid)*iooff+iogap/2,h=ohi*3,center=true,$fn=F1);
    

    // cut for bolts outer
    for(i=[0:Nholeo-1]){
        rotate([0,0,360/Nholeo*i])
        translate([ood-oholeo,0,-1])
        cylinder(r=rholeo,h=ohi*2,center=true,$fn=16);
    }

    // cut for bolt heads
    for(i=[0:Nholeo-1]){
        rotate([0,0,360/Nholeo*i])
        translate([ood-oholeo,0,-ohi/2-1])
        cylinder(r=2.9,h=5,$fn=16);
    }

    
    translate([(ood+oid)/2+5.5,13,-ohi/2-0.2])
color("red")
    rotate([0,0,-65])
    linear_extrude(height=0.8){
        rotate([180,0,0])
    text("5", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
}// end diff

}
//---------------------------------
module inner1(){
    
    intersection(){
        ring1();  
        // cut for inner ring
        cylinder(r=(ood+oid)*iooff-iogap/2,h=ohi*3,center=true,$fn=F1);
    }   
    
}
//-----------------------------------
module innerLow(tol=0.1){
    difference(){
        inner1();
        
        translate([-ood,-ood,-tol])
        cube([ood*2,ood*2,20]);

    }
 
difference(){
    color("orange")
        translate([0,0,-ohi/2-2])
        difference(){
            union(){
            cylinder(r=(ood+oid)*iooff+iogap/2+3,h=3,center=true,$fn=F2);
                translate([0,0,2])
            cylinder(r=(ood+oid)*iooff-iogap/2,h=1,center=true,$fn=F2);
            }
            
            cylinder(r=oid,h=6,center=true,$fn=F1);

       // cut for bolts inner
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholei,h=ohi*2,center=true,$fn=16);
        }

        // cuts for bolt heads
        if(1){
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i]){
            translate([oid+oholei,0,-0.1])
            cylinder(r=2.9,h=3.0,center=true,$fn=16);
            translate([oid+oholei,0,1.6])
            cylinder(r1=2.9,r2=1.55,h=1,center=true,$fn=16);
            }
        }
    }
                




        }
        
    translate([(ood+oid)/2-1,8,-ohi/2-4])
color("red")
    rotate([0,0,-65])
    linear_extrude(height=0.8){
        rotate([180,0,0])
    text("5", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
        
    }
    
 }

//-----------------------------------
module innerHi(tol=0.1){
    difference(){
    intersection(){
        inner1();
        
        translate([-ood,-ood,+tol])
        cube([ood*2,ood*2,20]);
    }


        // cut for bolt heads
    if(0){
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,ohi/2-4])
            cylinder(r=3,h=4,$fn=F2);
        }
    }

    translate([(ood+oid)/2-9,6,ohi/2-0.2])
color("red")
    rotate([0,0,-65])
    linear_extrude(height=0.8){
        rotate([0,0,0])
    text("5", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
}
}

//--------------------------------
module gasket(){
    intersection(){
    inner1();
    cylinder(r=30,h=0.2,center=true);
}
}


//--------------------------------
module carrier2(tol=-0.25){
    a1=360/Nr;
//    a1=360;
z0=ohi+2*ofill;
z1=0.0;     // clearance to top/bottom

tolR=0.25;  // radial tolerance to clear races    
    
difference(){ 
  union(){  
     difference(){
        // outer ring
        translate([0,0,z1])
            cylinder(r=(ood+oid)*iooff+iogap/2-tolR,h=z0-z1,center=true,$fn=F1);
                
        // cut for inner ring
        translate([0,0,-z1])
        cylinder(r=(ood+oid)*iooff-iogap/2+tolR,h=ohi*1.3,center=true,$fn=F1);
    }   
    }

c1=2;
    
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2-c1])
    cylinder(r=rod/2+0.3, h=rhi+2*c1, $fn=F1);

 }
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2-c1])
    cylinder(r=rod/2+0.3, h=rhi+2*c1, $fn=F1);
}

// indicator cuts
    rotate([0,0,90/Nr])
    translate([(ood+oid)*iooff,0,ohi/2])
    rotate([45,0,0])
    cube([5,2,2],center=true);



}// end diff
}

// ----------------------------------
module plate1(){
    difference(){
    union(){
        cylinder(r=(ood+oid)*iooff-iogap/2-4,h=2.1,$fn=F2);
        
        cylinder(r2=3,r1=oid,h=7,$fn=12);

        cylinder(r=7.3/2,h=25,$fn=6);
}
       // cut for bolts inner
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholei+0.05,h=ohi*2,center=true,$fn=16);
        }
            
        // center hole
        cylinder(r=rholei,h=ohi*2,$fn=6);

    }
}
//=================================

if(0){
difference(){
carrier();
translate([22,-13,0])
rotate([0,0,180/Nr])
cube([40,40,40],center=true);    
}
}

//carrier2();

if(0){
//for(i=[0]){
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2])
    roller1();
}
//for(i=[0]){
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2])
    roller1();
}
}

//roller1();

//ring1();

//outer1();

//innerHi();
//innerLow();

plate1();

//gasket();

