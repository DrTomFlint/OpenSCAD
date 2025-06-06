//=================================================================================
// tearConstants.scad
//
// Tear Drop style guitar pick constants, included in all files.
//
// Dr Tom Flint, 20 Feb 2025
//=================================================================================


// choose which pick thickness to make
Num = 3;    // [0,1,2,3,4,5,6,7]

//     0    1    2    3    4    5    6    7    8
Tn = [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2, 1.5];
Ln = ["4", "5", "6", "7", "8", "9", "A", "C", "F"];
Dn = [0.0, 0.0, 0.0, 0.1, 0.1, 0.1, 0.2, 0.3, 0.5];

T = Tn[Num];    // thickness
Label=Ln[Num];  // label
dz = Dn[Num];

R = 8;      // radius of scaled circles
X = 5.2;    // long dimension of pick
Z = 0.2;    // depth of grip pattern

F = 299;     // set $fn

//=================================================================================

