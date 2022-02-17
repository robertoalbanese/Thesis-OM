within OM_SP7.Controller.PIDs;

model PositionPID
  import Modelica.SIunits;
  import OM_SP7.Controller.Components;
  Modelica.Blocks.Interfaces.RealOutput setVelocity annotation(
    Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));

  parameter Real gearRatio = 1 / 156;
  parameter Integer encoderTickPerRound = 4000;
  parameter SIunits.AngularVelocity maximumVelocity = 10 "rad/s, maximum allowable velocity";
  parameter SIunits.Time PIDPeriod = 0.001 "s, pid time period";
  parameter Integer IClip = 0 "Integral Clip Limit";
  parameter Integer PParam = 0 "Proportional gain 1";
  parameter Integer IParam = 0 "Integral gain 1";
  parameter Integer DParam = 0 "Derivative gain 1";
  Modelica.Blocks.Math.Add3 sum annotation(
    Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput positionError annotation(
    Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gearBoxNormalization(k = 2 / gearRatio * Modelica.Constants.pi) annotation(
    Placement(transformation(extent = {{120, -10}, {140, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter positionErrorLimiter(uMax = 65535 / encoderTickPerRound * 2 / gearRatio * Modelica.Constants.pi, uMin = -positionErrorLimiter.uMax) annotation(
    Placement(transformation(extent = {{-180, -10}, {-160, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter setVelocityLimiter(uMax = maximumVelocity, uMin = -setVelocityLimiter.uMax) annotation(
    Placement(transformation(extent = {{160, -10}, {180, 10}}, rotation = 0)));
  Components.DiscreteDerivative discreteDerivative(SampleTime = PIDPeriod) annotation(
    Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(extent = {{-100, -10}, {-80, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = PParam)  annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = IClip * 0.001 * maximumVelocity, uMin = -limiter.uMax) annotation(
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = IParam) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = DParam) annotation(
    Placement(visible = true, transformation(origin = {20, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(sum.y, gearBoxNormalization.u) annotation(
    Line(points = {{101, 0}, {118, 0}}, color = {0, 0, 127}));
  connect(gearBoxNormalization.y, setVelocityLimiter.u) annotation(
    Line(points = {{141, 0}, {158, 0}}, color = {0, 0, 127}));
  connect(setVelocityLimiter.y, setVelocity) annotation(
    Line(points = {{181, 0}, {220, 0}}, color = {0, 0, 127}));
  connect(positionError, positionErrorLimiter.u) annotation(
    Line(points = {{-220, 0}, {-182, 0}}, color = {0, 0, 127}));
  connect(positionErrorLimiter.y, integrator.u) annotation(
    Line(points = {{-159, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(positionErrorLimiter.y, discreteDerivative.inputValue) annotation(
    Line(points = {{-159, 0}, {-120, 0}, {-120, -40}, {-62, -40}}, color = {0, 0, 127}));
  connect(positionErrorLimiter.y, gain.u) annotation(
    Line(points = {{-158, 0}, {-120, 0}, {-120, 40}, {10, 40}}, color = {0, 0, 127}));
  connect(gain.y, sum.u1) annotation(
    Line(points = {{29, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(integrator.y, limiter.u) annotation(
    Line(points = {{-78, 0}, {-48, 0}}, color = {0, 0, 127}));
  connect(limiter.y, gain1.u) annotation(
    Line(points = {{-24, 0}, {10, 0}}, color = {0, 0, 127}));
  connect(gain1.y, sum.u2) annotation(
    Line(points = {{28, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(discreteDerivative.outputValue, gain2.u) annotation(
    Line(points = {{-38, -40}, {10, -40}}, color = {0, 0, 127}));
  connect(gain2.y, sum.u3) annotation(
    Line(points = {{29, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-200, 100}, {200, -100}}), Text(textColor = {0, 0, 255}, extent = {{-198, 138}, {200, 100}}, textString = "%name"), Text(textColor = {0, 0, 255}, extent = {{-80, 80}, {80, 0}}, textString = "PID"), Text(textColor = {0, 0, 255}, extent = {{-80, 0}, {80, -80}}, textString = "Position")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
    DymolaStoredErrors);
end PositionPID;
