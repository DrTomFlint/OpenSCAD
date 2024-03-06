//======================================================================
// Seeder5.scad
// 
// Sieve and tray seeder?
//
// assume 20 mm row spacing
// to fit inside a tray cannot exceed 230 mm wide outer dimensions
//
// big cilantro seed is 2mm radius
// arugula is 0.5 mm or less
// cress might be even smaller
//
// DrTomFlint 15 Jan 2024
//======================================================================

open = 4;  // -1 is closed, +4 is open

// perf plate
ymax = 230;
x0 = 100;    
y0 = ymax-20; 

thick = 1.2;
margin = 6;
dy = 20.2;    // don't change row spacing !

// arugula
//~ dx = 5;       // spacing along row
//~ rs = 0.5;     // seed hole

// kale sized
//~ dx = 7.2;       // spacing along row
//~ rs = 1.0;     // seed hole

// max seed
dx = 11;       // spacing along row
rs = 0.5;     // seed hole, 2.75 max


rslot=3.5;      // slot width of lower

zb = 10;
xtub = 40;
ztub = 10;


nx = floor( (x0-2*margin)/dx )+1;
ny = floor( (y0-2*margin)/dy )+1;

xoff = (x0-nx*dx)/2;
yoff = (y0-ny*dy)/2;

F2 = 66;
F3 = 22;


x1 = 4;   // perf plate rails

echo (nx);
echo (ny);
echo (xoff);
echo (yoff);

//----------------------------------------------------------------------
module upper(){

  // perf plate
  difference(){
    union(){
      translate([0,0,thick/2])
      cube([x0,y0,thick],center=true);
    
      // ribs 
      for(j=[0:ny-1]){
        translate([0,dy*j-y0/2+margin-max(2*thick,1.5*rs),thick])
        rotate([0,90,0])
        scale([2,1,1])
        cylinder(r=1.5*thick,h=x0,center=true,$fn=F3);
      }
      // last rig
        translate([0,dy*ny-y0/2+margin-2*thick,thick])
        rotate([0,90,0])
        scale([3,1,1])
        cylinder(r=3*thick,h=x0,center=true,$fn=F3);
    }

    // seed holes  
    for(i=[0:nx-1]){
      for(j=[0:ny-1]){
        translate([dx*i-x0/2+margin,dy*j-y0/2+margin,-0.1])
        cylinder(r1=rs,r2=3*rs,h=8*thick+0.2,$fn=F3);
      }
    }
    
    // trim off backside of ribs
    translate([0,0,-5])
    cube([x0+2,y0+2,10],center=true);
    
  }

    
}



//----------------------------------------------------------------------
module lower(tol=0.25){

  difference(){
    cube([x0+2*margin,ymax-10,2*thick],center=true);
    // perf plate
    translate([0,0,thick/2])
    cube([x0+2*tol,y0+2*tol+5,thick+2*tol],center=true);
    translate([0,10,thick/2])
    cube([x0+2*tol,y0+2*tol+5,thick+2*tol],center=true);

    translate([0,4,0])
      for(j=[0:ny-1]){
        hull(){
          translate([x0/2-margin,dy*j-y0/2+margin+1,-0.1])
          cylinder(r=rslot,h=5*thick,center=true,$fn=F3);
          translate([-x0/2+margin,dy*j-y0/2+margin+1,-0.1])
          cylinder(r=rslot,h=5*thick,center=true,$fn=F3);
        }
      }

  }
  // top rail
  translate([-x0/2-margin+3-tol,0,4*thick])
  cube([6-2*tol,ymax-10,8*thick],center=true);
  // left rail
  translate([0,-y0/2-margin+2,4*thick])
  cube([x0+2*margin,2,8*thick],center=true);

}

//----------------------------------------------------------------------
module base(tol=0.25){

  // frame to hold lower and upper
  difference(){
    union(){
      translate([0,0,-zb/2])
      cube([x0+2*margin+10,ymax,zb],center=true);
      translate([x0/2+xtub/2+margin+thick,0,-ztub/2])
      cube([xtub,ymax,ztub],center=true);
    }
    translate([0,0,-thick])
    cube([x0+2*margin+2*tol,ymax-10+2*tol,2*thick+0.1],center=true);
    translate([0,0,-zb/2])
    cube([x0,y0,zb+2],center=true);

    // seed cache
    hull(){
      translate([x0/2+xtub/2+margin,y0/2-ztub/2-6,0])
      scale([0.45*xtub,15,ztub])
      sphere(r=1,$fn=F2);
      translate([x0/2+xtub/2+margin,-(y0/2-ztub/2-6),0])
      scale([0.45*xtub,15,ztub])
      sphere(r=1,$fn=F2);
    }
  }


  // outer lip
  difference(){
    translate([0,0,9])
    union(){
      translate([0,0,-zb/2])
      cube([x0+2*margin+10,ymax,zb],center=true);
      translate([x0/2+xtub/2+margin+thick,0,-ztub/2])
      cube([xtub,ymax,ztub],center=true);
    }
    translate([0,0,9-zb/2+0.1])
    cube([x0+2*margin+6,ymax-8,zb+20],center=true);
    translate([xtub-6,0,9-zb/2+0.1])
    cube([x0+2*margin+6,ymax-8,zb+20],center=true);
  }  
}


//======================================================================

translate([0,open,0])
upper();

lower();

//~ base();

//======================================================================
