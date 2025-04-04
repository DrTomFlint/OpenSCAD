//=================================================================================
// BirdWater.scad
//
// squirrel water dish
//
// Dr Tom Flint, 2 April 2025
//=================================================================================


thick=1.2;
rx=60;

hi=10;

rBase=10;
rLip=2;
zLip=30;

F1=299;
F2=99;

//-----------------------------------------------------------------------------------
module dish_old(){

  difference(){
    scale([1,0.7,1])
    rotate_extrude($fn=F1){
      hull(){
        translate([rx,hi/2+2-thick,0])
        circle(r=hi/2+2,$fn=F1);

        translate([rx+2,hi+16,0])
        circle(r=hi/4,$fn=F1);
      }
      hull(){
        translate([rx-hi+thick*2,thick,0])
        circle(r=thick*2,$fn=F1);

        translate([0,-thick,0])
        square([rx,3*thick]);
      }
      difference(){
        hull(){
          translate([rx-30,0,0])
          circle(r=thick,$fn=F1);

          translate([rx,hi,0])
          circle(r=hi/2,$fn=F1);
        }
        translate([rx-33,hi+thick+7,0])
        scale([1.65,0.86])
        circle(r=hi+8,$fn=F1);
      }

    }
    translate([0,0,-100])
    cube([200,200,200],center=true);
    
      translate([0,20,0.6])
      rotate([0,180,0])
      linear_extrude(height=0.6)
      text("Flint's", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.2);

      translate([0,0,0.6])
      rotate([0,180,0])
      linear_extrude(height=0.6)
      text("Finest", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.2);

      translate([0,-20,0.6])
      rotate([0,180,0])
      linear_extrude(height=0.6)
      text("2025", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.2);

  }

}

//-----------------------------------------------------------------------------------
module dish(){

rotate_extrude($fn=F1){
  translate([rx+rBase-1.8,0])
  square([1.25,3]);
  
  difference(){
      
    difference(){
      union(){
        hull(){
          translate([rx,0,0])
          circle(r=rBase,$fn=F1);

          translate([rx,zLip,0])
          circle(r=rLip,$fn=F1);
        }
        translate([0,0,0])
        square([rx,thick+0.6]);
              
        difference(){
         translate([rx/2,0,0])
          square([rx/2,rx/2]);

          translate([rx/2-rLip,rx/2+thick+0.6])
          circle(r=rx/2,$fn=F1);
        }
      }
      translate([0,-100])
      square([200,200],center=true);
    }
      

    difference(){
      union(){
        hull(){
          translate([rx,0,0])
          circle(r=rBase-thick-0.5,$fn=F1);

          translate([rx,zLip,0])
          circle(r=rLip-thick-0.7,$fn=F1);
        }
        translate([0,-2*thick,0])
        square([rx,2*thick]);
              
        difference(){
         translate([rx/2,-thick,0])
          square([rx/2,rx/2]);

          translate([rx/2-rLip+0.5,rx/2+1*thick])
          circle(r=rx/2+thick,$fn=F1);
        }
      }
      translate([0,-100])
      square([200,200],center=true);
    }
  }
}

if(1){
  
  tsize=14;
  thi=0.2;
  ang=10;
  nWords=20;
  Words=[" ","F","l","i","n","t","s"," ","F","i","n","e","s","t"," ","2","0","2","5"," "];
  
  difference(){
    intersection(){
      union(){
        for(i=[0:nWords-1]){
          rotate([0,0,i*ang])
          translate([0,-rx-rLip/2-rBase/2+1,zLip/3])
          rotate([0,0,0])
          rotate([76,0,0])
          linear_extrude(height=4)
          text(Words[i], font = "Open Sans:style=Bold", size=tsize,halign="center",valign="bottom",spacing=1.2);
        }
      }

      rotate_extrude($fn=F1)
      hull(){
        translate([rx,0,0])
        circle(r=rBase+thi,$fn=F1);

        translate([rx,zLip,0])
        circle(r=rLip+thi,$fn=F1);
      }
    }
    rotate_extrude($fn=F1)
    hull(){
      translate([rx,0,0])
      circle(r=rBase-thi,$fn=F1);

      translate([rx,zLip,0])
      circle(r=rLip-thi,$fn=F1);
    }
  }
}  
  
  
}

//=================================================================================

dish();

//~ difference(){
  //~ dish();
  //~ translate([0,0,-2*thick])
  //~ scale([0.99,0.99,1])
  //~ dish();
//~ }

//=================================================================================
