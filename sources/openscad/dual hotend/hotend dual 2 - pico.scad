print=1; // 0= veiw assembly 1= printable render
include <pico-hotend.scad>;
$fn=40;
width = 40;

if (print==1){
print();
}
else {
rotate([0,-90,0]) {
	hotends();
	fans();
	fan_duct();
	mount();
	clamp();

rotate([180,0,0]) translate([0,-40,10]) {
	mount2();
	sensor();
}
}
};
module print() {
translate([30,50,57])rotate([0,180,0])fan_duct();
translate([60, 0, 0]) mount();
translate([60, 50, 0]) mount2();
translate([80, 0 , 31.100]) rotate([0, 180, 0]) clamp(); 
}
module hotends() {
	color("silver")
		translate([41, 10, 15]) rotate([90, 45, -90]) pico();
	color("silver")
		translate([41, 30, 15]) rotate([90, -145, -90]) pico();
$fn= 32;
}

module fan_duct() {
difference() {

color("yellow") translate([28, -5, 32])

union() {
difference() {
	union()
	{
		cube([7.5, width+10, 6]);
//		translate([-50,5,0])		cube([50, 40,25]);
		translate([0,45,0])		{
			rotate([90,0,0]) 
			linear_extrude(height=40) polygon([[-0.5,-10],[-45,-5],[-51,-5],[-40,25],[0,25],[7.5,6],[7.5,0],[-0.5,0]]);
		}
	}
		translate([0,44,0])		{
			rotate([90,0,0]) 
			linear_extrude(height=38) polygon([[0,-12],[-45,-5],[-50,-5],[-40,20],[-1,20],[0,5]]);
		}
//fan hole
		translate([-20.5,25,20])cylinder(r=19, h=8);
//fan mount 40mm
translate([-4, 9, 19]) cylinder(r=1.4, h=10, $fn=30);
translate([-4, 41, 19]) cylinder(r=1.4, h=10, $fn=30);
translate([-36, 9, 19]) cylinder(r=1.4, h=10, $fn=30);
translate([-36, 41, 19]) cylinder(r=1.4, h=10, $fn=30);

}
// inside duct
translate([0,44,0])		{
			rotate([90,0,0]) 
			linear_extrude(height=38) polygon([[-24,-5],[-46,-5],[-25,20],[-24,20]]);
		}
}
// mount to bracked holes
translate([32, width+2, 0]) cylinder(r=1.45, h=50);
translate([32, -2, 0]) cylinder(r=1.45, h=50);
// head screw
translate([32, width+2,38]) cylinder(r=4, h=25);
translate([32, -2, 38]) cylinder(r=4, h=25);


}

}
module fans() {
	//color("grey") 		translate([-6,0,0]) scale(1) import("fan_guard.stl");
	color("grey") rotate([90,0,0])
		translate([-12,61, -40]) import("fan_guard.stl");
}


module sensor(){
color("blue")
translate([-26, width/2, 12]) rotate([0, 90, 0]) cylinder(r=5.6, h=62);
}

module mount() {
color("green")
difference() {
union(){ //Main Mount Bracket
	translate([28, -5, 0]) cube([7.5, width+10, 15] );
	cube([30, width, 5] );
}
translate([5, 10, -.1]) cube([20, width-20, 5.2]);
//mount screw holes
translate([4, 3 , -.1]) cylinder(r = 1.8, h= 5.5); 
translate([4, width-3, -.1]) cylinder(r = 1.8, h=5.5);
translate([20.5, 3, -.1]) cylinder(r=1.8, h=5.5);
translate([20.5, width-3, -.1]) cylinder(r=1.8, h=5.5);
	
//hotend mount holes
	translate([33.5, 30, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([33.5, 10, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([26.5, 30, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([26.5, 10, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([26.5, 10, 15])rotate([0, 90, 0]) cylinder(r=6.25, h=10);
	translate([26.5, 30, 15])rotate([0, 90, 0]) cylinder(r=6.25, h=10);


//clamp holes
translate([32, width+2, 0]) cylinder(r=1.45, h=30);
translate([32, -2, 0]) cylinder(r=1.45, h=30);
}
}



module mount2() {
color("green")
difference() {
union(){ //Main Mount Bracket
	translate([10, 5, 0]) cube([6.5, width-10, 15] );
	cube([30, width, 5] );
}
//translate([-.1, 10, -.1]) cube([25, width-20, 5.2]);
//mount screw holes
translate([4, 3 , -.1]) cylinder(r = 1.8, h= 5.5); 
translate([4, width-3, -.1]) cylinder(r = 1.8, h=5.5);
translate([20.5, 3, -.1]) cylinder(r=1.8, h=5.5);
translate([20.5, width-3, -.1]) cylinder(r=1.8, h=5.5);
sensor();
}
}


module clamp() {//outer clamp

color("purple")
difference() {

union() {
// sensor mount
//translate([28, 30, 48])rotate([0, 90, 0]) cylinder(r=13, h=6.5);
//translate([28, 25, 25])cube([6.5, 10, 18]);

translate([28, -5, 15.1])cube([7.5, width+10, 16]);
}

color("pink")
//hot end mount holes
translate([26.5, 30, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([26.5, 10, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
translate([33.5, 30, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([33.5, 10, 15])rotate([0, 90, 0]) cylinder(r=8.25, h=2.5);
	translate([26.5, 10, 15])rotate([0, 90, 0]) cylinder(r=6.25, h=10);
	translate([26.5, 30, 15])rotate([0, 90, 0]) cylinder(r=6.25, h=10);
//sensor mount
//translate([27.9, 30, 48]) rotate([0, 90, 0]) cylinder(r=9.1, h=10);
//translate([32, 30, 48]) cylinder(r=1.55, h=20);
//translate([32, 4, 0]) cylinder(r=1.55, h=30);
//fan mount 40mm
//translate([30, 4, 22]) cylinder(r=1.4, h=10, $fn=30);
//translate([30, 36, 22]) cylinder(r=1.4, h=10, $fn=30);
//clamp holes
translate([32, width+2, 0]) cylinder(r=1.45, h=50);
translate([32, -2, 0]) cylinder(r=1.45, h=50);
//fin releif
	

}
}