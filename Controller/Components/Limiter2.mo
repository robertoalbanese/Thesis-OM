within OM_SP7.Controller.Components;

model Limiter2 "Clip signal with a threshold and 2 parameter set"
  Real clip;
  import Modelica.Blocks.Interfaces;
  parameter Real k1 "first clip value";
  parameter Real k2 "second clip value";
  parameter Real threshold "Threshold value";
  Interfaces.RealInput inputClip annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Interfaces.RealOutput outputClip annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  Interfaces.RealInput feedbackVelocity annotation(
    Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  clip = if abs(feedbackVelocity) < threshold and threshold > 0 then k1 + abs(feedbackVelocity) / threshold * (k2 - k1) else k2;
  outputClip = if abs(inputClip) < clip then inputClip else if abs(inputClip) > clip and inputClip > 0 then clip else -clip;
  annotation(
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{60, 60}, {100, 20}}, lineColor = {0, 0, 255}, textString = "k2"), Text(extent = {{60, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "k1"), Line(points = {{0, 80}, {0, -80}}, color = {0, 0, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {0, 0, 255}), Line(points = {{80, 60}, {20, 60}, {-20, -60}, {-80, -60}}, color = {95, 95, 95}), Line(points = {{80, 20}, {18, 20}, {-20, -20}, {-80, -20}}, color = {95, 95, 95}, pattern = LinePattern.Dot, thickness = 0.5)}),
    Icon(graphics = {Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{60, 60}, {100, 20}}, lineColor = {0, 0, 255}, textString = "k2"), Text(extent = {{60, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "k1"), Line(points = {{-80, 0}, {80, 0}}, color = {0, 0, 255}), Line(points = {{80, 60}, {20, 60}, {-20, -60}, {-80, -60}}, color = {95, 95, 95}), Line(points = {{80, 20}, {18, 20}, {-20, -20}, {-80, -20}}, color = {95, 95, 95}, pattern = LinePattern.Dot, thickness = 0.5), Line(points = {{0, 80}, {0, -80}}, color = {0, 0, 255})}),
    DymolaStoredErrors);
end Limiter2;
