// Beam1.scad
// make some lego compatible parts

//-------------------------------------
module pin1cut(){
f1=88;

cylinder(r=5.1/2,h=7.8,$fn=f1);

cylinder(r=6/2,h=0.91,$fn=f1);
translate([0,0,7.8-0.9])
cylinder(r=6/2,h=0.91,$fn=f1);
    
} // --------- end module pin1cut ---------

module barrel1(){
    
f2=88;
difference(){
    cylinder(r=7.8/2,h=7.8,$fn=f2);
    pin1cut();
    }
} // --------- end module barrel1 ---------

module plug1(){

difference(){
f3=88;    
    translate([0,4,2.9])
    linear_extrude(height=2)
    square([7,7],center=true);

    cylinder(r=7.4/2,h=7.8,$fn=f3);
    translate([0,8,0])
    cylinder(r=7.4/2,h=7.8,$fn=f3);
}
    

}

module shell1(N=3){
    
f2=88;
difference(){
hull(){
    cylinder(r=7.05/2,h=7.8,$fn=f2);
    translate([0,8*(N-1),0])
    cylinder(r=7.05/2,h=7.8,$fn=f2);
}    
translate([0,0,-1])
hull(){
    cylinder(r=5.5/2,h=10,$fn=f2);
    translate([0,8*(N-1),0])
    cylinder(r=5.5/2,h=10,$fn=f2);
}    


for(i=[0:N-1])
    translate([0,i*8,0])
    pin1cut();

}

} // --------- end module barrel1 ---------

module beam1(N=3){

f2=88;
    
shell1(N=N);
intersection(){

// line of barrels
union(){
for(i=[0:N-1])
    translate([0,i*8,0])
    barrel1();

for(i=[0:N-2])
    translate([0,i*8,0])
    plug1();

}

hull(){
    cylinder(r=7/2,h=7.8,$fn=f2);
    translate([0,8*(N-1),0])
    cylinder(r=7/2,h=7.8,$fn=f2);
}    
}

    
} // ----------end beam1 ----------------

/*
translate([20,0,0])
pin1cut();

barrel1();

translate([-20,0,0])
shell1(N=4);

translate([-30,0,0])
plug1();
*/

translate([-40,0,0])
beam1(N=5);


