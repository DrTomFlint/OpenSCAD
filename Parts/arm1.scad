// armSingle for sg92r micro servo

//------------------------------------------
// arm1
module arm1(){
difference(){
    union(){
        // Boss
        cylinder(r=3.55,h=4.75,$fn=44);
        // arm
        hull(){
            translate([0,0,4.75-1.85])
            cylinder(r=3.2,h=1.85,$fn=22);

            translate([14,0,4.75-1.85])
            cylinder(r=3.9/2,h=1.85,$fn=22);
        }
    }

    // bottom cut
    cylinder(r=2.2,h=3.0,$fn=22);
    // thru cut
    cylinder(r=1.1,h=5,$fn=22);
    // top cut
    translate([0,0,4.75-1.0])
    cylinder(r=2.32,h=1,$fn=44);
    
    // holes in the arm
    for(i=[0:5])
    translate([4.7+i*9.75/5,0,4.75-1.85])
    cylinder(r=0.4,h=2,$fn=22);
}
} // ---------- end module arm1 -------

// arm1cut
module arm1cut(tol=0.1){
difference(){
    union(){
        // Boss
        cylinder(r=3.55+tol/2,h=4.75+tol,$fn=44);
        // arm
        hull(){
            translate([0,0,4.75-1.85])
            cylinder(r=3.2+tol/2,h=1.85+tol,$fn=22);

            translate([14,0,4.75-1.85])
            cylinder(r=3.9/2+tol,h=1.85,$fn=22);
        }
    }

    // bottom cut if needed
//    cylinder(r=2.2-tol/2,h=3.0-tol,$fn=22);
}
} // ---------- end module arm1cut -------
//---------------------------
module disk3(){
difference(){
union(){
    translate([0,0,-4])
    cylinder(r1=8,r2=8.5,h=4,$fn=180);

    cylinder(r=12,h=1,$fn=180);
    
    translate([0,0,1])
//    rotate([0,0,30])
    cylinder(r=4,h=2.5,$fn=6);
}

    translate([0,0,0])
    rotate([180,0,0])
    arm1cut(tol=0.2);

    translate([0,0,0])
    rotate([0,0,180])
    rotate([180,0,0])
    arm1cut(tol=0.2);

}
}

//---------------------------
module disk3cut(tol=0.1){
    translate([0,0,-4-tol])
    cylinder(r1=8+tol,r2=8.5+tol,h=4+tol,$fn=180);

    cylinder(r=12+tol,h=1+tol,$fn=180);
    
    translate([0,0,1])
//    rotate([0,0,30])
    cylinder(r=4+tol,h=2.5+tol,$fn=6);
}

//---------------------------

difference(){
arm1cut();
arm1();
}

translate([0,15,0])
arm1cut();

translate([0,40,0])
disk3();

translate([0,70,0])
difference(){
disk3cut();
disk3();
}
