#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;
varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform sampler2D ditherText;

float dither8x8(vec2 position, float brightness) {
  float limit = texture(ditherText, mod(position, 8.) / 8.).x;
  return brightness < limit ? 0.0 : 1.0;
}

void main(void) {

    vec4 col = texture2D(texture, vertTexCoord.st);
    if(col.g < 0.9){ 
        float v = dither8x8(gl_FragCoord.xy, col.g);
        gl_FragColor = vec4(v,v,v,col.a);
    } else {
        gl_FragColor = vec4(1.0,1.0,1.0,1.0);
    }
}