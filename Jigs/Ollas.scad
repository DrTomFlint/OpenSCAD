//=================================================================================
// Ollas.scad
//
//
// Dr Tom Flint, 12 March 2025
//=================================================================================


thick=1.2;
rx=18.75/2;
F2=99;

hi=5;


rows=3;
cols=3;
rowWide=45;
colWide=45;
tsize=12;

F1=99;

//-----------------------------------------------------------------------------------
module plug(){


  cylinder(r1=rx+4,r2=rx+4+thick/2,h=thick,$fn=F2);
  difference(){
    cylinder(r1=rx,r2=rx-1,h=4*thick,$fn=F2);
    translate([0,0,thick])
    cylinder(r1=rx-2.5,r2=rx-1.5,h=4*thick,$fn=F2);
  }
}


//-----------------------------------------------------------------------------------
module ring(){

  difference(){
    cylinder(r=129/2,h=hi,center=true,$fn=F2);
    translate([0,0,-2.5])
    rotate_extrude($fn=F2){
      translate([131/2,0,0])
      circle(r=2.5,$fn=F2);
    }
    translate([0,0,2.5])
    rotate_extrude($fn=F2){
      translate([131/2,0,0])
      circle(r=2.5,$fn=F2);
    }
    cylinder(r=125/2,h=20,center=true,$fn=F2);
  }

  difference(){
    cylinder(r=126/2,h=10,center=true,$fn=F2);
    cylinder(r=125/2,h=20,center=true,$fn=F2);
  }
  
}

//-----------------------------------------------------------------------------------
module lids(i0=1){


  for (i=[0:cols-1]){
    for (j=[0:rows-1]){
      difference(){
        translate([i*rowWide,j*colWide,0])
        cylinder(r1=41.5/2,r2=41.5/2-thick,h=thick,$fn=F1);
        translate([i*rowWide,j*colWide,0])
        linear_extrude(height=thick+0.01)
        text(str(i0+i*rows+j), font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.2);

        translate([i*rowWide,j*colWide,0])
        difference(){
          cylinder(r=30/2,h=thick,$fn=F1);
          cylinder(r=27/2,h=thick,$fn=F1);
        }
      }
    }
  }

}

//-----------------------------------------------------------------------------------
module nums(i0=1){

  for (i=[0:cols-1]){
    for (j=[0:rows-1]){
      translate([i*rowWide,j*colWide,0])
      linear_extrude(height=thick+0.01)
      text(str(i0+i*rows+j), font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.2);

        translate([i*rowWide,j*colWide,0])
        difference(){
          cylinder(r=30/2,h=thick,$fn=F1);
          cylinder(r=27/2,h=thick,$fn=F1);
        }
    }
  }

}


//=================================================================================

//~ plug();

//~ ring();

lids(i0=28);
//~ nums(i0=28);

//=================================================================================
