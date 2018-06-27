#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

#declare water = plane{
	<0, 0, 1>, 0
	material {
		texture {
			pigment {
				color rgb <0.4, 0.7, 0.9>
			}
			finish {
				ambient 0.0
				diffuse 0.0

				reflection {
					0.0, 1.0
					fresnel on
				}

				specular 0.4
				roughness 0.003
			}
			normal{ pigment_pattern{
				crackle
				colour_map { [0, rgb 0]
				[1, rgb 1] }
				turbulence 1.7
				translate <0,0,1>
				}
			0.5
			}
			scale <2.0,1,0.3>*2
			rotate<0,10,0>
			
		}
		interior {
			ior 1.3
		}
	}	
}
