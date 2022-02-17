within OM_SP7.Controller.PIDs;

model CurrentPID
  import Modelica.SIunits;
  import OM_SP7.Controller.Components;
  Modelica.Blocks.Interfaces.RealInput setCurrent annotation(
    Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput setPWM annotation(
    Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));
  parameter SIunits.Time PIDPeriod = 0.05 "Time period for PID controller";
  parameter Integer maximumPWM = 32767 "PWM Input Limiter";
  parameter Integer IClip = 1000 "Integral Clip Limit";
  parameter Integer PParam = 4000 "Proportional gain";
  parameter Integer IParam = 4000 "Integral gain";
  parameter Integer DParam = 0 "Derivative gain";
  Modelica.Blocks.Math.Add3 sum annotation(
    Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
  Components.DiscreteDerivative DiscreteDerivative1(SampleTime = PIDPeriod) annotation(
    Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter PWMLimiter(uMax = maximumPWM, uMin = -PWMLimiter.uMax) annotation(
    Placement(transformation(extent = {{130, -10}, {150, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain currentNormalization(k = 1000) annotation(
    Placement(transformation(extent = {{-130, -10}, {-110, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain integralGain(k = IParam) annotation(
    Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain derivativeGain(k = DParam) annotation(
    Placement(transformation(extent = {{20, -50}, {40, -30}}, rotation = 0)));
  Modelica.Blocks.Math.Gain proportionalGain(k = PParam) annotation(
    Placement(transformation(extent = {{-6, 30}, {14, 50}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter integralLimiter(limitsAtInit = true,uMax = IClip * 0.001 * maximumPWM, uMin = -integralLimiter.uMax) annotation(
    Placement(transformation(extent = {{-34, -10}, {-14, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Integrator1 annotation(
    Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
equation
  connect(sum.y, PWMLimiter.u) annotation(
    Line(points = {{101, 0}, {128, 0}}, color = {0, 0, 127}));
  connect(PWMLimiter.y, setPWM) annotation(
    Line(points = {{151, 0}, {220, 0}}, color = {0, 0, 127}));
  connect(derivativeGain.y, sum.u3) annotation(
    Line(points = {{41, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
  connect(integralGain.y, sum.u2) annotation(
    Line(points = {{41, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(currentNormalization.y, proportionalGain.u) annotation(
    Line(points = {{-109, 0}, {-100, 0}, {-100, 40}, {-8, 40}}, color = {0, 0, 127}));
  connect(proportionalGain.y, sum.u1) annotation(
    Line(points = {{15, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(integralLimiter.y, integralGain.u) annotation(
    Line(points = {{-13, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(Integrator1.y, integralLimiter.u) annotation(
    Line(points = {{-59, 0}, {-36, 0}}, color = {0, 0, 127}));
  connect(currentNormalization.y, Integrator1.u) annotation(
    Line(points = {{-109, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(currentNormalization.y, DiscreteDerivative1.inputValue) annotation(
    Line(points = {{-109, 0}, {-100, 0}, {-100, -40}, {-62, -40}}, color = {0, 0, 127}));
  connect(DiscreteDerivative1.outputValue, derivativeGain.u) annotation(
    Line(points = {{-39, -40}, {18, -40}}, color = {0, 0, 127}));
  connect(setCurrent, currentNormalization.u) annotation(
    Line(points = {{-220, 0}, {-132, 0}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-200, 100}, {200, -100}}), Text(textColor = {0, 0, 255}, extent = {{-80, 80}, {80, 0}}, textString = "PID"), Text(textColor = {0, 0, 255}, extent = {{-80, 0}, {80, -80}}, textString = "Current"), Text(textColor = {0, 0, 255}, extent = {{-198, 138}, {200, 100}}, textString = "%name")}));
end CurrentPID;
