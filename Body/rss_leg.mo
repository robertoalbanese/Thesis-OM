within OM_SP7.Body;

model rss_leg
  import Modelica.SIunits;
  
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
  parameter SIunits.Length baseY = 0 "location of base_manipulator in y axis";
  parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
  parameter SIunits.AngularVelocity motorInitialVelocity = 0 "Axis speed of revolute joint j1";
  parameter Integer side = 1 "right=1, left=-1";
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, w(fixed = false, start = motorInitialVelocity)) annotation(
    Placement(visible = true, transformation(origin = {2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b1(animateSphere = false, m = 1, r = {side *0.2, 0, 0}, r_CM = {side *0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {38, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b2(animateSphere = false, m = 1, r = {-side *0.2, 0.3, 0}, r_CM = {-side *0.1, 0.15, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j2(cylinderDiameter = jointWidth, phi(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {60, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-74, -48}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, -62}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {60, 54}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {0, 96}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {baseX, baseY, 0}) annotation(
    Placement(visible = true, transformation(origin = {-42, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(j1.frame_b, b1.frame_a) annotation(
    Line(points = {{12, -48}, {28, -48}}));
  connect(b1.frame_b, j2.frame_a) annotation(
    Line(points = {{48, -48}, {60, -48}, {60, -26}}, color = {95, 95, 95}));
  connect(j2.frame_b, b2.frame_a) annotation(
    Line(points = {{60, -6}, {60, 10}}, color = {95, 95, 95}));
  connect(b2.frame_b, frame_b) annotation(
    Line(points = {{60, 30}, {60, 54}}));
  connect(frame_a, fixedTranslation.frame_a) annotation(
    Line(points = {{-74, -48}, {-52, -48}}));
  connect(fixedTranslation.frame_b, j1.frame_a) annotation(
    Line(points = {{-32, -48}, {-8, -48}}));
end rss_leg;
