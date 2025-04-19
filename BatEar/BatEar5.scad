//======================================================================
// BatEar5.scad
//
// Passive vocal monitor that clips onto safety glasses
//
// DrTomFlint, 16 April 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

//~ flip=210;
flip=0;

// Versionj J params:
// location of ear
x1j = -35;
y1j = -5;
z1j = -25;
m1j = 12;

// location of midway
x2j = 40;
y2j = 0;
z2j = -60;
m2j = 30;
flat2j = 0.6;

// location of mouth
x3j = 75;
y3j = 20;
z3j = -70;
m3j = 40;
flat3j = 0.60;

// move hollow out to account for flattening
flatfixj = 0.5;

// location of pivot post
zpostj=5;
stopAnglej= 2 * 360/10;
Versionj="J";


// Version K params:
// location of ear
x1k = -35;
y1k = -5;
z1k = -25;
m1k = 12;
flat1k = 0.6;

// location of midway
x2k = 40;
y2k = 0;
z2k = -65;
m2k = 20;
flat2k = 0.6;

// location of mouth
x3k = 75;
y3k = 20;
z3k = -80;
m3k = 30;
flat3k = 0.60;

// move hollow out to account for flattening
flatfixk = 0.5;

// location of pivot post
zpostk=5;
stopAnglek= 2 * 360/10;
Versionk="K";

// Version L params
// location of ear
x1l = -35;
y1l = -5;
z1l = -25;
m1l = 12;
flat1l = 0.6;

// location of midway
x2l = 40;
y2l = 0;
z2l = -65;
m2l = 20;
flat2l = 0.6;

// location of mouth
x3l = 75;
y3l = 20;
z3l = -80;
m3l = 30;
flat3l = 0.60;

// move hollow out to account for flattening
flatfixl = 0.5;

// location of pivot post
zpostl=5;
stopAnglel= 2 * 360/10;
Versionl="L";


// Version M params
// location of ear
x1m = -35;
y1m = -5;
z1m = -25;
m1m = 12;
flat1m = 0.6;

// location of midway
x2m = 40;
y2m = 0;
z2m = -65;
m2m = 20;
flat2m = 0.6;

// location of mouth
x3m = 75;
y3m = 20;
z3m = -80;
m3m = 30;
flat3m = 0.60;

// move hollow out to account for flattening
flatfixm = 0.5;

// location of pivot post
zpostm=0;
stopAnglem= 2 * 360/10;
//~ Versionm="M";
Versionm="N";

// Version ALL params:

// height of lenses
z0 = 55;      

F1=299;
F2=55;

//-----------------------------------------------------------------------------------------------
module wordsj(){
  
    translate([5,-17,-44])
    rotate([0,0,-1])
    rotate([0,24,0])
    rotate([90,0,0])
    linear_extrude(height=0.9)
    text("How About No", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
}

//----------------------------------------------------------------------
module parabola( 
    focus_point, 
    base_area, 
    resolution = [60, 60], 
    thickness  = 0   
){
    
    function parabola_point( focus_point, base_point ) =
        let ( dist_fb = norm(focus_point - base_point) )
        [
            base_point.x,
            base_point.y,
            ( dist_fb * dist_fb ) / ( 2 * (focus_point.z - base_point.z) )
        ];
    
    function flip(vec) = [ vec[3], vec[2], vec[1], vec[0] ];

    parabola_points = [
        for ( 
            y = [0 : base_area.y / resolution.y : base_area.y + 0.1], 
            x = [0 : base_area.x / resolution.x : base_area.x + 0.1] 
        )
        parabola_point( focus_point, [x,y,0] )
    ];

    base_points = [
        for ( 
            y = [0 : base_area.y / resolution.y : base_area.y + 0.1], 
            x = [0 : base_area.x / resolution.x : base_area.x + 0.1] 
        ) 
        let ( p = parabola_point( focus_point, [x,y,0] ) )
        if (thickness > 0)
            [x, y, p.z - thickness]
        else
            [x, y, 0]
    ];

    size_x = resolution.x + 1;
                
    parabola_faces = [
        for ( 
            y = [0 : resolution.y - 1], 
            x = [0 : resolution.x - 1] 
        )
        [ 
            y    * size_x + x, 
            y    * size_x + x + 1,
           (y+1) * size_x + x + 1,
           (y+1) * size_x + x
        ]
    ];

    size_ppoints = len( parabola_points );
    
    base_faces = [
        for ( 
            y = [0 : resolution.y - 1], 
            x = [0 : resolution.x - 1] 
        )
        [ y    * size_x + x     + size_ppoints, 
          y    * size_x + x + 1 + size_ppoints,
         (y+1) * size_x + x + 1 + size_ppoints,
         (y+1) * size_x + x     + size_ppoints]
    ];


    side_faces_1 = [
        for ( x = [0 : resolution.x - 1] )
        [ x, 
          x + 1, 
          x + 1 + size_ppoints, 
          x     + size_ppoints ]
    ];


    last_row = resolution.y * size_x;
        
    side_faces_2 = [
        for ( x = [0 : resolution.x - 1] )
        [ 
            last_row + x, 
            last_row + x + 1, 
            last_row + x + 1 + size_ppoints, 
            last_row + x     + size_ppoints
        ]
    ];

    side_faces_3 = [
        for ( y = [0 : resolution.y - 1] )
        [ 
            y      * size_x, 
           (y + 1) * size_x, 
           (y + 1) * size_x + size_ppoints, 
            y      * size_x + size_ppoints 
        ]
    ];

    last_col = resolution.x;

    side_faces_4 = [
        for ( y = [0 : resolution.y - 1] )
        [ 
            last_col +  y      * size_x, 
            last_col + (y + 1) * size_x, 
            last_col + (y + 1) * size_x + size_ppoints, 
            last_col +  y      * size_x + size_ppoints
        ]
    ];

    polyhedron(convexity = 10,
        points = concat( parabola_points, base_points ), 
        faces  = concat( parabola_faces, 
                         base_faces, 
                         side_faces_1,
                         side_faces_2,
                         side_faces_3,
                         side_faces_4)
    );
    
}

//----------------------------------------------------------------------
module reflector(T=1.2,R=9){
  
//~ intersection(){  
  translate([-R,-R,-8.5])
  parabola( 
      focus_point = [R,R,10],
      base_area   = [2*R,2*R],
      thickness   = T
  );
  
  //~ cylinder(r=R,h=20,$fn=F1, center=true);
//~ }

}  

//----------------------------------------------------------------------
// over the glasses protective goggles
module glassHalf(){
  
  // lens front
  translate([0,-238,-5])
  intersection(convexity=10){
    linear_extrude(height=z0)
    difference(convexity=10){
      circle(r=250,$fn=F1);
      circle(r=248,$fn=F1);
    }
    translate([35,200,0])
    cube  ([70,180,150],center=true);
  }
  
  points=[ [0,0], [0,45], [-14,45], [-38,40], [-72,30], [-97,20], [-110,10], [-120,0], [-130,-15], [-124,-25], [-113,-15], [-112,0], [-92,10], [-78,12], [-63,10], [-14,0] ];
  translate([70,0,0])
  rotate([0,0,90])
  rotate([90,0,0])
  linear_extrude(height=2)
  polygon(points);
  
}

//----------------------------------------------------------------------
module stopAdjust(tol=0.15){

    translate([-5.5,-3,-5])
    rotate([0,stopAnglej,0])
    translate([5.5,3,5])

  difference(){
    translate([-5.5-1.5,-3,-5])
    rotate([90,0,0])
    cylinder(r=5,h=5,$fn=F2);

    translate([-5.5,-3,-5])
    rotate([90,0,0])
    cylinder(r=2+tol,h=5,$fn=10);
  }

}

//----------------------------------------------------------------------
// mounting point onto headloop
module mountj(){

thick=2;
ang=14;
  
  // main loop
  intersection(){
    difference(){
      hull(){
        translate([0,0,12.5])
        rotate([0,90-ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
        translate([0,0,-12.5])
        rotate([0,90+ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        
        // version number
        translate([0,1.5*thick,0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.605)
        text(Versionj, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([5,-1.5*thick,zpostj])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);        
        // main shaft
        translate([5,-1.5*thick,zpostj])
        rotate([90,0,0])
        cylinder(r=4,h=5.2,$fn=F2);
        // inner angle
        translate([5,-1.5*thick-4.5,zpostj])
        rotate([90,0,0])
        cylinder(r1=4.0,r2=4.8,h=0.5,$fn=F2);
        // outer angle
        translate([5,-1.5*thick-5,zpostj])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);
      }
      translate([5,-1.5*thick-5.5,zpostj])
      cube([20,10,1.5],center=true);
      translate([5,-1.5*thick-5.5,zpostj])
      cube([1.5,10,20],center=true);
    }
  
    cube([16,20,40],center=true);
  }
  
  // stopper
  translate([-5.5,-3,-5])
  rotate([90,0,0])
  cylinder(r=2,h=5,$fn=10);

  
}


//----------------------------------------------------------------------
module tunnelj(T=1.2){

  // tunnel
  difference(){
    union(){
      // upper tunnel
      hull(){  
        translate([x1j,y1j,z1j])  
        sphere(r=m1j,$fn=F1);
        translate([x2j,y2j,z2j])
        scale([1,flat2j,1])
        sphere(r=m2j,$fn=F1);

        translate([x1j,y1j+30,z1j])  
        sphere(r=m1j,$fn=F1);
        translate([x2j,y2j+30,z2j])
        scale([1,flat2j,1])
        sphere(r=m2j,$fn=F1);
      }
      // lower tunnel
      hull(){  
        translate([x2j,y2j,z2j])  
        scale([1,flat2j,1])
        sphere(r=m2j,$fn=F1);
        translate([x3j,y3j,z3j])
        scale([0.5,flat3j,1])
        sphere(r=m3j,$fn=F1);

        translate([x2j,y2j+40,z2j])  
        scale([1,flat2j,1])
        sphere(r=m2j,$fn=F1);
        translate([x3j,y3j+40,z3j])
        scale([0.5,flat3j,1])
        sphere(r=m3j,$fn=F1);
      }
      // ear disk
      translate([x1j,y1j+0,z1j])  
      rotate([0,-45,0])
      rotate([90,0,0])
      scale([1,1.4,1])
      cylinder(r=20,h=1.5*T,center=true,$fn=F2);

      // upper panel
      hull(){
        translate([x1j,y1j+0,z1j+16])  
        rotate([90,0,0])
        cylinder(r=6,h=1.5*T,center=true,$fn=F2);
        translate([x2j,y1j+3,z2j+30])  
        rotate([90,0,0])
        cylinder(r=12,h=1.5*T,center=true,$fn=F2);
      }

      // lower attach to post
      hull(){
        // midpoint block
        translate([5,-5,-6])
        rotate([0,10,0])
        cube([10,4,1],center=true);
        // tunnel block
        translate([5,-6,-30])
        rotate([0,18,0])
        cube([30,3,1],center=true);
      }
    }

    // cut for stop adjuster
    translate([-8,y1j+0,z1j+17])  
    scale([1,1,0.7])
    rotate([90,0,0])
    cylinder(r=6,h=10,center=true,$fn=F2);
    
    // hollow out
    hull(){  
      translate([x1j,y1j+flatfixj,z1j])  
      sphere(r=m1j-T,$fn=F1);
      translate([x2j,y2j+flatfixj,z2j])
      scale([1,flat2j,1])
      sphere(r=m2j-T,$fn=F1);

      translate([x1j,y1j+40+flatfixj,z1j])  
      sphere(r=m1j-T,$fn=F1);
      translate([x2j,y2j+40+flatfixj,z2j])
      scale([1,flat2j,1])
      sphere(r=m2j-T,$fn=F1);
    }
    hull(){  
      translate([x2j,y2j+flatfixj,z2j])  
      scale([1,flat2j,1])
      sphere(r=m2j-T,$fn=F1);
      translate([x3j-flatfixj,y3j+flatfixj,z3j])
      scale([0.5,flat3j,1])
      sphere(r=m3j-T,$fn=F1);

      translate([x2j,y2j+40+flatfixj,z2j])  
      scale([1,flat2j,1])
      sphere(r=m2j-T,$fn=F1);
      translate([x3j-flatfixj,y3j+40+flatfixj,z3j])
      scale([0.5,flat3j,1])
      sphere(r=m3j-T,$fn=F1);
    }
    
    // cut away near ear
    hull(){
      translate([x1j-40,y1j+25,z1j])
      rotate([15,0,0])
      rotate([0,20,0])
      cylinder(r=m1j-T+8,h=50,center=true,$fn=F2);
      
      translate([x2j+0,y2j+38,z2j])
      rotate([15,0,0])
      rotate([0,20,0])
      cylinder(r=m2j,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2j,74,z2j])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
      translate([x3j,74+20,z2j])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    // version   
    translate([5,-6.8,-15])
    rotate([0,10,0])
    rotate([90,0,0])
    linear_extrude(height=1.5)
    text(Versionj, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    if(0){
      words();
    }
    
  }
        
  // upper section attach to post
  thick=2;
  difference(){  
    hull(){
      // surround the post
      translate([5,-1.5*thick,zpostj])
      rotate([90,0,0])
      cylinder(r=7,h=4.5,$fn=F1);
      // attachment to the tunnel
      translate([5,-5,-6])
      rotate([0,10,0])
      cube([10,4,1],center=true);
    }
    
    // cuts for pivot
    translate([5,-1.5*thick,zpostj])
    rotate([90,0,0])
    cylinder(r=4.2,h=20,center=true,$fn=F1);
    
    translate([5,-2*thick-5.5,zpostj])
    rotate([90,0,0])
    cylinder(r=6,h=4,center=true,$fn=F1);

    // fillet cut
    translate([5,-1.5*thick,zpostj])
    rotate([90,0,0])
    cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);        
  }
  
}


//----------------------------------------------------------------------
// mounting point
module mountk(){

thick=2.5;
ang=14;
translate([0,1.5,0]){  
  // main loop
  intersection(){
    difference(){
      hull(){
        translate([0,0,12.5])
        rotate([0,90-ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
        translate([0,0,-12.5])
        rotate([0,90+ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=1.2,h=17+2,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=1.2,h=17+2,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        
        // version number
        translate([0,1.5*thick,0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.605)
        text(Versionk, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([5,-1.5*thick,zpostk])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        
        // main shaft
        translate([5,-1.5*thick,zpostk])
        rotate([90,0,0])
        cylinder(r=5,h=5.2,$fn=F2);
        // inner angle
        translate([5,-1.5*thick-4.5,zpostk])
        rotate([90,0,0])
        cylinder(r1=5.0,r2=5.8,h=0.5,$fn=F2);
        // outer angle
        translate([5,-1.5*thick-5,zpostk])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);
      }
      // cuts to make pinchable 
      translate([5,-1.5*thick-5.5,zpostk])
      cube([20,10,1.5],center=true);
      translate([5,-1.5*thick-5.5,zpostk])
      cube([1.5,10,20],center=true);
      translate([5,-1.5*thick,zpostk])
      rotate([90,0,0])
      cylinder(r1=3,r2=4,h=6,$fn=F2);        
    }
  
    cube([16,20,40],center=true);
  }
  
  // stopper
  translate([-5.5,-3,-5])
  rotate([90,0,0])
  cylinder(r=2,h=6.5,$fn=10);

  // extra tab to lock
  translate([7.5,-1.5,0])
  cube([1,1,10],center=true);

}  
}


//----------------------------------------------------------------------
module tunnelk(T=1.2){

  // tunnel
  difference(){
    union(){
      // upper tunnel
      hull(){  
        translate([x1k,y1k,z1k])  
        scale([1,flat1k,1])
        sphere(r=m1k,$fn=F1);
        translate([x2k,y2k,z2k])
        scale([1,flat2k,1])
        sphere(r=m2k,$fn=F1);

        translate([x1k,y1k+30,z1k])  
        sphere(r=m1k,$fn=F1);
        translate([x2k,y2k+30,z2k])
        scale([1,flat2k,1])
        sphere(r=m2k,$fn=F1);
      }
      // lower tunnel
      hull(){  
        translate([x2k,y2k,z2k])  
        scale([1,flat2k,1])
        sphere(r=m2k,$fn=F1);
        translate([x3k,y3k,z3k])
        scale([0.5,flat3k,1])
        sphere(r=m3k,$fn=F1);

        translate([x2k,y2k+40,z2k])  
        scale([1,flat2k,1])
        sphere(r=m2k,$fn=F1);
        translate([x3k,y3k+40,z3k])
        scale([0.5,flat3k,1])
        sphere(r=m3k,$fn=F1);
      }
      // ear disk
      if(1){
        translate([x1k,y1k-1,z1k])  
        rotate([0,-45,0])
        rotate([90,0,0])
        scale([1,1.4,1])
        cylinder(r=25,h=1.5*T,center=true,$fn=F2);
      }else{
        translate([x1k,y1k-8,z1k])  
        rotate([0,-45,0])
        rotate([-90,0,0])
        scale([1,1.4,1])
        reflector(T=1.2,R=20);
      }
      
      // upper panel
      hull(){
        translate([x1k,y1k-1,z1k+16])  
        rotate([90,0,0])
        cylinder(r=6,h=1.5*T,center=true,$fn=F2);
        translate([0,y1k-1,z1k+4])  
        rotate([90,0,0])
        cylinder(r=12,h=1.5*T,center=true,$fn=F2);
      }

      // lower attach to post
      hull(){
        // midpoint block
        translate([5,-5,-6])
        rotate([0,10,0])
        cube([10,4,1],center=true);
        // tunnel block
        translate([5,-6,-32])
        rotate([0,24,0])
        cube([30,3,1],center=true);
      }
    }

    // cut for stop adjuster
    translate([-8,y1k+0,z1k+18])  
    scale([1,1,0.7])
    rotate([90,0,0])
    cylinder(r=7,h=10,center=true,$fn=F2);
    
    // hollow out
    hull(){  
      translate([x1k,y1k+flatfixk,z1k]) 
      scale([1,flat1k,1])
      sphere(r=m1k-T,$fn=F1);
      translate([x2k,y2k+flatfixk,z2k])
      scale([1,flat2k,1])
      sphere(r=m2k-T,$fn=F1);

      translate([x1k,y1k+40+flatfixk,z1k])  
      sphere(r=m1k-T,$fn=F1);
      translate([x2k,y2k+40+flatfixk,z2k])
      scale([1,flat2k,1])
      sphere(r=m2k-T,$fn=F1);
    }
    hull(){  
      translate([x2k,y2k+flatfixk,z2k])  
      scale([1,flat2k,1])
      sphere(r=m2k-T,$fn=F1);
      translate([x3k-flatfixk,y3k+flatfixk,z3k])
      scale([0.5,flat3k,1])
      sphere(r=m3k-T,$fn=F1);

      translate([x2k,y2k+40+flatfixk,z2k])  
      scale([1,flat2k,1])
      sphere(r=m2k-T,$fn=F1);
      translate([x3k-flatfixk,y3k+40+flatfixk,z3k])
      scale([0.5,flat3k,1])
      sphere(r=m3k-T,$fn=F1);
    }
    
    // cut away near ear
    hull(){
      translate([x1k-40,y1k+25,z1k])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m1k-T+8,h=50,center=true,$fn=F2);
      
      translate([x2k+0,y2k+24,z2k])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m2k,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2k,74,z2k])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=69,h=120,center=true,$fn=F2);
    
      translate([x3k,74+20,z2k])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    // version   
    translate([5,-6.8,-15])
    rotate([0,10,0])
    rotate([90,0,0])
    linear_extrude(height=1.5)
    text(Versionk, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    if(0){
      words();
    }
    
  }
        
  // upper section attach to post
  thick=2;
  difference(){  
    hull(){
      // surround the post
      translate([5,-1.5*thick,zpostk])
      rotate([90,0,0])
      cylinder(r=8,h=4.5,$fn=F1);
      // attachment to the tunnel
      translate([5,-5,-6])
      rotate([0,10,0])
      cube([10,4,1],center=true);
    }
    
    // cuts for pivot
    translate([5,-1.5*thick,zpostk])
    rotate([90,0,0])
    cylinder(r=5.2,h=20,center=true,$fn=F1);
    
    translate([5,-2*thick-5.5,zpostk])
    rotate([90,0,0])
    cylinder(r=7,h=4,center=true,$fn=F1);

    // fillet cut
    translate([5,-1.5*thick,zpostk])
    rotate([90,0,0])
    cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        
  }
  
}

//----------------------------------------------------------------------
module tunnell(T=1.2){

  // tunnel
  difference(){
    union(){
      // upper tunnel
      hull(){  
        translate([x1l,y1l,z1l])  
        scale([1,flat1l,1])
        sphere(r=m1l,$fn=F1);
        translate([x2l,y2l,z2l])
        scale([1,flat2l,1])
        sphere(r=m2l,$fn=F1);

        translate([x1l,y1l+30,z1l])  
        sphere(r=m1l,$fn=F1);
        translate([x2l,y2l+30,z2l])
        scale([1,flat2l,1])
        sphere(r=m2l,$fn=F1);
      }
      // lower tunnel
      hull(){  
        translate([x2l,y2l,z2l])  
        scale([1,flat2l,1])
        sphere(r=m2l,$fn=F1);
        translate([x3l,y3l,z3l])
        scale([0.5,flat3l,1])
        sphere(r=m3l,$fn=F1);

        translate([x2l,y2l+40,z2l])  
        scale([1,flat2l,1])
        sphere(r=m2l,$fn=F1);
        translate([x3l,y3l+40,z3l])
        scale([0.5,flat3l,1])
        sphere(r=m3l,$fn=F1);
      }
      // ear disl
      //~ if(1){
        //~ translate([x1l,y1l-1,z1l])  
        //~ rotate([0,-45,0])
        //~ rotate([90,0,0])
        //~ scale([1,1.4,1])
        //~ cylinder(r=25,h=1.5*T,center=true,$fn=F2);
      //~ }else{
        //~ translate([x1l,y1l-8,z1l])  
        //~ rotate([0,-45,0])
        //~ rotate([-90,0,0])
        //~ scale([1,1.4,1])
        //~ reflector(T=1.2,R=20);
      //~ }
      
      // upper panel
      //~ hull(){
        //~ translate([x1l,y1l-1,z1l+16])  
        //~ rotate([90,0,0])
        //~ cylinder(r=6,h=1.5*T,center=true,$fn=F2);
        //~ translate([0,y1l-1,z1l+4])  
        //~ rotate([90,0,0])
        //~ cylinder(r=12,h=1.5*T,center=true,$fn=F2);
      //~ }

      // lower attach to post
      hull(){
        // midpoint blocl
        translate([5,-5,-6])
        rotate([0,10,0])
        cube([10,4,1],center=true);
        // tunnel blocl
        translate([5,-6,-32])
        rotate([0,24,0])
        cube([30,3,1],center=true);
      }
    }

    // cut for stop adjuster
    translate([-8,y1l+0,z1l+18])  
    scale([1,1,0.7])
    rotate([90,0,0])
    cylinder(r=7,h=10,center=true,$fn=F2);
    
    // hollow out
    hull(){  
      translate([x1l,y1l+flatfixl,z1l]) 
      scale([1,flat1l,1])
      sphere(r=m1l-T,$fn=F1);
      translate([x2l,y2l+flatfixl,z2l])
      scale([1,flat2l,1])
      sphere(r=m2l-T,$fn=F1);

      translate([x1l,y1l+40+flatfixl,z1l])  
      sphere(r=m1l-T,$fn=F1);
      translate([x2l,y2l+40+flatfixl,z2l])
      scale([1,flat2l,1])
      sphere(r=m2l-T,$fn=F1);
    }
    hull(){  
      translate([x2l,y2l+flatfixl,z2l])  
      scale([1,flat2l,1])
      sphere(r=m2l-T,$fn=F1);
      translate([x3l-flatfixl,y3l+flatfixl,z3l])
      scale([0.5,flat3l,1])
      sphere(r=m3l-T,$fn=F1);

      translate([x2l,y2l+40+flatfixl,z2l])  
      scale([1,flat2l,1])
      sphere(r=m2l-T,$fn=F1);
      translate([x3l-flatfixl,y3l+40+flatfixl,z3l])
      scale([0.5,flat3l,1])
      sphere(r=m3l-T,$fn=F1);
    }
    
    // cut away near ear
    hull(){
      translate([x1l-40,y1l+25,z1l])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m1l-T+8,h=50,center=true,$fn=F2);
      
      translate([x2l+0,y2l+24,z2l])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m2l,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2l,74,z2l])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=69,h=120,center=true,$fn=F2);
    
      translate([x3l,74+20,z2l])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    // version   
    translate([5,-6.8,-15])
    rotate([0,10,0])
    rotate([90,0,0])
    linear_extrude(height=1.5)
    text(Versionl, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    if(0){
      words();
    }
    
  }
        
  // upper section attach to post
  thick=2;
  difference(){  
    hull(){
      // surround the post
      translate([5,-1.5*thick,zpostl])
      rotate([90,0,0])
      cylinder(r=8,h=4.5,$fn=F1);
      // attachment to the tunnel
      translate([5,-5,-6])
      rotate([0,10,0])
      cube([10,4,1],center=true);
    }
    
    // cuts for pivot
    translate([5,-1.5*thick,zpostl])
    rotate([90,0,0])
    cylinder(r=5.2,h=20,center=true,$fn=F1);
    
    translate([5,-2*thick-5.5,zpostl])
    rotate([90,0,0])
    cylinder(r=7,h=4,center=true,$fn=F1);

    // fillet cut
    translate([5,-1.5*thick,zpostl])
    rotate([90,0,0])
    cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        
  }
  
}


//----------------------------------------------------------------------
// mounting point
module mountl(){

thick=2.5;
ang=14;
translate([0,0.75,0]){  
  // main loop
  intersection(){
    difference(){
      hull(){
        translate([0,0,12.5])
        rotate([0,90-ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
        translate([0,0,-12.5])
        rotate([0,90+ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=1.2,h=17+2,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=1.2,h=17+2,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        
        // version number
        translate([0,1.5*thick,0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.605)
        text(Versionl, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([5,-1.5*thick,zpostl])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        
        // main shaft
        translate([5,-1.5*thick,zpostl])
        rotate([90,0,0])
        cylinder(r=5,h=5.2,$fn=F2);
        // inner angle
        translate([5,-1.5*thick-4.5,zpostl])
        rotate([90,0,0])
        cylinder(r1=5.0,r2=5.8,h=0.5,$fn=F2);
        // outer angle
        translate([5,-1.5*thick-5,zpostl])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);
      }
      // cuts to make pinchable 
      translate([5,-1.5*thick-10,zpostl])
      translate([-10,0,-0.75])
      cube([20,10,1.5]);
            
      translate([5,-1.5*thick,zpostl])
      rotate([90,0,0])
      cylinder(r1=3,r2=3,h=6,$fn=F2);        
    }
  
    cube([16,20,40],center=true);
  }
  
  // lower adjustable stop
  translate([-5.5,-3,-5])
  rotate([90,0,0])
  cylinder(r=2,h=6.5,$fn=10);

  // upper stop
  translate([-5.5,-3,6])
  rotate([90,0,0])
  cylinder(r=2,h=5,$fn=10);

  // extra tab to lock
  translate([7.5,-1.5,0])
  cube([1,1,10],center=true);

}  
}


//----------------------------------------------------------------------
module tunnelm_OLD(T=1.2){

  // tunnel
  difference(){
    union(){
      // upper tunnel
      hull(){  
        translate([x1m,y1m,z1m])  
        scale([1,flat1m,1])
        sphere(r=m1m,$fn=F1);
        translate([x2m,y2m,z2m])
        scale([1,flat2m,1])
        sphere(r=m2m,$fn=F1);

        translate([x1m,y1m+30,z1m])  
        sphere(r=m1m,$fn=F1);
        translate([x2m,y2m+30,z2m])
        scale([1,flat2m,1])
        sphere(r=m2m,$fn=F1);
      }
      // lower tunnel
      hull(){  
        translate([x2m,y2m,z2m])  
        scale([1,flat2m,1])
        sphere(r=m2m,$fn=F1);
        translate([x3m,y3m,z3m])
        scale([0.5,flat3m,1])
        sphere(r=m3m,$fn=F1);

        translate([x2m,y2m+40,z2m])  
        scale([1,flat2m,1])
        sphere(r=m2m,$fn=F1);
        translate([x3m,y3m+40,z3m])
        scale([0.5,flat3m,1])
        sphere(r=m3m,$fn=F1);
      }

      // lower attach to post
      difference(){
        hull(){
          // midpoint block
          translate([0,-5,-7])
          rotate([0,0,0])
          cube([10,3,1],center=true);
          // tunnel block
          translate([0,-5,-32])
          rotate([0,24,0])
          cube([60,3,1],center=true);
        }
        // cutaway attach
        translate([30,0,-16])
        rotate([90,0,0])
        cylinder(r=24,h=100,center=true,$fn=F1);
        translate([-19,0,-9])
        rotate([90,0,0])
        cylinder(r=11,h=100,center=true,$fn=F1);
      }
    }

    // hollow out
    hull(){  
      translate([x1m,y1m+flatfixm,z1m]) 
      scale([1,flat1m,1])
      sphere(r=m1m-T,$fn=F1);
      translate([x2m,y2m+flatfixm,z2m])
      scale([1,flat2m,1])
      sphere(r=m2m-T,$fn=F1);

      translate([x1m,y1m+40+flatfixm,z1m])  
      sphere(r=m1m-T,$fn=F1);
      translate([x2m,y2m+40+flatfixm,z2m])
      scale([1,flat2m,1])
      sphere(r=m2m-T,$fn=F1);
    }
    hull(){  
      translate([x2m,y2m+flatfixm,z2m])  
      scale([1,flat2m,1])
      sphere(r=m2m-T,$fn=F1);
      translate([x3m-flatfixm,y3m+flatfixm,z3m])
      scale([0.5,flat3m,1])
      sphere(r=m3m-T,$fn=F1);

      translate([x2m,y2m+40+flatfixm,z2m])  
      scale([1,flat2m,1])
      sphere(r=m2m-T,$fn=F1);
      translate([x3m-flatfixm,y3m+40+flatfixm,z3m])
      scale([0.5,flat3m,1])
      sphere(r=m3m-T,$fn=F1);
    }
    
    // cut away near ear
    hull(){
      translate([x1m-40,y1m+25,z1m])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m1m-T+8,h=50,center=true,$fn=F2);
      
      translate([x2m+0,y2m+24,z2m])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m2m,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2m,74,z2m])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=69,h=120,center=true,$fn=F2);
    
      translate([x3m,74+20,z2m])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    // version   
    translate([-2,-6.2,-19])
    rotate([0,20,0])
    rotate([90,0,0])
    linear_extrude(height=1.5)
    text(Versionm, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    if(0){
      words();
    }
    
  }
        
  // upper section attach to post
  thick=2;
  difference(){  
    // surround the post
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=12,h=4.5,$fn=F1);
    
    // cut for pivot
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=5.2,h=20,center=true,$fn=F1);
    
    // fillet cut
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        

    translate([0,-1.5*thick-3.5,zpostm])
    rotate([90,0,0])
    cylinder(r2=5.8,r1=4.9,h=1,$fn=F2);        
  }
  // upper stop
  rotate([0,14,0])
  translate([12,-1.5*thick,zpostm])
  rotate([90,0,0])
  cylinder(r=4,h=4.5,$fn=F1);

  
}


//----------------------------------------------------------------------
// mounting point
module mountm(){

thick=2.5;
ang=14;
translate([0,1.2,0]){  
    difference(){
      union(){
        // main loop
        hull(){
          translate([0,-0.5,12.5])
          rotate([0,90-ang,0])
          cylinder(r=1.5*thick+0.5,h=17+3,center=true,$fn=F2);
          translate([0,-0.5,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=1.5*thick+0.5,h=17+7,center=true,$fn=F2);
        }
        // lower stop
        translate([-12,3.75,-11])
        rotate([90,0,0])
        cylinder(r=1.5*thick,h=12,$fn=F2);        

        //~ // reinforce pivot
        //~ translate([0,-3.5,0])
        //~ rotate([90,0,0])
        //~ cylinder(r=12,h=1,$fn=F2);        
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=1.2,h=50,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=1.2,h=50,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=50,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=50,center=true,$fn=F2);
        
        // material reduction on the backside
        translate([0,4,0])
        hull(){
          translate([0,0,8])
          rotate([0,90-ang,0])
          cylinder(r=1.2,h=50,center=true,$fn=F2);
          translate([0,0,-8])
          rotate([0,90+ang,0])
          cylinder(r=1.2,h=50,center=true,$fn=F2);
        }

      }
      // trim to make printable side
      translate([16,0,0])
      cube([16,20,40],center=true);

      // trim so tips of glasses earpiece can pass through
      translate([-18,0,2])
      rotate([90,0,0])
      cylinder(r=10,h=50,center=true,$fn=F2);        
      
    }
  
  // version number
  translate([0,2.2,0])
  rotate([0,0,180])
  rotate([90,0,0])
  linear_extrude(height=0.605)
  text(Versionm, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([0,-1.5*thick,zpostm])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        
        // main shaft
        translate([0,-1.5*thick,zpostm])
        rotate([90,0,0])
        cylinder(r=5,h=5.2,$fn=F2);
        // inner angle
        translate([0,-1.5*thick-4.5,zpostm])
        rotate([90,0,0])
        cylinder(r1=5.0,r2=5.8,h=0.5,$fn=F2);
        // outer angle
        translate([0,-1.5*thick-5,zpostm])
        rotate([90,0,0])
        cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);
      }
      // cuts to make pinchable 
      translate([0,-1.5*thick-10,zpostm])
      translate([-10,0,-2.5])
      cube([20,10,5]);
            
      translate([0,-1.5*thick,zpostm])
      rotate([90,0,0])
      cylinder(r1=3,r2=4,h=7,$fn=F2);        
    }
  
    cube([16,20,40],center=true);
  }
  
  //~ // lower adjustable stop
  //~ translate([-5.5,-3,-5])
  //~ rotate([90,0,0])
  //~ cylinder(r=2,h=6.5,$fn=10);

  //~ // upper stop
  //~ translate([-5.5,-3,6])
  //~ rotate([90,0,0])
  //~ cylinder(r=2,h=5,$fn=10);

  // extra tab to lock
  translate([7.5,-1.5,0])
  cube([1,1,10],center=true);

}  
}

//----------------------------------------------------------------------
// smooth curves
module test_OLD(T=1.5){

  difference(){
    union(){
      translate([x1m,y1m,z1m])  
      scale([1,flat1m,1])
      sphere(r=m1m+T,$fn=F1);

      translate([x1m,y1m+9,z1m])
      scale([1,flat1m,1])
      rotate([0,128,0])
      linear_extrude(height=120,scale=1.95,twist=120,$fn=F1)
      translate([0,-15,0])
      circle(r=m1m+T,$fn=F1);

      translate([x3m,y3m-7,z3m])
      rotate([0,30,0])
      rotate([0,0,30])
      scale([0.5,flat3m*0.77,0.8])
      sphere(r=m3m+1+T*2,$fn=F1);
      
      // lower attach to post
      difference(){
        hull(){
          // midpoint block
          translate([0,-5,-7])
          rotate([0,0,0])
          cube([10,3,1],center=true);
          // tunnel block
          translate([0,-5,-32])
          rotate([0,24,0])
          cube([60,3,1],center=true);
        }
        // cutaway attach
        translate([26,0,-8])
        rotate([90,0,0])
        cylinder(r=20,h=100,center=true,$fn=F1);
        translate([-19,0,-9])
        rotate([90,0,0])
        cylinder(r=11,h=100,center=true,$fn=F1);
      }
      
    }
    
    translate([x1m,y1m,z1m])  
    scale([1,flat1m,1])
    sphere(r=m1m,$fn=F1);

    translate([x1m,y1m+9,z1m])
    scale([1,flat1m,1])
    rotate([0,128,0])
    linear_extrude(height=120,scale=1.95,twist=120,$fn=F1)
    translate([0,-15,0])
    circle(r=m1m,$fn=F1);

    translate([x3m,y3m-7,z3m])
    rotate([0,30,0])
    rotate([0,0,30])
    scale([0.5,flat3m*0.77,0.8])
    sphere(r=m3m+1,$fn=F1);
  
    // cut away near ear
    hull(){
      translate([x1m-40,y1m+24,z1m])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m1m-T+8,h=50,center=true,$fn=F2);
      
      translate([x2m+0,y2m+20,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=m2m,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2m,70,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=69,h=120,center=true,$fn=F2);
    
      translate([x3m,70+20,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    }
    // upper section attach to post
  thick=2;
  difference(){  
    // surround the post
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=12,h=4.5,$fn=F1);
    
    // cut for pivot
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=5.2,h=20,center=true,$fn=F1);
    
    // fillet cut
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        

    translate([0,-1.5*thick-3.5,zpostm])
    rotate([90,0,0])
    cylinder(r2=5.8,r1=4.9,h=1,$fn=F2);        
  }
  // upper stop
  rotate([0,14,0])
  translate([12,-1.5*thick,zpostm])
  rotate([90,0,0])
  cylinder(r=4,h=4.5,$fn=F1);

}
//----------------------------------------------------------------------
// smooth curves
module tunnelm(T=1.5){

  difference(){
    union(){
      mirror([0,0,1])
      translate([x1m,y1m,-z1m])  
      scale([1,flat1m,1])
      sphere(r=m1m+T,$fn=F1);

      mirror([0,0,1])
      translate([x1m,y1m+9,-z1m])
      scale([1,flat1m,1])
      rotate([0,75.3,0])
      linear_extrude(height=120,scale=1.95,twist=120,$fn=F1)
      translate([0,-15,0])
      circle(r=m1m+T,$fn=F1);

      mirror([0,0,1])
      translate([x3m,y3m-7,-z3m])
      rotate([0,-30,0])
      rotate([0,0,30])
      scale([0.5,flat3m*0.77,0.8])
      sphere(r=m3m+1.5+T*2,$fn=F1);
      
      // lower attach to post
      difference(){
        hull(){
          // midpoint block
          translate([0,-5,-7])
          rotate([0,0,0])
          cube([10,3,1],center=true);
          // tunnel block
          translate([0,-5,-32])
          rotate([0,24,0])
          cube([60,3,1],center=true);
        }
        // cutaway attach
        translate([35,0,-14])
        rotate([90,0,0])
        cylinder(r=30,h=100,center=true,$fn=F1);
        translate([-19,0,-9])
        rotate([90,0,0])
        cylinder(r=11,h=100,center=true,$fn=F1);
      }
      
    }
    
    mirror([0,0,1])
    translate([x1m,y1m,-z1m])  
    scale([1,flat1m,1])
    sphere(r=m1m,$fn=F1);

    mirror([0,0,1])
    translate([x1m,y1m+9,-z1m])
    scale([1,flat1m,1])
    rotate([0,75.3,0])
    linear_extrude(height=120,scale=1.95,twist=120,$fn=F1)
    translate([0,-15,0])
    circle(r=m1m,$fn=F1);

    mirror([0,0,1])
    translate([x3m,y3m-7,-z3m])
    rotate([0,-30,0])
    rotate([0,0,30])
    scale([0.5,flat3m*0.77,0.8])
    sphere(r=m3m+1.5,$fn=F1);
  
    // cut away near ear
    hull(){
      translate([x1m-40,y1m+24,z1m])
      rotate([10,0,0])
      rotate([0,20,0])
      cylinder(r=m1m-T+8,h=50,center=true,$fn=F2);
      
      translate([x2m+0,y2m+20,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=m2m,h=84,center=true,$fn=F2);
    }

    //~ // cut away near mouth
    hull(){
      translate([x2m,70,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=70,h=120,center=true,$fn=F2);
    
      translate([x3m,70+20,z2m])
      rotate([5,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }

    // version   
    translate([-2,-6.2,-19])
    rotate([0,20,0])
    rotate([90,0,0])
    linear_extrude(height=1.5)
    text(Versionm, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
    
    }

    // upper section attach to post
  thick=2;
  difference(){  
    // surround the post
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=12,h=4.5,$fn=F1);
    
    // cut for pivot
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r=5.2,h=20,center=true,$fn=F1);
    
    // fillet cut
    translate([0,-1.5*thick,zpostm])
    rotate([90,0,0])
    cylinder(r1=5.8,r2=4.9,h=1,$fn=F2);        

    translate([0,-1.5*thick-3.5,zpostm])
    rotate([90,0,0])
    cylinder(r2=5.8,r1=4.9,h=1,$fn=F2);        
  }
  // upper stop
  rotate([0,14,0])
  translate([12,-1.5*thick,zpostm])
  rotate([90,0,0])
  cylinder(r=4,h=4.5,$fn=F1);

}

//======================================================================

// choose 1 for design, 0 for print
design=1;

//---------------------------------------------------------
if(design==1){

thick=2;

// Version J
if(0){
  translate([0,300,0]){
    mountj();

    translate([5,-1.5*thick,zpostj])
    rotate([0,-flip,0])
    translate([-5,1.5*thick,-zpostj])

    tunnelj();

    if(0){
      difference(){
        tunnelj();
        translate([0,0,0])
      cube([300,100,100],center=true);
      }
    }

    // safety glasses approx
    if(0){
      translate([55,71,-22])
      rotate([0,0,-90])
      glassHalf();
      mirror([0,1,0])
      translate([55,-71,-22])
      rotate([0,0,-90])
      glassHalf();
    }
  }
}

// Version K:
if(0){
  translate([0,200,0]){

    mountk();
    stopAdjust();

    translate([5,-1.5*thick,zpostk])
    rotate([0,-flip,0])
    translate([-5,1.5*thick,-zpostk])

    tunnelk();

    if(0){
      difference(){
        tunnelk();
        translate([0,0,0])
      cube([300,100,100],center=true);
      }
    }

    // safety glasses approx
    if(0){
      color("gray")
      translate([55,71,-22])
      rotate([0,0,-90])
      glassHalf();
      color("gray")
      mirror([0,1,0])
      translate([55,-71,-22])
      rotate([0,0,-90])
      glassHalf();
    }
  }
}


// Version L:
if(0){
  translate([0,100,0]){

    mountl();
    stopAdjust();

    translate([5,-1.5*thick,zpostl])
    rotate([0,-flip,0])
    translate([-5,1.5*thick,-zpostl])

    tunnell();

    if(0){
      difference(){
        tunnell();
        translate([0,0,0])
      cube([300,100,100],center=true);
      }
    }

    // safety glasses approx
    if(0){
      color("gray")
      translate([55,71,-22])
      rotate([0,0,-90])
      glassHalf();
      color("gray")
      mirror([0,1,0])
      translate([55,-71,-22])
      rotate([0,0,-90])
      glassHalf();
    }
  }
}

// Version M:
if(1){
  translate([0,0,0]){

    mountm();

    translate([0,-1.5*thick,zpostm])
    rotate([0,-flip,0])
    translate([0,1.5*thick,-zpostm])

    //~ tunnelm_OLD();
    tunnelm();

    if(0){
      difference(){
        tunnelm();
        translate([0,0,0])
      cube([300,100,100],center=true);
      }
    }

    // safety glasses approx
    if(0){
      color("gray")
      translate([55,71,-22])
      rotate([0,0,-90])
      glassHalf();
      color("gray")
      mirror([0,1,0])
      translate([55,-71,-22])
      rotate([0,0,-90])
      glassHalf();
    }
  }
}


//---------------------------------------------------------
}else{
//---------------------------------------------------------
  

//~ stopAdjust();

//~ tunnelj();
//~ wordsj();
//~ mountj();

//~ tunnelk();
//~ mountk();

//~ tunnell();
//~ mountl();

tunnelm();
//~ mountm();

}  

//======================================================================
