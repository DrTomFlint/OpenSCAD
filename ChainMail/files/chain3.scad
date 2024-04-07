//======================================================================
// chain1.scad
//
// Adaptions of Nasa Cloth from tile.scad
//
// DrTomFlint, 2 April 2024
//======================================================================

// Number of sides for tile 4
//~ TILE_SIDES=6; // [3,4,5,6,7,8]
//~ // Style of the tile
//~ TILE_STYLE="solid"; // [solid,socket,peg]
//~ TILE_STYLE="socket"; // [solid,socket,peg]
//~ TILE_STYLE="peg"; // [solid,socket,peg]
//~ // Sheet width in number of tiles
//~ SHEET_WIDTH=5;
//~ // Sheet depth in number of tiles
//~ SHEET_DEPTH=5;
//~ // Size of one edge of the tile
//~ TILE_BASE_EDGE=10;
//~ // Thickness of tile base at the edge
//~ TILE_BASE_THICK=.9; 
//~ // Gap between tiles
//~ TILE_GAP=1;
//~ // Thickness of ring
//~ RING_THICK=1;


//~ // Number of sides for tile 5
//~ TILE_SIDES=4; // [3,4,5,6,7,8]
//~ // Style of the tile
//~ TILE_STYLE="solid"; // [solid,socket,peg]
//~ TILE_STYLE="socket"; // [solid,socket,peg]
//~ TILE_STYLE="peg"; // [solid,socket,peg]
//~ // Sheet width in number of tiles
//~ SHEET_WIDTH=4;
//~ // Sheet depth in number of tiles
//~ SHEET_DEPTH=4;
//~ // Size of one edge of the tile
//~ TILE_BASE_EDGE=12;
//~ // Thickness of tile base at the edge
//~ TILE_BASE_THICK=.9; 
//~ // Gap between tiles
//~ TILE_GAP=1;
//~ // Thickness of ring
//~ RING_THICK=1;

// Number of sides for chain3
TILE_SIDES=6; // [3,4,5,6,7,8]
// Style of the tile
TILE_STYLE="solid"; // [solid,socket,peg]
//~ TILE_STYLE="socket"; // [solid,socket,peg]
//~ TILE_STYLE="peg"; // [solid,socket,peg]
// Sheet width in number of tiles
SHEET_WIDTH=12;
// Sheet depth in number of tiles
SHEET_DEPTH=10;
// Size of one edge of the tile
TILE_BASE_EDGE=7;
// Thickness of tile base at the edge
TILE_BASE_THICK=1.5; 
// Gap between tiles
TILE_GAP=0.4;
// Thickness of ring
RING_THICK=0.9;

mag = 175;

// derived values, not set by customizer
RING_ANGLE=45;

SIDE_ANGLE=360/TILE_SIDES;
SIDE_RADIUS=(TILE_BASE_EDGE/2)/tan(SIDE_ANGLE/2); // dist from center to flat edge
RING_RAD=TILE_BASE_EDGE/2-RING_THICK;

TILE_CENTER_H=RING_RAD*sin(RING_ANGLE)*2+RING_THICK*2;
TILE_CENTER_R=SIDE_RADIUS-RING_THICK*2-TILE_GAP;

//----------------------------------------------------------------------
module torus(r1=1, r2=2, angle=360, endstops=0, $fn=50){
    if(angle < 360){
        intersection(){
            rotate_extrude(convexity=10, $fn=$fn)
            translate([r2, 0, 0])
            circle(r=r1, $fn=$fn);
            
            color("blue")
            wedge(h=r1*3, r=r2*2, a=angle);
        }
    }else{
        rotate_extrude(convexity=10, $fn=$fn)
        translate([r2, 0, 0])
        circle(r=r1, $fn=$fn);
    }
    
    if(endstops && angle < 360){
        rotate([0,0,angle/2])
        translate([0,r2,0])
        sphere(r=r1);
        
        rotate([0,0,-angle/2])
        translate([0,r2,0])
        sphere(r=r1);
    }
}

//----------------------------------------------------------------------
module tileCenter() {
    //~ translate([0,0,TILE_BASE_THICK]) cylinder(h=TILE_CENTER_H,r=TILE_CENTER_R,$fn=32);
    translate([0,0,TILE_BASE_THICK]) cylinder(h=TILE_CENTER_H-0.3,r=TILE_CENTER_R,$fn=32);
}

//----------------------------------------------------------------------
module tileRing() {
    //~ translate([0,SIDE_RADIUS-RING_RAD+RING_THICK+TILE_GAP,RING_RAD*sin(RING_ANGLE)+RING_THICK+TILE_BASE_THICK]) rotate([0,-RING_ANGLE,0]) torus(RING_THICK, RING_RAD);
    translate([0,SIDE_RADIUS-RING_RAD+RING_THICK+TILE_GAP,RING_RAD*sin(RING_ANGLE)+RING_THICK+TILE_BASE_THICK-0.3]) rotate([0,-RING_ANGLE,0]) torus(RING_THICK, RING_RAD);
}

//----------------------------------------------------------------------
module tileRings() {
    union(){
        for (a = [0 : 360/TILE_SIDES : 359 ])
            rotate([0,0,a]) tileRing();
    }
}

//----------------------------------------------------------------------
module tileBase() {
    for (a = [ 0 : SIDE_ANGLE : 359]) {
        rotate([0,0,a]) union() {
            translate([-TILE_BASE_EDGE/2,0,0]) cube([TILE_BASE_EDGE,SIDE_RADIUS,TILE_BASE_THICK]);
        }
    }
}

//----------------------------------------------------------------------
module tile_old() {
    tileBase();
    tileRings();
    tileCenter();
}

//----------------------------------------------------------------------
module tile() {
    tileBase();
    //~ tileRings();
    //~ tileCenter();
}

//----------------------------------------------------------------------
module rings() {
    //~ tileBase();
    tileRings();
    tileCenter();
}

//----------------------------------------------------------------------
module octSheet(sx, sy) {
    for (x = [1 : sx]){
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE + TILE_BASE_EDGE*.707*2+TILE_GAP)*x,(TILE_BASE_EDGE + TILE_BASE_EDGE*.707*2+TILE_GAP)*y,0]) tile();
        }
    }
}

//----------------------------------------------------------------------
module hexSheet(sx, sy) {
    for (x = [1 : sx]){
        dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
    }
}

//----------------------------------------------------------------------
module squareSheet(sx, sy) {
    for (x = [1 : sx]){
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE+TILE_GAP)*x,(TILE_BASE_EDGE+TILE_GAP)*y,0]) tile();
        }
    }
}

//----------------------------------------------------------------------
module sheet() {
    if (TILE_SIDES == 8) {
        octSheet(SHEET_WIDTH, SHEET_DEPTH);    
    }
    else if (TILE_SIDES == 6) {
        hexSheet(SHEET_WIDTH, SHEET_DEPTH);    
    }
    else if (TILE_SIDES == 4) {
        squareSheet(SHEET_WIDTH, SHEET_DEPTH);    
    }
    else
    {
        tile(); // only single supported
    }
}

//----------------------------------------------------------------------
module hexSheet2(n=19) {
  translate([-(TILE_BASE_EDGE*1.5+TILE_GAP)*3,-(TILE_BASE_EDGE*2*.866+TILE_GAP)*2.5,0])
  for (x = [1 : n]){
    dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    //-------------------
    if(n==3){
      if(x==1){
        for (y = [1 : 2]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==2){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==3){
        for (y = [1 : 2]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
    }
    //-------------------
    if(n==5){
      if(x==1){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==2){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==3){
        for (y = [0 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==4){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==5){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
    }
    //-------------------
    if(n==7){
      if(x==1){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==2){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==3){
        for (y = [0 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==4){
        for (y = [0 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==5){
        for (y = [0 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==6){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==7){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
    }

    //-------------------
    if(n==9){
      if(x==1){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==2){
        for (y = [1 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==3){
        for (y = [0 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==4){
        for (y = [0 : 7]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==5){
        for (y = [-1 : 7]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==6){
        for (y = [0 : 7]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==7){
        for (y = [0 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==8){
        for (y = [1 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==9){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
    }

    //-------------------
    if(n==19){
      if(x==1){
        for (y = [1 : 10]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==2){
        for (y = [1 : 11]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==3){
        for (y = [0 : 11]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==4){
        for (y = [0 : 12]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==5){
        for (y = [-1 : 12]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==6){
        for (y = [-1 : 13]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==7){
        for (y = [-2 : 13]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==8){
        for (y = [-2 : 14]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==9){
        for (y = [-3 : 14]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==10){
        for (y = [-3 : 15]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==11){
        for (y = [-3:14]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==12){
        for (y = [-2 : 14]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==13){
        for (y = [-2 : 13]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==14){
        for (y = [-1 : 13]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==15){
        for (y = [-1 : 12]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==16){
        for (y = [0 : 12]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==17){
        for (y = [0 : 11]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==18){
        for (y = [1 : 11]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }
      if(x==19){
        for (y = [1 : 10]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile_old();
        }
      }


    }
  }
}

//----------------------------------------------------------------------
module hexSheet3() {
  
  translate([-(TILE_BASE_EDGE*1.5+TILE_GAP)*10,-(TILE_BASE_EDGE*2*.866+TILE_GAP)*6,0])
  for (x = [1 : 19]){
  dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    if(x==1){
      for (y = [1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==2){
      for (y = [1 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==3){
      for (y = [0 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==4){
      for (y = [0 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==5){
      for (y = [-1 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==6){
      for (y = [-1 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==7){
      for (y = [-2 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==8){
      for (y = [-2 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==9){
      for (y = [-3 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==10){
      for (y = [-3 : 15]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==11){
      for (y = [-3:14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==12){
      for (y = [-2 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==13){
      for (y = [-2 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==14){
      for (y = [-1 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==15){
      for (y = [-1 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==16){
      for (y = [0 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==17){
      for (y = [0 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==18){
      for (y = [1 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==19){
      for (y = [1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
  }
}
  
  
//----------------------------------------------------------------------
module hexRings3() {
  
  translate([-(TILE_BASE_EDGE*1.5+TILE_GAP)*10,-(TILE_BASE_EDGE*2*.866+TILE_GAP)*6,0])
  for (x = [1 : 19]){
  dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    if(x==1){
      for (y = [1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==2){
      for (y = [1 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==3){
      for (y = [0 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==4){
      for (y = [0 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==5){
      for (y = [-1 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==6){
      for (y = [-1 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==7){
      for (y = [-2 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==8){
      for (y = [-2 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==9){
      for (y = [-3 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==10){
      for (y = [-3 : 15]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==11){
      for (y = [-3:14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==12){
      for (y = [-2 : 14]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==13){
      for (y = [-2 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==14){
      for (y = [-1 : 13]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==15){
      for (y = [-1 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==16){
      for (y = [0 : 12]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==17){
      for (y = [0 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==18){
      for (y = [1 : 11]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==19){
      for (y = [1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
  }
}
  
//----------------------------------------------------------------------
// just the hex part
module hexA(){
  
  difference(){
    //~ hexSheet2(5);
    hexSheet3();
    translate([0,0,20+TILE_BASE_THICK])
    cube([400,400,40],center=true);
  }
  
}
//----------------------------------------------------------------------
// just the hex part
module hexA1(){
  
  difference(){
    //~ hexSheet2(5);
    hexSheet3();
    translate([0,0,20+TILE_BASE_THICK-0.6])
    cube([400,400,40],center=true);
  }
  
}
//----------------------------------------------------------------------
// just the hex part
module hexA2(){
  
  intersection(){
    //~ hexSheet2(5);
    hexSheet3();
    translate([0,0,TILE_BASE_THICK-0.3])
    cube([400,400,0.6],center=true);
  }
  
}

//----------------------------------------------------------------------
// just the rings
module hexB(){

  difference(){
    //~ hexSheet2(5);
    hexRings3();
    translate([0,0,-20+TILE_BASE_THICK])
    cube([400,400,40],center=true);
    // trim upper side too
    translate([0,0,20+6.3])
    cube([400,400,40],center=true);
  }
  
}
//----------------------------------------------------------------------
module hexBlue(){
  
  intersection(){
    difference(){
      hexA1();
      scale([rescale,rescale,1])
      yin();
    }
    scale([rescale,rescale,1])
    cylinder(r=65-0.01,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}

//----------------------------------------------------------------------
module hexRed(){
  
  intersection(){
    hexA1();
    scale([rescale,rescale,1])
    yin();
  }
}
//----------------------------------------------------------------------
module hexBlack(){
  
  difference(){
    hexA1();
    scale([rescale,rescale,1])
    cylinder(r=65,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}
//----------------------------------------------------------------------
module hexBlue2(){
  
  intersection(){
    difference(){
      hexA1();
      scale([rescale2,rescale2,1])
      yin();
    }
    scale([rescale2,rescale2,1])
    cylinder(r=65-0.01,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}

//----------------------------------------------------------------------
module hexRed2(){
  
  intersection(){
    hexA1();
    scale([rescale2,rescale2,1])
    yin();
  }
}
//----------------------------------------------------------------------
module hexBlack2(){
  
  difference(){
    hexA1();
    scale([rescale2,rescale2,1])
    cylinder(r=65,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}

//----------------------------------------------------------------------
module yin(){

$fn=99;

  difference(){
    cylinder(r=65,h=3*TILE_BASE_THICK,center=true);
    translate([0,65/2,0])
    cylinder(r=65/2,h=5*TILE_BASE_THICK,center=true);
    translate([0,-65/2,0])
    cylinder(r=65/2,h=5*TILE_BASE_THICK,center=true);
    translate([50,0,0])
    cube([100,200,5*TILE_BASE_THICK],center=true);
  }
  difference(){
    translate([0,-65/2,0])
    cylinder(r=65/2,h=3*TILE_BASE_THICK,center=true);
    translate([0,-65/2,0])
    cylinder(r=65/7,h=5*TILE_BASE_THICK,center=true);
  }
  translate([0,65/2,0])
  cylinder(r=65/7,h=5*TILE_BASE_THICK,center=true);
}

//----------------------------------------------------------------------
module hexSheet4() {
  
  translate([-(TILE_BASE_EDGE*1.5+TILE_GAP)*7,-(TILE_BASE_EDGE*2*.866+TILE_GAP)*4.5,0])
  for (x = [1 : 13]){
  dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    if(x==1){
      for (y = [1 : 7]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==2){
      for (y = [1 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==3){
      for (y = [0 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==4){
      for (y = [0 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==5){
      for (y = [-1 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==6){
      for (y = [-1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==7){
      for (y = [-2 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==8){
      for (y = [-1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==9){
      for (y = [-1 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==10){
      for (y = [0 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==11){
      for (y = [0:8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==12){
      for (y = [1 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
    if(x==13){
      for (y = [1 : 7]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
      }
    }
  }
}
//----------------------------------------------------------------------
module hexRings4() {
  
  translate([-(TILE_BASE_EDGE*1.5+TILE_GAP)*7,-(TILE_BASE_EDGE*2*.866+TILE_GAP)*4.5,0])
  for (x = [1 : 13]){
  dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    if(x==1){
      for (y = [1 : 7]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==2){
      for (y = [1 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==3){
      for (y = [0 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==4){
      for (y = [0 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==5){
      for (y = [-1 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==6){
      for (y = [-1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==7){
      for (y = [-2 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==8){
      for (y = [-1 : 10]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==9){
      for (y = [-1 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==10){
      for (y = [0 : 9]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==11){
      for (y = [0:8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==12){
      for (y = [1 : 8]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
    if(x==13){
      for (y = [1 : 7]){
          translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) rings();
      }
    }
  }
}

//----------------------------------------------------------------------
// just the hex part
module hexA4(){
  
  difference(){
    hexSheet4();
    translate([0,0,20+TILE_BASE_THICK-0.6])
    cube([400,400,40],center=true);
  }
  
}
//----------------------------------------------------------------------
// just the hex part
module hexB4(){
  
  intersection(){
    hexSheet4();
    translate([0,0,TILE_BASE_THICK-0.3])
    cube([400,400,0.6],center=true);
  }
  
}

//----------------------------------------------------------------------
// just the rings
module hexC4(){

  difference(){
    hexRings4();
    //~ translate([0,0,-20+TILE_BASE_THICK])
    //~ cube([400,400,40],center=true);
    // trim upper side too
    translate([0,0,20+6.3])
    cube([400,400,40],center=true);
  }
  
}
//----------------------------------------------------------------------
module hexBlue4(){
  
  intersection(){
    difference(){
      hexA1();
      scale([rescale4,rescale4,1])
      yin();
    }
    scale([rescale4,rescale4,1])
    cylinder(r=65-0.01,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}

//----------------------------------------------------------------------
module hexRed4(){
  
  intersection(){
    hexA4();
    scale([rescale4,rescale4,1])
    yin();
  }
}
//----------------------------------------------------------------------
module hexBlack4(){
  
  difference(){
    hexA4();
    scale([rescale4,rescale4,1])
    cylinder(r=65,h=3*TILE_BASE_THICK,center=true,$fn=99);
  }
}



//======================================================================

//~ sheet();   
//~ hexSheet2(5);
//~ hexSheet3();

//~ hexA();

//~ hexA1();
//~ hexA2();
//~ hexB();

//~ yin();

//~ rescale=1.55;
//~ hexBlue();
//~ hexRed();
//~ hexBlack();


//~ rescale2=0.38;
//~ hexBlue2();
//~ hexRed2();
//~ hexBlack2();

rescale4=0.95;
//~ hexSheet4();
//~ hexBlue4();
//~ hexRed4();
//~ hexBlack4();
//~ hexB4();
hexC4();

//======================================================================

