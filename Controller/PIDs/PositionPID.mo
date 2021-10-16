within OM_SP7.Controller.PIDs;

model PositionPID
  import Modelica.SIunits;
  import OM_SP7.Controller.Components;
  Modelica.Blocks.Interfaces.RealOutput setVelocity annotation(
    Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));
public
  parameter Real gearRatio = 1 / 156;
  parameter Integer encoderTickPerRound = 4000;
  parameter SIunits.AngularVelocity maximumVelocity = 10 "rad/s, maximum allowable velocity";
  parameter SIunits.Time PIDPeriod = 0.001 "s, pid time period";
  parameter Modelica.SIunits.AngularVelocity threshold = 0 "(rad/s)";
  parameter Integer IClip1 = 0 "Integral Clip Limit 1";
  parameter Integer IClip2 = 0 "Integral Clip Limit 2";
  parameter Integer PParam1 = 0 "Proportional gain 1";
  parameter Integer PParam2 = 0 "Proportional gain 2";
  parameter Integer IParam1 = 0 "Integral gain 1";
  parameter Integer IParam2 = 0 "Integral gain 2";
  parameter Integer DParam1 = 0 "Derivative gain 1";
  parameter Integer DParam2 = 0 "Derivative gain 2";
  Components.Gain2 integralGain(threshold = threshold, k1 = IParam1, k2 = IParam2) annotation(
    Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
  Components.Gain2 derivativeGain(threshold = threshold, k1 = DParam1, k2 = DParam2) annotation(
    Placement(transformation(extent = {{20, -50}, {40, -30}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 sum annotation(
    Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput positionError annotation(
    Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
  Components.Gain2 proportionalGain(threshold = threshold, k1 = PParam1, k2 = PParam2) annotation(
    Placement(transformation(extent = {{-10, 30}, {10, 50}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gearBoxNormalization(k = 2 / gearRatio * Modelica.Constants.pi) annotation(
    Placement(transformation(extent = {{120, -10}, {140, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter positionErrorLimiter(uMax = 65535 / encoderTickPerRound * 2 / gearRatio * Modelica.Constants.pi, uMin = -positionErrorLimiter.uMax) annotation(
    Placement(transformation(extent = {{-180, -10}, {-160, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter setVelocityLimiter(uMax = maximumVelocity, uMin = -setVelocityLimiter.uMax) annotation(
    Placement(transformation(extent = {{160, -10}, {180, 10}}, rotation = 0)));
  Components.DiscreteDerivative discreteDerivative(SampleTime = PIDPeriod) annotation(
    Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput velocityFeedback annotation(
    Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Components.Limiter2 integralLimiter2(threshold = threshold, k1 = IClip1 * 0.001 * maximumVelocity, k2 = IClip2 * 0.001 * maximumVelocity) annotation(
    Placement(transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(extent = {{-100, -10}, {-80, 10}}, rotation = 0)));
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
  connect(integrator.y, integralLimiter2.inputClip) annotation(
    Line(points = {{-79, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, integralLimiter2.feedbackVelocity) annotation(
    Line(points = {{0, -120}, {0, -20}, {-30, -20}, {-30, -12}}, color = {0, 0, 127}));
  connect(positionErrorLimiter.y, proportionalGain.inputGain2) annotation(
    Line(points = {{-159, 0}, {-120, 0}, {-120, 40}, {-12, 40}}, color = {0, 0, 127}));
  connect(proportionalGain.outputGain2, sum.u1) annotation(
    Line(points = {{11, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(velocityFeedback, proportionalGain.feedbackVelocity) annotation(
    Line(points = {{0, -120}, {0, 28}}, color = {0, 0, 127}));
  connect(integralLimiter2.outputClip, integralGain.inputGain2) annotation(
    Line(points = {{-19, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(integralGain.outputGain2, sum.u2) annotation(
    Line(points = {{41, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(velocityFeedback, integralGain.feedbackVelocity) annotation(
    Line(points = {{0, -120}, {0, -20}, {30, -20}, {30, -12}}, color = {0, 0, 127}));
  connect(velocityFeedback, derivativeGain.feedbackVelocity) annotation(
    Line(points = {{0, -120}, {0, -60}, {30, -60}, {30, -52}}, color = {0, 0, 127}));
  connect(derivativeGain.outputGain2, sum.u3) annotation(
    Line(points = {{41, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
  connect(positionErrorLimiter.y, discreteDerivative.inputValue) annotation(
    Line(points = {{-159, 0}, {-120, 0}, {-120, -40}, {-62, -40}}, color = {0, 0, 127}));
  connect(discreteDerivative.outputValue, derivativeGain.inputGain2) annotation(
    Line(points = {{-39, -40}, {18, -40}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-198, 138}, {200, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-80, 80}, {80, 0}}, lineColor = {0, 0, 255}, textString = "PID"), Text(extent = {{-80, 0}, {80, -80}}, lineColor = {0, 0, 255}, textString = "Position")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
    DymolaStoredErrors);
end PositionPID;
