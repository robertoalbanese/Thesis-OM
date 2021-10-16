within OM_SP7.Controller.Components;

model DiscreteDerivative
  import Modelica.Blocks.Interfaces;
  import Modelica.Blocks.Discrete;
  import Modelica.Blocks.Math;
  parameter Modelica.SIunits.Time SampleTime;
  Interfaces.RealInput inputValue annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Interfaces.RealOutput outputValue annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  Discrete.UnitDelay UnitDelay1(samplePeriod = SampleTime) annotation(
    Placement(transformation(extent = {{-10, 10}, {10, 30}}, rotation = 0)));
  Math.Add Add1(k1 = 1, k2 = -1) annotation(
    Placement(transformation(extent = {{30, -10}, {50, 10}}, rotation = 0)));
  Discrete.ZeroOrderHold ZeroOrderHold1(samplePeriod = SampleTime) annotation(
    Placement(transformation(extent = {{-48, -10}, {-28, 10}}, rotation = 0)));
equation
  connect(UnitDelay1.y, Add1.u1) annotation(
    Line(points = {{11, 20}, {20, 20}, {20, 6}, {28, 6}}, color = {0, 0, 127}));
  connect(Add1.y, outputValue) annotation(
    Line(points = {{51, 0}, {80.5, 0}, {80.5, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(inputValue, ZeroOrderHold1.u) annotation(
    Line(points = {{-120, 0}, {-50, 0}}, color = {0, 0, 127}));
  connect(ZeroOrderHold1.y, UnitDelay1.u) annotation(
    Line(points = {{-27, 0}, {-20, 0}, {-20, 20}, {-12, 20}}, color = {0, 0, 127}));
  connect(ZeroOrderHold1.y, Add1.u2) annotation(
    Line(points = {{-27, 0}, {-20, 0}, {-20, -6}, {28, -6}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    DymolaStoredErrors,
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "  E(t-1) - E(t)  "), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-100, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
end DiscreteDerivative;
