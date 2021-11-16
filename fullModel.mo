within OM_SP7;

model fullModel
  OM_SP7.Body.six_rss_closedloop SP7 annotation(
    Placement(visible = true, transformation(origin = {108, 12}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
  OM_SP7.Axis.sixPositionAxis sixPositionAxis annotation(
    Placement(visible = true, transformation(origin = {-1, 1}, extent = {{-63, -63}, {63, 63}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, 70}, {-130, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, 38}, {-130, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, 8}, {-130, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, -24}, {-130, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, -56}, {-130, -36}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-150, -86}, {-130, -66}}, rotation = 0)));
equation
  connect(sixPositionAxis.flange_b[:], SP7.flange_a[:]) annotation(
    Line(points = {{76.49, 0.37}, {88.49, 0.37}}, thickness = 0.5));
  connect(const3.y, sixPositionAxis.joint4SetPosition) annotation(
    Line(points = {{-129, 18}, {-102, 18}, {-102, 9}, {-70, 9}}, color = {0, 0, 127}));
  connect(const4.y, sixPositionAxis.joint3SetPosition) annotation(
    Line(points = {{-129, -14}, {-105, -14}, {-105, -8}, {-70, -8}}, color = {0, 0, 127}));
  connect(const5.y, sixPositionAxis.joint2SetPosition) annotation(
    Line(points = {{-129, -46}, {-98, -46}, {-98, -24}, {-70, -24}}, color = {0, 0, 127}));
  connect(const2.y, sixPositionAxis.joint5SetPosition) annotation(
    Line(points = {{-129, 48}, {-98, 48}, {-98, 26}, {-70, 26}}, color = {0, 0, 127}));
  connect(const1.y, sixPositionAxis.joint6SetPosition) annotation(
    Line(points = {{-129, 80}, {-92, 80}, {-92, 43}, {-70, 43}}, color = {0, 0, 127}));
  connect(const6.y, sixPositionAxis.joint1SetPosition) annotation(
    Line(points = {{-129, -76}, {-92, -76}, {-92, -41}, {-70, -41}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=backenddaeinfo -d=stateselection -d=discreteinfo",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "cvode"));
end fullModel;
