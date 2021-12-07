within OM_SP7;

model fullModel
  OM_SP7.Body.six_rss_closedloop SP7 annotation(
    Placement(visible = true, transformation(origin = {132, 0}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
  OM_SP7.Axis.sixPositionAxis sixPositionAxis annotation(
    Placement(visible = true, transformation(origin = {-47, 1}, extent = {{-63, -63}, {63, 63}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, 70}, {-176, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, 38}, {-176, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, 8}, {-176, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, -24}, {-176, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, -56}, {-176, -36}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(extent = {{-196, -86}, {-176, -66}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-36, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sixPositionAxis.flange_b[:], SP7.flange_a[:]) annotation(
    Line(points = {{30.49, 0.37}, {36.49, 0.37}, {36.49, -1.09672e-07}, {60, -1.09672e-07}}, thickness = 0.5));
  connect(const3.y, sixPositionAxis.joint4SetPosition) annotation(
    Line(points = {{-175, 18}, {-148, 18}, {-148, 9}, {-116, 9}}, color = {0, 0, 127}));
  connect(const4.y, sixPositionAxis.joint3SetPosition) annotation(
    Line(points = {{-175, -14}, {-151, -14}, {-151, -8}, {-116, -8}}, color = {0, 0, 127}));
  connect(const5.y, sixPositionAxis.joint2SetPosition) annotation(
    Line(points = {{-175, -46}, {-144, -46}, {-144, -24}, {-116, -24}}, color = {0, 0, 127}));
  connect(const2.y, sixPositionAxis.joint5SetPosition) annotation(
    Line(points = {{-175, 48}, {-144, 48}, {-144, 26}, {-116, 26}}, color = {0, 0, 127}));
  connect(const1.y, sixPositionAxis.joint6SetPosition) annotation(
    Line(points = {{-175, 80}, {-138, 80}, {-138, 43}, {-116, 43}}, color = {0, 0, 127}));
  connect(const6.y, sixPositionAxis.joint1SetPosition) annotation(
    Line(points = {{-175, -76}, {-138, -76}, {-138, -41}, {-116, -41}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=infoXmlOperations -d=backenddaeinfo -d=stateselection -d=discreteinfo",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "cvode"));
end fullModel;
