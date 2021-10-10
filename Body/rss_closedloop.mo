within OM_SP7.Body;

model rss_closedloop
  import Modelica.SIunits;
  
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
  parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
  parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
  
  OM_SP7.Body.rss_leg rss_leg1(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 1, side = 1) annotation(
    Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OM_SP7.Body.rss_leg rss_leg2(baseX = -0.05, baseY = 0, bodyWidth = bodyWidth, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1) annotation(
    Placement(visible = true, transformation(origin = {10, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape plat_1(animateSphere = false, m = 0.1, r = {0.1, 0, 0}, r_CM = {0.05, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {32, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {-6, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j2(cylinderColor = {0, 255, 0}, cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
    Placement(visible = true, transformation(origin = {66, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = theta, n = {0, 1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-48, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-76, -52}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-102, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, animation = false, n = {0, 1, 0}, r = {distance, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-20, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(rss_leg2.frame_b, j1.frame_a) annotation(
    Line(points = {{10, -16}, {10, -10}, {-30, -10}, {-30, 14}, {-16, 14}}));
  connect(j1.frame_b, plat_1.frame_a) annotation(
    Line(points = {{4, 14}, {22, 14}}));
  connect(plat_1.frame_b, j2.frame_a) annotation(
    Line(points = {{42, 14}, {56, 14}}));
  connect(j2.frame_b, rss_leg1.frame_b) annotation(
    Line(points = {{76, 14}, {88, 14}, {88, -10}, {58, -10}, {58, -16}}));
  connect(frame_a, fixedRotation.frame_a) annotation(
    Line(points = {{-76, -52}, {-58, -52}}));
  connect(fixedRotation.frame_b, fixedRotation1.frame_a) annotation(
    Line(points = {{-38, -52}, {-30, -52}}, color = {95, 95, 95}));
  connect(fixedRotation1.frame_b, rss_leg2.frame_a) annotation(
    Line(points = {{-10, -52}, {10, -52}, {10, -36}}, color = {95, 95, 95}));
  connect(fixedRotation1.frame_b, rss_leg1.frame_a) annotation(
    Line(points = {{-10, -52}, {58, -52}, {58, -36}}, color = {95, 95, 95}));
protected
end rss_closedloop;
