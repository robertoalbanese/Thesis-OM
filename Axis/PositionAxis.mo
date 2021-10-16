within OM_SP7.Axis;

model PositionAxis
  import Modelica.SIunits;
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM(IaNominal = nominalCurrent, Jr = motorInertia + gearboxInertia, La = armatureInductance, Ra = armatureResistance, VaNominal = nominalVoltage, phiMechanical(displayUnit = "rad"), wMechanical(displayUnit = "rad/s"), wNominal = nominalRPM * 2 * 3.14159265358979323846 / 60) annotation(
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
    Placement(visible = true, transformation(extent = {{62, -10}, {82, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput setPosition annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180), iconTransformation(extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  parameter SIunits.Voltage nominalVoltage = 24 "|Motor||";
  parameter SIunits.Current nominalCurrent = 2.36 "|Motor||";
  parameter SIunits.Conversions.NonSIunits.AngularVelocity_rpm nominalRPM = 6700 "|Motor||";
  parameter SIunits.Resistance armatureResistance = 0.978 "|Motor||";
  parameter SIunits.Inductance armatureInductance = 0.000573 "|Motor||";
  parameter SIunits.Inertia motorInertia = 0.0000135 "|Motor||";
  parameter SIunits.Inertia gearboxInertia = 0.000000409 "|Motor||";
  parameter Real gearboxRatio = 100 "|Motor||";
  parameter Integer encoderTickPerRound = 4000 "|Motor||";
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
  OM_SP7.Controller.Modes.PositionMode positionMode(motorVoltage = nominalVoltage, encoderTickPerRound = encoderTickPerRound, thresholdPosition = thresholdPosition, maximumVelocity = maximumVelocity, PIDPeriodPosition = PIDPeriodPosition, PParam1Position = PParam1Position, PParam2Position = PParam2Position, IParam1Position = IParam1Position, IParam2Position = IParam2Position, DParam1Position = DParam1Position, DParam2Position = DParam2Position, IClip1Position = IClip1Position, IClip2Position = IClip2Position, thresholdVelocity = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriodVelocity = PIDPeriodVelocity, PParam1Velocity = PParam1Velocity, PParam2Velocity = PParam2Velocity, IParam1Velocity = IParam1Velocity, IParam2Velocity = IParam2Velocity, DParam1Velocity = DParam1Velocity, DParam2Velocity = DParam2Velocity, IClip1Velocity = IClip1Velocity, IClip2Velocity = IClip2Velocity, maximumPWM = maximumPWM, PIDPeriodCurrent = PIDPeriodCurrent, PParamCurrent = PParamCurrent, IParamCurrent = IParamCurrent, DParamCurrent = DParamCurrent, IClipCurrent = IClipCurrent, gearRatio = idealGear.ratio) annotation(
    Placement(visible = true, transformation(extent = {{-88, 60}, {-48, 80}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(extent = {{110, -10}, {130, 10}}, rotation = 0)));
equation
  connect(ground.p, signalVoltage.p) annotation(
    Line(points = {{20, 40}, {20, 48}, {-10, 48}}, color = {0, 0, 255}));
  connect(idealGear.flange_b, bearingFriction.flange_a) annotation(
    Line(points = {{40, 0}, {62, 0}}));
  positionMode.currentFeedback = DCPM.airGapDC.ia;
  connect(signalVoltage.n, DCPM.pin_an) annotation(
    Line(points = {{-30, 48}, {-40, 48}, {-40, 10}, {-26, 10}}, color = {0, 0, 255}));
  connect(signalVoltage.p, DCPM.pin_ap) annotation(
    Line(points = {{-10, 48}, {0, 48}, {0, 10}, {-14, 10}}, color = {0, 0, 255}));
  connect(bearingFriction.flange_b, flange_b) annotation(
    Line(points = {{82, 0}, {120, 0}}));
  connect(speedSensor.flange, flange_b) annotation(
    Line(points = {{20, -50}, {100, -50}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
  connect(angleSensor.flange, flange_b) annotation(
    Line(points = {{20, -70}, {100, -70}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
  connect(DCPM.flange, idealGear.flange_a) annotation(
    Line(points = {{-10, 0}, {20, 0}}, color = {0, 0, 0}));
  connect(setPosition, positionMode.setPosition) annotation(
    Line(points = {{-120, 0}, {-100, 0}, {-100, 70}, {-86, 70}}, color = {0, 0, 127}));
  connect(speedSensor.w, positionMode.velocityFeedback) annotation(
    Line(points = {{-1, -50}, {-68, -50}, {-68, 62}}, color = {0, 0, 127}));
  connect(angleSensor.phi, positionMode.positionFeedback) annotation(
    Line(points = {{-1, -70}, {-80, -70}, {-80, 62}}, color = {0, 0, 127}));
  connect(positionMode.setVoltage, signalVoltage.v) annotation(
    Line(points = {{-50, 70}, {-20, 70}, {-20, 55}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Line(origin = {-0.863013, -4.0394e-05},points = {{0, 0}, {-58, 0}, {-58, 62}}, color = {0, 0, 255}, pattern = LinePattern.Dot)}),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Rectangle(lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-140, 60}, {140, -60}}), Text(pattern = LinePattern.None, extent = {{-100, 40}, {100, 0}}, textString = "Position"), Text(pattern = LinePattern.None, extent = {{-102, -2}, {98, -42}}, textString = "Axis"), Text(lineColor = {0, 0, 255}, extent = {{-140, 100}, {140, 60}}, textString = "%name")}));
end PositionAxis;
