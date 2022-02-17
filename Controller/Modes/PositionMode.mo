within OM_SP7.Controller.Modes;

model PositionMode
  import Modelica.SIunits;
  import Modelica.Blocks.Interfaces;
  import OM_SP7;
  Interfaces.RealInput positionFeedback annotation(
    Placement(transformation(origin = {-120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput velocityFeedback annotation(
    Placement(visible = true, transformation(origin = {-28, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(extent = {{-10, -90}, {10, -70}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput currentFeedback annotation(
    Placement(visible = true, transformation(origin = {52, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(extent = {{110, -90}, {130, -70}}, rotation = 90)));
  OM_SP7.Controller.PIDs.PositionPID positionPID(DParam = DParamPosition, IClip = IClipPosition, IParam = IParamPosition, PIDPeriod = PIDPeriodPosition, PParam = PParamPosition, encoderTickPerRound = encoderTickPerRound, gearRatio = gearRatio, maximumVelocity = maximumVelocity) annotation(
    Placement(transformation(extent = {{-90, -10}, {-50, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.VelocityPID velocityPID(DParam = DParamVelocity, IClip = IClipVelocity, IParam = IParamVelocity, PIDPeriod = PIDPeriodVelocity, PParam = PParamVelocity, maximumCurrent = maximumCurrent) annotation(
    Placement(visible = true, transformation(extent = {{-6, -10}, {34, 10}}, rotation = 0)));
  OM_SP7.Controller.PIDs.CurrentPID currentPID(maximumPWM = maximumPWM, PIDPeriod = PIDPeriodCurrent, IClip = IClipCurrent, PParam = PParamCurrent, IParam = IParamCurrent, DParam = DParamCurrent) annotation(
    Placement(transformation(extent = {{70, -10}, {110, 10}}, rotation = 0)));
  Interfaces.RealOutput setVoltage annotation(
    Placement(transformation(extent = {{170, -10}, {190, 10}}, rotation = 0)));
  OM_SP7.Controller.Components.P2V P2V1(maximumVoltage = motorVoltage, maximumPWM = maximumPWM) annotation(
    Placement(transformation(extent = {{130, -10}, {150, 10}}, rotation = 0)));
  parameter Real gearRatio = 156 "Gearbox Ratio";
  parameter Integer encoderTickPerRound = 4000 "Motor Encoder Tick";
  parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
  parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
  parameter Integer PParamPosition "|Position Controller||  parameter for proportional gain in position controller";
  parameter Integer IParamPosition "|Position Controller||  parameter for integral gain in position controller";
  parameter Integer DParamPosition "|Position Controller||  parameter for derivative gain in position controller";
  parameter Integer IClipPosition "|Position Controller||  parameter for integral clip in position controller";
  parameter Modelica.SIunits.Current maximumCurrent = 2.68 "|Velocity Controller|| maximum allowable current set";
  parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
  parameter Integer PParamVelocity "|Velocity Controller||  parameter for proportional gain in velocity controller";
  parameter Integer IParamVelocity "|Velocity Controller||  parameter for integral gain in velocity controller";
  parameter Integer DParamVelocity "|Velocity Controller||  parameter for derivative gain in velocity controller";
  parameter Integer IClipVelocity "|Velocity Controller||  parameter for integral clip in velocity controller";
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
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(extent = {{-38, -10}, {-18, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(visible = true, transformation(extent = {{42, -10}, {62, 10}}, rotation = 0)));
equation
  connect(setPosition, feedback.u1) annotation(
    Line(points = {{-180, 0}, {-128, 0}}, color = {0, 0, 127}));
  connect(positionFeedback, feedback.u2) annotation(
    Line(points = {{-120, -80}, {-120, -8}}, color = {0, 0, 127}));
  connect(P2V1.outputVoltage, setVoltage) annotation(
    Line(points = {{151, 0}, {180, 0}}, color = {0, 0, 127}));
  connect(feedback.y, positionPID.positionError) annotation(
    Line(points = {{-111, 0}, {-92, 0}}, color = {0, 0, 127}));
  connect(currentPID.setPWM, P2V1.inputPWM) annotation(
    Line(points = {{112, 0}, {128, 0}}, color = {0, 0, 127}));
  connect(positionPID.setVelocity, feedback1.u1) annotation(
    Line(points = {{-48, 0}, {-36, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, feedback1.u2) annotation(
    Line(points = {{-28, -78}, {-28, -8}}, color = {0, 0, 127}));
  connect(velocityPID.setCurrent, feedback2.u1) annotation(
    Line(points = {{36, 0}, {44, 0}}, color = {0, 0, 127}));
  connect(feedback2.y, currentPID.setCurrent) annotation(
    Line(points = {{62, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(feedback2.u2, currentFeedback) annotation(
    Line(points = {{52, -8}, {52, -78}}, color = {0, 0, 127}));
  connect(feedback1.y, velocityPID.setVelocity) annotation(
    Line(points = {{-18, 0}, {-8, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-200, 100}, {200, -100}}), Text(textColor = {0, 0, 255}, extent = {{-160, 60}, {140, 0}}, textString = "Position"), Text(textColor = {0, 0, 255}, extent = {{-160, 0}, {140, -60}}, textString = "Mode")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics));
end PositionMode;
