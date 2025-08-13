//======================================================================
// Menger1.scad
//
// Menger sponge created by cutting up a large cube
//
// DrTomFlint 7 May 2025
//======================================================================

// Menger sponge created by cutting up a large cube


thick=1.2;    // plate thickness
Ztab=1.2;     // depth of tabs into menge

F2=55;

//----------------------------------------------------------------------
module led(leads=10,tol=0,short=2){

  difference(){    
    cylinder(r=3.8/2+tol,h=1.25+tol,$fn=F2);
    //~ translate([2+1.4,0,0])
    //~ cube([4,4,10],center=true);
  }
  cylinder(r=3.0/2+tol,h=4+tol,$fn=F2);
  translate([0,0,4+tol])
  sphere(r=3.0/2+tol,$fn=F2);


  translate([1.0,0,-(leads-short)/2])
  cube([0.5+tol,0.5+tol,leads-short],center=true);
  
  color("red")
  translate([-1.0,0,-leads/2])
  cube([0.5+tol,0.5+tol,leads],center=true);
}


//----------------------------------------------------------------------
module menge(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0])

  difference(){
    cube(l, center = true);
    
    cutz2();
    
    rotate([90,0,0])
    cutz2();
    
    rotate([0,90,0])
    cutz2();

  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}

//----------------------------------------------------------------------
module box(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0])

  difference(){
    cube(l, center = true);
    
    //~ cutz2();
    
    //~ rotate([90,0,0])
    //~ cutz2();
    
    //~ rotate([0,90,0])
    //~ cutz2();

  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}
//----------------------------------------------------------------------
module cuts(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0]){

    cutz2(tol=-0.25);
    
    rotate([90,0,0])
    cutz2(tol=-0.25);
    
    rotate([0,90,0])
    cutz2(tol=-0.25);
  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}

//----------------------------------------------------------------------
module box8a(cut=66){
  translate([l/2,-l/2,l/2])
  rotate([-45,0,0])
  rotate([0,-35.5,0])
  difference(){
    //~ box(T=T,l=l);
    menge(T=T,l=l);
    translate([0,0,cut]) cube([400,400,100],center=true);
  }
}

//----------------------------------------------------------------------
module box8(part=3){

if(part==1){
  // lowers 4
  translate([0,0,-l])
  for(i=[0:3])
  rotate([0,0,i*90])
  box8a();
}

if(part==2){  
  // upper 4
  translate([0,0,l+2*thick+0.2])
  for(i=[0:3])
  rotate([0,0,i*90])
  rotate([0,180,0])
  box8a();
}

if(part==3){
  // lowers 4
  translate([0,0,-l])
  for(i=[0:3])
  rotate([0,0,i*90])
  box8a();
  // upper 4
  translate([0,0,l+2*thick+0.2])
  for(i=[0:3])
  rotate([0,0,i*90])
  rotate([0,180,0])
  box8a();  
}

}

//----------------------------------------------------------------------
module box9(part=3){

if(part==1){
  // lowers 4
  for(i=[0:3])
  rotate([0,0,i*90])
  translate([-l,-l,0])
  rotate([180,0,0])
  box8a();
}

if(part==2){
  // upper 4
  translate([0,0,2*thick+0.2])
  for(i=[0:3])
  rotate([0,0,i*90])
  rotate([0,180,0])
  translate([-l,-l,0])
  rotate([180,0,0])
  box8a();
}

if(part==3){
  // lowers 4
  for(i=[0:3])
  rotate([0,0,i*90])
  translate([-l,-l,0])
  rotate([180,0,0])
  box8a(cut=99);
  // upper 4
  translate([0,0,2*thick+0.2])
  for(i=[0:3])
  rotate([0,0,i*90])
  rotate([0,180,0])
  translate([-l,-l,0])
  rotate([180,0,0])
  box8a(cut=99);
}
  
}

//----------------------------------------------------------------------
module cuts9(part=3){

  // lowers 4
  for(i=[0:3])
  rotate([0,0,i*90])
  translate([-l,-l,0])
  rotate([180,0,0])
  cuts8a();

}

//----------------------------------------------------------------------
module cuts8a(cut=66){
  translate([l/2,-l/2,l/2])
  rotate([-45,0,0])
  rotate([0,-35.5,0])
  difference(){
    //~ box(T=T,l=l);
    cuts(T=T,l=l);
    translate([0,0,cut]) cube([400,400,100],center=true);
  }
}
//----------------------------------------------------------------------
module cuts8(){

  // lowers 4
  translate([0,0,-l])
  for(i=[0:3])
  rotate([0,0,i*90])
  cuts8a();
  
  //~ // upper 4
  //~ translate([0,0,l+2*thick])
  //~ for(i=[0:3])
  //~ rotate([0,0,i*90])
  //~ rotate([0,180,0])
  //~ cuts8a();
  
}

//----------------------------------------------------------------------
module boxIn(tol=0){

s1=0.575*l-tol;
s2=0.575*l-tol;

  translate([0,0,0])
  rotate([180,0,0])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
  translate([0,0,0])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
}

//----------------------------------------------------------------------
module boxLeds(tol=0.15,showleds=0){

s1=0.575*l-tol;
s2=0.575*l-tol;
zled=2.8;
zled2=2.22;


  difference(){
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);

    // 4 leds
    for(i=[0:3])
    translate([0,0,zled2])
    rotate([0,0,45+90*i])
    rotate([55,0,0])
    translate([0,0,zled])
    rotate([0,0,45]){
      cylinder(r=3.8/2+tol,h=1.25+tol,$fn=F2);
      cylinder(r=3.0/2+tol,h=14+tol,$fn=F2);
      translate([0,0,4.2])
      cylinder(r1=3.0/2+tol,r2=4,h=1.5+tol,$fn=F2);
    }
    // cut for wiring
    cylinder(r1=0.45*s1,r2=0.01,h=0.45*s2,$fn=4);
    #cylinder(r1=0.2*s1,r2=0.35*s1,h=s2,$fn=4);
  }
  
  // leds
  if(showleds==1){
    for(i=[0:3])
    translate([0,0,zled2])
    rotate([0,0,45+90*i])
    rotate([55,0,0])
    translate([0,0,zled])
    rotate([0,0,45])
    led(leads=3.8,tol=0.2);
  }

  
}

//----------------------------------------------------------------------
module cutz2(tol=0){

  for (k = [0:T]) {
    w = l/pow(3,k);
    
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w]) {
      translate([x,y,0])cube([w+tol,w+tol,l+1],center=true);
    }
  
  }
}


//----------------------------------------------------------------------
module plate(tol=0){


  difference(){
    translate([0,0,thick/2])
    intersection(){
      cube([2*l,2*l,thick],center=true);
      rotate([0,0,45])
      cube([2.12*l,2.12*l,thick],center=true);
    }
    // recut the 4 largest
    translate([l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    
    // central cavity
    translate([0,0,thick/2])
    rotate([0,0,45])
    cube([0.75*l,0.75*l,3*thick],center=true);
  }
  
  difference(){
    cuts8();
    translate([0,0,-Ztab-l])
    cube([4*l,4*l,2*l],center=true);
    // recut the 4 largest
    translate([l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
  }
  
  difference(){
    boxIn(tol=0.1);
    translate([0,0,thick])
    boxIn(tol=0.1);
  }
  
  // hinge
  difference(){
    union(){
      translate([l+2,0,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=l,center=true,$fn=F2);
      translate([l,0,thick/2])
      cube([5,l,thick],center=true);
    }
    translate([l+4,l/5,thick/2])
    cube([10,l/5,6*thick],center=true);    
    translate([l+4,-l/5,thick/2])
    cube([10,l/5,6*thick],center=true);    
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);

    translate([l+8,l/2+6,-thick+0.4])
    rotate([0,0,45])
    cube([20,20,20],center=true);    
    translate([l+8,-l/2-6,-thick+0.4])
    rotate([0,0,45])
    cube([20,20,20],center=true);    
  }
}

//----------------------------------------------------------------------
module plate9(tol=0.5){

  // main plate
  difference(){
    linear_extrude(height=thick)
    offset(r=1.5*thick,$fn=F2)
    square([2*l,2*l],center=true);
    
    translate([0,0,thick/2])
    intersection(){
      cube([2*l+tol,2*l+tol,thick+1],center=true);
      rotate([0,0,45])
      cube([2.12*l+tol,2.12*l+tol,thick+1],center=true);
    }
    translate([l,0,thick/2])
    cube([10,l+0.4,6*thick],center=true);    

    translate([l-6.75,l/2+0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
    translate([l-6.75,-l/2-0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
    
    // cut for hinge
    translate([l+4,0.75*l,thick/2])
    cube([10,l/6,6*thick],center=true); 
    translate([l+4,-0.75*l,thick/2])
    cube([10,l/6,6*thick],center=true); 
           
  }    
  
  // lip
  difference(){
    translate([0,0,-thick])
    linear_extrude(height=2*thick)
    offset(r=1.5*thick,$fn=F2)
    square([2*l,2*l],center=true);
    
    translate([0,0,-thick])
    linear_extrude(height=2*thick)
    offset(r=0.54*thick,$fn=F2)
    square([2*l,2*l],center=true);
    
    translate([l,0,thick/2])
    cube([10,2*l,6*thick],center=true);    

    translate([l-6.75,l/2+0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
    translate([l-6.75,-l/2-0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
  }    

  // interlocking tabs
  difference(){
    cuts9();
    translate([0,0,-l-thick])
    cube([3*l,3*l,2*l],center=true);    
  }
  
  // hinge
  difference(){
    union(){
      translate([l+2,0,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=2*l,center=true,$fn=F2);
      translate([l,0,thick/2])
      cube([5,2*l,thick],center=true);
    }
    translate([l+4,0,thick/2])
    cube([10,l+0.4,6*thick],center=true);    
    translate([l,0,thick/2])
    cube([10,l+0.4,6*thick],center=true);    
    
    translate([l+4,0.75*l,thick/2])
    cube([10,l/6,6*thick],center=true); 
    translate([l+4,-0.75*l,thick/2])
    cube([10,l/6,6*thick],center=true); 
       
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=2*l+2,center=true,$fn=F2);

    translate([l-6.75,l/2+0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
    translate([l-6.75,-l/2-0,-thick+0.4])
    rotate([0,0,45])
    cube([10,10,10],center=true);    
  }


}

//----------------------------------------------------------------------
module plate10(tol=0.5){

  // main plate
  difference(){
    linear_extrude(height=thick)
    offset(r=1.5*thick,$fn=F2)
    square([2*l,2*l],center=true);
       
    cylinder(r=0.75*l,h=3*thick,center=true,$fn=F2);
  }    
  
  // lip
  difference(){
    translate([0,0,-thick])
    linear_extrude(height=2*thick)
    offset(r=1.5*thick,$fn=F2)
    square([2*l,2*l],center=true);
    
    translate([0,0,-thick])
    linear_extrude(height=2*thick)
    offset(r=0.54*thick,$fn=F2)
    square([2*l,2*l],center=true);    
  }    

  // interlocking tabs
  difference(){
    cuts9();
    translate([0,0,-l-thick])
    cube([3*l,3*l,2*l],center=true);    
  }
  
}

//----------------------------------------------------------------------
module hinge(tol=0.2){

Zoff=3.5*thick;

  difference(){
    hull(){
      translate([l+2,l/5,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=l/5-tol,center=true,$fn=F2);
      
      translate([l+2,l/5,-thick+0.4+Zoff])
      rotate([90,0,0])
      cylinder(r=2,h=l/5-tol,center=true,$fn=F2);
    }
    
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
    translate([l+2,0,-thick+0.4+Zoff])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
  }

}

//----------------------------------------------------------------------
module hinge9(tol=0.2){

Zoff=3.5*thick;

  difference(){
    hull(){
      translate([l+2,l/6,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=l/6-tol,center=true,$fn=F2);
      
      translate([l+2,l/6,-thick+0.4+Zoff])
      rotate([90,0,0])
      cylinder(r=2,h=l/6-tol,center=true,$fn=F2);
    }
    
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
    translate([l+2,0,-thick+0.4+Zoff])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
  }

}

//----------------------------------------------------------------------
module plateA(tol=0){

  difference(){
    plate();
    translate([0,0,thick/2])
    intersection(){
      cube([2*l-thick,2*l-thick,4*l],center=true);
      rotate([0,0,45])
      cube([2.12*l-thick,2.12*l-thick,4*l],center=true);
    }
  }
}

//----------------------------------------------------------------------
module plateB(tol=0){

difference(){
  intersection(){
    plate();
    translate([0,0,thick/2])
    intersection(){
      cube([2*l-thick,2*l-thick,4*l],center=true);
      rotate([0,0,45])
      cube([2.12*l-thick,2.12*l-thick,4*l],center=true);
    }
  }
  rotate([0,0,45])
  cube([0.75*l,0.75*l,2*l],center=true);
}

}

//----------------------------------------------------------------------
module plateB2(tol=0){

difference(){
  intersection(){
    plate();
    translate([0,0,thick/2])
    intersection(){
      cube([2*l-thick,2*l-thick,4*l],center=true);
      rotate([0,0,45])
      cube([2.12*l-thick,2.12*l-thick,4*l],center=true);
    }
  }
  rotate([0,0,45])
  cube([0.75*l+2*thick,0.75*l+2*thick,2*l],center=true);

  rotate([0,0,45])
  linear_extrude(height=thick,scale=1.1)
  square([0.75*l+2*thick,0.75*l+2*thick],center=true);
}

}

//----------------------------------------------------------------------
module plateB2a(tol=0){

  difference(){
    plateB2();
    rotate([0,0,45])
    linear_extrude(height=thick,scale=1.1)
    square([1.5*l,1.5*l],center=true);
  }

}

//----------------------------------------------------------------------
module plateB2b(tol=0){

  difference(){
    intersection(){
      plateB2();
      rotate([0,0,45])
      linear_extrude(height=thick,scale=1.1)
      square([1.5*l,1.5*l],center=true);
    }
    rotate([0,0,45])
    linear_extrude(height=thick,scale=1.1)
    square([1.1*l,1.1*l],center=true);
  }
}

//----------------------------------------------------------------------
module plateB2c(tol=0){


  intersection(){
    plateB2();
    rotate([0,0,45])
    linear_extrude(height=thick,scale=1.1)
    square([1.1*l,1.1*l],center=true);
  }
}

//----------------------------------------------------------------------
module plateC(tol=0){

  intersection(){
    plate();
    rotate([0,0,45])
    cube([0.75*l,0.75*l,2*l],center=true);
  }
  
}

//======================================================================

// Order
T=2; l=30;
//~ T=3; l=90;
//~ T=4; l=270;

//~ menge(T=T,l=l);

//~ cutz2();


// remove top for 8-ball construction
//~ difference(){
//~ menge(T=T,l=l);
//~ translate([0,0,66]) cube([400,400,100],center=true);
//~ }



// tests for internal space
box8(part=3);

//~ boxIn(tol=0.4);
//~ boxLeds(tol=0.2,showleds=0);

//~ plate();

//~ translate([0,0,2*thick+0.2])
//~ rotate([180,0,0])
//~ plate();


// cut up plate for multi-color prints
//~ plateA();     // outer rim and hinge
//~ plateB();     // inner flat
//~ plateB2();     // inner flat

//~ plateB2a();     // inner flat
//~ plateB2b();     // inner flat
//~ plateB2c();     // inner flat

//~ plateC();     // pyramid tent


//~ hinge();

//~ cuts8a();
//~ box8a();

//~ cuts8();


//~ box9(part=1);

//~ plate9();
//~ hinge9();

//~ plate10();


//~ cuts9();

//======================================================================
