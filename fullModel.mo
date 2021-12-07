within OM_SP7;

model fullModel
  OM_SP7.Body.six_rss_closedloop SP7 annotation(
    Placement(visible = true, transformation(origin = {132, 0}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
  OM_SP7.Axis.sixPositionAxis sixPositionAxis annotation(
    Placement(visible = true, transformation(origin = {-36, 5.32907e-15}, extent = {{-44, -44}, {44, 44}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, 70}, {-162, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, 38}, {-162, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, 8}, {-162, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, -24}, {-162, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, -56}, {-162, -36}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-182, -86}, {-162, -66}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {56, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Modelica.SIunits.Conversions.from_deg(10)) annotation(
    Placement(visible = true, transformation(extent = {{-72, 70}, {-52, 90}}, rotation = 0)));
equation
  connect(sixPositionAxis.flange_b[:], SP7.flange_a[:]) annotation(
    Line(points = {{7, 0}, {36.49, 0}, {36.49, -1.09672e-07}, {60, -1.09672e-07}}, thickness = 0.5));
  connect(const3.y, sixPositionAxis.joint4SetPosition) annotation(
    Line(points = {{-161, 18}, {-134, 18}, {-134, 6}, {-79, 6}}, color = {0, 0, 127}));
  connect(const4.y, sixPositionAxis.joint3SetPosition) annotation(
    Line(points = {{-161, -14}, {-128, -14}, {-128, -5}, {-79, -5}}, color = {0, 0, 127}));
  connect(const5.y, sixPositionAxis.joint2SetPosition) annotation(
    Line(points = {{-161, -46}, {-130, -46}, {-130, -17}, {-79, -17}}, color = {0, 0, 127}));
  connect(const2.y, sixPositionAxis.joint5SetPosition) annotation(
    Line(points = {{-161, 48}, {-130, 48}, {-130, 18}, {-79, 18}}, color = {0, 0, 127}));
  connect(const1.y, sixPositionAxis.joint6SetPosition) annotation(
    Line(points = {{-161, 80}, {-124, 80}, {-124, 30}, {-79, 30}}, color = {0, 0, 127}));
  connect(const6.y, sixPositionAxis.joint1SetPosition) annotation(
    Line(points = {{-161, -76}, {-124, -76}, {-124, -28}, {-79, -28}}, color = {0, 0, 127}));
  connect(const.y, sixPositionAxis.joint7SetPosition) annotation(
    Line(points = {{-50, 80}, {-36, 80}, {-36, 44}}, color = {0, 0, 127}));
  connect(sixPositionAxis.flange_vertical, SP7.flange_vertical) annotation(
    Line(points = {{6, 16}, {40, 16}, {40, 80}, {132, 80}, {132, 64}}, thickness = 0.5));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=infoXmlOperations -d=backenddaeinfo -d=stateselection -d=discreteinfo",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "cvode"));
end fullModel;
