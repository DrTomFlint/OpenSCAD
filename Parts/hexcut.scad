// hexcut

//--------------------------------
module hexcut1(
R=1,
x0=0,
y0=0,
h0=10,
N0=4
){
        
    for (i=[0:N0-1]){
        translate([x0,y0+i*R*2,-1])
        cylinder(r=R,h=h0,$fn=6);
    }
    for (i=[0:N0-2]){
        translate([x0-1.717*R,y0+R+i*R*2,-1])
        cylinder(r=R,h=h0,$fn=6);
    }
    for (i=[0:N0-2]){
        translate([x0+1.717*R,y0+R+i*R*2,-1])
        cylinder(r=R,h=h0,$fn=6);
    }

}


//=======================
    
hexcut1();
    
    