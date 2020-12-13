//
// Simple passthrough fragment shader
//
varying vec3 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float bias;

void main()
{
	float _y = v_vTexcoord.y + (sin(v_vPosition.x/10. + bias)*0.005);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, _y));
}