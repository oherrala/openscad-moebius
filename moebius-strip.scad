/*
 * Möbius Strip
 *
 * r: radius of strip
 * w: width of strip
 * t: thickness of strip
 *
 * The model uses $fs to adjust the smoothness.
 */
module moebius_strip(r = 1, w = 1, t = 1) {
    step = $fs;
    for(azimuth = [0 : step : 360]) {
        x = r * cos(azimuth);
        y = r * sin(azimuth);
        translate([x, y, 0]) {
            rotate([0, azimuth/2, azimuth]) {
                cube([t, step, w], center=true);
            }
        }
    }
}


$fs = 0.5;

moebius_strip(r = 30, w = 15, t = 1);
