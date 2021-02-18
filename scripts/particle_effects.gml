global.system1=part_system_create();
global.particle1=part_type_create();
global.particle2=part_type_create();
global.particle3=part_type_create();
global.particle4=part_type_create();
global.particle5=part_type_create();
global.Particle44=part_type_create();
global.BoostRing=part_type_create();

part_system_depth(global.particle1,5);

//==================================
part_type_shape(global.particle3,pt_shape_line);
part_type_size(global.particle3,0.10,0.30,0,0);
part_type_speed(global.particle3,8,11,0,0);
part_type_direction(global.particle3,0,45,0,0);
part_type_orientation(global.particle3,0,0,0,0,1);
part_type_color1(global.particle3,1357048);
part_type_alpha1(global.particle3,1);
part_type_scale(global.particle3,1,1);
part_type_gravity(global.particle3,0,270);
part_type_life(global.particle3,20,40);
part_type_blend(global.particle3,1);
//==================================
part_type_shape(global.particle2,pt_shape_flare);
part_type_size(global.particle2,0.20,0.20,0,0);
part_type_scale(global.particle2,1.6,1.6);
part_type_color2(global.particle2,16744448,16768443);
part_type_alpha2(global.particle2,1,0);
part_type_speed(global.particle2,0,0,0,0);
part_type_direction(global.particle2,0,0,0,0);
part_type_gravity(global.particle2,0,270);
part_type_orientation(global.particle2,0,0,0,0,1);
part_type_blend(global.particle2,1);
part_type_life(global.particle2,15,15);


global.P_System=part_system_create();
global.Particle1=part_type_create();

part_system_depth(global.P_System,-150)

part_type_shape(global.Particle1,pt_shape_ring);
part_type_size(global.Particle1,0.1,0.1,1.3,0);
part_type_speed(global.Particle1,0,0,0,0);
part_type_direction(global.Particle1,0,359,0,0);
part_type_orientation(global.Particle1,0,0,0,0,1);
part_type_color1(global.Particle1,14737632);
part_type_alpha1(global.Particle1,0.7);
part_type_scale(global.Particle1,1,1);
part_type_gravity(global.Particle1,0,270);
part_type_life(global.Particle1,135,135);
part_type_blend(global.Particle1,0.8);

global.P_System2=part_system_create();
global.Particle2=part_type_create();

part_system_depth(global.P_System2,-100);

part_type_sprite(global.Particle2,sprSparkle2,1,0,1);

//part_type_shape(global.Particle2,pt_shape_pixel);
part_type_size(global.Particle2,1,1,0,0);
part_type_scale(global.Particle2,1,1);
part_type_color3(global.Particle2,16777215,16744448,0);
part_type_alpha3(global.Particle2,1,1,0);
part_type_speed(global.Particle2,5,8,-0.05,3);
part_type_direction(global.Particle2,0,359,0,0);
part_type_gravity(global.Particle2,0,270);
part_type_orientation(global.Particle2,0,0,0,0,1);
part_type_blend(global.Particle2,1);
part_type_life(global.Particle2,56,88);

global.P_System3=part_system_create();
global.Particle3=part_type_create();

part_system_depth(global.P_System3,-100);

part_type_shape(global.Particle3,pt_shape_ring);
part_type_size(global.Particle3,0.50,0.50,0.50,0);
part_type_scale(global.Particle3,1,1);
part_type_color3(global.Particle3,16777215,16744448,0);
part_type_alpha1(global.Particle3,1);
part_type_speed(global.Particle3,0,0,0,0);
part_type_direction(global.Particle3,0,359,0,0);
part_type_gravity(global.Particle3,0,270);
part_type_orientation(global.Particle3,0,0,0,0,1);
part_type_blend(global.Particle3,1);
part_type_life(global.Particle3,60,60);

//SpinDash
global.P_System4=part_system_create();
global.Particle4=part_type_create();

part_type_shape(global.Particle4,pt_shape_smoke);
part_type_size(global.Particle4,0.05,0.10,0.01,0);
part_type_scale(global.Particle4,1,1);
part_type_color1(global.Particle4,4436455);
part_type_alpha2(global.Particle4,1,0);
part_type_speed(global.Particle4,1,2,0,0);
part_type_direction(global.Particle4,-10,60,0,0);
part_type_gravity(global.Particle4,0,270);
part_type_orientation(global.Particle4,0,0,0,0,1);
part_type_blend(global.Particle4,0);
part_type_life(global.Particle4,45,60);


global.P_System5=part_system_create();
global.Particle5=part_type_create();

part_type_shape(global.Particle5,pt_shape_star);
part_type_size(global.Particle5,0.15,0.35,0,0.50);
part_type_scale(global.Particle5,1,1);
part_type_color1(global.Particle5,16777215);
part_type_alpha2(global.Particle5,1,0);
part_type_speed(global.Particle5,3,4,0,0);
part_type_direction(global.Particle5,0,180,0,0);
part_type_gravity(global.Particle5,0.25,270);
part_type_orientation(global.Particle5,0,359,0.40,0,1);
part_type_blend(global.Particle5,1);
part_type_life(global.Particle5,25,25);

//Bubbles

global.P_System6=part_system_create();
global.Particle6=part_type_create();

part_system_depth(global.P_System6,-15);
//part_type_shape(global.Particle6,pt_shape_ring);
part_type_sprite(global.Particle6,sprSmallBubble,0,0,0);
part_type_size(global.Particle6,0.7,1,0,0.01);
part_type_scale(global.Particle6,1,1);
part_type_color2(global.Particle6,16751415,16777215);
part_type_alpha3(global.Particle6,1,1,0);
part_type_speed(global.Particle6,5,8,-0.2,3);
part_type_direction(global.Particle6,-10,60,0,1);
part_type_gravity(global.Particle6,0,270);
part_type_orientation(global.Particle6,0,0,0,4,1);
part_type_blend(global.Particle6,1);
part_type_life(global.Particle6,15,20);

//More Bubbles
global.P_System7=part_system_create();
global.Particle7=part_type_create();

part_system_depth(global.P_System7,-15);
part_type_shape(global.Particle7,pt_shape_line);
part_type_size(global.Particle7,0.05,0.20,0,0.01);
part_type_scale(global.Particle7,1,1);
part_type_color2(global.Particle7,16764831,16777215);
part_type_alpha3(global.Particle7,1,1,0);
part_type_speed(global.Particle7,5,8,-0.2,3);
part_type_direction(global.Particle7,-10,60,0,1);
part_type_gravity(global.Particle7,0,270);
part_type_orientation(global.Particle7,0,0,0,4,1);
part_type_blend(global.Particle7,1);
part_type_life(global.Particle7,15,20);

// Portal Lights
global.P_System8=part_system_create();
global.Particle8=part_type_create();

part_system_depth(global.P_System8,-150);

part_type_shape(global.Particle8,pt_shape_flare);
part_type_size(global.Particle8,0.05,0.20,0,0.10);
part_type_scale(global.Particle8,1,1);
part_type_color2(global.Particle8,16552707,16493903);
part_type_alpha2(global.Particle8,1,0.50);
part_type_speed(global.Particle8,0.20,2,0,0);
part_type_direction(global.Particle8,55,120,0,5);
part_type_gravity(global.Particle8,0,270);
part_type_orientation(global.Particle8,0,0,0,0,1);
part_type_blend(global.Particle8,1);
part_type_life(global.Particle8,35,50);

/*
global.Particle1_Emitter1=part_emitter_create(global.P_System8);
part_emitter_region(global.Particle1_Emitter1,global.emitter1,-20,20,0,0,1,1);
part_emitter_stream(global.Particle1_Emitter1,global.emitter1,global.Particle8,1);

part_emitter_region(global.P_System9, global.Particle1_Emitter1, x-10, x+10, y-10, y+10, ps_shape_line, ps_distr_gaussian);
part_emitter_stream(global.P_System8,global.Particle1_Emitter1,global.P_System8,1);

global.emitter1 = part_emitter_create(global.Sname);


*/

//Minigame Enter Lights
global.P_System9=part_system_create();
global.Particle9=part_type_create();

part_system_depth(global.P_System9,-150);

part_type_shape(global.Particle9,pt_shape_ring);
part_type_size(global.Particle9,0.10,0.10,0.05,0);
part_type_scale(global.Particle9,0.30,1);
part_type_color2(global.Particle9,16555523,16554789);
part_type_alpha2(global.Particle9,1,0);
part_type_speed(global.Particle9,0.70,2.60,0,0);
part_type_direction(global.Particle9,90,90,0,0);
part_type_gravity(global.Particle9,0,270);
part_type_orientation(global.Particle9,0,0,0,0,1);
part_type_blend(global.Particle9,1);
part_type_life(global.Particle9,20,35);


//------------------Sonic Stomp------------------//
global.P_System10=part_system_create();
global.Particle10=part_type_create();

part_system_depth(global.P_System10,-1);

part_type_shape(global.Particle10,pt_shape_ring);
part_type_size(global.Particle10,0.01,0.01,0.50,0);
part_type_scale(global.Particle10,1,0.1);
part_type_color2(global.Particle10,16725536,16777045);
part_type_alpha2(global.Particle10,0.60,0);
part_type_speed(global.Particle10,0,0,0,0);
part_type_direction(global.Particle10,0,0,0,0);
part_type_gravity(global.Particle10,0,270);
part_type_orientation(global.Particle10,0,0,0,0,1);
part_type_blend(global.Particle10,1);
part_type_life(global.Particle10,12,12);

//-----------------------------------------------//

global.P_System11=part_system_create();
global.Particle11=part_type_create();

part_system_depth(global.P_System11,-1);

part_type_shape(global.Particle11,pt_shape_flare);
part_type_size(global.Particle11,0.045,0.045,0.20,0);
part_type_scale(global.Particle11,1,1);
part_type_color2(global.Particle11,16725536,16777056);
part_type_alpha2(global.Particle11,0.60,0);
part_type_speed(global.Particle11,0,0,0,0);
part_type_direction(global.Particle11,0,0,0,0);
part_type_gravity(global.Particle11,0,270);
part_type_orientation(global.Particle11,0,0,0,0,1);
part_type_blend(global.Particle11,1);
part_type_life(global.Particle11,12,12);


//Tornado
global.P_System12=part_system_create();
global.Particle12=part_type_create();

part_system_depth(global.P_System12,-1);

part_type_shape(global.Particle12,pt_shape_ring);
part_type_size(global.Particle12,0.10,0.10,0.05,0);
part_type_scale(global.Particle12,0.30,1);
part_type_color2(global.Particle12,16559660,16498265);
part_type_alpha2(global.Particle12,1,0);
part_type_speed(global.Particle12,0.20,2,0,0);
part_type_direction(global.Particle12,90,90,0,0);
part_type_gravity(global.Particle12,0,270);
part_type_orientation(global.Particle12,0,0,0,0,1);
part_type_blend(global.Particle12,1);
part_type_life(global.Particle12,20,45);


//Tornado Down
global.P_System13=part_system_create();
global.Particle13=part_type_create();

part_system_depth(global.P_System13,-1);

part_type_shape(global.Particle13,pt_shape_ring);
part_type_size(global.Particle13,0.10,0.10,0.05,0);
part_type_scale(global.Particle13,0.30,1);
part_type_color2(global.Particle13,16559660,16498265);
part_type_alpha2(global.Particle13,1,0);
part_type_speed(global.Particle13,0.20,2,0,0);
part_type_direction(global.Particle13,270,270,0,0);
part_type_gravity(global.Particle13,0,270);
part_type_orientation(global.Particle13,0,0,0,0,1);
part_type_blend(global.Particle13,1);
part_type_life(global.Particle13,20,45);


//Goal Ring Sparkles

global.P_System14=part_system_create();
global.Particle14=part_type_create();

part_system_depth(global.P_System14,10);

part_type_sprite(global.Particle14,sprSparkle2,1,0,1);

//part_type_shape(global.Particle14,pt_shape_pixel);
part_type_size(global.Particle14,0.5,0.5,0,0);
part_type_scale(global.Particle14,1,1);
part_type_color1(global.Particle14,16774369);
part_type_alpha2(global.Particle14,1,1);
part_type_speed(global.Particle14,0.50,2,0,1);
part_type_direction(global.Particle14,0,359,0,1);
part_type_gravity(global.Particle14,0,270);
part_type_orientation(global.Particle14,0,0,0,0,1);
part_type_blend(global.Particle14,1);
part_type_life(global.Particle14,40,60);


//Goal Ring Rainbow

global.P_System15=part_system_create();
global.Particle15=part_type_create();

part_system_depth(global.P_System15,10);

part_type_shape(global.Particle15,pt_shape_ring);
part_type_size(global.Particle15,0.01,0.01,0.03,0);
part_type_scale(global.Particle15,1,1);
part_type_color3(global.Particle15,312571,8453888,16744448);
part_type_alpha3(global.Particle15,1,1,0);
part_type_speed(global.Particle15,0,0,0,0);
part_type_direction(global.Particle15,0,359,0,0);
part_type_gravity(global.Particle15,0,270);
part_type_orientation(global.Particle15,0,0,0,0,1);
part_type_blend(global.Particle15,1);
part_type_life(global.Particle15,50,50);


//Spring Ring=================================================

global.P_System18=part_system_create();
global.Particle18=part_type_create();

part_system_depth(global.P_System18,-5);

part_type_shape(global.Particle18,pt_shape_ring);
part_type_size(global.Particle18,0.01,0.01,0.40,0);
part_type_scale(global.Particle18,0.10,0.80);
part_type_color1(global.Particle18,14869218);
part_type_alpha3(global.Particle18,1,0.75,0);
part_type_speed(global.Particle18,0,0,0,0);
part_type_direction(global.Particle18,0,0,0,0);
part_type_gravity(global.Particle18,0,270);
part_type_orientation(global.Particle18,90,0,0,0,1);
part_type_blend(global.Particle18,1);
part_type_life(global.Particle18,10,10);


//Spring Sparks=================================================

global.P_System19=part_system_create();
global.Particle19=part_type_create();

part_system_depth(global.P_System19,-5);

//part_type_shape(global.Particle19,pt_shape_spark);
part_type_sprite(global.Particle19,sprPlayerSparkle,1,1,0);
part_type_size(global.Particle19,1,1,0,0);
part_type_scale(global.Particle19,1,1);
part_type_color1(global.Particle19,16777215);
part_type_alpha3(global.Particle19,1,1,1);
part_type_speed(global.Particle19,2.50,5,-0.07,0);
part_type_direction(global.Particle19,0,359,0,0);
part_type_gravity(global.Particle19,0.20,270);
part_type_orientation(global.Particle19,0,0,0,0,0);
part_type_blend(global.Particle19,1);
part_type_life(global.Particle19,10,20);


//Ring Boost=================================================

global.P_System20=part_system_create();
global.Particle20=part_type_create();

part_system_depth(global.P_System20,-10);

part_type_shape(global.Particle20,pt_shape_ring);
part_type_size(global.Particle20,0.05,0.05,0.30,0);
part_type_scale(global.Particle20,0.2,0.8);
part_type_color1(global.Particle20,14869218);
part_type_alpha3(global.Particle20,1,1,0);
part_type_speed(global.Particle20,0,0,0,0);
part_type_direction(global.Particle20,0,0,0,0);
part_type_gravity(global.Particle20,0,270);
part_type_orientation(global.Particle20,90,0,0,0,1);
part_type_blend(global.Particle20,1);
part_type_life(global.Particle20,16,16);


//RainbowRing Boost=================================================

global.P_System21=part_system_create();
global.Particle21=part_type_create();

part_system_depth(global.P_System21,-10);

part_type_shape(global.Particle21,pt_shape_ring);
part_type_size(global.Particle20,0.05,0.05,0.30,0);
part_type_scale(global.Particle21,0.20,0.80);
part_type_color3(global.Particle21,2784893,15434543,4874994);
part_type_alpha2(global.Particle21,0.8,0);
part_type_speed(global.Particle21,0,0,0,0);
part_type_direction(global.Particle21,0,0,0,0);
part_type_gravity(global.Particle21,0,270);
part_type_orientation(global.Particle21,0,90,0,0,0);
part_type_blend(global.Particle21,1);
part_type_life(global.Particle21,25,25);


//RainbowRing Light=================================================

global.P_System22=part_system_create();
global.Particle22=part_type_create();

part_system_depth(global.P_System22,-1000);

part_type_shape(global.Particle22,pt_shape_flare);
part_type_size(global.Particle22,0.01,0.01,0.10,5);
part_type_scale(global.Particle22,0.70,0.70);
part_type_color3(global.Particle22,2784893,15434543,4874994);
part_type_alpha2(global.Particle22,0.60,0);
part_type_speed(global.Particle22,0,0,0,0);
part_type_direction(global.Particle22,0,359,0,0);
part_type_gravity(global.Particle22,0,270);
part_type_orientation(global.Particle22,0,0,0,0,0);
part_type_blend(global.Particle22,1);
part_type_life(global.Particle22,20,20);

