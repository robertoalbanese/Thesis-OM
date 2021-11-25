model rrr_leg
  import Modelica.SIunits;
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
  parameter SIunits.Length baseZ = 0 "location of base_manipulator in y axis";
  parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
  parameter Integer side = 0 "right=1, left=-1";
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(animateSphere = false, m = 0.1, r = {side * 0.2, -0.01, 0}, r_CM = {side * 0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {4, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-28, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(animateSphere = false, m = 0.1, r = {-side * 0.2, 0.31, 0}, r_CM = {-side * 0.1, 0.155, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {28, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {baseX, 0.03, baseZ}) annotation(
    Placement(visible = true, transformation(origin = {-54, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {0, 0, 255}, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-84, -62}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-96, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {28, 92}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {34, 90}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = false, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.never, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {28, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(fixedTranslation.frame_a, frame_a) annotation(
    Line(points = {{-64, -64}, {-84, -64}, {-84, -62}}));
  connect(fixedTranslation.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-44, -64}, {-38, -64}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{-18, -64}, {-6, -64}}, color = {95, 95, 95}));
  connect(bodyShape1.frame_b, fixedFrame2.frame_a) annotation(
    Line(points = {{28, 32}, {28, 44}, {66, 44}}, color = {95, 95, 95}));
  connect(bodyShape.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{14, -64}, {20, -64}, {20, -36}, {-52, -36}, {-52, -22}, {-28, -22}}));
  connect(bodyShape1.frame_b, frame_b) annotation(
    Line(points = {{28, 32}, {28, 92}}, color = {95, 95, 95}));
  connect(bodyShape.frame_b, revolute.frame_a) annotation(
    Line(points = {{14, -64}, {28, -64}, {28, -22}}, color = {95, 95, 95}));
  connect(revolute.frame_b, bodyShape1.frame_a) annotation(
    Line(points = {{28, -2}, {28, 12}}));
end rrr_leg;
