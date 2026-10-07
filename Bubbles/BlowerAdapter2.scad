// --- NEW PARAMETERS FOR 9733 BLOWER ---
$fn = 120; 

// Wall Thickness
wall = 2.4; 

// Fillet Reinforcement Size
fillet_size = 3.5; 

// GDSTIME 9733 Blower Port (Internal Dimensions)
blower_w = 33.0; // The 9733 is thinner (33mm wide)
blower_h = 29.0; // Port height opening

// Blower Mounting Flange (Angled mounting ears variant)
flange_w = 46.0;
flange_h = 42.0;
flange_thick = 3.0;
hole_spacing_x = 39.0; // Screw hole horizontal spacing
hole_spacing_y = 35.0; 
hole_dia = 3.5;        

// Transition Plenum
plenum_len = 95.0; 

// Stovepipe Port 
pipe_id = 99.5; 
pipe_len = 30.0; 

module duct(){
  // --- MAIN ASSEMBLY ---
  difference() {
      union() {
          // 1. Blower Flange Plate
          translate([-flange_w/2, -flange_h/2, 0])
              cube([flange_w, flange_h, flange_thick]);
              
          // 2. Added Structural Fillet (Reinforced Root Transition)
          translate([0, 0, flange_thick])
              cylinder_to_rectangle_loft(
                  blower_w + 2*wall + 2*fillet_size, 
                  blower_h + 2*wall + 2*fillet_size, 
                  blower_w + 2*wall, 
                  blower_h + 2*wall,
                  fillet_size
              );
          
          // 3. Outer Loft (Plenum Body)
          translate([0, 0, flange_thick])
              cylinder_to_rectangle_loft(blower_w + 2*wall, blower_h + 2*wall, pipe_id + 2*wall, 0, plenum_len);
          
          // 4. Outer Stovepipe Cuff
          translate([0, 0, flange_thick + plenum_len])
              cylinder(d = pipe_id + 2*wall, h = pipe_len);
      }
      
      // --- HOLLOW CUTOUTS ---
      union() {
          // 1. Internal Rectangular Airway Pass
          translate([-blower_w/2, -blower_h/2, -1])
              cube([blower_w, blower_h, flange_thick + 2]);
          
          // 2. Internal Loft Airway Pass
          translate([0, 0, flange_thick - 0.01])
              cylinder_to_rectangle_loft(blower_w, blower_h, pipe_id, 0, plenum_len + 0.02);
              
          // 3. Internal Pipe Core Pass
          translate([0, 0, flange_thick + plenum_len])
              cylinder(d = pipe_id, h = pipe_len + 1);
              
          // 4. Screw Mounting Holes through Flange
          translate([-hole_spacing_x/2, -hole_spacing_y/2, -1]) cylinder(d=hole_dia, h=2*flange_thick+2);
          translate([hole_spacing_x/2, -hole_spacing_y/2, -1])  cylinder(d=hole_dia, h=2*flange_thick+2);
          translate([-hole_spacing_x/2, hole_spacing_y/2, -1])  cylinder(d=hole_dia, h=2*flange_thick+2);
          translate([hole_spacing_x/2, hole_spacing_y/2, -1])   cylinder(d=hole_dia, h=2*flange_thick+2);
      }
  }
}

// --- HELPER MODULE FOR LOFTING ---
// Supports pure rectangle-to-cylinder transitions or custom base-to-top rectangle lofts
module cylinder_to_rectangle_loft(rect_w, rect_h, top_w_or_d, top_h_zero_if_cyl, height) {
    hull() {
        // Bottom Rectangle interface
        translate([-rect_w/2, -rect_h/2, 0])
            cube([rect_w, rect_h, 0.1]);
        
        // Top interface (determines if transitioning to a cylinder or a smaller rectangle)
        translate([0, 0, height - 0.1]) {
            if (top_h_zero_if_cyl == 0) {
                cylinder(d = top_w_or_d, h = 0.1);
            } else {
                translate([-top_w_or_d/2, -top_h_zero_if_cyl/2, 0])
                    cube([top_w_or_d, top_h_zero_if_cyl, 0.1]);
            }
        }
    }
}

//======================================================================

difference(){
  duct();
  translate([100,0,200])
  cube([200,200,400],center=true);
}

//======================================================================
