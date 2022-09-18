// marigold2.scad
//
// hat holder for marigolds
//-----------------------------------------------------------


rout = 120/2;
rin =  rout-12;
thick = 1.2;

rholes1=1.8;
rholes2=2.4;
roff=2.4;

rstem=6;
N=13;

F1=200;
F2=45;

//-----------------------------------------------------------
module holder1(){
  
  difference(){
  
    union(){
      rotate([0,90-7,0])
      cylinder(r1=rstem-thick,r2=rstem,h=rout-rin,$fn=F2);
      rotate([0,0,0])
      translate([(rout-rin)/2+0.3,0,-2*thick])
      cube([rout-rin-0.3,1.6*rstem,0.8*rstem],center=true);
    }

    rotate([0,90-7,0])
    translate([0,0,-0.5])
    cylinder(r1=rstem-2*thick,r2=rstem-thick,h=rout-rin+1,$fn=F2);

    translate([(rout-rin)/2-0.4,0,rstem])
    rotate([0,-14,0])
    cube([rout-rin+2,2.5*thick,4*thick],center=true);
  }
  
}

//-----------------------------------------------------------
module hat1(){

  difference(){
    cylinder(r=rout,h=thick,$fn=F1);
    cylinder(r=rin,h=3*thick,center=true,$fn=F1);

    // holes to sew down
    for(i=[0:N-1]){
      rotate([0,0,i*360/N+180/N-40/N])
      translate([rin+roff,0,0])
      cylinder(r=rholes1,h=3*thick,center=true,$fn=F2);
    }
    for(i=[0:N-1]){
      rotate([0,0,i*360/N+180/N+40/N])
      translate([rin+roff,0,0])
      cylinder(r=rholes1,h=3*thick,center=true,$fn=F2);
    }

    
    for(i=[0:N-1]){
      rotate([0,0,i*360/N+180/N-40/N])
      translate([rin,0,0])
      cube([6,1,3*thick],center=true);
    }
    for(i=[0:N-1]){
      rotate([0,0,i*360/N+180/N+40/N])
      translate([rin,0,0])
      cube([6,1,3*thick],center=true);
    }
  }

  for(i=[0:N-1]){
//  for(i=[0:3]){
    translate([0,0,rstem-thick])
    rotate([0,0,i*360/N])
    translate([rin-0.5,0,0])
    holder1();
  }

  // post to hold LED
  for(i=[0:N-1]){
    rotate([0,0,i*360/N+180/N])
    translate([0.505*(rout+rin),0,2*thick])
    scale([1.2,1,1])
    cylinder(r1=rholes2,r2=rholes2*1.2,h=4*thick,center=true,$fn=F2);
  }


}

//============================================================

if(0){
  intersection(){
    hat1();
    
    translate([0,0,-5])
    rotate([0,0,29])
    cube([200,200,30]);

    translate([0,0,-5])
    rotate([0,0,-16])
    cube([200,200,30]);
  }
}

hat1();

//============================================================
