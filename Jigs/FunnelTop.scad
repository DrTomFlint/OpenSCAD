//======================================================================
// Funnel Top for small Ollas in the porch tomato.
//
//
// DrTomFlint 27 July 2025
//======================================================================


hi=10;
low=6;
thick=1.5;

Rout=30/2;
Rmid=26/2;
Rin=7/2;

Zoff=-1;

F1=299;
F2=55;

//----------------------------------------------------------------------

module funnelTop(){

  // funnel
	difference(){
    cylinder(r1=Rmid,r2=Rout,h=hi,$fn=F1);
    cylinder(r1=Rmid-thick/2,r2=Rin-thick,h=hi,$fn=F1);
    translate([0,0,thick]){
      difference(){
        cylinder(r1=Rmid-thick/2,r2=Rout-thick/2,h=hi,$fn=F1);
        cylinder(r1=Rmid-thick/2,r2=Rin-thick*0.7,h=hi,$fn=F1);
      }
    }
    translate([0,0,hi]){
      translate([3.25,0,Zoff])        
      cylinder(r=1,h=low-Zoff,$fn=F1);      

      translate([3.25,0,Zoff+1])        
      rotate([0,90,0])
      cylinder(r=1,h=low,$fn=F1);

      translate([3.25,0,Zoff+1])        
      sphere(r=1.0,$fn=F2);
    }
      translate([10,0,Zoff+1+hi])        
      rotate([0,90,0])
      cylinder(r=1.5,h=low,$fn=F1);

  }

  
  // unions
  translate([0,0,hi]){
    difference(){
      union(){
        difference(){
          cylinder(r=Rin,h=low,$fn=F1);
          cylinder(r=Rin-thick,h=low,$fn=F1);
          translate([2.5,0,Zoff])        
          rotate([0,90,0])
          scale([0.5,1,1])
          cylinder(r=1,h=low,$fn=F1);
        }
        
        translate([2.5,0,Zoff])        
        scale([0.5,1,1])
        cylinder(r=2,h=low-Zoff,$fn=F1);        
        
        translate([2.5,0,Zoff])        
        rotate([0,90,0])
        scale([0.5,1,1])
        cylinder(r=2,h=3,$fn=F1);
        
        translate([2.5,0,Zoff])        
        scale([0.5,1,0.5])
        sphere(r=2,$fn=F2);
      }
      

      translate([3.25,0,Zoff+1])        
      scale([1,1,1])
      cylinder(r=1,h=low-Zoff,$fn=F1);      

      translate([3.25,0,Zoff+1])        
      rotate([0,90,0])
      cylinder(r=1,h=low,$fn=F1);

      translate([3.25,0,Zoff+1])        
      sphere(r=1.0,$fn=F2);

    }
  }
  
}

//======================================================================

//~ difference(){
  //~ funnelTop();
  //~ cube([40,40,40]);
//~ }

funnelTop();


//======================================================================
