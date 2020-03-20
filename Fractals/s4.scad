// s4 is double sided

// order of sierpinski fractal
order = 3; //[0,1,2,3,4,5,6,7]
// size of smallest pyramid
size = 3; //[2:50]

/* [Hidden] */
eps = 0.25;         // translate for pyramids
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

//difference(){
//sup = 0.5*size*pow(2,order);   
//translate([-sup/2,-sup/2,-size*pow(2,order)*0.91])
//cube([sup,sup,0.7*sup]);


if(1){
//hull(){    
ss(order-1);
mirror([0,0,1]) ss(order-1);
//}
// add a small cube at the base so prusa can slice it
//color("red")
//translate([-0.5,-0.5,-size*pow(2,order)*0.91])
//cube([1,1,1]);
}

//}



// support
if(0){
sup = 0.7*size*pow(2,order);   
base=0.9*sq2*size*pow(2,order);

color("green")
difference(){
    translate([-sup/2,-sup/2,-size*pow(2,order)*0.91])
    cube([sup,sup,0.7*sup]);

    color("red")
    hull(){
    translate([0,0,-0.1])
    cube([base,base,0.2], center=true);

    color("cyan")
    translate([-0.5,-0.5,-size*pow(2,order)*0.88])
    cube([1,1,1]);
}
}

}
      
// sierpinsky recursive code 
module ss(ord){
    k = pow(2,ord);
    w = size *k;
    
    if (k<1){  // end of recursive function
        rotate([0,0,45])cylinder(r1=size,r2 = epsr, h = 1.0*size, $fn=4);
    }
    else {
      //difference() {
        union () { // set the five smaller sierpinski pyramids
            // they are shifted so that there is an intersection for spiral vase
            translate([-k*eps+w/sq2,-k*eps+w/sq2,0]) ss(ord-1);  
            translate([k*eps-w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            translate([k*eps-w/sq2,-k*eps+w/sq2,0]) ss(ord-1); 
            translate([-k*eps+w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            translate([0,0,-sq2*k*eps+1.01*w]) rotate([180,0,0]) ss(ord-1);
            translate([0,0,-sq2*k*eps+1.01*w]) rotate([0,0,0]) ss(ord-1);    
          
             } // end union
   } // end else
 } // end module ss
