//=======================================================================
// TenBuck.scad
//
// Ten Buck Sixer band logo for coins or disks
// 
// DrTomFlint 28 March 2024
//======================================================================


use <./TenBuck2Black.scad>
use <./TenBuck2Blue.scad>
use <./TenBuck2Yellow.scad>
use <./TenBuck2Brown.scad>
use <./TenBuck2Red.scad>

layer = 0.3;
thick = 4*layer;    // thickness not including top and bottom

mag=80;   // scaling

//----------------------------------------------------------------------
module TenBlack(){
  
  intersection(){
    scale([mag,mag,thick])
    TenBuck2Black();
    
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}
//----------------------------------------------------------------------
module TenBlack2(){
  
  intersection(){
    translate([0,0,-thick/2])
    scale([mag,mag,2*thick])
    TenBuck2Black();
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenBlue(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck2Blue();
      
      TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}
//----------------------------------------------------------------------
module TenBrown(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck2Brown();
      
      TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenBrown2(){
  
  intersection(){
    difference(){
      translate([0,0,-thick/3])
      scale([mag,mag,2*thick])
      TenBuck2Brown();
      
      //~ TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenYellow(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck2Yellow();
      
      
      TenBlack2();
      TenBrown2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenRed(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck2Red();
      
      TenBlack2();
    }
  
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}


//----------------------------------------------------------------------
module TenLoop(){
  
  translate([0,0.32*mag,0])
  difference(){
    cylinder(r=1.5,h=thick,$fn=22);
    cylinder(r=0.75,h=3*thick,center=true,$fn=22);
  }
}

//======================================================================

//~ TenBlack();
//~ TenBlue();
//~ TenYellow();
//~ TenBrown();
//~ TenRed();

//~ scale([mag,mag,thick])
//~ TenBuck2Black();

TenLoop();

//======================================================================
