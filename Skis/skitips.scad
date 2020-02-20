// Skitips
// Replacement tips for Tua Heliums
//------------------
module screw(){
    cylinder(r=5.5/2,h=2.2,$fn=22);
    cylinder(r=2.2/2,h=7.1, $fn=22);
}
//--------------------------
module tiplow(){
    F1=200;
    F2=200;
    
    difference(){
    // boss
    union(){
        cylinder(r1=12.0,r2=12.5,h=1,$fn=F1);
        cylinder(r=6.4,h=6,$fn=F1);
        translate([0,0,6])
        cylinder(r1=6.4,r2=6.0,h=0.5,$fn=F1);
    }
        
    // mate for tiphigh
    translate([0,0,4])
    cylinder(r=3.6,h=4.1,$fn=F1);

    // bottom cut for screw head
    translate([0,0,-1])
    cylinder(r=3,h=3.5,$fn=F2);
    
    // thru hole
    cylinder(r=1.4,h=10,$fn=F2);
    
    }
}
//--------------------------
module tiphigh(word="SKADI"){
    F1=200;
    F2=200;
        
    difference(){
        // boss
        union(){
            cylinder(r1=16,r2=14,h=4,$fn=F1);
                    
            translate([0,0,-3])
            cylinder(r=3.5,h=3,$fn=F1);
        }
        
        // screw hole
        translate([0,0,-4.1])
        cylinder(r=1.1,h=6,$fn=F2);
    
        translate([0,0,0.01])
        deco(word=word);
    }
    
}

//---------------------------------
module deco(word="SKADI"){    
    // text
    color("red")
    translate([0,0,4-0.6])
    linear_extrude(height=0.6){
        text(word, font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
    }
        
    // outer circle
    color("red")
    translate([0,0,4-0.6])
    difference(convexity=10){
        cylinder(r=13,h=0.6,$fn=88);
        //translate([0,0,-0.1])
        cylinder(r=12,h=9.8,$fn=88);
    }
    
}
//=============================

// model the ski and hole
if(0){
    color("cyan")
    difference(){
    cube([40,40,6],center=true);
    cylinder(r=12.6/2,h=14,center=true,$fn=88);
    }
}

if(1){
    color("orange")
    translate([0,0,-4])
    screw();
}

// tiplow
if(1){
color("green")
translate([0,0,-4])
tiplow();
}

// tiphi
if(1){
translate([0,0,3]){
    tiphigh();
    deco();
}
}

if(0){
translate([-40,0,0])
translate([0,0,3]){
    tiphigh(word="ULLR");
    //deco(word="ULLR");
}
}


//===================================
