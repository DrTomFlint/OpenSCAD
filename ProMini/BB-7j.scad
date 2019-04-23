// BB-7j
// Acoustic amplifier horn for a piezo element 

// the piezo itself:
union(){
    cylinder(r=10,h=0.02);
    cylinder(r=7,h=0.43);

    translate([0.25,-5,0.43]) rotate([90,0,0]) 
    color("red") cylinder(r=.27,h=20);
    translate([-0.25,-5,0.43]) rotate([90,0,0]) 
    color("black") cylinder(r=.27,h=20);
}    
N=200;
T=0.5;      // thickness of each vertical slice
R=0.1;
W=0.4;

for(i=[0:N]){
    rotate([i*0.1,0,0])
    translate([0,0,i*T]) scale([1+i/N*0.7,1-i/N*0.7,1])
    difference(){
        cylinder(r1=i*R+10,r2=(i+1)*R+10,h=T);
        cylinder(r1=i*R+10-W,r2=(i+1)*R+10-W,h=T);
    }
}



