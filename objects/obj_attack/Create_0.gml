/// @description Uniforms & Collisions - DON'T FORGET TO INHERIT
u_uBox = shader_get_uniform(shd_insideOutside, "box");
u_uInside = shader_get_uniform(shd_insideOutside, "inside");

inside = true; //Default at true
passthrough = false; //If the shader doesn't have an effect
damage = 1; //Default at 1

collision = true; //Wether it should be collisionable, attacks fading away for exemple
destroy = true; //Wether the attack will destroy itself when contacting the player

color = WHITE;

//Bounding box
bounding = new BoundingBox();
boundingAmount = 1; //Only one bounding box by default, else make it an array