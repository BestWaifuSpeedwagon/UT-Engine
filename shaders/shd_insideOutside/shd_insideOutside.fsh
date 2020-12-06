varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform bool inside;
uniform vec4 box; //Coordinates of the box (x: x1, y: y1, z: x2, w: y2)

void main()
{
	//Check if inside the box, and invert based on inside value
	if((v_vPosition.x > box.x &&
		v_vPosition.x < box.z &&
		v_vPosition.y > box.y &&
		v_vPosition.y < box.w) ^^ inside)
	{
		gl_FragColor = vec4(.0, .0, .0, .0); //Transparent
	}
	else
	{
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	}
}
