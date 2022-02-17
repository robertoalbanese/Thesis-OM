within OM_SP7.Axis;

model FDL_DCPositionAxis
  import Modelica.SIunits;

  Modelica.Blocks.Interfaces.RealInput setPosition annotation(
    Placement(visible = true, transformation(origin = {-118, 60}, extent = {{10, 10}, {-10, -10}}, rotation = 180), iconTransformation(extent = {{-140, 10}, {-160, -10}}, rotation = 180)));
  parameter SIunits.Voltage nominalVoltage = 48 "|Motor||";
  parameter SIunits.Current nominalCurrent = 14.4 "|Motor||";
  parameter Modelica.SIunits.Temp_K nominalTemperature = 313.15 "|Motor||";
  parameter SIunits.Conversions.NonSIunits.AngularVelocity_rpm nominalRPM = 2500 "|Motor||";
  parameter SIunits.Resistance armatureResistance = 0.12 "|Motor||";
  parameter SIunits.Inductance armatureInductance = 0.00031 "|Motor||";
  parameter SIunits.Inertia motorInertia = 0.000116 "|Motor||";
  parameter SIunits.Inertia gearboxInertia = 0.000000409 "|Motor||";
  parameter Real gearboxRatio = 150 "|Motor||";
  parameter .Modelica.Blocks.Types.SimpleController controllerType=
         .Modelica.Blocks.Types.SimpleController.PID "||PID Controller|| Type of controller";
  parameter Real pidGain "||PID Controller|| controller pid gain";
  parameter Real Ti "||PID Controller|| Time constant of Integrator block";
  parameter Real Td "||PID Controller|| Time constant of Derivative block";
  parameter Modelica.SIunits.Current maximumCurrent = 39.8 "||PI Controller|| maximum allowable current set";
  parameter Real wd = 10 "||PI Controller|| Set-point weight for Proportional block (0..1)";
  parameter Real wp = 1 "||PI Controller|| Set-point weight for Derivative block (0..1)";
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(extent = {{110, -10}, {130, 10}}, rotation = 0), iconTransformation(extent = {{140, -10}, {160, 10}}, rotation = 0)));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM(IaNominal = nominalCurrent, Jr(start = motorInertia) = motorInertia + gearboxInertia, La = armatureInductance, Ra = armatureResistance, TaNominal = nominalTemperature, VaNominal = nominalVoltage, phiMechanical(displayUnit = "rad"), wMechanical(displayUnit = "rad/s"), wNominal = nominalRPM * 2 * 3.14159265358979323846 / 60) annotation(
    Placement(visible = true, transformation(extent = {{8, -10}, {28, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
    Placement(visible = true, transformation(origin = {36, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(visible = true, transformation(extent = {{26, 36}, {6, 56}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = 150, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{56, -10}, {76, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-4, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {26, 26}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.LimPID PID(Td = Td, Ti = Ti, controllerType = controllerType, initType = Modelica.Blocks.Types.InitPID.InitialOutput, k = pidGain, kFF = 1, limitsAtInit = true, wd = wd, withFeedForward = true, wp = wp, yMax = maximumCurrent) annotation(
    Placement(visible = true, transformation(extent = {{-76, 50}, {-56, 70}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.1, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1, y_start = 0) annotation(
    Placement(visible = true, transformation(extent = {{-40, 50}, {-20, 70}}, rotation = 0)));
equation
//positionMode.currentFeedback = DCPM.airGapDC.ia;
  connect(PID.y, firstOrder.u) annotation(
    Line(points = {{-55, 60}, {-43, 60}}, color = {0, 0, 127}));
  connect(angleSensor.phi, PID.u_m) annotation(
    Line(points = {{25, -44}, {-66, -44}, {-66, 48}}, color = {0, 0, 127}));
  connect(DCPM.pin_ap, currentSensor.n) annotation(
    Line(points = {{24, 10}, {26, 10}, {26, 16}}, color = {0, 0, 255}));
  connect(signalVoltage.n, ground.p) annotation(
    Line(points = {{6, 46}, {6, 16}}, color = {0, 0, 255}));
  connect(ground.p, DCPM.pin_an) annotation(
    Line(points = {{6, 16}, {12, 16}, {12, 10}}, color = {0, 0, 255}));
  connect(signalVoltage.p, currentSensor.p) annotation(
    Line(points = {{26, 46}, {26, 36}}, color = {0, 0, 255}));
  connect(firstOrder.y, signalVoltage.v) annotation(
    Line(points = {{-19, 60}, {16, 60}, {16, 58}}, color = {0, 0, 127}));
  connect(currentSensor.i, PID.u_ff) annotation(
    Line(points = {{37, 26}, {45, 26}, {45, -26}, {-60, -26}, {-60, 48}}, color = {0, 0, 127}));
  connect(idealGear.flange_b, angleSensor.flange) annotation(
    Line(points = {{76, 0}, {80, 0}, {80, -44}, {46, -44}}));
  connect(DCPM.flange, idealGear.flange_a) annotation(
    Line(points = {{28, 0}, {56, 0}}));
  connect(setPosition, PID.u_s) annotation(
    Line(points = {{-118, 60}, {-78, 60}}, color = {0, 0, 127}));
  connect(idealGear.flange_b, flange_b) annotation(
    Line(points = {{76, 0}, {120, 0}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Rectangle(lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-140, 60}, {140, -60}}), Text(origin = {-3, 2}, extent = {{-87, 26}, {87, 0}}, textString = "Position PID"), Text(origin = {-2, 0}, extent = {{-86, -1}, {82, -28}}, textString = "DC driver"), Text(textColor = {0, 0, 255}, extent = {{-140, 100}, {140, 60}}, textString = "%name")}));
end FDL_DCPositionAxis;
