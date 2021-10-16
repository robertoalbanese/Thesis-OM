within OM_SP7.Controller.Modes;

model VRampMode
  import OM_SP7;
  import Modelica.SIunits;
  import Modelica.Blocks.Math;
  import Modelica.Blocks.Interfaces;
  Interfaces.RealInput positionFeedback annotation(
    Placement(transformation(origin = {-140, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.RealInput velocityFeedback annotation(
    Placement(transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.RealInput currentFeedback annotation(
    Placement(transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OM_SP7.Controller.PIDs.VelocityPID velocityPID(PParam1 = PParam1Velocity, PParam2 = PParam2Velocity, IClip1 = IClip1Velocity, IClip2 = IClip2Velocity, IParam1 = IParam1Velocity, IParam2 = IParam2Velocity, DParam1 = DParam1Velocity, DParam2 = DParam2Velocity, threshold = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriod = PIDPeriodVelocity) annotation(
    Placement(transformation(extent = {{20, -10}, {60, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.CurrentPID currentPID(maximumPWM = maximumPWM, PIDPeriod = PIDPeriodCurrent, IClip = IClipCurrent, PParam = PParamCurrent, IParam = IParamCurrent, DParam = DParamCurrent) annotation(
    Placement(transformation(extent = {{80, -10}, {120, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput setVoltage annotation(
    Placement(transformation(extent = {{170, -10}, {190, 10}}, rotation = 0)));
  OM_SP7.Controller.Components.P2V P2V1(maximumVoltage = motorVoltage, maximumPWM = 1799) annotation(
    Placement(transformation(extent = {{140, -10}, {160, 10}}, rotation = 0)));
public
  parameter Integer encoderTickPerRound = 4000 "Motor Encoder Tick";
  parameter Real gearRatio = 156 "Gearbox Ratio";
  parameter SIunits.AngularVelocity thresholdPosition = 0 "|Position Controller|| threshold velocity for position controller";
  parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
  parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
  parameter Integer PParam1Position "|Position Controller|| first parameter for proportional gain in position controller";
  parameter Integer PParam2Position "|Position Controller|| second parameter for proportional gain in position controller";
  parameter Integer IParam1Position "|Position Controller|| first parameter for integral gain in position controller";
  parameter Integer IParam2Position "|Position Controller|| second parameter for integral gain in position controller";
  parameter Integer DParam1Position "|Position Controller|| first parameter for derivative gain in position controller";
  parameter Integer DParam2Position "|Position Controller|| second parameter for derivative gain in position controller";
  parameter Integer IClip1Position "|Position Controller|| first parameter for integral clip in position controller";
  parameter Integer IClip2Position "|Position Controller|| second parameter for integral clip in position controller";
  parameter SIunits.AngularAcceleration acceleration "|Velocity Ramp Generator|| Acceleration";
  parameter SIunits.Angle positionTolerance "|Velocity Ramp Generator|| Position tolerance";
  parameter SIunits.AngularVelocity velocityTolerance "|Velocity Ramp Generator|| Velocity tolerance";
  parameter SIunits.Angle stoppingDistanceAdjustment = 0.05 "|Velocity Ramp Generator|| Stopping distance adjusment";
  parameter SIunits.Time startTime = 0.1 "|Velocity Ramp Generator|| Time when Velocity Ramp Generator is active";
  parameter SIunits.AngularVelocity thresholdVelocity "|Velocity Controller|| threshold velocity for velocity controller";
  parameter Modelica.SIunits.Current maximumCurrent = 2.68 "|Velocity Controller|| maximum allowable current set";
  parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
  parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
  parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
  parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
  parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
  parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
  parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
  parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
  parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
  parameter Integer maximumPWM = 32767 "|Current Controller|| maximum allowable PWM set";
  parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
  parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
  parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
  parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
  parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
  parameter SIunits.Voltage motorVoltage " Source voltage";
  OM_SP7.Controller.Components.VelocityRampGenerator velocityRampGenerator(maximumVelocity = maximumVelocity, acceleration = acceleration, positionTolerance = positionTolerance, velocityTolerance = velocityTolerance, stoppingDistanceAdjustment = stoppingDistanceAdjustment, startTime = startTime) annotation(
    Placement(transformation(extent = {{-110, 20}, {-90, 40}}, rotation = 0)));
  Interfaces.RealInput setPosition annotation(
    Placement(transformation(extent = {{-190, -10}, {-170, 10}}, rotation = 0)));
  Math.Feedback feedback annotation(
    Placement(transformation(extent = {{-150, -10}, {-130, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.PositionPID positionPID(threshold = thresholdPosition, IClip1 = IClip1Position, IClip2 = IClip2Position, PParam1 = PParam1Position, PParam2 = PParam2Position, IParam1 = IParam1Position, IParam2 = IParam2Position, DParam1 = DParam1Position, DParam2 = DParam2Position, encoderTickPerRound = encoderTickPerRound, maximumVelocity = maximumVelocity, gearRatio = gearRatio, PIDPeriod = PIDPeriodPosition) annotation(
    Placement(transformation(extent = {{-80, -40}, {-40, -20}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch annotation(
    Placement(transformation(extent = {{-14, -10}, {6, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanStep BooleanStep1(startTime = startTime, startValue = false) annotation(
    Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
equation
  connect(setPosition, feedback.u1) annotation(
    Line(points = {{-180, 0}, {-148, 0}}, color = {0, 0, 127}));
  connect(positionFeedback, feedback.u2) annotation(
    Line(points = {{-140, -78}, {-140, -8}}, color = {0, 0, 127}));
  connect(P2V1.outputVoltage, setVoltage) annotation(
    Line(points = {{161, 0}, {180, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, positionPID.velocityFeedback) annotation(
    Line(points = {{40, -80}, {40, -60}, {-60, -60}, {-60, -42}}, color = {0, 0, 127}));
  connect(switch.y, velocityPID.setVelocity) annotation(
    Line(points = {{7, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, velocityPID.velocityFeedback) annotation(
    Line(points = {{40, -80}, {40, -12}}, color = {0, 0, 127}));
  connect(feedback.y, positionPID.positionError) annotation(
    Line(points = {{-131, 0}, {-120, 0}, {-120, -30}, {-82, -30}}, color = {0, 0, 127}));
  connect(positionPID.setVelocity, switch.u3) annotation(
    Line(points = {{-38, -30}, {-30, -30}, {-30, -8}, {-16, -8}}, color = {0, 0, 127}));
  connect(velocityPID.setCurrent, currentPID.setCurrent) annotation(
    Line(points = {{62, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(currentFeedback, currentPID.currentFeedback) annotation(
    Line(points = {{100, -80}, {100, -12}}, color = {0, 0, 127}));
  connect(currentPID.setPWM, P2V1.inputPWM) annotation(
    Line(points = {{122, 0}, {138, 0}}, color = {0, 0, 127}));
  connect(feedback.y, velocityRampGenerator.feedbackPosition) annotation(
    Line(points = {{-131, 0}, {-120, 0}, {-120, 30}, {-112, 30}}, color = {0, 0, 127}));
  connect(velocityFeedback, velocityRampGenerator.feedbackVelocity) annotation(
    Line(points = {{40, -80}, {40, -60}, {-100, -60}, {-100, 18}}, color = {0, 0, 127}));
  connect(velocityRampGenerator.setVelocity, switch.u1) annotation(
    Line(points = {{-89, 30}, {-30, 30}, {-30, 8}, {-16, 8}}, color = {0, 0, 127}));
  connect(BooleanStep1.y, switch.u2) annotation(
    Line(points = {{-59, 0}, {-16, 0}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-160, 60}, {140, 0}}, lineColor = {0, 0, 255}, textString = "VRAmp"), Text(extent = {{-160, 0}, {140, -60}}, lineColor = {0, 0, 255}, textString = "Mode")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics));
end VRampMode;
