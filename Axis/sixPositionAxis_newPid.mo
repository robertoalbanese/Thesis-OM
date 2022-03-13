within OM_SP7.Axis;

model sixPositionAxis_newPid
  Modelica.Blocks.Math.Gain gain6(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-38, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-38, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-38, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b[7] annotation(
    Placement(visible = true, transformation(origin = {84, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis1(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, 56}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis2(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, 32}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis3(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, 6}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis4(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis5(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -46}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis6(Td = 1, Ti = 0.9, controllerType = Modelica.Blocks.Types.SimpleController.PI, pidGain = 500, wd = 10, wp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput jointSetPosition[7] annotation(
    Placement(visible = true, transformation(extent = {{-94, -4}, {-74, 16}}, rotation = 0), iconTransformation(origin = {-106, 4.44089e-16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis DCPositionAxis7(Td = 0.001, Ti = 10, armatureInductance = 0.0074, armatureResistance = 1.4, gearboxRatio = 119, maximumCurrent = 17, nominalCurrent = 4.9, nominalRPM = 3000, nominalVoltage = 48, pidGain = 300, wd = 1, wp = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 82}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-38, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-38, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-38, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(gain6.y, DCPositionAxis6.setPosition) annotation(
    Line(points = {{-31.4, -70}, {-3.4, -70}}, color = {0, 0, 127}));
  connect(gain4.y, DCPositionAxis4.setPosition) annotation(
    Line(points = {{-31.4, -20}, {-3.4, -20}}, color = {0, 0, 127}));
  connect(gain2.y, DCPositionAxis2.setPosition) annotation(
    Line(points = {{-31.4, 32}, {-5, 32}}, color = {0, 0, 127}));
  connect(DCPositionAxis1.flange_b, flange_b[1]) annotation(
    Line(points = {{25, 56}, {40, 56}, {40, 6}, {84, 6}}));
  connect(DCPositionAxis2.flange_b, flange_b[2]) annotation(
    Line(points = {{25, 32}, {40, 32}, {40, 6}, {84, 6}}));
  connect(DCPositionAxis3.flange_b, flange_b[3]) annotation(
    Line(points = {{25, 6}, {84, 6}}));
  connect(DCPositionAxis4.flange_b, flange_b[4]) annotation(
    Line(points = {{25, -20}, {40, -20}, {40, 6}, {84, 6}}));
  connect(DCPositionAxis5.flange_b, flange_b[5]) annotation(
    Line(points = {{25, -46}, {40, -46}, {40, 6}, {84, 6}}));
  connect(DCPositionAxis6.flange_b, flange_b[6]) annotation(
    Line(points = {{25, -70}, {40, -70}, {40, 6}, {84, 6}}));
  connect(jointSetPosition[2], gain2.u) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, 32}, {-46, 32}}, color = {0, 0, 127}));
  connect(jointSetPosition[4], gain4.u) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, -20}, {-46, -20}}, color = {0, 0, 127}));
  connect(jointSetPosition[6], gain6.u) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, -70}, {-46, -70}}, color = {0, 0, 127}));
  connect(jointSetPosition[7], DCPositionAxis7.setPosition) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, 82}, {-5, 82}}, color = {0, 0, 127}));
  connect(DCPositionAxis7.flange_b, flange_b[7]) annotation(
    Line(points = {{25, 82}, {40, 82}, {40, 6}, {84, 6}}));
  connect(jointSetPosition[1], gain1.u) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, 56}, {-46, 56}}, color = {0, 0, 127}));
  connect(gain1.y, DCPositionAxis1.setPosition) annotation(
    Line(points = {{-31.4, 56}, {-5, 56}}, color = {0, 0, 127}));
  connect(jointSetPosition[3], gain3.u) annotation(
    Line(points = {{-84, 6}, {-46, 6}}, color = {0, 0, 127}));
  connect(gain3.y, DCPositionAxis3.setPosition) annotation(
    Line(points = {{-31.4, 6}, {-3.4, 6}}, color = {0, 0, 127}));
  connect(jointSetPosition[5], gain5.u) annotation(
    Line(points = {{-84, 6}, {-64, 6}, {-64, -46}, {-45, -46}}, color = {0, 0, 127}));
  connect(gain5.y, DCPositionAxis5.setPosition) annotation(
    Line(points = {{-31.4, -46}, {-4.4, -46}}, color = {0, 0, 127}));
protected
  annotation(
    Icon(graphics = {Text(origin = {-7, -112}, textColor = {0, 0, 255}, extent = {{-63, 18}, {63, -18}}, textString = "%name"), Rectangle(origin = {0, -2}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-90, 90}, {90, -90}}), Rectangle(lineColor = {106, 106, 106}, lineThickness = 1, extent = {{-90, 90}, {90, -90}}), Text(origin = {3, 3}, extent = {{-47, 25}, {47, -25}}, textString = "Controller")}),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    experiment);
end sixPositionAxis_newPid;
