// usbScope.scad
//
//------------------------------------------------

thick = 1;

//------------------------------------------------



module usbScope(){

$fn=288;
  
  difference(){
    union(){ 
      // main bore
      cylinder(r=32/2+thick,h=20);
  
      // tightening foot out front
      //translate([15,-2.5,0])
      //cube([10,5,20]);
      
      // back plate
      translate([-21,-24,0])
      cube([6,48,20]);
      translate([-21+3,-24,0])
      cylinder(r=3,h=20);
      translate([-21+3,24,0])
      cylinder(r=3,h=20);
      
      // side braces
      translate([-15,-24,0])
      rotate([0,0,30])
      cube([30,2,20]);

      mirror([0,1,0])
      translate([-15,-24,0])
      rotate([0,0,30])
      cube([30,2,20]);

    }
    // cut main bore
    translate([0,0,-0.1])
    cylinder(r1=29/2,r2=31.2/2,h=21);
    
    // cut back plate
    translate([-24,-36/2,-1.2])
    cube([6,36,20]);

    hull(){
      translate([-18,22.5,-1.2])
      cylinder(r=1,h=20);
      translate([-18,-22.5,-1.2])
      cylinder(r=1,h=20);
    }
    
  }
  
}


//=====================================================

usbScope();

//=====================================================


