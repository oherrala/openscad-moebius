/*
 * Umbilic Torus
 *
 * r: radius of torus
 * w: width of torus
 *
 * The model uses $fs to adjust the smoothness.
 */
module umbilic_torus(r = 1, w = 1) {
    step = $fs;
    for(azimuth = [0 : step : 360]) {
        x = r * cos(azimuth);
        y = r * sin(azimuth);
        translate([x, y, 0]) {
            rotate([0, azimuth/3, azimuth]) {
                triangle(r = w, h = $fs);
            }
        }
    }
}

/*
 * Extruded equilateral triangle
 */
module triangle(r = 1, h = 1) {
    equilateral_triangle = [ 
        for(azimuth = [-30, 90, 210]) 
            [cos(azimuth), sin(azimuth) ] 
    ];

    rotate([90, 0, 0]) {
        linear_extrude(height = h, center=true) {
            scale([r, r, r]) {
                polygon(equilateral_triangle);
            }
        }
    }
}



$fs = 0.5;
umbilic_torus(r = 10, w = 2);
