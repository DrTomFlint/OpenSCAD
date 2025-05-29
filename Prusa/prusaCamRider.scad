//======================================================================
// prusaCamRider.scad
//
// Attach a Raspberry Pi V3 camera and some white leds to the left end
// of the carriage.
//
// DrTomFlint 3 May 2025
//
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/tslot.scad>
use <../Parts/cambase1.scad>
use <../Parts/camlid1.scad>
use <../Parts/cambracket1.scad>


thick=1.5;

F1 = 100;  
F2=33;


//----------------------------------------------------------------------
module bracket(){

  // bracket
  difference(){
    translate([-17-2*thick,0,0])
    cube([17+2*thick,12.5,53.5+2*thick]);
    translate([-17-1*thick,-1,thick])
    cube([17,12.5+2,53.5]);
    translate([-25,-1,thick+2])
    cube([17,12.5+2,53.5-10]);
  }
  difference(){
    union(){
      // vertical
      translate([0,12.5-thick,-32])
      cube([50,thick,53.5+2*thick+32]);
      // lower
      translate([0,0,-32])
      cube([50,12.5,thick]);
      // upper horizontal
      translate([0,0,-thick])
      cube([50,12.5,thick]);    
      // hindge
      translate([50,12.5-2,-32])
      cylinder(r=2,h=40,$fn=F1);
      // lower vertical
      translate([-thick,0,-32])
      cube([thick,12.5,32]);
    }
    
    // vertical cut
    translate([82,12.5-thick,51])
    scale([1.6,1,1])
    rotate([90,0,0])
    cylinder(r=51,h=20,center=true,$fn=F1);
    
    // lower cut
    translate([70,-2.5,-32])
    scale([6,1,1])
    cylinder(r=12.5-thick,h=20,center=true,$fn=F1);
    
    // upper cut
    translate([70,-2.5,-thick])
    scale([6,1,1])
    cylinder(r=12.5-thick,h=20,center=true,$fn=F1);

    // material reduction
    translate([25,12.5-thick,-19])
    scale([1.5,1,1])
    rotate([90,0,0])
    cylinder(r=10,h=20,center=true,$fn=F1);
    
    // hinge clearance
    translate([50,12.5-2,10-32])
    cube([6,20,5.2],center=true);
    translate([50,12.5-2,20-32])
    cube([6,20,5.2],center=true);

    // hindge
    translate([50,12.5-2,10-32])
    cube([6,20,5.2],center=true);
    translate([50,12.5-2,20-32])
    cube([6,20,5.2],center=true);

    // cut for pin
    translate([50,12.5-2,-1-32])
    cylinder(r=1,h=70+2,$fn=F1);

    // cut for power wires to leds
    translate([0,6,-15])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F1);
    translate([0,6,-25])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F1);
  }

  
}

//----------------------------------------------------------------------
module arm(){

  // hindge
  difference(){
    translate([50,12.5-2,0])
    cylinder(r=2,h=30,$fn=F1);

    translate([50,12.5-2,3.7])
    cube([20,20,7.6],center=true);
    translate([50,12.5-2,15])
    cube([20,20,5.2],center=true);
    translate([50,12.5-2,26.3])
    cube([20,20,7.6],center=true);

    // cut for pin
    translate([50,12.5-2,-1])
    cylinder(r=1,h=70+2,$fn=F1);
  }

  // panel
  difference(){
    translate([50,12.5-thick-2.5,0])
    cube([6,thick,29]);

    translate([50,12.5-2,4-1])
    cube([6,20,7.2+2],center=true);
    translate([50,12.5-2,15])
    cube([6,20,5.2],center=true);
    translate([50,12.5-2,26+1])
    cube([6,20,7.2+2],center=true);

    // cut for pin
    translate([50,12.5-2,-1])
    cylinder(r=1,h=30+2,$fn=F1);
  }

  // led panel
  translate([54,12.5-thick-2.5,0])
  leds(row=2,col=2);
  translate([82.5,12.5-thick-2.5,0])
  cube([6,thick,20]);
  
  // cam panel
  translate([114,8.5,3])
  rotate([0,0,180])
  rotate([90,0,0]){
    cambase4();
    //~ camlid1();
  }

  // led panel
  translate([118.75,12.5-thick-2.5,0])
  leds(row=2,col=2);
  translate([114.5,12.5-thick-2.5,0])
  cube([6,thick,20]);

}

//----------------------------------------------------------------------
module leds(row=2,col=2){

dx=15;
dz=15;

  for(i=[0:row-1]){
    for(j=[0:col-1]){
      translate([dx*j,0,dz*i])
      difference(){
        cube([dx,thick+6,dz]);
        // parabolic cuts for leds
        translate([0,0,dz/2])
        rotate([-90,0,0]){      
          translate([dx/2,0,1])
          led(tol=0.3);
          translate([dx/2,0,10])
          reflector();
        }
      }
    }
  }

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
module reflector(T=8,R=7,F=5){
  
intersection(){  
  translate([-R,-R,-F/2])
  parabola( 
      focus_point = [R,R,F],
      base_area   = [2*R,2*R],
      thickness   = T
  );
  
  cylinder(r=R,h=20,$fn=F1, center=true);
}

}  

//----------------------------------------------------------------------
module led(leads=10,tol=0){

  difference(){    
    cylinder(r=3.8/2+tol,h=1.25+tol,$fn=F2);
    //~ translate([2+1.4,0,0])
    //~ cube([4,4,10],center=true);
  }
  cylinder(r=3.0/2+tol,h=4+tol,$fn=F2);
  translate([0,0,4+tol])
  sphere(r=3.0/2+tol,$fn=F2);


  translate([1.0,0,-leads/2])
  cube([0.5+tol,0.5+tol,leads],center=true);
  translate([-1.0,0,-leads/2])
  cube([0.5+tol,0.5+tol,leads],center=true);
}

module pcb(){

    cube([10.3,3,18.2]);
}
  
//======================================================================

//~ leds(row=2,col=2);

bracket();
//~ translate([0,0,-32])
//~ arm();

//~ translate([20,0,-25])
//~ pcb();

//~ reflector();
//~ led(tol=0);

//~ camlid1();

if(0){
  translate([115,13,0])
  rotate([0,0,180])
  rotate([90,0,0]){
    //~ cambase4();
    camlid1();
  }
}

//======================================================================
