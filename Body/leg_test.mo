within OM_SP7.Body;

model leg_test
import Modelica.SIunits;
  import Modelica.Math;
  import Modelica.Constants;
  
  parameter SIunits.Length h = 0.2 "Rotational motor's horn anchor length";
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  parameter SIunits.Angle alpha = Modelica.SIunits.Conversions.from_deg(120);
parameter Integer lefPositionConfig[2]={0,-1}"motorPair = 0/1/2   |   legPosition = -1(right)/1(left)";
  Modelica.Mechanics.MultiBody.Parts.BodyShape rod(m = 0.01, r = {-h * sin(lefPositionConfig[1] * alpha), 0.5, h * cos(lefPositionConfig[1] * alpha)}, r_CM = {-h * sin(lefPositionConfig[1] * alpha) / 2, 0.25, h * cos(lefPositionConfig[1] * alpha) / 2}, useQuaternions = useQuat) annotation(
    Placement(visible = true, transformation(origin = {28, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape horn(m = 0.01, r = {h * sin(lefPositionConfig[1] * alpha), 0, -h * cos(lefPositionConfig[1] * alpha)}, r_CM = {h * sin(lefPositionConfig[1] * alpha) / 2, 0 / 2, -h * cos(lefPositionConfig[1] * alpha) / 2}, useQuaternions = useQuat) annotation(
    Placement(visible = true, transformation(origin = {-26, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical j2(sequence_angleStates = {2, 3, 1}, useQuaternions = useQuat) annotation(
    Placement(visible = true, transformation(origin = {0, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(n = {cos(lefPositionConfig[1] * alpha), 0, sin(lefPositionConfig[1] * alpha)}, phi(displayUnit = "rad", fixed = false), useAxisFlange = true, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical j3(useQuaternions = useQuat) annotation(
    Placement(visible = true, transformation(origin = {56, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-82, 4}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 4}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {86, 4}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(j1.frame_b, horn.frame_a) annotation(
    Line(points = {{-46, 4}, {-34, 4}}));
  connect(horn.frame_b, j2.frame_a) annotation(
    Line(points = {{-18, 4}, {-8, 4}}, color = {95, 95, 95}));
  connect(j2.frame_b, rod.frame_a) annotation(
    Line(points = {{8, 4}, {20, 4}}, color = {95, 95, 95}));
  connect(rod.frame_b, j3.frame_a) annotation(
    Line(points = {{36, 4}, {48, 4}}, color = {95, 95, 95}));
  connect(j3.frame_b, frame_b) annotation(
    Line(points = {{64, 4}, {86, 4}}, color = {95, 95, 95}));
  connect(j1.frame_a, frame_a) annotation(
    Line(points = {{-62, 4}, {-82, 4}}, color = {95, 95, 95}));

annotation(
    Icon(graphics = {Rectangle(origin = {6, -69}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {25.4355, 0.7005}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Ellipse(origin = {-11, 78}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {55, -68}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Ellipse(origin = {-42, -69}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360)}));
end leg_test;
