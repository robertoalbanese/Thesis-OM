within OM_SP7.Body;

model six_rss_closedloop
  //parameter SIunits.Position pos[3]
  //"Vector from frame_a to frame_b resolved in frame_a";
  import Modelica.SIunits;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-12, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  
  OM_SP7.Body.rss_leg rss_leg1(baseX = 0.05, baseY = 0, motorInitialAngle = 0, motorInitialVelocity = 1, side = 1)  annotation(
    Placement(visible = true, transformation(origin = {34, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg2(baseX = -0.05, baseY = 0, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1)  annotation(
    Placement(visible = true, transformation(origin = {-26, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape plat_1(animateSphere = false, m = 0.1, r = {0.1, 0, 0}, r_CM = {0.05, 0, 0}, width = bodyWidth)  annotation(
    Placement(visible = true, transformation(origin = {-4, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, phi(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {-46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j2(cylinderDiameter = jointWidth)  annotation(
    Placement(visible = true, transformation(origin = {38, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
//pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
//pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
  connect(world.frame_b, rss_leg1.frame_a) annotation(
    Line(points = {{-2, -82}, {6, -82}, {6, -30}, {24, -30}}, color = {95, 95, 95}));
  connect(world.frame_b, rss_leg2.frame_a) annotation(
    Line(points = {{-2, -82}, {6, -82}, {6, -50}, {-58, -50}, {-58, -30}, {-36, -30}}, color = {95, 95, 95}));
  connect(rss_leg2.frame_b, j1.frame_a) annotation(
    Line(points = {{-26, -14}, {-26, -8}, {-84, -8}, {-84, 16}, {-56, 16}}));
  connect(j1.frame_b, plat_1.frame_a) annotation(
    Line(points = {{-36, 16}, {-14, 16}}));
  connect(plat_1.frame_b, j2.frame_a) annotation(
    Line(points = {{6, 16}, {28, 16}}));
  connect(j2.frame_b, rss_leg1.frame_b) annotation(
    Line(points = {{48, 16}, {70, 16}, {70, -4}, {34, -4}, {34, -14}}));
protected
end six_rss_closedloop;
