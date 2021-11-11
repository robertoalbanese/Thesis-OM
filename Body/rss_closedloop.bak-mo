within OM_SP7.Body;

model rss_closedloop
  import Modelica.SIunits;
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
  parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
  parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
  //output SIunits.Position w_ee_pos[3]"Absolute position vector resolved in world frame";
  OM_SP7.Body.rss_leg rss_leg1(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, distance = 0, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 1, side = 1) annotation(
    Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg2(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, distance = 0, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1) annotation(
    Placement(visible = true, transformation(origin = {10, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape plat_1(animateSphere = false, m = 0.1, r = {0.1, 0, 0}, r_CM = {0.05, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {32, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-54, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical j2(enforceStates = true)  annotation(
    Placement(visible = true, transformation(origin = {62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {-6, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//w_ee_pos = ee_cart_pos_world.r;
  connect(world.frame_b, rss_leg2.frame_a) annotation(
    Line(points = {{-44, -54}, {-12, -54}, {-12, -32}, {4, -32}}, color = {95, 95, 95}));
  connect(world.frame_b, rss_leg1.frame_a) annotation(
    Line(points = {{-44, -54}, {42, -54}, {42, -32}, {52, -32}}, color = {95, 95, 95}));
  connect(plat_1.frame_b, j2.frame_a) annotation(
    Line(points = {{42, 14}, {52, 14}}, color = {95, 95, 95}));
  connect(j2.frame_b, rss_leg1.frame_b) annotation(
    Line(points = {{72, 14}, {82, 14}, {82, -8}, {58, -8}, {58, -14}}, color = {95, 95, 95}));
  connect(j1.frame_b, plat_1.frame_a) annotation(
    Line(points = {{4, 14}, {22, 14}}));
  connect(rss_leg2.frame_b, j1.frame_a) annotation(
    Line(points = {{10, -16}, {10, -10}, {-30, -10}, {-30, 14}, {-16, 14}}));
protected
  annotation(
    Icon(graphics = {Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {79.4355, -1.2995}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Rectangle(origin = {60, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {109, -68}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Rectangle(origin = {79.4355, -1.2995}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Rectangle(origin = {60, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {109, -68}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {24, -69}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Rectangle(origin = {-80.56, 0.7}, rotation = -115, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.02, 14.03}, {81.02, -14.03}}), Rectangle(origin = {-70, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {-70, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {-24, -69}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Ellipse(origin = {-111, -66}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Rectangle(origin = {-2, 73}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {-43, 78}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {41, 78}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360)}));
end rss_closedloop;
