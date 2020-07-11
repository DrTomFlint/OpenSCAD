// bearings
// modules for bearings

//----------------------------
// 608Z ball bearings from the filament rollers
module balls1(
    tol=0.0,
    mark=1,
    hole=1
){

bod=22;     // bearing outer diameter
bid=7.9;    // bearing inner diameter
bxd=12.0;   // bearing x diameter
bhi=7.0;
bevel=0.75;
    
pts = [ [bxd/2-0.2,0], [bxd/2,-0.2], [bxd/2+0.2,0] ];


difference(){    
union(){
    // boss is stack of 3 to get bevels
    translate([0,0,-tol])
    cylinder(r1=bod/2+tol-bevel,r2=bod/2+tol,h=bevel,$fn=120);

    translate([0,0,bevel+tol])
    cylinder(r=bod/2+tol,h=bhi-2*bevel,$fn=120);
        
    translate([0,0,bhi-bevel+tol])
    cylinder(r1=bod/2+tol,r2=bod/2+tol-bevel,h=bevel,$fn=120);
}

    if(hole==1){
    // hole is stack of 3 to get bevels
    translate([0,0,-0.01])
    cylinder(r1=bid/2-tol+bevel,r2=bid/2-tol,h=bevel+0.01,$fn=120);
   
    translate([0,0,bevel-0.01])
    cylinder(r=bid/2-tol,h=bhi-2*bevel+0.02,$fn=120);
        
    translate([0,0,bhi-bevel])
    cylinder(r1=bid/2-tol,r2=bid/2-tol+bevel,h=bevel+0.01,$fn=120);
    }
    
    if(mark==1){
    // mark the inner race
    translate([0,0,bhi+0.01])
    rotate_extrude($fn=144){
        polygon(points=pts);
    }

    translate([0,0,-0.01])
    rotate([180,0,0])
    rotate_extrude($fn=144){
        polygon(points=pts);
    }
}
}


}


//==============================

balls1();

translate([40,0,0])
difference(){
balls1(tol=0.1);
balls1();
}


translate([-40,0,0])
balls1(hole=0,mark=0);
