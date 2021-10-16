within OM_SP7.Controller.Components;

model P2V "output a signal from a pwm input signal"
  Modelica.Blocks.Interfaces.RealInput inputPWM annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput outputVoltage annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  parameter Modelica.SIunits.Voltage maximumVoltage = 24 "voltage source range = (-maximum_voltage) - maximum_voltage";
  parameter Real maximumPWM = 100 "pwm input range = (-maximum_pwm) - maximum_pwm";
equation
  outputVoltage = inputPWM / maximumPWM * maximumVoltage;
  annotation(
    Icon(graphics = {Text(extent = {{-100, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-60, 22}, {60, -28}}, lineColor = {0, 0, 255}, textString = "P2V")}),
    Diagram(graphics = {Text(extent = {{-50, 30}, {50, -30}}, lineColor = {0, 0, 255}, textString = "P2V"), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255})}));
end P2V;
