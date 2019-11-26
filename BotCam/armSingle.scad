// armSingle for sg92r micro servo

//------------------------------------------
// armSingle
module armSingle(){
difference(){
    union(){
        // Boss
        cylinder(r=6.9/2,h=4.75,$fn=44);
        // arm
        hull(){
            translate([0,0,4.75-1.85])
            cylinder(r=2.35,h=1.85,$fn=22);

            translate([13.4,0,4.75-1.85])
            cylinder(r=3.8/2,h=1.85,$fn=22);
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
    translate([4.7+i*1.85,0,4.75-1.85])
    cylinder(r=0.4,h=2,$fn=22);
}
} // ---------- end module armSingle -------

armSingle();



