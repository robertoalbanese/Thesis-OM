within OM_SP7.Utils;

model terminateSimulationOnKey
  parameter Modelica_DeviceDrivers.Blocks.InputDevices.Types.keyCodes keyCode="Return";
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardKeyInput keyboardKeyInput(keyCode = keyCode)  annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime annotation(
    Placement(visible = true, transformation(extent = {{-30, -10}, {-10, 10}}, rotation = 0)));
  parameter String terminationText="... End condition reached"
  "Text that will be displayed when simulation is terminated";   
protected
equation
  when keyboardKeyInput.keyState == true then
    terminate(terminationText);
  end when;
  annotation(
    uses(Modelica_DeviceDrivers(version = "1.8.2"), Modelica(version = "3.2.3")),
    Icon(graphics = {Text(origin = {-4, -42}, extent = {{-192, 200}, {192, 150}}, textString = "%name"), Polygon(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{0, -100}, {-80, -100}, {-88, -98}, {-94, -94}, {-98, -88}, {-100, -80}, {-100, 80}, {-98, 88}, {-94, 94}, {-88, 98}, {-80, 100}, {80, 100}, {88, 98}, {94, 94}, {98, 88}, {100, 80}, {100, -80}, {98, -88}, {94, -94}, {88, -98}, {80, -100}, {0, -100}}), Ellipse(origin = {0, 7}, lineColor = {199, 0, 0}, lineThickness = 5, extent = {{-45, 45}, {45, -45}}), Line(origin = {-1.42214, 5.81258}, rotation = 90, points = {{-30, 30}, {30, -30}, {30, -30}}, color = {199, 0, 0}, thickness = 5), Polygon(lineColor = {0, 0, 255}, fillColor = {236, 236, 236}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, 80}, {80, 80}, {60, 78}, {-60, 78}, {-80, 80}}), Text(lineColor = {0, 0, 255}, fillColor = {236, 236, 236}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 20}, {100, -20}}, textString = "%keyCode"), Rectangle(rotation = 180, lineColor = {0, 0, 255}, fillColor = {215, 215, 215}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Polygon(lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, 80}, {-60, 78}, {-60, -60}, {-80, -80}, {-80, 80}}), Line(origin = {-0.35, 5.87}, points = {{-30, 32}, {30, -30}, {32, -32}}, color = {199, 0, 0}, thickness = 2), Polygon(lineColor = {0, 0, 255}, fillColor = {135, 135, 135}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{80, 80}, {60, 78}, {60, -60}, {80, -80}, {80, 80}}), Polygon(lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, -80}, {-60, -60}, {60, -60}, {80, -80}, {-80, -80}}), Ellipse(origin = {0, 5}, lineColor = {199, 0, 0}, lineThickness = 2, extent = {{-45, 45}, {45, -45}}), Line(origin = {1.70323, 6.76404}, rotation = 90, points = {{-34, 32}, {30, -30}, {30, -30}}, color = {199, 0, 0}, thickness = 2), Line(origin = {-0.78, -0.78}, points = {{0, -100}, {-80, -100}, {-88, -98}, {-94, -94}, {-98, -88}, {-100, -80}, {-100, 80}, {-98, 88}, {-94, 94}, {-88, 98}, {-80, 100}, {80, 100}, {88, 98}, {94, 94}, {98, 88}, {100, 80}, {100, -80}, {98, -88}, {94, -94}, {88, -98}, {80, -100}, {0, -100}}, color = {0, 64, 127}, thickness = 0.5)}));
end terminateSimulationOnKey;
