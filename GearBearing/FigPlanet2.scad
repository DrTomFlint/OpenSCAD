
// Debug reminders:
// % percent sign will make a ghost figure in preview that doesn't render
// # pound sign will show both the mod and un-mod parts
// ! bang sign makes that line the root for preview

// Attachment for the planet figures
Rhole = 1.6;       // radius, bolt hole

Rbase = 5.9;        // radius, base
Rplat   = 10;      // radius, platform
Hbase = 8;          // height, base
Nbase = 8;          // number sides base

Xslot = 5.5;         // slot X
Yslot = 4*Rbase;   // slot Y
Zslot = 4.1;         // slot Z

Rfill = 1;      // radius fillet on base
Pboss = [[0,0],[Rbase,0],[Rbase,2],[Rplat,Hbase-2],[Rplat,Hbase],[0,Hbase]];    // points for polygon

// For debug / design just look at the polygon
//fillet(r=-0.5) fillet(r=0.5) polygon( points=Pboss );


difference(){  // Base - Hole - Slot
    
    // Base 
    //rotate([0,0,180/Nbase]) cylinder(r1=Rbase, r2=Rplat, h=Hbase, $fn=Nbase);
    // Improved base
    rotate_extrude($fn=99) fillet(r=-0.5) fillet(r=0.5) polygon( points=Pboss );

    // Hole
    cylinder(r1=Rhole, r2=Rhole, h=Hbase, $fn=16);

    // Slot for the captive nut
    //translate([0,0,Zslot/2+(Hbase-Zslot)/2]) cube([Xslot,Yslot,Zslot],center=true);

    // Improved slot
    Rfill2 = 0.4;   // fillets inside the slot
    translate([0,2*Rbase,Zslot/2+(Hbase-Zslot)/2])
    rotate([90,0,0])
    color("red") linear_extrude(height=3*Rplat,scale=[0.8,1.0])
     fillet(r=-Rfill2,$fn=20) 
      square([Xslot+Rfill2,Zslot+Rfill2],center=true);
    
}


module fillet(r) {
   offset(r = -r) {
     offset(delta = r) {
       children();
     }
   }
}