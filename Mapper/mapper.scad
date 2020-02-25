// mapper.scad
//
// Output from the TouchTerrain mapper python stuff is an STL mesh
// Import that into FreeCAD, create shape from mesh, create solid,
// export as .amf, import the solid.amf here to slice it up and add
// decorations, text, etc.

Lay=0.2;
//infile="test1solid.amf";
infile="test1trim.amf";

N=10;         // number white not counting base and top
n0=10;       // first non-white layer
z0=n0*Lay;

//-------------------
module cutter(
z1=1,
z2=2,
x=100,
y=100
){
  
  intersection(){
  import(infile);
  
  translate([-x/2,-y/2,z1])
  cube([x,y,z2-z1]);
}
echo("from ",z1," to ",z2);
}

//---------------------
module white(){

// add layers skipping every 5th one
for(i=[0:N]){
    cutter(z1=5*i*Lay+Lay+z0, z2=5*i*Lay+5*Lay+z0);
}

}
//---------------------
module gray(){

// add layers skipping every 5th one
for(i=[0:N]){
    cutter(z1=5*i*Lay+z0, z2=5*i*Lay+Lay+z0);
}

}

//-----------------------
module base(){

// base layer
cutter(z1=-1,z2=z0);  

}
//-----------------------
module top(){

// topmost layer
cutter(z1=z0+N*Lay*5+Lay,z2=20);

}
//=====================

//base();
//white();
top();

//gray();

//======================


  
  
  
