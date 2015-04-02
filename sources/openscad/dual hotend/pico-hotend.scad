
module pico() {
translate([-4,-7,58.5]) rotate([-90,0,0]) {
	import("Pico.stl");
	translate([-4,43,-1]) import("Pico_Groovemount_for_Bowden.stl");
	translate([0,-8.5,3.5]) import("Pico_Nozzle.stl");
}
}