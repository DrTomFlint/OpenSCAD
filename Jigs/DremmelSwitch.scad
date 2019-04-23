// switch adapter for dremmel
difference(){
    union(){
        linear_extrude(height=12,scale=1.05) square(size=[12.2,18.6],center=true);

        translate([0,0,12])
        linear_extrude(height=2,scale=0.95) square(size=[15,20.8],center=true);
    }

    translate([0,0,-1]) cylinder(r=3.25,h=30);

    translate([0,0,0])
        linear_extrude(height=10,scale=1) square(size=[8,13.5],center=true);

    translate([0,-5,12])
        linear_extrude(height=2,scale=1) 
        square(size=[3,3],center=true);

}
