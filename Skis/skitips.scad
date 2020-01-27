// Skitips
// Replacement tips for Tua Heliums

//--------------------------
module tiplow(){
    F1=200;
    F2=200;
    
    difference(){
    // boss
    union(){
        cylinder(r1=12.0,r2=12.5,h=1,$fn=F1);
        cylinder(r=6.4,h=5.4,$fn=F1);
        translate([0,0,5.4])
        cylinder(r1=6.4,r2=6.0,h=1.0,$fn=F1);
    }
        
    // bottom cut for screw head
    cylinder(r=3,h=2.25,$fn=F2);
    
    // top cut for mating part
    translate([0,0,3.5])
    cylinder(r=3.5,h=5,$fn=F2);
    translate([0,0,5.4])
    cylinder(r1=3.5,r2=4.5,h=1,$fn=F2);
    
    // thru hole
    cylinder(r=1.2,h=7,$fn=F2);
    
    }
}
//--------------------------
module tiphigh(word="SKADI"){
    F1=200;
    F2=200;
    
    difference(){
    // boss
    union(){
        cylinder(r1=12.5,r2=13.5,h=2,$fn=F1);
        cylinder(r=3.5-0.1,h=4.5,$fn=F1);
        translate([0,0,4.5])
        cylinder(r1=3.5-0.1,r2=3.5-0.4,h=1.0,$fn=F1);
        translate([0,0,2])
        cylinder(r1=4.5,r2=3.5-0.1,h=1.0,$fn=F1);
    }
            
    // screw hole
    translate([0,0,1.0])
    cylinder(r=1,h=7,$fn=F2);
    
    color("red")
    translate([0,0,0.4])
    rotate([180,0,0])
    linear_extrude(height=0.4){
    text(word, font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
    }
    
    }
    
}
//=============================


//translate([40,0,0])
tiplow();

//tiphigh();


//translate([-40,0,0])
//tiphigh(word="ULLR");

//===================================