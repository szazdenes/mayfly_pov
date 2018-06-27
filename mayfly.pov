#version 3.7;
global_settings { assumed_gamma 1.0}

#include "textures.inc"
#include "colors.inc" 

sky_sphere {
	
	pigment {image_map {png "skygrad.png" map_type 1 interpolate 2} scale -1 rotate -90*x }
	pigment{ 
		bozo turbulence 0.75
		octaves 6  omega 0.7
		lambda 2  phase 0.15
		color_map {
			[0.00 color rgb <1,1,1>*0.95]
			[0.05 color rgb <1,1,1>*1.25]
			[0.15 color rgb <1,1,1>*0.85]
			[0.55 color rgbt<1,1,1,1>]
			[1.00 color rgbt<1,1,1,1>]
		} 
		translate< 3, 0,-1>
		scale<0.3, 0.4, 0.2>*3
		rotate <0,220,90>
	} 
}

#declare cam1 = camera {
	location <0, 0, 0.1>
	look_at <0, 0, 0>
	angle 100
	translate <0,15,65>
	rotate <80,0,135>
}

#declare cam2 = camera {
	fisheye
	location <0, 0, 0.1>
	up y
	right 1.*x
	angle 180
	look_at <0, 0, 1>
	translate <0,0,8>
	rotate <0,0,0>
}

camera{cam1}

light_source {
	<0.0,0.0,1000.0> color rgb <0.5, 0.5, 0.5>
	shadowless
}

light_source {
	<0.0,500.0,0.0> color rgb <1.0, 1.0, 1.0>
	shadowless
}

light_source {
	<0.0,0.0,8.0> color rgb <1.0, 1.0, 1.0>
	shadowless
}

//Duck parameters----------------------------
#declare F_Plastic=finish{ambient 0 diffuse 1 phong 1} // reflection{0,0.1 fresnel}}
#declare T_Bill=texture{pigment{Red} finish{F_Plastic}}
#declare T_Eye=texture{pigment{White} finish{F_Plastic}}
#declare T_Body=texture{pigment{rgb <0.8,0.75,0>} finish{F_Plastic}}
#declare T_Pupil=texture{pigment{Black} finish{F_Plastic}}
//----------------------------------------------

#include "mayfly.inc"
#include "ducky.inc"

#declare Ducky=union{
	object{Ducky}
	object{Ducky scale <-1,1,1>} 
	//    interior{ior 5}
	rotate <90,0,90>
	scale 1/10
}    

object{water}
object{Ducky}
