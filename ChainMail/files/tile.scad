//~ // Number of sides for tile
//~ TILE_SIDES=6; // [3,4,5,6,7,8]
//~ // Style of the tile
//~ TILE_STYLE="solid"; // [solid,socket,peg]
//~ // Sheet width in number of tiles
//~ SHEET_WIDTH=3;
//~ // Sheet depth in number of tiles
//~ SHEET_DEPTH=2;
//~ // Size of one edge of the tile
//~ TILE_BASE_EDGE=7;
//~ // Thickness of tile base at the edge
//~ TILE_BASE_THICK=.5; 
//~ // Gap between tiles
//~ TILE_GAP=.5;
//~ // Thickness of ring
//~ RING_THICK=.5;

//~ // Number of sides for tile
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
//~ TILE_BASE_EDGE=7;
//~ // Thickness of tile base at the edge
//~ TILE_BASE_THICK=.6; 
//~ // Gap between tiles
//~ TILE_GAP=.5;
//~ // Thickness of ring
//~ RING_THICK=.8;


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


// Number of sides for tile 5
TILE_SIDES=4; // [3,4,5,6,7,8]
// Style of the tile
TILE_STYLE="solid"; // [solid,socket,peg]
//~ TILE_STYLE="socket"; // [solid,socket,peg]
//~ TILE_STYLE="peg"; // [solid,socket,peg]
// Sheet width in number of tiles
SHEET_WIDTH=4;
// Sheet depth in number of tiles
SHEET_DEPTH=4;
// Size of one edge of the tile
TILE_BASE_EDGE=12;
// Thickness of tile base at the edge
TILE_BASE_THICK=.9; 
// Gap between tiles
TILE_GAP=1;
// Thickness of ring
RING_THICK=1;

// derived values, not set by customizer
RING_ANGLE=45;

SIDE_ANGLE=360/TILE_SIDES;
SIDE_RADIUS=(TILE_BASE_EDGE/2)/tan(SIDE_ANGLE/2); // dist from center to flat edge
RING_RAD=TILE_BASE_EDGE/2-RING_THICK;

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

//~ module model() {
    //~ rotate([0,0,30]) translate([-55.5,-32.85,-10.5]) import("NASA_Fabric_Link_Mk_III_fixed.stl", convexity=3);
//~ }



TILE_CENTER_H=RING_RAD*sin(RING_ANGLE)*2+RING_THICK*2;
TILE_CENTER_R=SIDE_RADIUS-RING_THICK*2-TILE_GAP;
module tileCenter() {
    //~ translate([0,0,TILE_BASE_THICK]) cylinder(h=TILE_CENTER_H,r=TILE_CENTER_R,$fn=32);
    translate([0,0,TILE_BASE_THICK]) cylinder(h=TILE_CENTER_H-0.3,r=TILE_CENTER_R,$fn=32);
}
module tileCenterSocket() {
    translate([0,0,TILE_BASE_THICK]) difference() {
        cylinder(h=TILE_CENTER_H*.5,r=TILE_CENTER_R,$fn=32);
        translate([0,0,TILE_CENTER_H*.5/2]) cylinder(h=TILE_CENTER_H*.5,r=TILE_CENTER_R*.5,$fn=32);
    }
}
module tileCenterPeg() {
    translate([0,0,TILE_BASE_THICK]) union() {
        cylinder(h=TILE_CENTER_H*.5,r=TILE_CENTER_R,$fn=32);
        translate([0,0,-TILE_CENTER_H*.5/2]) cylinder(h=TILE_CENTER_H*.5,r=TILE_CENTER_R*.5,$fn=32);
    }
}

module tileRing() {
    //~ translate([0,SIDE_RADIUS-RING_RAD+RING_THICK+TILE_GAP,RING_RAD*sin(RING_ANGLE)+RING_THICK+TILE_BASE_THICK]) rotate([0,-RING_ANGLE,0]) torus(RING_THICK, RING_RAD);
    translate([0,SIDE_RADIUS-RING_RAD+RING_THICK+TILE_GAP,RING_RAD*sin(RING_ANGLE)+RING_THICK+TILE_BASE_THICK-0.3]) rotate([0,-RING_ANGLE,0]) torus(RING_THICK, RING_RAD);
}
module tileRings() {
    union(){
        for (a = [0 : 360/TILE_SIDES : 359 ])
            rotate([0,0,a]) tileRing();
    }
}

module tileBase() {
    for (a = [ 0 : SIDE_ANGLE : 359]) {
        rotate([0,0,a]) union() {
            translate([-TILE_BASE_EDGE/2,0,0]) cube([TILE_BASE_EDGE,SIDE_RADIUS,TILE_BASE_THICK]);
        }
    }
}

module tileStyleSolid() {
    tileBase();
    tileRings();
    tileCenter();
}

module tileStyleSocket() {
    tileBase();
    difference() {
        tileRings();
        tileCenter();
    }
    tileCenterSocket();
}

module tileStylePeg() {
    translate([0,0,TILE_CENTER_H]) tileCenterPeg();
}

module tile() {
    if (TILE_STYLE == "solid")
    {
        tileStyleSolid();
    }
    if (TILE_STYLE == "socket")
    {
        tileStyleSocket();
    }
    if (TILE_STYLE == "peg")
    {
        tileStylePeg();
    }
}
module octSheet(sx, sy) {
    for (x = [1 : sx]){
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE + TILE_BASE_EDGE*.707*2+TILE_GAP)*x,(TILE_BASE_EDGE + TILE_BASE_EDGE*.707*2+TILE_GAP)*y,0]) tile();
        }
    }
}
module hexSheet(sx, sy) {
    for (x = [1 : sx]){
        dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
    }
}
module squareSheet(sx, sy) {
    for (x = [1 : sx]){
        for (y = [1 : sy]){
            translate([(TILE_BASE_EDGE+TILE_GAP)*x,(TILE_BASE_EDGE+TILE_GAP)*y,0]) tile();
        }
    }
}

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


module hexSheet2(n) {
  for (x = [1 : n]){
    dy = (x%2)*(TILE_BASE_EDGE*.866+TILE_GAP/2);
    //-------------------
    if(n==3){
      if(x==1){
        for (y = [1 : 2]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==2){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==3){
        for (y = [1 : 2]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
    }
    //-------------------
    if(n==5){
      if(x==1){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==2){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==3){
        for (y = [0 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==4){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==5){
        for (y = [1 : 3]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
    }
    //-------------------
    if(n==7){
      if(x==1){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==2){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==3){
        for (y = [0 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==4){
        for (y = [0 : 6]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==5){
        for (y = [0 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==6){
        for (y = [1 : 5]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
      if(x==7){
        for (y = [1 : 4]){
            translate([(TILE_BASE_EDGE*1.5+TILE_GAP)*x,(TILE_BASE_EDGE*2*.866+TILE_GAP)*y+dy,0]) tile();
        }
      }
    }



  }
}


//~ hexSheet2(7);

sheet();

//~ cube([TILE_BASE_EDGE,TILE_BASE_EDGE,TILE_BASE_EDGE]);
