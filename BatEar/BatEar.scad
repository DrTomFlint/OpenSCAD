//======================================================================
// BatEar.scad
//
// Passive vocal monitor that clips onto safety glasses
//
// DrTomFlint, 18 Feb 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>


z0 = 55;      // height of lenses

// rev B
//~ // location of ear reflector  
//~ x1 = -40;
//~ y1 = -10;
//~ z1 = -25;
//~ ang1 = -50;
//~ m1 = 8;

//~ // location of mouth reflector  
//~ x2 = 80;
//~ y2 = -15;
//~ z2 = -70;
//~ ang2 = 35;
//~ m2 = 20;

// rev C
// location of ear reflector  
x1 = -35;
y1 = -10;
z1 = -25;
ang1 = -50;
m1 = 9;

// location of mouth reflector  
x2 = 85;
y2 = -5;
z2 = -70;
ang2 = 40;
m2 = 30;


Version="D";

F1=299;
F2=55;

//----------------------------------------------------------------------
module parabola( 
    focus_point, 
    base_area, 
    resolution = [30, 30], 
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
// over the glasses protective goggles
module glassHalf(){
  
  // lens front
  translate([0,-238,-5])
  intersection(){
    linear_extrude(height=z0)
    difference(){
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
// mounting point onto glassses
module mount(){

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
        text(Version, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        translate([5,-1.5*thick,0])
        rotate([90,0,0])
        cylinder(r=4,h=5.2,$fn=F2);

        translate([5,-1.5*thick-5,0])
        rotate([90,0,0])
        cylinder(r1=4.4,r2=3.9,h=1,$fn=F2);
      }
      translate([5,-1.5*thick-5,0])
      cube([20,10,2.5],center=true);
    }
  
    cube([16,20,40],center=true);
  }
  
}


//----------------------------------------------------------------------
// support beam for the 2 reflectors
module beam(){

thick=2;

  // surround the post
  translate([5,-1.5*thick,0])
  rotate([90,0,0])
  difference(){
    cylinder(r=8,h=4.8,$fn=F2);
    cylinder(r=4,h=5,$fn=F2);
  }
  
  // ear reflector beam
  difference(){
    hull(){
      translate([x1,y1,z1])
      rotate([-20,0,ang1])
      cube([2,1.2,3],center=true);
      
      translate([5,-2*thick,0])
      rotate([90,0,0])
      cylinder(r=4,h=1.5,$fn=F2);
    }
    translate([5,-3*thick-1.2,0])
    rotate([90,0,0])
    cylinder(r=5,h=20,$fn=F2,center=true);
  }
  
  // ear reflector
  translate([x1,y1,z1-5])
  rotate([0,0,ang1])
  translate([0,-2,-1])
  rotate([-90,0,0])
  reflector1();
  
  // mouth reflector beam
  difference(){
    hull(){
      translate([x2,y2,z2])
      rotate([0,0,ang2])
      cube([1.5,1.5,6],center=true);
      
      translate([5,-2*thick,0])
      rotate([90,0,0])
      cylinder(r=4,h=thick,$fn=F2);
    }
    translate([5,-3*thick-1.2,0])
    rotate([90,0,0])
    cylinder(r=5,h=20,$fn=F2,center=true);
  }
  // reinforce meeting between beam and reflector
    translate([x2,y2,z2])
    rotate([0,0,ang2])
    translate([-2,0.25,0])
    #cube([3,2,6],center=true);
  
  // mouth reflector
  translate([x2-3,y2+3,z2-m2+4])
  rotate([0,0,ang2])
  translate([0,-0.6,0])
  rotate([-70,0,0])
  reflector2();

  translate([x2-3,y2+3,z2-m2+4])
  rotate([0,0,ang2])
  rotate([-70,0,0])
  linear_extrude(height=1)
  text(Version, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

}


//----------------------------------------------------------------------
module ear(){
  
  difference(){
    union(){
      // ear reflector
      translate([x1,y1,z1-5])
      rotate([0,0,ang1])
      translate([0,-2,-1])
      rotate([-90,0,0])
      reflector1();
      
      translate([x1,y1+3.5,z1+0.25])
      rotate([0,-35,0])
      cube([6,4,5.5],center=true);
    }
    
    beam2(tol=0.15);
    
    translate([x1,y1,z1-5])
    rotate([0,0,ang1])
    translate([0,-2,-1])
    rotate([-90,0,0])
    translate([0,0,-1.2])
    reflector1(T=4);
  }
}

//----------------------------------------------------------------------
module mouth(){


  difference(){
    union(){
      // mouth reflector
      translate([x2-3,y2+3,z2-m2+4])
      rotate([0,0,ang2])
      translate([0,-0.6,0])
      rotate([-70,0,0])
      reflector2();

      translate([x2-2,y2-1.5,z2-4.0])
      rotate([0,44,0])
      #cube([14,4,7],center=true);
    }
    
    beam2(tol=0.15);
    
    translate([x2-3,y2+3,z2-m2+4])
    rotate([0,0,ang2])
    translate([0,-0.6,0])
    rotate([-70,0,0])
    translate([0,0,-1.2])
    reflector2(T=12);
  }


  translate([x2-3,y2+3,z2-m2+4])
  rotate([0,0,ang2])
  rotate([-70,0,0])
  linear_extrude(height=1)
  text(Version, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
// support beam for the 2 reflectors
module beam2(tol=0){

thick=2;

  difference(){
    union(){
      // surround the post
      translate([5,-1.5*thick,0])
      rotate([90,0,0])
      cylinder(r=8,h=4.8,$fn=F1);
    
      // ear reflector beam
      translate([x1/2,y1/2-1.5,z1/2])
      rotate([0,0,0])
      rotate([0,-35,0])
      cube([ sqrt(x1*x1+y1*y1+z1*z1)+tol, 2.6+tol, 4+tol],center=true);
            
      // mouth reflector beam
      translate([x2/2,y2/2-4,z2/2])
      rotate([0,0,0])
      rotate([0,44,0])
      cube([ sqrt(x2*x2+y2*y2+z2*z2)+tol-2, 2.6+tol, 6+tol],center=true);
    }
    // cut the pivot hole
    translate([5,-1.5*thick,0])
    rotate([90,0,0])
    cylinder(r=4.15,h=20,center=true,$fn=F2);
  }    
}

//----------------------------------------------------------------------
module reflector1(T=1.2,R=9){
  
intersection(){  
  translate([-R,-R,-8.5])
  parabola( 
      focus_point = [R,R,20],
      base_area   = [2*R,2*R],
      thickness   = T
  );
  
  cylinder(r=R,h=20,$fn=F1, center=true);
}

}  

//----------------------------------------------------------------------
module reflector2(T=1.2,R=30){
  
intersection(){  
  translate([-R,-R,-48])
  parabola( 
      focus_point = [R,R,100],
      base_area   = [2*R,2*R],
      thickness   = T
  );
  
  cylinder(r=R,h=20,$fn=F1,center=true);
}

}  

//----------------------------------------------------------------------
module tunnel(T=1.2){

d1=1.2;
d2=1.2;
dx1=d1*cos(abs(ang1));
dy1=d1*sin(abs(ang1));
dx2=d2*cos(abs(ang2));
dy2=d2*sin(abs(ang2));

echo("ear")
echo(d1);
echo(ang1);
echo(dx1);
echo(dy1);
echo("mouth")
echo(d2);
echo(ang2);
echo(dx2);
echo(dy2);

  // ear reflector
  translate([x1,y1,z1])
  rotate([0,0,ang1])
  translate([0,-2,-1])
  rotate([-90,0,0])
  reflector1(R=m1);

  // mouth reflector
  translate([x2,y2,z2])
  rotate([0,0,ang2])
  translate([0,-0.6,0])
  rotate([-70,0,0])
  reflector2(R=m2);

  // tunnel
  difference(){
    hull(){
      // ear reflector
      translate([x1,y1,z1])
      rotate([0,0,ang1])
      translate([0,-2,-1])
      rotate([-90,0,0])
      reflector1(R=m1);

      // mouth reflector
      translate([x2,y2,z2])
      rotate([0,0,ang2])
      translate([0,-0.6,0])
      rotate([-70,0,0])
      reflector2(R=m2);
    }
    hull(){
      // ear reflector
      translate([x1+dx1,y1+dy1,z1])
      rotate([0,0,ang1])
      translate([0,-2,-1])
      rotate([-90,0,0])
      reflector1(R=m1-d1);

      // mouth reflector
      translate([x2-dx2,y2+dy2,z2])
      rotate([0,0,ang2])
      translate([0,-0.6,0])
      rotate([-70,0,0])
      reflector2(R=m2-d2);
    }

    // cut away inner side    
    translate([ (x1+x2)/2, (y1+y2)/2+50+2, (z1+z2)/2 ])
    rotate([0,0,2])
    cube([200,100,100],center=true);

  }
  
  // attach to mount
  thick=2;
  difference(){  
    hull(){
      // surround the post
      translate([5,-1.5*thick,0])
      rotate([90,0,0])
      cylinder(r=8,h=4.8,$fn=F1);
      // attachment to the tunnel
      translate([5,-8,-24])
      rotate([0,10,0])
      cube([30,2,1],center=true);
    }
    
    // cut for pivot
    translate([5,-1.5*thick,0])
    rotate([90,0,0])
    cylinder(r=4.2,h=20,center=true,$fn=F1);
    
    // version   
    translate([5,-8,-12])
    rotate([0,0,0])
    rotate([88,0,0])
    linear_extrude(height=1)
    text(Version, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
    
  }
}


//======================================================================

// choose 1 for design, 0 for print
design=1;

//---------------------------------------------------------
if(design==1){

//~ reflector1();
//~ reflector2();

mount();

//~ beam();

//~ beam2();
//~ ear();
//~ mouth();

tunnel();

if(0){
  difference(){
    tunnel();
    translate([0,0,-90])
    cube([300,100,100],center=true);
  }
}

// safety glasses approx
if(1){
  translate([55,71,-22])
  rotate([0,0,-90])
  glassHalf();
  mirror([0,1,0])
  translate([55,-71,-22])
  rotate([0,0,-90])
  glassHalf();
}


//---------------------------------------------------------
}else{
//---------------------------------------------------------
  
//~ mount();
//~ beam();
//~ beam2();
//~ ear();
//~ mouth();
tunnel();

}  

//======================================================================
