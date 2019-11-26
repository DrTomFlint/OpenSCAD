// Tests for layer switching

m=0.707;
base=4*0.3;
/*
intersection(){
difference(){
union(){
    // base
    color("green")
    translate([-10,-10,0])
    cube([20,20,base]);

    // pyramid
    translate([0,0,base])
    rotate([0,0,45])
    cylinder(15*m,20*m,0,$fn=4);
}

*/
union(){
    // Test text on the bottom side

    translate([0,0,0])
    rotate([0,0,45])
    mirror([1,0,0]) color("red") 
    linear_extrude(height=0.3){
        text("Love", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
    }

    }
/*
}

// Test for layer slicing
Zslice=0.3;
Nslice=20;
Z0=5*Zslice;
union(){
for(i=[0:Nslice]){
    translate([-10,-10,i*Zslice*2+Z0])
    cube([20,20,Zslice]);
    }
}

}

*/



