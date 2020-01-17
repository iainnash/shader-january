// pass in a float for the number of tiles (200 and 4.5 are both interesting).
uniform float tileCount;
// output fragment color
out vec4 fragColor;
void main()
{
    // Sample the texture at the fraction of the current 0-1 xy coordinates
    //   multipled by the number of desired tiles.
    vec4 color = texture(sTD2DInputs[0], fract(vUV.st*tileCount));
    fragColor = TDOutputSwizzle(color);
}
