// table.scad
// scanner part

F2=88;

// --------------------------------------------------------------------
module table(type=1){
  
  // plain flat base
  if((type==1)||(type==2)){
    color("gray")
    translate([0,0,11.5])
    cylinder(r=90,h=2,$fn=F1);
  }
  
  // add the support pillar in the center
  if(type==2){
    color("gray")
    translate([0,0,11.5])
    cylinder(r=6,h=100-11.5-10,$fn=F2);
  }
  
  // printable
  if(type==3){
    
    // tower
    difference(){
      
      union(){
        
        // table top
        color("gray")
        translate([0,0,11.5])
        cylinder(r=90,h=3,$fn=F2);

        // reinforce the base, convert to hex
        translate([0,0,11.5-4])
        cylinder(r1=8,r2=12,h=4,$fn=6);

        // add pins down to the slew10
        for(i=[0:7]){
          rotate([0,0,i*360/8+180/8]){
            color("pink")
            translate([0,82,11.5-3.6])
            cylinder(r1=1.2,r2=1.5,h=3.6+2,$fn=F2);      
          }
        }
        
      }
            
      // hole for the riser
      translate([0,0,11.5-5])
      cylinder(r1=4.0,r2=4.15,h=8.5,$fn=6);

      // holes in the pins down to the slew10
      for(i=[0:7]){
        rotate([0,0,i*360/8+180/8]){
          color("pink")
          translate([0,82,11.5-3.6-1-0.6])
          cylinder(r=0.5,h=3.6+2+2,$fn=F2);      
        }
      }

    }  // end diff

    if(0){
      // main rise
      translate([0,0,11.5])
      cylinder(r=4.0,h=100-11.5-10,$fn=6);
    }
    


  }
}

  
  


//------------------------------------------------------------
module riser1(hi=100){

  difference(){
    // main rise
    translate([0,0,11.5])
    cylinder(r=4.0,h=hi,$fn=6);

    translate([0,0,11.49])
    #cylinder(r=1.0,h=5,$fn=22);

    translate([0,0,hi+11.5-4.99])
    #cylinder(r=1.0,h=5,$fn=22);
  }
  
}

//=======================================

//table(type=3);

riser1(hi=80);

//==============================================
