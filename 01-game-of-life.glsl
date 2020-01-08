float getPixel(float x, float y) {
    vec2 offset = vec2(x, y);
    vec2 pixel_size = 1.0 / vec2(textureSize(sTD2DInputs[0], 0));
    vec4 color = texture(sTD2DInputs[0], vUV.st + offset * pixel_size);
    return color.r;
}

out vec4 fragColor;
// minimum value of a pixel to be "on"
uniform float min;

void main()
{
    float me = getPixel(0, 0);
    
    int count = 0;
    count += getPixel(-1, 1) > min ? 0 : 1;
    count += getPixel(-1, 0) > min ? 0 : 1;
    count += getPixel(-1, -0) > min ? 0 : 1;
    count += getPixel(1, 1) > min ? 0 : 1;
    count += getPixel(1, 0) > min ? 0 : 1;
    count += getPixel(1, -0) > min ? 0 : 1;
    count += getPixel(0, 1) > min ? 0 : 1;
    count += getPixel(0, -0) > min ? 0 : 1;

    vec4 alive = vec4(0, 0, 0, 0);
    if (me > min) {
        if (count == 2 || count == 3) {
            alive = texture(sTD2DInputs[0], vUV.st);
        }
    } else {
        if (count == 3) {
            alive = texture(sTD2DInputs[0], vUV.st);
        }
    }

    // vec4 color = vec4(alive, alive, alive, alive);
    vec4 color = alive;

    fragColor = TDOutputSwizzle(color);
}
