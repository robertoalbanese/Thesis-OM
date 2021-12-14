within OM_SP7;

model fullModel
  OM_SP7.Body.six_rss_closedloop SP7 annotation(
    Placement(visible = true, transformation(origin = {116, 8.88178e-16}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  OM_SP7.Axis.sixPositionAxis sixPositionAxis annotation(
    Placement(visible = true, transformation(origin = {-20, 7.10543e-15}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, 70}, {-132, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, 38}, {-132, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, 8}, {-132, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, -24}, {-132, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, -56}, {-132, -36}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-152, -86}, {-132, -66}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {86, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Modelica.SIunits.Conversions.from_deg(10)) annotation(
    Placement(visible = true, transformation(extent = {{-58, 62}, {-38, 82}}, rotation = 0)));
  OM_SP7.Utils.terminateSimulationOnKey stopSim annotation(
    Placement(visible = true, transformation(origin = {-8, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sixPositionAxis.flange_b[:], SP7.flange_a[:]) annotation(
    Line(points = {{9.1, 0.3}, {88.1, 0.3}}, thickness = 0.5));
  connect(const3.y, sixPositionAxis.joint4SetPosition) annotation(
    Line(points = {{-131, 18}, {-104, 18}, {-104, 4}, {-49, 4}}, color = {0, 0, 127}));
  connect(const4.y, sixPositionAxis.joint3SetPosition) annotation(
    Line(points = {{-131, -14}, {-106, -14}, {-106, -4}, {-49, -4}}, color = {0, 0, 127}));
  connect(const5.y, sixPositionAxis.joint2SetPosition) annotation(
    Line(points = {{-131, -46}, {-100, -46}, {-100, -11}, {-49, -11}}, color = {0, 0, 127}));
  connect(const2.y, sixPositionAxis.joint5SetPosition) annotation(
    Line(points = {{-131, 48}, {-100, 48}, {-100, 13}, {-49, 13}}, color = {0, 0, 127}));
  connect(const1.y, sixPositionAxis.joint6SetPosition) annotation(
    Line(points = {{-131, 80}, {-94, 80}, {-94, 20}, {-49, 20}}, color = {0, 0, 127}));
  connect(const6.y, sixPositionAxis.joint1SetPosition) annotation(
    Line(points = {{-131, -76}, {-94, -76}, {-94, -19}, {-49, -19}}, color = {0, 0, 127}));
  connect(const.y, sixPositionAxis.joint7SetPosition) annotation(
    Line(points = {{-37, 72}, {-37, 72.5}, {-20, 72.5}, {-20, 29}}, color = {0, 0, 127}));
  connect(sixPositionAxis.flange_vertical, SP7.flange_vertical) annotation(
    Line(points = {{9.1, 11.1}, {70.1, 11.1}, {70.1, 36.1}, {116.1, 36.1}, {116.1, 25.1}}, thickness = 0.5));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=infoXmlOperations -d=backenddaeinfo -d=stateselection -d=discreteinfo",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "cvode"));
end fullModel;
