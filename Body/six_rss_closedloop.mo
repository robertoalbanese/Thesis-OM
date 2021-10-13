within OM_SP7.Body;

model six_rss_closedloop
  //parameter SIunits.Position pos[3]
  //"Vector from frame_a to frame_b resolved in frame_a";
  import Modelica.SIunits;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-82, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
  OM_SP7.Body.rss_leg rss_leg_a1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = 1, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg_a2(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {-36, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg_b1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, theta = 120) annotation(
    Placement(visible = true, transformation(origin = {-36, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg_b2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 120) annotation(
    Placement(visible = true, transformation(origin = {-32, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg_c1(baseX = 0.05, baseY = 0, distance = 0.3, theta = 240) annotation(
    Placement(visible = true, transformation(origin = {-32, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg_c2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 240) annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j_b1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {2, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_b2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
    Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j_c1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {6, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_2c(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
    Placement(visible = true, transformation(origin = {8, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b_b(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {48, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b_a(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {48, 78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b_c(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {50, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_a2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
    Placement(visible = true, transformation(origin = {8, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j_a1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {8, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
//pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
//pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
  connect(world.frame_b, rss_leg_a2.frame_a) annotation(
    Line(points = {{-72, 4}, {-58, 4}, {-58, 47}, {-43, 47}}, color = {95, 95, 95}));
  connect(world.frame_b, rss_leg_a1.frame_a) annotation(
    Line(points = {{-72, 4}, {-58, 4}, {-58, 75}, {-47, 75}}, color = {95, 95, 95}));
  connect(rss_leg_b1.frame_b, j_b1.frame_a) annotation(
    Line(points = {{-37, 23.8}, {-23.5, 23.8}, {-23.5, 24}, {-8, 24}}, color = {95, 95, 95}));
  connect(rss_leg_b2.frame_b, j_b2.frame_a) annotation(
    Line(points = {{-33, -4.2}, {-7, -4.2}}, color = {95, 95, 95}));
  connect(j_b2.frame_b, b_b.frame_b) annotation(
    Line(points = {{14, -4}, {48, -4}, {48, 2}}));
  connect(rss_leg_c1.frame_b, j_c1.frame_a) annotation(
    Line(points = {{-33, -42.2}, {-5, -42.2}}, color = {95, 95, 95}));
  connect(rss_leg_c2.frame_b, j_2c.frame_a) annotation(
    Line(points = {{-31, -68.2}, {-3, -68.2}}, color = {95, 95, 95}));
  connect(j_c1.frame_b, b_c.frame_a) annotation(
    Line(points = {{16, -42}, {50, -42}, {50, -46}}));
  connect(j_2c.frame_b, b_c.frame_b) annotation(
    Line(points = {{18, -68}, {50, -68}, {50, -66}}));
  connect(world.frame_b, rss_leg_b1.frame_a) annotation(
    Line(points = {{-72, 4}, {-43, 4}, {-43, 7}}, color = {95, 95, 95}));
  connect(world.frame_b, rss_leg_b2.frame_a) annotation(
    Line(points = {{-72, 4}, {-58, 4}, {-58, -21}, {-39, -21}}, color = {95, 95, 95}));
  connect(world.frame_b, rss_leg_c1.frame_a) annotation(
    Line(points = {{-72, 4}, {-58, 4}, {-58, -59}, {-39, -59}}));
  connect(world.frame_b, rss_leg_c2.frame_a) annotation(
    Line(points = {{-72, 4}, {-58, 4}, {-58, -85}, {-37, -85}}));
  connect(j_a2.frame_b, b_a.frame_b) annotation(
    Line(points = {{18, 64}, {48, 64}, {48, 68}}, color = {95, 95, 95}));
  connect(rss_leg_a2.frame_b, j_a2.frame_a) annotation(
    Line(points = {{-37, 63.8}, {-3, 63.8}}, color = {95, 95, 95}));
  connect(j_b1.frame_b, b_b.frame_a) annotation(
    Line(points = {{12, 24}, {30, 24}, {30, 22}, {48, 22}}, color = {95, 95, 95}));
  connect(b_a.frame_a, j_a1.frame_b) annotation(
    Line(points = {{48, 88}, {48, 92}, {18, 92}}, color = {95, 95, 95}));
  connect(rss_leg_a1.frame_b, j_a1.frame_a) annotation(
    Line(points = {{-41, 91.8}, {-3, 91.8}}, color = {95, 95, 95}));
protected
  annotation(
    Diagram);
end six_rss_closedloop;
