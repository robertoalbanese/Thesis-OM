within OM_SP7.Body;

model six_rss_closedloop
  //parameter SIunits.Position pos[3]
  //"Vector from frame_a to frame_b resolved in frame_a";
  import Modelica.SIunits;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
  OM_SP7.Body.rss_closedloop arm1(distance = 0.3)  annotation(
    Placement(visible = true, transformation(origin = {8, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_closedloop arm2(distance = 0.3, theta = 120) annotation(
    Placement(visible = true, transformation(origin = {6, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  rss_closedloop arm3(distance = 0.3, theta = 240) annotation(
    Placement(visible = true, transformation(origin = {6, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
//pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
//pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
  connect(world.frame_b, arm1.frame_a) annotation(
    Line(points = {{-44, 0}, {-26, 0}, {-26, 38}, {-2, 38}}, color = {95, 95, 95}));
  connect(world.frame_b, arm2.frame_a) annotation(
    Line(points = {{-44, 0}, {-26, 0}, {-26, -6}, {-4, -6}}, color = {95, 95, 95}));
  connect(world.frame_b, arm3.frame_a) annotation(
    Line(points = {{-44, 0}, {-26, 0}, {-26, -48}, {-4, -48}}, color = {95, 95, 95}));
protected
  annotation(
    Diagram);
end six_rss_closedloop;
