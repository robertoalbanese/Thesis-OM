within OM_SP7.Controller.Modes;

model PositionMode
  import Modelica.SIunits;
  import Modelica.Blocks.Interfaces;
  import OM_SP7;
  Interfaces.RealInput positionFeedback annotation(
    Placement(transformation(origin = {-120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.RealInput velocityFeedback annotation(
    Placement(transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.RealInput currentFeedback annotation(
    Placement(transformation(origin = {90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OM_SP7.Controller.PIDs.PositionPID positionPID(threshold = thresholdPosition, IClip1 = IClip1Position, IClip2 = IClip2Position, PParam1 = PParam1Position, PParam2 = PParam2Position, IParam1 = IParam1Position, IParam2 = IParam2Position, DParam1 = DParam1Position, DParam2 = DParam2Position, encoderTickPerRound = encoderTickPerRound, maximumVelocity = maximumVelocity, gearRatio = gearRatio, PIDPeriod = PIDPeriodPosition) annotation(
    Placement(transformation(extent = {{-90, -10}, {-50, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.VelocityPID velocityPID(PParam1 = PParam1Velocity, PParam2 = PParam2Velocity, IClip1 = IClip1Velocity, IClip2 = IClip2Velocity, IParam1 = IParam1Velocity, IParam2 = IParam2Velocity, DParam1 = DParam1Velocity, DParam2 = DParam2Velocity, threshold = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriod = PIDPeriodVelocity) annotation(
    Placement(transformation(extent = {{-20, -10}, {20, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.CurrentPID currentPID(maximumPWM = maximumPWM, PIDPeriod = PIDPeriodCurrent, IClip = IClipCurrent, PParam = PParamCurrent, IParam = IParamCurrent, DParam = DParamCurrent) annotation(
    Placement(transformation(extent = {{70, -10}, {110, 10}}, rotation = 0)));
  Interfaces.RealOutput setVoltage annotation(
    Placement(transformation(extent = {{170, -10}, {190, 10}}, rotation = 0)));
  OM_SP7.Controller.Components.P2V P2V1(maximumVoltage = motorVoltage, maximumPWM = maximumPWM) annotation(
    Placement(transformation(extent = {{130, -10}, {150, 10}}, rotation = 0)));
public
  parameter Real gearRatio = 156 "Gearbox Ratio";
  parameter Integer encoderTickPerRound = 4000 "Motor Encoder Tick";
  parameter SIunits.AngularVelocity thresholdPosition "|Position Controller|| threshold velocity for position controller";
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
  parameter Real motorVoltage "(V) Source voltage";
  Modelica.Blocks.Interfaces.RealInput setPosition annotation(
    Placement(transformation(extent = {{-190, -10}, {-170, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(extent = {{-130, -10}, {-110, 10}}, rotation = 0)));
equation
  connect(setPosition, feedback.u1) annotation(
    Line(points = {{-180, 0}, {-128, 0}}, color = {0, 0, 127}));
  connect(positionFeedback, feedback.u2) annotation(
    Line(points = {{-120, -80}, {-120, -8}}, color = {0, 0, 127}));
  connect(P2V1.outputVoltage, setVoltage) annotation(
    Line(points = {{151, 0}, {180, 0}}, color = {0, 0, 127}));
  connect(feedback.y, positionPID.positionError) annotation(
    Line(points = {{-111, 0}, {-92, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, positionPID.velocityFeedback) annotation(
    Line(points = {{0, -80}, {0, -40}, {-70, -40}, {-70, -12}}, color = {0, 0, 127}));
  connect(positionPID.setVelocity, velocityPID.setVelocity) annotation(
    Line(points = {{-48, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, velocityPID.velocityFeedback) annotation(
    Line(points = {{0, -80}, {0, -12}}, color = {0, 0, 127}));
  connect(velocityPID.setCurrent, currentPID.setCurrent) annotation(
    Line(points = {{22, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(currentFeedback, currentPID.currentFeedback) annotation(
    Line(points = {{90, -80}, {90, -12}}, color = {0, 0, 127}));
  connect(currentPID.setPWM, P2V1.inputPWM) annotation(
    Line(points = {{112, 0}, {128, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-160, 60}, {140, 0}}, lineColor = {0, 0, 255}, textString = "Position"), Text(extent = {{-160, 0}, {140, -60}}, lineColor = {0, 0, 255}, textString = "Mode")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics));
end PositionMode;
