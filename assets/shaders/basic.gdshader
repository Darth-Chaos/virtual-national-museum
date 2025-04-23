shader_type canvas_item;
uniform mat3 color_matrix;

void fragment() {
    vec4 original_color = texture(TEXTURE, UV);
    COLOR.rgb = original_color.rgb * color_matrix;
    COLOR.a = original_color.a; // Mantener transparencia
}