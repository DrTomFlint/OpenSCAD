//======================================================================
// Mister.scad
//
// Hanger for 1/8" OD line with mister nozzles.
//
// DrTomFlint 26 Aug 2024
//
//======================================================================

use <../Parts/rounder.scad>



//----------------------------------------------------------------------
module hang1(){
//~ wide=26;
wide=36;
thick=1.5;
gap=8;

// staple attachment
difference(){
  translate([0,0,-0.5])
  difference(){
    translate([-(26-wide)/2,0,gap])
    cube([26,7*thick,10]);
    translate([-(24-wide)/2,4*thick,gap+thick+0.01])
    cube([24,7*thick,10-thick]);
    translate([(wide-10)/2,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
    translate([(wide-10)/2+10,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
  }
  translate([-2,-4*thick,gap-2])
  cube([34,4*thick,15]);
}

translate([wide,0,0])
rotate([0,180,0])
difference(){
  translate([0,0,-0.5])
  difference(){
    translate([-(26-wide)/2,0,gap])
    cube([26,7*thick,10]);
    translate([-(24-wide)/2,4*thick,gap+thick+0.01])
    cube([24,7*thick,10-thick]);
    translate([(wide-10)/2,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
    translate([(wide-10)/2+10,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
  }
  translate([-2,-4*thick,gap-2])
  cube([34,4*thick,15]);
}

// fiber clip
difference(){
  translate([0,thick+7.5,0])
  rotate([0,90,0])
  cylinder(r=7.5+thick,h=wide,$fn=33);
  translate([-1,thick+7.5,0])
  rotate([0,90,0])
  cylinder(r=7.5,h=wide+2,$fn=33);

  translate([0,0,-7.5])
  cube([wide,7.5,15]);

  hull(){
    translate([wide/2,20,-7.5])
    rotate([45,0,0])
    cylinder(r=7,h=10,$fn=33);
    translate([wide/2,13,0])
    rotate([-45,0,0])
    cylinder(r=7,h=10,$fn=33);
  }
}

  translate([0,0,7.5])
  cube([5,7.5,thick]);
  translate([0,0,-7.5-thick])
  cube([5,7.5,thick]);

  translate([31,0,7.5])
  cube([5,7.5,thick]);
  translate([31,0,-7.5-thick])
  cube([5,7.5,thick]);



}

//----------------------------------------------------------------------
module hang2(){
//~ wide=26;
wide=36;
thick=1.5;
gap=8;

difference(){
  union(){
    // staple attachment
    translate([wide,0,25.5])
    rotate([0,180,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,2*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
    }

    translate([0,0,-25.5])
    rotate([0,0,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,2*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
    }

    // fiber clip
    difference(){
      translate([0,thick+7.5,0])
      rotate([0,90,0])
      cylinder(r=7.5+thick,h=wide,$fn=178);
      
      translate([-1,thick+7.5,0])
      rotate([0,90,0])
      cylinder(r=7.5-0.2,h=wide+2,$fn=17);

      translate([0,0,-7.5])
      cube([wide,7.0,15]);
    }

    // add end walls to make it printable
    translate([0,0,7.5])
    cube([5,7.0,thick]);
    translate([0,0,-7.5-thick])
    cube([5,7.0,thick]);

    translate([31,0,7.5])
    cube([5,7.0,thick]);
    translate([31,0,-7.5-thick])
    cube([5,7.0,thick]);
  
  } // end of union

  hull(){
    translate([wide/2,10,-5])
    rotate([40,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);

    translate([wide/2,15,0])
    rotate([90,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);
    
    translate([wide/2,10,5])
    rotate([-40,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);
  }

} // end diff


}


//----------------------------------------------------------------------
module hang3(){
wide=26;
//~ wide=36;
thick=1.5;
gap=12.25;

    // staple attachment
    translate([wide,0,25.5])
    rotate([0,180,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,2*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
    }

    translate([0,0,-25.5])
    rotate([0,0,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,2*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=10,center=true,$fn=33);
    }

    // fiber clip
    difference(){
      translate([0,thick+3.2,0])
      rotate([0,90,0])
      cylinder(r=3.2+thick,h=wide,$fn=178);
      
      translate([-1,thick+3.2,0])
      rotate([0,90,0])
      cylinder(r=3.2,h=wide+2,$fn=178);

      translate([0,0,-3.2])
      cube([wide,5,6.4]);
    }

    // add end walls to make it printable
    //~ translate([0,0,3.2])
    //~ cube([5,6.0,thick]);
    //~ translate([0,0,-3.2-thick])
    //~ cube([5,6.0,thick]);

    //~ translate([31,0,3.2])
    //~ cube([5,6.0,thick]);
    //~ translate([31,0,-3.2-thick])
    //~ cube([5,6.0,thick]);
  

}

//----------------------------------------------------------------------
module hang4(){
//~ wide=26;
wide=26;
thick=2.1;
gap=8;

difference(){
  union(){
    // staple attachment
    translate([wide,0,26])
    rotate([0,180,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,1.5*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([-(24-wide)/2 -5,1.5*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=33);
    }

    translate([0,0,-26])
    rotate([0,0,0])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,4*thick,10]);
      translate([-(24-wide)/2,1.5*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([-(24-wide)/2 + 5,1.5*thick,gap])
      cube([24,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+4])
      rotate([90,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=33);
    }

    // fiber clip
    difference(){
      union(){
        translate([0,thick+7.5,0])
        rotate([0,90,0])
        cylinder(r=7.5+thick,h=wide,$fn=178);
        hull(){
          translate([0,thick+7.5,0])
          rotate([0,90,0])
          cylinder(r=7.5+thick+1,h=1,$fn=178);
          translate([0,7.4,-18])
          cube([1,1,36]);
        }
      }
      
      translate([-1,thick+7.5,0])
      rotate([0,90,0])
      cylinder(r=7.5,h=wide+2,$fn=178);

      translate([0,-2,-7.5])
      cube([wide,9.0,15]);
    }

    // add end walls to make it printable
    translate([0,0,7.5])
    cube([wide,9.0,thick]);
    translate([0,0,-7.5-thick])
    cube([wide,9.0,thick]);
  
  } // end of union

  hull(){
    translate([wide/2,10,-5])
    rotate([40,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);

    translate([wide/2,15,0])
    rotate([90,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);
    
    translate([wide/2,10,5])
    rotate([-40,0,0])
    cylinder(r=4.4,h=15,$fn=99,center=true);
  }

} // end diff


}


//======================================================================

//~ translate([0,100,0])
//~ hang1();


//~ hang2();

//~ hang3();

hang4();

//======================================================================


