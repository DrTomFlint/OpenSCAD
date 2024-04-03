//=======================================================================
// TenBuck.scad
//
// Ten Buck Sixer band logo for coins or disks
// 
// DrTomFlint 28 March 2024
//======================================================================


use <./TenBuck1Black.scad>
use <./TenBuck1Blue.scad>
use <./TenBuck1Yellow.scad>
use <./TenBuck1Brown.scad>
use <./TenBuck1Purple.scad>
use <./TenBuck1Brown2.scad>
use <./TenBuck1Purple2.scad>

layer = 0.3;
thick = 4*layer;    // thickness not including top and bottom

mag=100;   // scaling

//----------------------------------------------------------------------
module TenBlack(){
  
  intersection(){
    scale([mag,mag,thick])
    TenBuck1Black();
    
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}
//----------------------------------------------------------------------
module TenBlack2(){
  
  intersection(){
    translate([0,0,-thick/2])
    scale([mag,mag,2*thick])
    TenBuck1Black();
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenBlue(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck1Blue();
      
      TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}
//----------------------------------------------------------------------
module TenYellow(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck1Yellow();
      
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
      TenBuck1Brown();
      
      TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenPurple(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck1Purple();
      
      TenBlack2();
    }
  
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}

//----------------------------------------------------------------------
module TenBrown2(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck1Brown2();
      
      TenBlack2();
    }
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
  
}
//----------------------------------------------------------------------
module TenPurple2(){
  
  intersection(){
    difference(){
      scale([mag,mag,thick])
      TenBuck1Purple2();
      
      TenBlack2();
    }
  
    cube([0.9*mag,0.9*mag,3*thick],center=true);
  }
}

//----------------------------------------------------------------------
module TenLoop(){
  
  translate([0,0.31*mag,0])
  difference(){
    cylinder(r=1.2,h=thick,$fn=22);
    cylinder(r=0.5,h=3*thick,center=true,$fn=22);
  }
}

//======================================================================

//~ TenBlack();
//~ TenBlue();
//~ TenYellow();
//~ TenBrown();
//~ TenPurple();
//~ TenBrown2();
TenPurple2();

//~ scale([mag,mag,thick])
//~ TenBuck1Black();

//~ TenLoop();

//======================================================================
