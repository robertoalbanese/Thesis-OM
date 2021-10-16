within OM_SP7.Controller.Components;

model VelocityRampGenerator
  import Modelica.SIunits;
  import Modelica.Blocks.Interfaces;
  parameter SIunits.AngularVelocity maximumVelocity;
  parameter SIunits.AngularAcceleration acceleration;
  parameter SIunits.Angle positionTolerance;
  parameter SIunits.AngularVelocity velocityTolerance;
  parameter SIunits.Angle stoppingDistanceAdjustment = 0.1;
  SIunits.AngularAcceleration setAcceleration;
  SIunits.AngularVelocity velocity;
  SIunits.Angle stoppingDistance;
  parameter SIunits.Time startTime = 1 "Start time when Velocity Ramp Generator is active";
  Boolean positionEndFlag(start = false);
  Boolean positionReachFlag(start = true);
  Interfaces.RealInput feedbackPosition annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Interfaces.RealOutput setVelocity annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
public
  Interfaces.RealInput feedbackVelocity annotation(
    Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  positionReachFlag = if abs(feedbackPosition) < positionTolerance and abs(feedbackVelocity) < velocityTolerance then true else false;
  stoppingDistance = 0.5 * feedbackVelocity ^ 2 / acceleration + stoppingDistanceAdjustment;
  positionEndFlag = if positionReachFlag then false else if abs(feedbackPosition) > stoppingDistance then false else true;
  setAcceleration = if positionEndFlag then if abs(velocity) < 0.001 then 0 else if velocity < 0 then acceleration else -acceleration else if positionReachFlag or time < startTime then 0 else if abs(velocity) < maximumVelocity then if feedbackPosition < 0 then -acceleration else acceleration else 0;
  der(velocity) = setAcceleration;
  velocity = setVelocity;
  when positionReachFlag and abs(velocity) > 0 then
    reinit(velocity, 0);
  end when;
  annotation(
    extent = [12, -38; 32, -18],
    Diagram(graphics),
    Icon(graphics = {Line(points = {{-60, 60}, {-60, -60}, {60, -60}}, color = {0, 0, 255}), Line(points = {{-40, -60}, {-20, 0}, {20, 0}, {40, -60}}, color = {0, 0, 0}), Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
    Placement(transformation(extent = {{12, -38}, {32, -18}}, rotation = 0)),
    Diagram);
end VelocityRampGenerator;
