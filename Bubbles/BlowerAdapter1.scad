// --- PARAMETERS ---
$fn = 120; // Rendering smoothness

// Wall Thickness
wall = 2.4; // Optimized for 3 perimeters with a 0.4mm or 0.6mm nozzle

// Coolerguys Blower Port (Internal Dimensions)
blower_w = 47.0; 
blower_h = 28.0;

// Blower Mounting Flange
flange_w = 60.0;
flange_h = 42.0;
flange_thick = 3.0;
hole_spacing_x = 54.0; // Distance between mounting screw centers
hole_spacing_y = 35.0; 
hole_dia = 3.5;        // M3 screw clearance

// Transition Plenum
//~ plenum_len = 95.0; // ~3.75 inches transition length
plenum_len = 120.0; // ~3.75 inches transition length

// Stovepipe Port (External Dimensions to fit inside 4" pipe)
pipe_id = 99.5; // ~3.92 inches outer diameter for snug fit inside 4" pipe
pipe_len = 30.0; // 30mm insertion depth into the metal pipe

module duct(){
  // --- MAIN ASSEMBLY ---
  difference() {
      union() {
          // 1. Blower Flange Plate
          translate([-flange_w/2, -flange_h/2, 0])
              cube([flange_w, flange_h, flange_thick]);
          
          // 2. Outer Loft (Plenum Body)
          translate([0, 0, flange_thick])
              cylinder_to_rectangle_loft(blower_w + 2*wall, blower_h + 2*wall, pipe_id + 2*wall, plenum_len);
          
          // 3. Outer Stovepipe Cuff
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
              cylinder_to_rectangle_loft(blower_w, blower_h, pipe_id, plenum_len + 0.02);
              
          // 3. Internal Pipe Core Pass
          translate([0, 0, flange_thick + plenum_len])
              cylinder(d = pipe_id, h = pipe_len + 1);
              
          // 4. Screw Mounting Holes through Flange
          translate([-hole_spacing_x/2, -hole_spacing_y/2, -1]) cylinder(d=hole_dia, h=flange_thick+2);
          translate([hole_spacing_x/2, -hole_spacing_y/2, -1])  cylinder(d=hole_dia, h=flange_thick+2);
          translate([-hole_spacing_x/2, hole_spacing_y/2, -1])  cylinder(d=hole_dia, h=flange_thick+2);
          translate([hole_spacing_x/2, hole_spacing_y/2, -1])   cylinder(d=hole_dia, h=flange_thick+2);
      }
  }
}


// --- HELPER MODULE FOR LOFTING ---
module cylinder_to_rectangle_loft(rect_w, rect_h, cyl_d, height) {
    hull() {
        // Bottom Rectangle interface
        translate([-rect_w/2, -rect_h/2, 0])
            cube([rect_w, rect_h, 0.1]);
        
        // Top Cylinder interface
        translate([0, 0, height - 0.1])
            cylinder(d = cyl_d, h = 0.1);
    }
}


//======================================================================

difference(){
  duct();
  translate([100,0,200])
  cube([200,200,400],center=true);
}

//======================================================================
