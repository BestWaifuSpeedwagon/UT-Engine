/// @description Uniforms & Collisions - DON'T FORGET TO INHERIT
u_uBox = shader_get_uniform(shd_insideOutside, "box");
u_uInside = shader_get_uniform(shd_insideOutside, "inside");

inside = true; //Default at true
passthrough = false; //If the shader doesn't have an effect
damage = 1; //Default at 1

destroy = true; //Wether the attack will destroy itself when contacting the player

//Collision bounding box
p1 = new Point(0, 0); //Top-left corner
p2 = new Point(0, 0); //Bottom-right corner
po = new Point(0, 0); //Rotation origin
theta = 0; //Angle of bounding box