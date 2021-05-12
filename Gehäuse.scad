/*
Step 1
- basic parameters
- $fn - 200 fragments results in a smooth shape
- minkowski is creating a rounded shape, don't forget to exclude the double radius
*/

$fn=200;

length = 110;
width= 80;
height = 19;
//height = 2;
radius = 10;
rand = 2;
dRadius = 2*radius;


//Box
translate([10,10,0]) {
    difference() {
        abgerundeteBox(length, width, height, radius);
        translate([rand/2,rand/2,1]) {
            abgerundeteBox(length-rand, width-rand, height-1, radius);
        }
    }

    translate([4,-2,0]) {
        group() {
            translate([0,0,0]) {
                nut_trap();
            }
            translate([55,0,]) {
                nut_trap();
            }
            translate([0,42,0]) {
                nut_trap();
            }
            translate([55,42,]) {
                nut_trap();
            }
        }
    }
}


//Deckel
/*
translate([width*2,10,0]) {
    mirror([1,0,0]) {
        abgerundeteBox(length, width, 1, radius);
        difference() {
            translate([1,1,0]) {
                abgerundeteBox(length-2, width-2,4,radius);
            }
            translate([2,2,0]) {
                abgerundeteBox(length-4, width-4,4,radius);
            }
        }
    }
}
*/


module nut_trap (
        w = 6,
        h = 7
        )
{
        difference() {
            cylinder(h=h, r = w / 2);//, center=true);
            cylinder(h=h, r2 = 3/2, r1 = 1.8/2);//, center=true);
        }
}    

module abgerundeteBox(length, width, height, radius) {
    dRadius = 2*radius;
    
    translate([-radius,length-dRadius, 0]){
        cube(size=[radius,radius, height+0.01]);
    }

    translate([width-dRadius,-radius, 0]){
        cube(size=[radius,radius, height+0.01]);
    }
    
    minkowski() {
        cube(size=[width-dRadius,length-dRadius, height]);
        cylinder(r=radius, h=0.01);
    }
}
