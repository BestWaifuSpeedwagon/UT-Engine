/// @description Uniforms - DON'T FORGET TO INHERIT
u_uBox = shader_get_uniform(shd_insideOutside, "box");
u_uInside = shader_get_uniform(shd_insideOutside, "inside");

inside = false; //Default at true
damage = 1; //Default at 1