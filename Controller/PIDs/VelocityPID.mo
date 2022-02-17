within OM_SP7.Controller.PIDs;

model VelocityPID
  import Modelica.SIunits;
  import OM_SP7.Controller.Components;
  Modelica.Blocks.Interfaces.RealInput setVelocity annotation(
    Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput setCurrent annotation(
    Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));

  parameter SIunits.Time PIDPeriod = 0.05 "Time period for PID controller";
  parameter Modelica.SIunits.Current maximumCurrent = 2.68 "maximum allowable current set";
  parameter Integer IClip "Integral Clip Limit 1";
  parameter Integer PParam "Proportional gain 1";
  parameter Integer IParam "Integral gain 2";
  parameter Integer DParam "Derivative gain 1";
  Modelica.Blocks.Math.Add3 sum annotation(
    Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain currentNormalization(k = 0.001) annotation(
    Placement(transformation(extent = {{120, -10}, {140, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter currentSetLimiter(uMax = maximumCurrent, uMin = -currentSetLimiter.uMax) annotation(
    Placement(transformation(extent = {{160, -10}, {180, 10}}, rotation = 0)));
  Components.DiscreteDerivative discreteDerivative(SampleTime = PIDPeriod) annotation(
    Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = PParam)  annotation(
    Placement(visible = true, transformation(origin = {28, 40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = IParam) annotation(
    Placement(visible = true, transformation(origin = {28, 4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = DParam) annotation(
    Placement(visible = true, transformation(origin = {28, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = IClip * 0.001 * maximumCurrent, uMin = -limiter.uMax) annotation(
    Placement(visible = true, transformation(origin = {-28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sum.y, currentNormalization.u) annotation(
    Line(points = {{101, 0}, {118, 0}}, color = {0, 0, 127}));
  connect(currentNormalization.y, currentSetLimiter.u) annotation(
    Line(points = {{141, 0}, {158, 0}}, color = {0, 0, 127}));
  connect(currentSetLimiter.y, setCurrent) annotation(
    Line(points = {{181, 0}, {220, 0}}, color = {0, 0, 127}));
  connect(gain.y, sum.u1) annotation(
    Line(points = {{37, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(gain1.y, sum.u2) annotation(
    Line(points = {{37, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(discreteDerivative.outputValue, gain2.u) annotation(
    Line(points = {{-38, -40}, {18, -40}}, color = {0, 0, 127}));
  connect(gain2.y, sum.u3) annotation(
    Line(points = {{37, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
  connect(integrator.y, limiter.u) annotation(
    Line(points = {{-58, 0}, {-40, 0}}, color = {0, 0, 127}));
  connect(limiter.y, gain1.u) annotation(
    Line(points = {{-16, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(setVelocity, integrator.u) annotation(
    Line(points = {{-220, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(setVelocity, gain.u) annotation(
    Line(points = {{-220, 0}, {-120, 0}, {-120, 40}, {18, 40}}, color = {0, 0, 127}));
  connect(setVelocity, discreteDerivative.inputValue) annotation(
    Line(points = {{-220, 0}, {-120, 0}, {-120, -40}, {-62, -40}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-200, 100}, {200, -100}}), Text(textColor = {0, 0, 255}, extent = {{-80, 80}, {80, 0}}, textString = "PID"), Text(textColor = {0, 0, 255}, extent = {{-80, 0}, {80, -80}}, textString = "Velocity"), Text(textColor = {0, 0, 255}, extent = {{-198, 138}, {200, 100}}, textString = "%name")}),
    DymolaStoredErrors);
end VelocityPID;
