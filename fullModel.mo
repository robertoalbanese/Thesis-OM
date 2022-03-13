within OM_SP7;

model fullModel
  OM_SP7.Body.six_rss_closedloop SP7 annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(label2 = "z", n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable jointSpace(columns = 2:8, fileName = Modelica.Utilities.Files.loadResource("modelica://OM_SP7/PlatformPath.txt"), tableName = "LegLengths", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  OM_SP7.Axis.sixPositionAxis_newPid sixPositionAxis_newPid annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Real endTimeSimulation = jointSpace.t_maxScaled; 
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition = time >= endTimeSimulation) annotation(
    Placement(visible = true, transformation(extent = {{-44, -46}, {36, -40}}, rotation = 0)));
  equation
  when sample(0, 1) then
    print("Time =" + String(time) + "\n");
  end when;
  connect(sixPositionAxis_newPid.flange_b[:], SP7.flange_a[:]) annotation(
    Line(points = {{12.56, 0}, {31.56, 0}}, thickness = 0.5));
  connect(jointSpace.y[:], sixPositionAxis_newPid.jointSetPosition[:]) annotation(
    Line(points = {{-29, 0}, {-16.2, 0}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=infoXmlOperations -d=infoXmlOperations -d=backenddaeinfo -d=stateselection -d=discreteinfo",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "cvode", ls = "totalpivot"),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0111012));
end fullModel;
