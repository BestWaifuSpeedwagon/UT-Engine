varying vec3 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float y;
uniform float height;
uniform float fraction;


void main()
{
    float alpha = 1.;
    
	float pos = v_vPosition.y - y;
	float yy = fraction*height;
	
    if(pos < yy)
    {
		alpha = max(0., 1. - (yy-pos)/15.);
    }
    
    gl_FragColor = vec4( texture2D( gm_BaseTexture, v_vTexcoord ).rgb, alpha );
}
