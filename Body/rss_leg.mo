within OM_SP7.Body;

model rss_leg
  import Modelica.SIunits;
  
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
  parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
  parameter SIunits.Length baseY = 0 "location of base_manipulator in y axis";
  parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
  parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
  parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
  parameter SIunits.AngularVelocity motorInitialVelocity = 0 "Axis speed of revolute joint j1";
  parameter Integer side = 1 "right=1, left=-1";
  
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, w(fixed = false, start = motorInitialVelocity)) annotation(
    Placement(visible = true, transformation(origin = {2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b1(animateSphere = false, m = 1, r = {side *0.2, 0, 0}, r_CM = {side *0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {38, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b2(animateSphere = false, m = 1, r = {-side *0.2, 0.3, 0}, r_CM = {-side *0.1, 0.15, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j2(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {60, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-74, -48}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-70, -54}, extent = {{-16, -16}, {16, 16}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {60, 80}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {-10, 118}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {side *baseX, baseY, 0}) annotation(
    Placement(visible = true, transformation(origin = {-22, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = theta, n = {0, 1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-66, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, animation = false, n = {0, 1, 0}, r = {distance, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-38, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(j1.frame_b, b1.frame_a) annotation(
    Line(points = {{12, -48}, {28, -48}}));
  connect(b1.frame_b, j2.frame_a) annotation(
    Line(points = {{48, -48}, {60, -48}, {60, -26}}, color = {95, 95, 95}));
  connect(j2.frame_b, b2.frame_a) annotation(
    Line(points = {{60, -6}, {60, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, j1.frame_a) annotation(
    Line(points = {{-12, -48}, {-8, -48}}));
  connect(fixedRotation.frame_b, fixedRotation1.frame_a) annotation(
    Line(points = {{-56, -6}, {-48, -6}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_a, fixedRotation1.frame_b) annotation(
    Line(points = {{-32, -48}, {-40, -48}, {-40, -20}, {-14, -20}, {-14, -6}, {-28, -6}}, color = {95, 95, 95}));
  connect(frame_a, fixedRotation.frame_a) annotation(
    Line(points = {{-74, -48}, {-64, -48}, {-64, -24}, {-88, -24}, {-88, -6}, {-76, -6}}));
  connect(b2.frame_b, frame_b) annotation(
    Line(points = {{60, 30}, {60, 80}}));

annotation(
    Icon(graphics = {Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {8, -53}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {27.4355, 16.7005}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Ellipse(origin = {-40, -53}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Ellipse(origin = {57, -52}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {-7, 92}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360)}));
end rss_leg;
