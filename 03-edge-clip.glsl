// min and max from 0.0 to 1.0 for the X offset (cuts the image from the min to the max)
uniform vec2 offsetX;
// same but for the Y coordinates
uniform vec2 offsetY;

out vec4 fragColor;

void main()
{
    vec4 color = texture(
        sTD2DInputs[0],
        vec2(
            min(offsetX.y, max(vUV.st.x, offsetX.x)),
            min(offsetY.y, max(vUV.st.y, offsetY.x))
        )
    );
    fragColor = TDOutputSwizzle(color);
}
