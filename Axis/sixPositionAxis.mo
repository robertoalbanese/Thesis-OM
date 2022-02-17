within OM_SP7.Axis;

model sixPositionAxis
  Modelica.Blocks.Interfaces.RealInput joint1SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, 48}, {-66, 68}}, rotation = 0), iconTransformation(origin = {-98, 66}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint2SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, 22}, {-66, 42}}, rotation = 0), iconTransformation(origin = {-98, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint3SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, -4}, {-66, 16}}, rotation = 0), iconTransformation(origin = {-98, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint4SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, -30}, {-66, -10}}, rotation = 0), iconTransformation(origin = {-98, -10}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint5SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, -56}, {-66, -36}}, rotation = 0), iconTransformation(origin = {-98, -32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint6SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, -80}, {-66, -60}}, rotation = 0), iconTransformation(origin = {-98, -54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput joint7SetPosition annotation(
    Placement(visible = true, transformation(extent = {{-86, 74}, {-66, 94}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_vertical annotation(
    Placement(visible = true, transformation(origin = {96, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {97, 37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  
  OM_SP7.Axis.DCPositionAxis positionAxis_vertical(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 200, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 200, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, 84}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain6(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-48, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-48, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-48, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {96, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DCPositionAxis positionAxis6(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, -70}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  DCPositionAxis positionAxis5(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, -46}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  OM_SP7.Axis.DCPositionAxis positionAxis4(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, -20}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  DCPositionAxis positionAxis3(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, 6}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  DCPositionAxis positionAxis2(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, 32}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  DCPositionAxis positionAxis1(DParamCurrent = 0, DParamPosition = 0, DParamVelocity = 0, IClipCurrent = 1000, IClipPosition = 1000, IClipVelocity = 1000, IParamCurrent = 4000, IParamPosition = 0, IParamVelocity = 600, PParamCurrent = 4000, PParamPosition = 50, PParamVelocity = 800, maximumCurrent = 1.75) annotation(
    Placement(visible = true, transformation(origin = {-6, 58}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
equation
  connect(joint7SetPosition, positionAxis_vertical.setPosition) annotation(
    Line(points = {{-76, 84}, {-21, 84}}, color = {0, 0, 127}));
  connect(positionAxis_vertical.flange_b, flange_vertical) annotation(
    Line(points = {{9, 84}, {62, 84}, {62, 28}, {96, 28}}));
  connect(joint6SetPosition, gain6.u) annotation(
    Line(points = {{-76, -70}, {-55, -70}}, color = {0, 0, 127}));
  connect(joint4SetPosition, gain4.u) annotation(
    Line(points = {{-76, -20}, {-55, -20}}, color = {0, 0, 127}));
  connect(joint2SetPosition, gain2.u) annotation(
    Line(points = {{-76, 32}, {-55, 32}}, color = {0, 0, 127}));
  connect(gain6.y, positionAxis6.setPosition) annotation(
    Line(points = {{-41, -70}, {-20, -70}}, color = {0, 0, 127}));
  connect(positionAxis6.flange_b, flange_b[6]) annotation(
    Line(points = {{10, -70}, {40, -70}, {40, -4}, {96, -4}}));
  connect(positionAxis5.flange_b, flange_b[5]) annotation(
    Line(points = {{10, -46}, {40, -46}, {40, -4}, {96, -4}}));
  connect(joint5SetPosition, positionAxis5.setPosition) annotation(
    Line(points = {{-76, -46}, {-20, -46}}, color = {0, 0, 127}));
  connect(gain4.y, positionAxis4.setPosition) annotation(
    Line(points = {{-41, -20}, {-20, -20}}, color = {0, 0, 127}));
  connect(positionAxis4.flange_b, flange_b[4]) annotation(
    Line(points = {{10, -20}, {40, -20}, {40, -4}, {96, -4}}));
  connect(positionAxis3.flange_b, flange_b[3]) annotation(
    Line(points = {{10, 6}, {40, 6}, {40, -4}, {96, -4}}));
  connect(joint3SetPosition, positionAxis3.setPosition) annotation(
    Line(points = {{-76, 6}, {-21, 6}}, color = {0, 0, 127}));
  connect(gain2.y, positionAxis2.setPosition) annotation(
    Line(points = {{-41, 32}, {-21, 32}}, color = {0, 0, 127}));
  connect(positionAxis2.flange_b, flange_b[2]) annotation(
    Line(points = {{9, 32}, {40, 32}, {40, -4}, {96, -4}}));
  connect(joint1SetPosition, positionAxis1.setPosition) annotation(
    Line(points = {{-76, 58}, {-20, 58}}, color = {0, 0, 127}));
  connect(positionAxis1.flange_b, flange_b[1]) annotation(
    Line(points = {{10, 58}, {40, 58}, {40, -4}, {96, -4}}));
protected
  annotation(
    Icon(graphics = {Text(origin = {-7, -112}, textColor = {0, 0, 255}, extent = {{-63, 18}, {63, -18}}, textString = "%name"), Rectangle(origin = {55, 54}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -12}, {15, 13}}), Text(origin = {3, 1}, extent = {{-47, 25}, {47, -25}}, textString = "Controller"), Rectangle(origin = {0, 2}, lineColor = {106, 106, 106}, lineThickness = 1, extent = {{-90, 90}, {90, -90}})}),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end sixPositionAxis;
