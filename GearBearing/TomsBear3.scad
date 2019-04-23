// Planetary gear bearing (customizable)

// outer diameter of ring
D=120;
// thickness
T=15;
// clearance
tol=0.25;
number_of_planets=9;
number_of_teeth_on_planets=7;
approximate_number_of_teeth_on_sun=31;
// pressure angle
P=22;//[30:60]
// number of teeth to twist across
nTwist=1;
// width of hexagonal hole
w=48;

DR=0.5*1;// maximum depth ratio of teeth

m=round(number_of_planets);                      // m planets
np=round(number_of_teeth_on_planets);           // np num tooth planet
ns1=approximate_number_of_teeth_on_sun;         
k1=round(2/m*(ns1+np));
k= k1*m%2!=0 ? k1+1 : k1;
ns=k*m/2-np;                                        // ns num tooth sun
echo(ns);
nr=ns+2*np;                                         // nr num tooth ring    
pitchD=0.9*D/(1+min(PI/(2*nr*tan(P)),PI*DR/nr));
pitch=pitchD*PI/nr;
echo(pitch);                                         // pitch circle of ring gear?
helix_angle=atan(2*nTwist*pitch/T);
echo(helix_angle);

phi=$t*360/m;           // $t might be a time index looped over 0 to 1?

difference(){

intersection(){     // TF try to get some fillets 
// this translate() is the main body of the bearing    
translate([0,0,T/2]){
	
    // The ring gear
    difference(){
		cylinder(r=D/2,h=T,center=true,$fn=200);
		herringbone(nr,pitch,P,DR,-tol,helix_angle,T+0.2);
        // TF remove the monogram?
		//difference(){
		//	translate([0,-D/2,0])rotate([90,0,0])monogram(h=10);
		//	cylinder(r=D/2-0.25,h=T+2,center=true,$fn=100);
		//}
	}
    // align ring so teeth mesh
	rotate([0,0,(np+1)*180/ns+phi*(ns+np)*2/ns])
    
    // The sun gear
	difference(){
		mirror([0,1,0])
			herringbone(ns,pitch,P,DR,tol,helix_angle,T);
		cylinder(r=w/sqrt(3),h=T+1,center=true,$fn=9);
	}
    
    // The m planets
	for(i=[1:m])rotate([0,0,i*360/m+phi])translate([pitchD/2*(ns+np)/nr,0,0])
		rotate([0,0,i*ns/m*360/np-phi*(ns+np)/np-phi]){
            // TF add a 3.5mm hole in each planet
            difference(){
                herringbone(np,pitch,P,DR,tol,helix_angle,T);
                translate([0,0,-T]) cylinder(h=2*T, r1=1.75, r2 = 1.75, $fn=16);
            }
        }
}

// TF add fillets on the ring gear
// TF make a cone using a cylinder with 2 different radii:
translate([0,0,-0.75]) color([1,0,0]) cylinder(h = 2*T, r1 = D, r2 = 0);
translate([0,0,-T+0.75]) color([0,1,0]) cylinder(h = 2*T, r1 = 0, r2 = D);
}

// adding text on side of ring gear
translate([0,0,T/2+-1]){
    rotate(a=[-90,0,0]){
        intersection(){
            // extrude some text
            linear_extrude(height=D/2){
            translate([0,-4,0]) text("Leverett Laboratory", font = "Open Sans:style=Bold", size=8,halign="center");
            }

            rotate(a=[90,0,0]) {
                difference(){
                    // make a ring same as ring gear
                    color([0,0,1]) cylinder(r=D/2,h=T,center=true,$fn=200);
                    color([0,0,1]) cylinder(r=D/2-1,h=T,center=true,$fn=200);
                }
            }
        }
    }
}

}

module rack(
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	helix_angle=0,
	clearance=0,
	gear_thickness=5,
	flat=false){
addendum=circular_pitch/(4*tan(pressure_angle));

flat_extrude(h=gear_thickness,flat=flat)translate([0,-clearance*cos(pressure_angle)/2])
	union(){
		translate([0,-0.5-addendum])square([number_of_teeth*circular_pitch,1],center=true);
		for(i=[1:number_of_teeth])
			translate([circular_pitch*(i-number_of_teeth/2-0.5),0])
			polygon(points=[[-circular_pitch/2,-addendum],[circular_pitch/2,-addendum],[0,addendum]]);
	}
}

module monogram(h=1)
linear_extrude(height=h,center=true)
translate(-[3,2.5])union(){
	difference(){
		square([4,5]);
		translate([1,1])square([2,3]);
	}
	square([6,1]);
	translate([0,2])square([2,1]);
}

module herringbone(
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5){
union(){
	gear(number_of_teeth,
		circular_pitch,
		pressure_angle,
		depth_ratio,
		clearance,
		helix_angle,
		gear_thickness/2);
	mirror([0,0,1])
		gear(number_of_teeth,
			circular_pitch,
			pressure_angle,
			depth_ratio,
			clearance,
			helix_angle,
			gear_thickness/2);
}}

module gear (
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5,
	flat=false){
pitch_radius = number_of_teeth*circular_pitch/(2*PI);
twist=tan(helix_angle)*gear_thickness/pitch_radius*180/PI;

flat_extrude(h=gear_thickness,twist=twist,flat=flat)
	gear2D (
		number_of_teeth,
		circular_pitch,
		pressure_angle,
		depth_ratio,
		clearance);
}

module flat_extrude(h,twist,flat){
	if(flat==false)
		linear_extrude(height=h,twist=twist,slices=twist/6)children(0);
	else
		children(0);
}

module gear2D (
	number_of_teeth,
	circular_pitch,
	pressure_angle,
	depth_ratio,
	clearance){
pitch_radius = number_of_teeth*circular_pitch/(2*PI);
base_radius = pitch_radius*cos(pressure_angle);
depth=circular_pitch/(2*tan(pressure_angle));
outer_radius = clearance<0 ? pitch_radius+depth/2-clearance : pitch_radius+depth/2;
root_radius1 = pitch_radius-depth/2-clearance/2;
root_radius = (clearance<0 && root_radius1<base_radius) ? base_radius : root_radius1;
backlash_angle = clearance/(pitch_radius*cos(pressure_angle)) * 180 / PI;
half_thick_angle = 90/number_of_teeth - backlash_angle/2;
pitch_point = involute (base_radius, involute_intersect_angle (base_radius, pitch_radius));
pitch_angle = atan2 (pitch_point[1], pitch_point[0]);
min_radius = max (base_radius,root_radius);

intersection(){
	rotate(90/number_of_teeth)
		circle($fn=number_of_teeth*3,r=pitch_radius+depth_ratio*circular_pitch/2-clearance/2);
	union(){
		rotate(90/number_of_teeth)
			circle($fn=number_of_teeth*2,r=max(root_radius,pitch_radius-depth_ratio*circular_pitch/2-clearance/2));
		for (i = [1:number_of_teeth])rotate(i*360/number_of_teeth){
			halftooth (
				pitch_angle,
				base_radius,
				min_radius,
				outer_radius,
				half_thick_angle);		
			mirror([0,1])halftooth (
				pitch_angle,
				base_radius,
				min_radius,
				outer_radius,
				half_thick_angle);
		}
	}
}}

module halftooth (
	pitch_angle,
	base_radius,
	min_radius,
	outer_radius,
	half_thick_angle){
index=[0,1,2,3,4,5];
start_angle = max(involute_intersect_angle (base_radius, min_radius)-5,0);
stop_angle = involute_intersect_angle (base_radius, outer_radius);
angle=index*(stop_angle-start_angle)/index[len(index)-1];
p=[[0,0],
	involute(base_radius,angle[0]+start_angle),
	involute(base_radius,angle[1]+start_angle),
	involute(base_radius,angle[2]+start_angle),
	involute(base_radius,angle[3]+start_angle),
	involute(base_radius,angle[4]+start_angle),
	involute(base_radius,angle[5]+start_angle)];

difference(){
	rotate(-pitch_angle-half_thick_angle)polygon(points=p);
	square(2*outer_radius);
}}

// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance (radius) from it's center.
//source: http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle (base_radius, radius) = sqrt (pow (radius/base_radius, 2) - 1) * 180 / PI;

// Calculate the involute position for a given base radius and involute angle.

function involute (base_radius, involute_angle) =
[
	base_radius*(cos (involute_angle) + involute_angle*PI/180*sin (involute_angle)),
	base_radius*(sin (involute_angle) - involute_angle*PI/180*cos (involute_angle))
];
