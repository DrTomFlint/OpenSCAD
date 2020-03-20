/* L-system OpenSCAD library by Hans Loeblich
Version 2.0
 - Now supports "M" move without draw
 - Also support position save "[" and restore "]"
 - Core functions have been completely rewritten and are about twice as fast using half the memory from before.
 - Rules now take the form of a single string per rule: "X=ABC"
 - Added new examples to demonstrate added features
This library is for creating L-systems, aka Lindenmayer System, 
which is a kind of formal grammar that can be used to generate space-filling curves 
and other fractal shapes by applying replacement rules recursively.
See https://en.wikipedia.org/wiki/L-system for a better, more detailed explanation.
Many of the example curves in this file use rules found on that wikipedia page.
This script relies on recent features so I recommend using a 2019 RC or nightly build of OpenSCAD.
See here: http://www.openscad.org/downloads.html#snapshots
The "turtle graphics" used by the script supports the following operations:
  "F" : moves the turtle "forward" by one unit and draws line segment
  "M" : "move" turtle forward without draw (see island_curve example)
  "-" : rotates the turtle to the left, by the given angle (default 90)
  "+" : rotates the turtle to the right, by the given angle (default 90)
  "[" : saves position on stack
  "]" : restore position from top of stack
  If you have rules for an L-system that uses different symbols than "F" for forward 
  or "M" for move, you can specify optional string of characters to interpret as each 
  of those operations, using "draw_chars" and "move_chars" parameters for Lsystem2.  
  See: island_curve, gosper_curve, an sierpinski_triangle examples definitions.
  The models increase in complexity exponentially so be careful with increasing values of n
  or the program may hang, or consume many gigabytes of RAM.
  Some recommended absolute maximum n values have been given for each curve, 
  most of which are currently limited by the 1,000,000 iteration limit for "c-style" for loops
  in OpenSCAD.  This is the limit of the final total instructions length after applying 
  replacement rules. That's also around the point where geometries may need multiple GB of RAM.
  All the generated shapes are currently 2D, and its recommended to **USE F6 RENDER** to view each curve.  
  It takes roughly the same time to complete as F5, but the framerate of moving the camera etc. 
  will be much better without OpenCSG rendering a 2D object as 3D on these complex models.
*/


rounded = true; // Add circles at each vertex
// setting rounded = false gives slightly faster preview/render but an uglier curve path
n = 18;


$fn=16;

//dragon_curve(n=14);           // Recommended n <= 18
//dragon_curve(n=14, angle=72); // "pentagonal dragon"
//dragon_curve(n=14, angle=60); // hexagonal?
//twin_dragon(n=12);            // Recommended n <= 17
//terdragon(n=5, w=0.1);        // Recommended n <= 11
//hilbert_curve(n=4, w=0.5, angle=90);    // Recommended n <= 9
//moore_curve(n=3, w=0.5);      // Recommended n <= 8
//peano_curve(n=3);             // Recommended n <= 6
//gosper_curve(n=4);            // Recommended n <= 6
//levy_c_curve(n=9);            // Recommended n <= 17
//koch_curve(n=6,angle=80,w=0.2); // Recommended n <= 6 (try different angles: 60,80,90)
//koch_curve(n=4, angle=75+15*(sin($t*360)), w=0.2); // Enable animation!!
//koch_snowflake(n=4);          // Recommended n <= 8
//quadratic_type1_koch(n=4);    // Recommended n <= 8
//quadratic_type2_koch(n=3);    // Recommended n <= 6
sierpinski_triangle(n=6);     // Recommended n <= 11
//sierpinski_arrowhead(n=6);    // Recommended n <= 11
//island_curve(n=2);            // Recommended n <= 4
//penrose_tiling(n=4, w=0.2);   // Recommended n <= 6
//pentadendrite(n=4);           // Recommended n <= 5
//icy(n=4);
//tree(n=4);
//scale([100,100,1]) round_star(n=8);
//fractal_plant(n=6);             // Recommended n <= 8


module dragon_curve(n=10, angle=90, w=0.4) {
  L_system2("FX", ["X=X+YF+","Y=-FX-Y"], n, angle, w);
}

module twin_dragon(n=10, angle=90, w=0.4) {
  L_system2("FX+FX+", ["X=X+YF","Y=FX-Y"], n, angle, w);
}

module terdragon(n=10, angle=120, w=0.4) {
  L_system2("F", ["F=F+F-F"], n, angle, w);
}

module hilbert_curve(n=4, angle=90, w=0.4) {
  L_system2("A", ["A=-BF+AFA+FB-","B=+AF-BFB-FA+"], n, angle, w);
}

module moore_curve(n=4, angle=90, w=0.4) {
  L_system2("LFL+F+LFL", ["L=-RF+LFL+FR-","R=+LF-RFR-FL+"], n, angle, w);
}

module peano_curve(n=3, angle=90, w=0.4) {
  L_system2("L", ["L=LFRFL-F-RFLFR+F+LFRFL","R=RFLFR+F+LFRFL-F-RFLFR"], n, angle, w);
}

module gosper_curve(n=4, angle=60, w=0.4) {
  // final pass, convert A and B to (F)orward instructions
  L_system2("A", ["A=A-B--B+A++AA+B-","B=+A-BB--B-A++A+B"], n, angle, w, "AB");
}

module levy_c_curve(n=10, angle=45, w=0.4) {
  L_system2("F", ["F=+F--F+"], n, angle, w);
} 

module koch_curve(n=4, angle=60, w=0.4) {
  L_system2("F", ["F=F-F++F-F"], n, angle, w);
} 

module koch_snowflake(n=4, angle=60) {
  L_system_polygon("F++F++F", ["F=F-F++F-F"], n, angle);
} 

module quadratic_type1_koch(n=4, angle=90, w=0.4) {
  L_system2("F", ["F=F-F+F+F-F"], n, angle, w);
} 

module quadratic_type2_koch(n=4, angle=90, w=0.4) {
  L_system2("F", ["F=F-F+F+FF-F-F+F"], n, angle, w);
} 

module sierpinski_triangle(n=5, angle=120, w=0.2) {
  L_system2("F-G-G", ["F=F-G+F+G-F", "G=GG"], n, angle, w, "FG");
}

module sierpinski_arrowhead(n=6, angle=60, w=0.4) {
  L_system2("XF", ["X=YF+XF+Y", "Y=XF-YF-X"], n, angle, w);
}

module island_curve(n=10, angle=90, w=0.4) {
  L_system2("F-F-F-F", ["F=F-b+FF-F-FF-Fb-FF+b-FF+F+FF+Fb+FFF", "b=bbbbbb"], n, angle, w, "F", "b");
}

module penrose_tiling(n=2, angle=36, w=0.2) {
  L_system2("[7]++[7]++[7]++[7]++[7]", [
    "6=81++91----71[-81----61]++", 
    "7=+81--91[---61--71]+", 
    "8=-61++71[+++81++91]-", 
    "9=--81++++61[+91++++71]--71", 
    "1="], n, angle, w, "6789");
}

module pentadendrite(n=2, angle=72, w=0.2) {
  L_system2("F-F-F-F-F", ["F=F-F-F++F+F-F"], n, angle, w);
}

module icy(n=2, angle=90, w=0.5) {
  L_system2("F+F+F+F", ["F=FF+F++F+F"], n, angle, w);
}

module tree(n=2, angle=36, w=0.1) {
  L_system2("F", ["F=F[+FF][-FF]F[-F][+F]F"], n, angle, w, heading=90);
}

module round_star(n=7, angle=77, w=0.001) {
  L_system2("F", ["F=F++F"], n, angle, w);
}

module fractal_plant(n=4, angle=25, w=0.1) {
  L_system2("X", ["X=F+[[X]-X]-F[-FX]+X", "F=FF"], n, angle, w, heading=90);
}



module L_system2(start, rules, n, angle, w=0.4, draw_chars="F", move_chars="M", heading=0, startpos=[0,0]) {
  tables = create_lookup(start, rules, draw_chars, move_chars);
  //echo(tables);
  instrs = apply_rules(start, tables[0], tables[1], n);
  //echo(instrs);
  l = len(instrs);

  // generate a completely flat list of numbers, with each consecutive 4 numbers representing a line segment
  // this doubles the output size necessary in most cases, but needed to support M (move without drawing) commands
  coords = // C-style "for" list comprehension
  [for(i=0,ch=instrs[0],pos=startpos, // init
      newpos=(ch=="F" || ch=="M") ? pos + [cos(heading), sin(heading)] : pos,
      heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
      stack=(ch=="[") ? [[pos,heading]] : [];
      
      i<l; // condition
      // update variables
      i = i+1,
      ch = instrs[i],
      pos = newpos, 
      newpos = (ch=="F" || ch=="M") ? newpos + [cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : newpos,
      heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
      stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
      //,_=echo(ch,pos,newpos,heading,stack)       
    )
    if(ch=="F") for(x=[pos[0],pos[1],newpos[0],newpos[1]]) x ];

  segmented_lines(coords, w);
  echo("Done!");
}

// draw a closed path using polygon, assumes no move commands(all lines connected)
// only koch snowflake uses this currently
module L_system_polygon(start, rules, n, angle=90, draw_chars="F") {
  startpos = [0,0];
  heading = 0;
  tables = create_lookup(start, rules, draw_chars, "");
  //echo(tables);
  instrs = apply_rules(start, tables[0], tables[1], n);
  //echo(instrs);
  l = len(instrs);
  path = // C-style "for" list comprehension
  [for(i=0,ch=instrs[0], // init
      pos=(ch=="F") ? startpos + [cos(heading), sin(heading)] : startpos,
      heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
      stack=(ch=="[") ? [[pos,heading]] : [];
      i<l; // condition
      // update variables
      i = i+1,
      ch = instrs[i],
      pos = (ch=="F") ? pos + [cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : pos,
      heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
      stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
      //,_=echo(ch,pos,newpos,heading,stack)       
    )
    if(ch=="F") pos ];
  //echo(path);
  polygon(path);
}


// binary tree based join, depth of recursion is log_2(n), rather than (n) for naive join
function join(l) = let(s = len(l)) s > 0 ? _jb(l,0,s) : "";
// "join binary", splits list into halves and joins them. 
// l=list, b=begin(inclusive), e=end(exlusive), s=size, m=midpoint
function _jb(l,b,e) = let(s = e-b, m=floor(b+s/2)) s > 2 ? 
  str(_jb(l,b,m), _jb(l,m,e)) :
  s == 2 ? 
    str(l[b],l[b+1]) : 
    l[b];

// extract substring given begin(inclusive) and end(exclusive)
// if end not specified, go to end of string
function substr(s,b,e) = let(e=is_undef(e) || e > len(s) ? len(s) : e) (b==e) ? "" : join([for(i=[b:e-1]) s[i] ]);
function sublist(s,b,e) = let(e=is_undef(e) || e > len(s) ? len(s) : e) [for(i=[b:1:e-1]) s[i] ];
// return true if value v in list(or string)
function in_list(l,v) = len([for(x=l) if(x==v) x])>0;


// create lookup tables for every character, then we can do array lookup for replacement
// instead of many ternary statments
function create_lookup(start, rules, draw_chars, move_chars) = 
  let (
    valid_chars = "FM-+[]",
    allchars = str(join(rules),start,valid_chars),
    // Create table of size == max ord character in all rules (<256 for ASCII)
    size = max([for(ch = allchars) if (ch != "=") ord(ch)])+1,
    rules_l = [for (rule = rules) rule[0]], // rule left symbol
    rules_r = [for (rule = rules)           // rule right symbols
      assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
      substr(rule,2)
    ],
    table = [for(i=[0:size]) // rule_i is index of first rule for ch, otherwise undef 
      let (ch = chr(i), rule_i=[for(j=[0:len(rules)-1]) if(rules_l[j]==ch) j ][0]) 
      is_undef(rule_i) ? ch : rules_r[rule_i]
    ],
    //valid_identity = 
    final_rules1 = [for (rule = rules)     // rule right symbols
      assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
      [rule[0],substr(rule,2)]
    ],
    final_rules2 = [for (ch=valid_chars) [ch,ch]], // use identity rules for valid characters, 
                                    // needed because any invalid char will be filtered out in final pass
    final_rules = [for(rule=concat(final_rules1,final_rules2))
        [rule[0], join([for(ch=rule[1]) in_list(draw_chars,ch)? "F": (in_list(move_chars,ch)? "M": in_list(valid_chars,ch) ? ch : "") ])]
    ],
    // final table should specify replacements for draw/move, and keep any other valid chars
    // if a draw/move char is a F or M then 
    final_table = [for(i=[0:size])
      let (
        ch = chr(i), // rule_i is index of first rule for ch, otherwise undef
        rule_i=[for(j=[0:len(final_rules)-1]) if(final_rules[j][0]==ch) j ][0])
      is_undef(rule_i) ? undef : final_rules[rule_i][1]
    ]
  )
  [table, final_table];


// recursively apply rule replacement using table lookup.  
// replacement strings are split out into individual characters at each level.
// return a list of single character strings to be processed into coordinates
function apply_rules(start, table, final_table, n) = 
  n > 1 ? 
    apply_rules([ for(ch=start) for(c2=table[ord(ch)]) c2 ], table, final_table, n-1) :
    (n == 1 ? 
      [ for(ch=start) for(c2=final_table[ord(ch)]) c2] :
      start);


// works on long lists of "lines" which are specified as a flat list of numbers, 
// each 4 representing a single line: [xa,ya,xb,yb,...]
module segmented_lines(l, w=0.1) {
  // OpenSCAD doesn't allow ranges > 10000 in modules, 
  // so limit is used to split very large segmented lines into manageable chunks
  limit = 9999*4;
  size = len(l);
  imax = floor((size-1) / limit);
  for (i = [0:1:imax]) {
    jmin = i*limit;
    jmax = min(jmin + limit - 1, size-1);
    for (j=[jmin:4:jmax]) {
      line(l[j],l[j+1],l[j+2],l[j+3], w); 
    }
  }
  if (rounded) {
    lmax = len(l)-1;
    translate([l[lmax-1], l[lmax]]) circle(d=w); 
  }
}

// works on long lists of "lines" which are a flat list of numbers: [xa1,ya1,xb1,yb1,xa2,ya2,xb2,yb2...
// From testing this is not really advantageous over segmented line implementation above
module binary_lines(l, w=0.1,b=0, end) {
  e = is_undef(end) ? len(l) : end;
  s = e-b;
  //echo(b,e,s);
  if (s > 8) {
    m = b + floor(s/8)*4;
    binary_lines(l, w, b, m);    
    binary_lines(l, w, m, e);    
  } else if (s == 8) {
    line(l[b  ],l[b+1],l[b+2],l[b+3], w); 
    line(l[b+4],l[b+5],l[b+6],l[b+7], w); 
  } else if (s == 4){
    line(l[b],l[b+1],l[b+2],l[b+3], w); 
  }
  if (rounded) {
    lmax = len(l)-1;
    translate([l[lmax-1], l[lmax]]) circle(d=w); 
  }
}

module line(xa,ya,xb,yb, w=0.1) {
  //echo(xa,ya,xb,yb);
  dx = (xb - xa);
  dy = (yb - ya);
  d = sqrt(dx*dx + dy*dy);
  a = atan2(dy, dx);
  translate([xa,ya]) {
    if (rounded) circle(d=w);
    rotate([0,0,a]) translate([0,-w/2]) square([d,w]);
  }
}
