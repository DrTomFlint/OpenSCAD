// Planetary gear bearing (customizable)
// 18 minutes to render

// outer diameter of ring
D=80;
// thickness
T=20;
// clearance
tol=0.25;
number_of_planets=8;
number_of_teeth_on_planets=12;
approximate_number_of_teeth_on_sun=36;
// pressure angle
P=22;//[30:60]
// number of teeth to twist across
nTwist=2.2;
DR=0.5*1;// maximum depth ratio of teeth
inset=1;    // inset for gear blanks

// width of sun hole
w=18;
s=42;
axle=3;
// planet holes
w2=4.5;
s2=16;
axle2=1;

axle3=5;

m=round(number_of_planets);                      // m planets
np=round(number_of_teeth_on_planets);           // np num tooth planet
ns1=approximate_number_of_teeth_on_sun;         
k1=round(2/m*(ns1+np));
k= k1*m%2!=0 ? k1+1 : k1;
ns=k*m/2-np;                                        // ns num tooth sun
echo("Sun"); echo(ns);
nr=ns+2*np;                                         // nr num tooth ring    
echo("Ring"); echo(nr);
pitchD=0.9*D/(1+min(PI/(2*nr*tan(P)),PI*DR/nr));
pitch=pitchD*PI/nr;
echo("pitch"); echo(pitch);                     // pitch circle of ring gear?
helix_angle=atan(2*nTwist*pitch/T);
echo("helix angle"); echo(helix_angle);

phi=$t*360/m;           // $t index loops over 0 to 1

difference(){

// this translate() is the main body of the bearing    
translate([0,0,T/2]){

	
    // The ring gear
    difference(){
        // TEST make the walls of the ring thinner
		//cylinder(r=D/2,h=T,center=true,$fn=200);
		//cylinder(r=D/2-1,h=T,center=true,$fn=200);
        ring(D/2,T);
		herringbone(nr,pitch,P,DR,-tol,helix_angle,T+0.2);
	}
    // align ring so teeth mesh
	rotate([0,0,(np+1)*180/ns+phi*(ns+np)*2/ns])

    // The sun gear
	difference(){
		mirror([0,1,0])
			herringbone3(ns,pitch,P,DR,tol,helix_angle,T,inset,axle);
		cylinder(r=w,h=T+1,center=true,$fn=s);
	}
    
    // The m planets
	for(i=[1:m])rotate([0,0,i*360/m+phi])translate([pitchD/2*(ns+np)/nr,0,0])
		rotate([0,0,i*ns/m*360/np-phi*(ns+np)/np-phi]){
            // TF add a 3.5mm hole in each planet
            difference(){
                herringbone3(np,pitch,P,DR,tol,helix_angle,T,inset,axle2);
                translate([0,0,-T]) cylinder(h=2*T, r1=w2, r2=w2, $fn=s2);
            }
        }
       
}

// adding text on side of ring gear
fsize=7;

color("red"){
translate([0,0,T/2]){
    rotate(a=[-90,0,0]){
        intersection(){
            union(){
                // extrude some text
                linear_extrude(height=D){
                text("~~~ Earth ~~~", font = "Open Sans:style=Bold", size=fsize,halign="center",valign="center");
                }

                rotate([0,-90,0]) linear_extrude(height=D){
                text("~~~ Air ~~~", font = "Open Sans:style=Bold", size=fsize,halign="center",valign="center");
                }
                
                rotate([0,180,0]) linear_extrude(height=D){
                text("~~~ Fire ~~~", font = "Open Sans:style=Bold", size=fsize,halign="center",valign="center");
                }
                
                rotate([0,90,0]) linear_extrude(height=D){
                text("~~~ Water ~~~", font = "Open Sans:style=Bold", size=fsize,halign="center",valign="center");
                }
                
            }// end of union()


            // a hollow ring
            rotate(a=[90,0,0]) {
                difference(){
                    ring(D/2,T);
                    ring(D/2,T-2);
                    cylinder(r=D/2,h=T,center=true);    
                }
            }
        }
    }
}
}

}

/*
color("red") 
union(){
    // finger hole in the sun
    translate([7,0,T/2])
    rotate_extrude($fn=99)
    translate([11,0,0])
        fillet(r=-0.8) square([2,T],center=true);

    translate([7,14,T/2])
        rotate_extrude(angle=45, convexity=10, $fn=99)
        translate([3,0,0])
            fillet(r=-0.8) square([2,T],center=true);

    translate([7,-14,T/2])
        rotate_extrude(angle=45, convexity=10, $fn=99)
        translate([3,0,0])
            fillet(r=-0.8) square([2,T],center=true);

}
*/

module ring (
    radius=10,
    thick=5){
        rotate_extrude($fn=99)
        //rotate([90,0,0])
        translate([radius,0,0]) circle(r=thick*0.5);
        
    }
    
module gear3 (
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5,
    inset=0,
    axle=0){
pitch_radius = number_of_teeth*circular_pitch/(2*PI);
twist=tan(helix_angle)*gear_thickness/pitch_radius*180/PI;
        
intersection(){
    flat_extrude(h=gear_thickness,twist=twist,flat=false)
        gear2D (
            number_of_teeth,  // number_of_teeth,
            circular_pitch,  // circular_pitch,
            pressure_angle,    // pressure_angle,
            depth_ratio,  // depth_ratio,
            clearance  // clearance
            );

    blank3(
        number_of_teeth,
        circular_pitch,
        pressure_angle,
        depth_ratio,
        clearance, 
        gear_thickness,
        inset,
        axle);
    
    }
}

//---------------------------------------------------------

module blank3 (
	number_of_teeth,
	circular_pitch,
	pressure_angle,
	depth_ratio,
	clearance,
    T,
    inset,
    axle){

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

add_circle = pitch_radius+depth_ratio*circular_pitch/2-clearance/2;
ded_circle = max(root_radius,pitch_radius-depth_ratio*circular_pitch/2-clearance/2);
tooth = add_circle - ded_circle;
//inset = 1;        
//axle=3;
        
Pb = [ [0,0], [3,0], [3,1], [ded_circle-1,1], [ded_circle-1,0], [ded_circle,0], 
        [add_circle,add_circle-ded_circle], [add_circle,T],[0,T] ];
  
Pb2 = [ [0,0], [add_circle-tooth,0], [add_circle,tooth], [add_circle,T-tooth],
        [add_circle-tooth,T], [ded_circle,T], [ded_circle-tooth/2,T],
        [ded_circle-tooth/2-inset,T-inset],[axle+inset,T-inset], [axle,T], [0,T] ];
  
rotate_extrude($fn=99)
            polygon( points=Pb2 );
}


module blank4 (
	number_of_teeth,
	circular_pitch,
	pressure_angle,
	depth_ratio,
	clearance,
    T,
    inset,
    axle){

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

add_circle = pitch_radius+depth_ratio*circular_pitch/2-clearance/2;
ded_circle = max(root_radius,pitch_radius-depth_ratio*circular_pitch/2-clearance/2);
tooth = add_circle - ded_circle;
//inset = 1;        
//axle=3;
        
  
Pb2 = [ [0,0], [add_circle+tooth,0], [add_circle,tooth], [add_circle,T-tooth],
        [add_circle+tooth,T], [ded_circle,T], [0,T] ];
  
rotate_extrude($fn=99)
            polygon( points=Pb2 );
}

//==========================================================
module herringbone3(
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5,
    inset=0,
    axle=0){
union(){
        gear3(number_of_teeth,
            circular_pitch,
            pressure_angle,
            depth_ratio,
            clearance,
            helix_angle,
            gear_thickness/2,
            inset,
            axle);

    mirror([0,0,1])
   	gear3(number_of_teeth,
			circular_pitch,
			pressure_angle,
			depth_ratio,
			clearance,
			helix_angle,
			gear_thickness/2,
            inset,
            axle);
    
}
}

//------------------------------------    
module fillet(r) {
   offset(r = -r) {
     offset(delta = r) {
       children();
     }
   }
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
    }
}

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
