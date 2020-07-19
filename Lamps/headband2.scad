// headband.scad
// Scale a 100 mm radius sphere to model a head.
// Make it hollow, thickness ~ 1 mm.
// Slice out a headband with a zlow and zhigh cut mark.

//-----------------------------------------------------------
module headband(
thick=1.0,
zlow=50,
zhi=70,
r0=100,
s=[1,0.85,1.25],
tol=0
){
F1=150;

sphere(r=r0,$fn=F1);

}

//===================================================

headband();

//====================================================
