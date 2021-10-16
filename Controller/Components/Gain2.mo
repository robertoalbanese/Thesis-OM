within OM_SP7.Controller.Components;

model Gain2
  import Modelica.Blocks.Interfaces;
  parameter Real k1 "first gain parameter";
  parameter Real k2 "second gain parameter";
  parameter Real threshold "Threshold value";
  Real gain;
  Interfaces.RealInput inputGain2 annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Interfaces.RealOutput outputGain2 annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  Interfaces.RealInput feedbackVelocity annotation(
    Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  gain = if abs(feedbackVelocity) < threshold and threshold > 0 then k1 + abs(feedbackVelocity) / threshold * (k2 - k1) else k2;
  outputGain2 = gain * inputGain2;
  annotation(
    Diagram(graphics = {Polygon(points = {{-100, 100}, {-100, -100}, {100, 0}, {-100, 100}}, lineColor = {0, 0, 225}), Ellipse(extent = {{-10, 10}, {10, -10}}, lineColor = {0, 0, 255}), Line(points = {{0, -100}, {0, -10}}, color = {0, 0, 255}), Text(extent = {{-80, 60}, {0, 0}}, lineColor = {0, 0, 225}, textString = "k1"), Text(extent = {{-80, 0}, {0, -60}}, lineColor = {0, 0, 225}, textString = "k2")}),
    Icon(graphics = {Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Polygon(points = {{-100, 100}, {-100, -100}, {100, 0}, {-100, 100}}, lineColor = {0, 0, 225}), Ellipse(extent = {{-10, 10}, {10, -10}}, lineColor = {0, 0, 255}), Line(points = {{0, -100}, {0, -10}}, color = {0, 0, 255}), Text(extent = {{-80, 60}, {0, 0}}, lineColor = {0, 0, 225}, textString = "k1"), Text(extent = {{-80, 0}, {0, -60}}, lineColor = {0, 0, 225}, textString = "k2")}));
end Gain2;
