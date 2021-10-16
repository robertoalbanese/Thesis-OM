within OM_SP7.Axis;

model VRampAxis
  import Modelica.SIunits;
  import Modelica.SIunits.Conversions.NonSIunits;
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM(IaNominal = nominalCurrent, Jr = motorInertia + gearboxInertia, Ra = armatureResistance, La = armatureInductance, VaNominal = nominalVoltage, wNominal = nominalRPM * 2 * 3.14159265358979323846 / 60) annotation(
    Placement(transformation(extent = {{-30, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(transformation(origin = {-20, 48}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(extent = {{10, 20}, {30, 40}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = gearboxRatio, useSupport = false) annotation(
    Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
    Placement(transformation(extent = {{20, -80}, {0, -60}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(transformation(extent = {{20, -60}, {0, -40}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos = [0, 0.0328; 3, 0.063; 4, 0.0731], useSupport = false) annotation(
    Placement(transformation(extent = {{60, -10}, {80, 10}}, rotation = 0)));
public
  parameter SIunits.Voltage nominalVoltage = 24 "|Motor||";
  parameter SIunits.Current nominalCurrent = 2.36 "|Motor||";
  parameter SIunits.Conversions.NonSIunits.AngularVelocity_rpm nominalRPM = 6700 "|Motor||";
  parameter SIunits.Resistance armatureResistance = 0.978 "|Motor||";
  parameter SIunits.Inductance armatureInductance = 0.000573 "|Motor||";
  parameter SIunits.Inertia motorInertia = 0.0000135 "|Motor||";
  parameter SIunits.Inertia gearboxInertia = 0.000000409 "|Motor||";
  parameter Real gearboxRatio = 100 "|Motor||";
  parameter Integer encoderTickPerRound = 4000 "|Motor||";
  parameter SIunits.AngularAcceleration acceleration = 2 "|Velocity Ramp Generator|| Acceleration";
  parameter Real positionTolerance = 5 "|Velocity Ramp Generator|| Position tolerance, EncoderTick";
  parameter SIunits.AngularVelocity velocityTolerance "|Velocity Ramp Generator|| Velocity tolerance";
  parameter SIunits.Angle stoppingDistanceAdjustment = 0.05 "|Velocity Ramp Generator|| Stopping distance adjusment";
  parameter SIunits.Time startTime = 0.1 "|Velocity Ramp Generator|| Time when Velocity Ramp Generator is active";
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
  parameter SIunits.Current maximumCurrent = 2 "|Velocity Controller|| (A), maximum allowable current set";
  parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
  parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
  parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
  parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
  parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
  parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
  parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
  parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
  parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
  parameter Integer maximumPWM "|Current Controller|| maximum allowable PWM set";
  parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
  parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
  parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
  parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
  parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(extent = {{110, -10}, {130, 10}}, rotation = 0)));
  OM_SP7.Controller.Modes.VRampMode Controller_VRampMode2_1(motorVoltage = nominalVoltage, maximumVelocity = maximumVelocity, thresholdVelocity = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriodVelocity = PIDPeriodVelocity, PParam1Velocity = PParam1Velocity, PParam2Velocity = PParam2Velocity, IParam1Velocity = IParam1Velocity, IParam2Velocity = IParam2Velocity, DParam1Velocity = DParam1Velocity, DParam2Velocity = DParam2Velocity, IClip1Velocity = IClip1Velocity, IClip2Velocity = IClip2Velocity, velocityTolerance = velocityTolerance, PIDPeriodCurrent = PIDPeriodCurrent, PParamCurrent = PParamCurrent, IParamCurrent = IParamCurrent, DParamCurrent = DParamCurrent, IClipCurrent = IClipCurrent, acceleration = acceleration, stoppingDistanceAdjustment = stoppingDistanceAdjustment, PIDPeriodPosition = PIDPeriodPosition, PParam1Position = PParam1Position, PParam2Position = PParam2Position, IParam1Position = IParam1Position, IParam2Position = IParam2Position, DParam1Position = DParam1Position, DParam2Position = DParam2Position, IClip1Position = IClip1Position, IClip2Position = IClip2Position, thresholdPosition = thresholdPosition, startTime = 1, positionTolerance = positionTolerance / encoderTickPerRound * (65535 / encoderTickPerRound) * 2 / idealGear.ratio * Modelica.Constants.pi) annotation(
    Placement(transformation(extent = {{-90, 60}, {-48, 80}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput setPosition annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
equation
  connect(ground.p, signalVoltage.p) annotation(
    Line(points = {{20, 40}, {20, 48}, {-10, 48}}, color = {0, 0, 255}));
  connect(idealGear.flange_b, bearingFriction.flange_a) annotation(
    Line(points = {{40, 0}, {60, 0}}, color = {0, 0, 0}));
  Controller_VRampMode2_1.currentFeedback = DCPM.airGapDC.ia;
  connect(signalVoltage.n, DCPM.pin_an) annotation(
    Line(points = {{-30, 48}, {-40, 48}, {-40, 10}, {-26, 10}}, color = {0, 0, 255}));
  connect(signalVoltage.p, DCPM.pin_ap) annotation(
    Line(points = {{-10, 48}, {0, 48}, {0, 10}, {-14, 10}}, color = {0, 0, 255}));
  connect(speedSensor.flange, flange_b) annotation(
    Line(points = {{20, -50}, {100, -50}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
  connect(bearingFriction.flange_b, flange_b) annotation(
    Line(points = {{80, 0}, {120, 0}}, color = {0, 0, 0}));
  connect(angleSensor.flange, flange_b) annotation(
    Line(points = {{20, -70}, {100, -70}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
  connect(DCPM.flange, idealGear.flange_a) annotation(
    Line(points = {{-10, 0}, {20, 0}}, color = {0, 0, 0}));
  connect(angleSensor.phi, Controller_VRampMode2_1.positionFeedback) annotation(
    Line(points = {{-1, -70}, {-83.7, -70}, {-83.7, 62.2}}, color = {0, 0, 127}));
  connect(Controller_VRampMode2_1.setVoltage, signalVoltage.v) annotation(
    Line(points = {{-50.1, 70}, {-20, 70}, {-20, 55}}, color = {0, 0, 127}));
  connect(setPosition, Controller_VRampMode2_1.setPosition) annotation(
    Line(points = {{-120, 0}, {-100, 0}, {-100, 70}, {-87.9, 70}}, color = {0, 0, 127}));
  connect(speedSensor.w, Controller_VRampMode2_1.velocityFeedback) annotation(
    Line(points = {{-1, -50}, {-64.8, -50}, {-64.8, 62}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Line(points = {{-58, 62}, {-58, 0}, {-30, 0}}, color = {0, 0, 255}, pattern = LinePattern.Dot)}),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Rectangle(extent = {{-140, 60}, {140, -60}}, lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-100, 40}, {100, 0}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, textString = "VRamp"), Text(extent = {{-102, -2}, {98, -42}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, textString = "Axis"), Text(extent = {{-140, 100}, {140, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
end VRampAxis;
