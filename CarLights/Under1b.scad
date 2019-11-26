// Under1b
// Fiber holder at tips of under


//-------------------------------------


//--------------------------------------------
module block2(
    r0=18,   // radius for boss
    z1=1,  // height of block
    r2=1.8,  // radius for fiber cut
    r3=3,    // outer radius fiber holder
    r4=17,  // radius of holder
    a1=220  // angle of holder
){
    
    difference(){
        // boss
        union(){
            cylinder(r=r0,h=z1,$fn=22);       

            translate([0,0,r3])
            rotate_extrude(angle=a1,$fn=88)
            translate([r4,0,0])
            circle(r=r3,$fn=88);
        }
        
        // center hole
        color("blue")
        translate([0,0,-0.5])
        cylinder(r=8.5, h=z1+1,$fn=22);
        
        // fiber hole
        translate([0,0,r3])
        rotate_extrude(angle=360,$fn=88)
        translate([r4,0,0])
        circle(r=r2,$fn=88);

        // stress relief
        translate([0,0,2*r3-2])
        difference(){
            cylinder(r1=17.5,r2=18.5,h=z1+2,$fn=88);       
            translate([0,0,-0.5])
            cylinder(r1=16.5,r2=15, h=z1+3,$fn=88);
            
            
        }
    }



}



//==============================================

block2();

//=================================================
