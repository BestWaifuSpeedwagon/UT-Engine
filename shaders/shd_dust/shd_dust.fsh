varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float yy;

void main()
{
    vec4 v_c = v_vColour;
    vec2 v_xy = v_vTexcoord;
    
    if(v_xy.y < yy)
    {
        v_c.a = 2.0 - (yy - v_xy.y)*6.0;
    }
    
    gl_FragColor = v_c * texture2D( gm_BaseTexture, v_xy );
}
