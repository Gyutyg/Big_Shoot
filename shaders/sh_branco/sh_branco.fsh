//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//Criando uma variável para armazenar o valor do shader
	vec4 _cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//Mudando o valor das cores
	_cor.rgb = vec3(1.0, 1.0, 1.0);
	
    gl_FragColor = _cor;
}
