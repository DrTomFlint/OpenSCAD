//=================================================================================
// Nextruder_Filament.scad
//
// Filament sensor, idler, and swing arm for Nextruder MMU conversion.
//
// DrTomFlint, 23 Aug 2025
//----------------------------------------------------------------------------------

use <../Parts/rounder.scad>

Rout=3;
Rin=1.7;
Z=12.5;

F1=288;

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      // pillar
      cylinder(r=Rout,h=Z,$fn=F1);
      // block
      translate([1,-8.5,0])
      linear_extrude(height=Z)
      offset(r=1,$fn=F1)
      square([2,6.5]);
      translate([1.3,-0.7,Z/2])
      rotate([0,0,25])
      cube([4.0,4.0,Z],center=true);
      // arm
      translate([2,-9.5,0])
      cube([20.5,8,2]);
      translate([15,-9,0])
      cube([7.5,15,2]);
      // post
      translate([15,1.5,0])
      cube([7.5,4.5,9]);
    }
    // pillar main pivot
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    // post cut for magnet
    translate([15+1,2.5,3])
    cube([1.7,3.5,10]);
    // cuts for tension screws
    translate([0,-5,4])
    rotate([0,90,0])
    cylinder(r=1.5,h=Z,center=true,$fn=F1);
    translate([0,-5,5])
    cube([Z,0.5,3],center=true);
    translate([0,-5,10])
    rotate([0,90,0])
    cylinder(r=1.5,h=Z,center=true,$fn=F1);
    translate([0,-5,8.5])
    cube([Z,0.5,3],center=true);
    // bevel the post
    translate([15,7,-3])
    rotate([45,0,0])
    cube([20,10,10],center=true);
    

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook2(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([-Rout,-5.5,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      //~ translate([1.3,-0.7,Z/2])
      //~ rotate([0,0,25])
      //~ cube([4.0,4.0,Z],center=true);
      // arm
      translate([2,-9.5,0])
      cube([20.5,8,2]);
      translate([15,-9,0])
      cube([7.5,15,2]);
      // post
      translate([15,1.5,0])
      cube([7.5,4.5,9]);
    }
    // pillar main pivot
    translate([-Rout,-5.5,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([15+1,1.5,5])
    cube([1.7,3.5,4]);
    
    // cuts for tension screws
    translate([5,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      translate([0,-5,5])
      cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      translate([0,-5,8.5])
      cube([Z,0.5,3],center=true);
    }    
    // bevel the post
    translate([15,7,-3])
    rotate([45,0,0])
    cube([20,10,10],center=true);

  }
  
}
//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook3(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([0,0,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      //~ translate([1.3,-0.7,Z/2])
      //~ rotate([0,0,25])
      //~ cube([4.0,4.0,Z],center=true);
      // arm
      translate([2,-9.5,0])
      cube([20.5,8,2]);
      translate([15,-9,0])
      cube([7.5,15,2]);
      // post
      translate([15,1.5,0])
      cube([7.5,4.5,6]);
    }
    // pillar main pivot
    translate([0,0,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([15+2,1,2])
    #cube([1.7,5,4]);
    
    // cuts for tension screws
    translate([0,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,5])
      //~ cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,8.5])
      //~ cube([Z,0.5,3],center=true);
    }    
    translate([-7,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7,-3])
    rotate([45,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook4(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([0,0,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      // arm
      translate([2,-9.5,0])
      cube([20.5-2,8,2]);
      translate([15+1,-9,0])
      cube([7.5-2,15,2]);
      // post
      translate([15+1,1.5,0])
      cube([7.5-2,4.5,8]);
    }
    // pillar main pivot
    translate([0,0,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([15+3,1,3])
    cube([1.7,5,5]);
    
    // cuts for tension screws
    translate([0,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,5])
      //~ cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,8.5])
      //~ cube([Z,0.5,3],center=true);
    }    
    translate([-6,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7,-3])
    rotate([45,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook5(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([0,0,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      // arm
      translate([2,-9.5,0])
      cube([20.5-2,8,2]);
      translate([15+1/2,-9,0])
      cube([7.5-1,15,2]);
      // post
      translate([15+1/2,1.5,0])
      cube([7.5-1,4.5,8]);
    }
    // pillar main pivot
    translate([0,0,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([15+1.5,1,4])
    cube([3.2,5,5]);
    translate([15+1.5,2.2,3])
    cube([3.2,3.2,5]);
    
    // cuts for tension screws
    translate([0,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,5])
      //~ cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,8.5])
      //~ cube([Z,0.5,3],center=true);
    }    
    translate([-6,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7,-3])
    rotate([45,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook6(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([0,0,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      // arm
      translate([2,-9.5,0])
      cube([20.5-2,8,2]);
      translate([15+1/2,-9,0])
      cube([7.5-1,15,2]);
      // post
      translate([15+1/2,1.5,0])
      cube([7.5-1,4.5,8]);
    }
    // pillar main pivot
    translate([0,0,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([19,3.75,5.5])
    rotate([0,90,0])
    cylinder(r=1.6,h=10,$fn=F1,center=true);
    translate([19,3.75,7])
    cube([10,0.5,4],center=true);
    
    // cuts for tension screws
    translate([0,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,5])
      //~ cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,8.5])
      //~ cube([Z,0.5,3],center=true);
    }    
    translate([-6,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7.5,-4])
    rotate([55,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook7(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      hull(){
        // pillar
        translate([0,-10,0])
        cylinder(r=Rout,h=Z,$fn=F1);
        // block
        translate([1,-8.5,0])
        linear_extrude(height=Z)
        offset(r=1,$fn=F1)
        square([2,6.5]);
      }
      // arm
      translate([2,-9.5,0])
      cube([20.5-2,8,2]);
      translate([15+1/2,-9,0])
      cube([7.5-1,15,2]);
      // post
      translate([15+1/2,1.5,0])
      cube([7.5-1,4.5+0.25,8]);
    }
    // pillar main pivot
    translate([0,-10,0])
    cylinder(r=Rin,h=Z,$fn=F1);
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([16,3.75,5.5])
    rotate([0,90,0])
    cylinder(r=1.6,h=10,$fn=F1,center=true);
    translate([19,3.75,7])
    cube([10,0.5,4],center=true);
    
    // cuts for tension screws
    translate([0,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,5])
      //~ cube([Z,0.5,3],center=true);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      //~ translate([0,-5,8.5])
      //~ cube([Z,0.5,3],center=true);
    }    
    translate([-6,0,0]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7.5,-4])
    rotate([55,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------------------
// magnet arm for filament sensor, Core One, Nextruder MMU mod
module hook8(){
  
  // union all parts first, then take diffs
  difference(){
    union(){
      // block
      translate([-1,-8.5,0])
      linear_extrude(height=Z+2)
      offset(r=1,$fn=F1)
      square([4,6.5]);
      // arm
      translate([2,-9.5,0])
      cube([20.5-2,8,2]);
      translate([15+1/2,-9,0])
      cube([7.5-1,15,2]);
      // post
      translate([15+1/2,1.5,0])
      cube([7.5-1,4.5+0,8]);
    }
    
    // pillar main pivots
    translate([1.5,-5,12.0])
    cylinder(r1=2,r2=1.5,h=2.5,$fn=F1);
    translate([1.5,-5,0])
    cylinder(r1=1.5,r2=2,h=2.5,$fn=F1);
    
    // arm trim corner
    translate([25,-10,-1])
    rotate([0,0,45])
    cube([12,12,16],center=true);
    
    // post cut for magnet
    translate([18,3.75,5.5])
    rotate([0,90,0])
    cylinder(r1=1.8,r2=1.6,h=6,$fn=F1,center=true);
    translate([19,3.75,7])
    cube([10,0.5,4],center=true);
    
    // cuts for tension screws
    translate([0,0.5,0.5]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=1.5,h=Z,center=true,$fn=F1);
    }    
    translate([-7.5,0.5,0.5]){
      translate([0,-5,4])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
      translate([0,-5,10])
      rotate([0,90,0])
      cylinder(r=5.8/2,h=Z,center=true,$fn=F1);
    }    
    // bevel the post
    translate([15,7.5,-4])
    rotate([55,0,0])
    cube([20,10,10],center=true);

  }
  
}

//----------------------------------------------------------------------
module screwGuide(){

Rout = 3.5;
Rin=1.5;

H = 10;
X=6;
F2=99;

difference(){
  hull(){
    cylinder(r=Rout,h=H,$fn=F2);
    translate([X,0,0])
    cylinder(r=Rout,h=H,$fn=F2);
  }
  cylinder(r=Rin,h=H,$fn=F2);
  translate([X,0,0])
  cylinder(r=Rin,h=H,$fn=F2);
  translate([X-2.5,0,0])
  #cube([2,0.5,H]);
  translate([0.5,0,0])
  #cube([2,0.5,H]);
}


}

//----------------------------------------------------------------------
module motor(wheel=1){

  difference(){
    intersection(){
      translate([0,0,-10])
      cube([42,42,20],center=true);
      translate([0,0,-10])
      cylinder(r=27,h=20,center=true,$fn=F1);
    }
    translate([31/2,31/2,0])
    cylinder(r=1.7,h=50,center=true,$fn=F1);
    translate([-31/2,31/2,0])
    cylinder(r=1.7,h=50,center=true,$fn=F1);
    translate([-31/2,-31/2,0])
    cylinder(r=1.7,h=50,center=true,$fn=F1);
    translate([31/2,-31/2,0])
    cylinder(r=1.7,h=50,center=true,$fn=F1);
  }
  // shaft
  cylinder(r=4.8/2,h=10,$fn=F1);
  
  if(wheel==1){
    difference(){
      cylinder(r=24.5/2,h=10,$fn=F1);
      cylinder(r=4.8/2+0.1,h=30,$fn=F1);
    }
  }

  // filament tube
  translate([-21+8.5,-21+12.5,5])
  rotate([90,0,0])
  cylinder(r=3.0/2,h=12.5,$fn=F1);

}

//----------------------------------------------------------------------
module arm(){

Z=9.6;    // arm thickness
X=-0.5;   // offset of the idlers 
W=0.4;    // thickness of the washers
  
  difference(){
    union(){
      // pivot
      hull(){
        translate([-31/2,-31/2,(10-Z)/2])
        cylinder(r=1.7+2,h=Z,$fn=F1);
        translate([-31/2-7.5,-31/2+4,(10-Z)/2])
        cube([4,10,Z]);  
      }

      // surround low roller
      hull(){
        translate([-31/2+X-0.7,-31/2+11,(10-Z)/2])
        cylinder(r=8/2,h=Z,$fn=F1);
        translate([-31/2-7.5,-11,(10-Z)/2])
        cube([4,16,Z]);  
      }
      
      // surround high roller
      hull(){
        translate([-31/2+X,-31/2+20,(10-Z)/2])
        cylinder(r=8/2,h=Z,$fn=F1);
        translate([-31/2-7.5,-5,(10-Z)/2])
        cube([4,16,Z]);  
      }
      
      // tab prevents rollers touching the gobblin
      translate([-31/2-13.5,-14,(10-Z)/2])
      cube([11,30,Z]);  
      intersection(){
        translate([-31/2-19.5-2,-14,(10-Z)/2])
        cube([8,45,Z]);  
        translate([-31/2-7,31/2+3,(10-Z)/2])
        scale([1,0.8,1])
        cylinder(r=13,h=Z,$fn=F1);
      }
    }
    
    // cut pivot
    translate([-31/2,-31/2,(10-Z)/2])
    cylinder(r=3.8/2+0.15,h=Z+1,$fn=F1);

    // cut low roller
    translate([-31/2+X-0.5,-31/2+11,(10-4-2*W)/2])
    cylinder(r=8/2+0.8,h=4+2*W,$fn=F1);
    
    translate([-31/2+X-0.5,-31/2+11,(10-9)/2])
    cylinder(r=2.9/2+0.2,h=9,$fn=F1);
      
    // cut high roller
    translate([-31/2+X,-31/2+20,(10-4-2*W)/2])
    cylinder(r=8/2+0.8,h=4+2*W,$fn=F1);
    
    translate([-31/2+X,-31/2+20,(10-9)/2])
    cylinder(r=2.9/2+0.2,h=9,$fn=F1);

    // cut filament tube
    translate([-21+8.5,-21+12.5,5])
    rotate([90,0,0])
    cylinder(r=3.0/2+0.2,h=12.5,$fn=F1);
    
    // cut filament tube again in door-open position
    translate([-7,-12,5])
    rotate([0,0,-45])
    rotate([90,0,0])
    cylinder(r=3.0/2+0.2,h=12.5,$fn=F1);

    // dent for the roller
    translate([-34.5,24.5,(10-Z)/2])
    cylinder(r=3.2,h=Z,$fn=F1);

    // trim corner
    translate([-34,-35,0])
    rotate([0,0,20])
    cube([20,40,10]);
    
    // bolt hole
    translate([-23,12,(10-Z)/2])
    cylinder(r=1.5,h=Z,$fn=F1);
    translate([-23,12,Z-3.5])
    cylinder(r=5.6/2,h=3.8,$fn=F1);
  }
  
  // add back low washers
  difference(){
    translate([-31/2+X-0.5,-31/2+11,(10-4)/2-W])
    cylinder(r=2.9/2+0.7,h=W,$fn=F1);
    translate([-31/2+X-0.5,-31/2+11,(10-4)/2-W])
    cylinder(r=2.9/2+0.1,h=1,$fn=F1);
  }
  
  translate([0,0,4-0.4])
  difference(){
    translate([-31/2+X-0.5,-31/2+11,(10-4)/2+W])
    cylinder(r=2.9/2+0.7,h=W,$fn=F1);
    translate([-31/2+X-0.5,-31/2+11,(10-4)/2+W])
    cylinder(r=2.9/2+0.1,h=1,$fn=F1);
  }

  // add back high washers
  difference(){
    translate([-31/2+X,-31/2+20,(10-4)/2-W])
    cylinder(r=2.9/2+0.7,h=W,$fn=F1);
    translate([-31/2+X,-31/2+20,(10-4)/2-W])
    cylinder(r=2.9/2+0.1,h=1,$fn=F1);
  }
  
  translate([0,0,4-0.4])
  difference(){
    translate([-31/2+X,-31/2+20,(10-4)/2+W])
    cylinder(r=2.9/2+0.7,h=W,$fn=F1);
    translate([-31/2+X,-31/2+20,(10-4)/2+W])
    cylinder(r=2.9/2+0.1,h=1,$fn=F1);
  }

  // fillet on the tab
  translate([-29,16,(10-Z)/2])
  rounder(r=4,h=Z,f=F1);
}

//----------------------------------------------------------------------
module armA(){

  intersection(){
    translate([0,0,-5])
    arm();
    translate([0,0,-10])
    cube([100,100,20],center=true);
  }
}
//----------------------------------------------------------------------
module armB(){

  intersection(){
    translate([0,0,-5])
    arm();
    translate([0,0,10])
    cube([100,100,20],center=true);
  }
}

//----------------------------------------------------------------------
module lock(){

X=12;

  // arm
  difference(){
    union(){
      hull(){
        translate([0,0,0])
        cylinder(r=5.6/2,h=2.5,$fn=F1);
        translate([X,0,0])
        cylinder(r=5.6/2,h=2.5,$fn=F1);
      }
      translate([0,0,0])
      cylinder(r=6/2,h=4,$fn=F1);
      
    }
    translate([0,0,-1])
    cylinder(r=1.7,h=9,$fn=F1);
    translate([X,0,-1])
    cylinder(r=1.7,h=9,$fn=F1);
  }
    
}
//----------------------------------------------------------------------
module lock8(){

X2=17;
X1=12;
fit=0;

    // pillar main pivots
    translate([1.5,-5,12.5-0.5])
    rotate([0,10,0])
    cylinder(r=1.5-fit,h=2.5+0.5,$fn=F1);
    
    translate([1.5,-5,-0.5])
    rotate([0,-10,0])
    cylinder(r=1.5-fit,h=2.5+0.5,$fn=F1);
    
    // far side
    difference(){
      union(){
        hull(){
          translate([1.5,-5,14.6])
          cylinder(r=3,h=2,$fn=F1);
          translate([1.5-X2,-5,14.6])
          cylinder(r=3,h=2,$fn=F1);
        }
        translate([-X1,-5,14.6-3])
        cylinder(r=3,h=3,$fn=F1);
      }
      translate([-X1,-5,-5])
      cylinder(r=1.7,h=20,$fn=F1);
    }      
    
    // near side
    difference(){
      union(){
        hull(){
          translate([1.5,-5,-2.1])
          cylinder(r=3,h=2,$fn=F1);
          translate([1.5-X2,-5,-2.1])
          cylinder(r=3,h=2,$fn=F1);
        }
        translate([-X1,-5,-0.1])
        cylinder(r=3,h=3,$fn=F1);
      }
      translate([-X1,-5,-5])
      cylinder(r=1.7,h=20,$fn=F1);
    }      

    // connect sides
    difference(){
      translate([1.5-X2,-5,-1.1])
      cylinder(r=3,h=16.7,$fn=F1);
      translate([1.5-X2+3,-5,8])
      cube([6,6,16.7],center=true);
      translate([-X1,-5,-5])
      cylinder(r=1.7,h=20,$fn=F1);
    }
    
}

//=================================================================================

//~ translate([-22,20,12])
//~ rotate([180,0,0])
//~ hook8();

lock8();

//~ lock();

//~ screwGuide();

//~ motor();

//~ arm();

//~ armA();
//~ armB();

//=================================================================================
