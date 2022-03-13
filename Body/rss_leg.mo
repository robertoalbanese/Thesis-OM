within OM_SP7.Body;

model rss_leg
  import Modelica.SIunits;
  import Modelica.Math;
  import Modelica.Constants;
  //parameter Integer axis = 1 "Revolute axis direction";
  parameter SIunits.Length h = 0.190 "Rotational motor's horn anchor length";
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  parameter SIunits.Angle alpha = Modelica.SIunits.Conversions.from_deg(120);
  parameter Integer lefPositionConfig[2] = {0, -1} "motorPair = 0/1/2   |   legPosition = -1(right)/1(left)";
  Modelica.Mechanics.MultiBody.Joints  .Revolute j1(cylinderDiameter = 0.04, cylinderLength = 0.04,n = {cos(lefPositionConfig[1] * alpha), sin(lefPositionConfig[1] * alpha), 0}, phi(displayUnit = "rad", fixed = true, start = 0), useAxisFlange = true, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-28, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, -22}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.SphericalSpherical sphericalSpherical( computeRodLength = true,m = 6.94488325, rodColor = {230, 230, 230}, rodDiameter = 0.028, showMass = false, sphereDiameter = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape cranck(animateSphere = false,color = {70, 70, 70},m = 2.93228404, r = {lefPositionConfig[2] * h * sin(lefPositionConfig[1] * alpha), -lefPositionConfig[2] * h * cos(lefPositionConfig[1] * alpha), 0}, r_CM = {lefPositionConfig[2] * h * sin(lefPositionConfig[1] * alpha) / 2, -lefPositionConfig[2] * h * cos(lefPositionConfig[1] * alpha) / 2, 0}, sphereDiameter = 0.05, width = 0.03) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(animation = false) annotation(
    Placement(visible = true, transformation(origin = {4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sphericalSpherical.frame_b, frame_b) annotation(
    Line(points = {{40, 0}, {60, 0}}));
  connect(j1.frame_b, cranck.frame_a) annotation(
    Line(points = {{-20, 0}, {-8, 0}}));
  connect(j1.frame_a, frame_a) annotation(
    Line(points = {{-36, 0}, {-62, 0}}, color = {95, 95, 95}));
  connect(flange_a, j1.axis) annotation(
    Line(points = {{-62, 28}, {-28, 28}, {-28, 8}}));
  connect(cranck.frame_b, sphericalSpherical.frame_a) annotation(
    Line(points = {{8, 0}, {20, 0}}));
  connect(cranck.frame_a, fixedFrame.frame_a) annotation(
    Line(points = {{-8, 0}, {-14, 0}, {-14, 48}, {-6, 48}}, color = {95, 95, 95}));
  annotation(
    Icon(graphics = {Text(origin = {3, -124}, textColor = {0, 60, 255}, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {0, 1}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-84, 81}, {84, -81}}), Rectangle(origin = {2, 1}, lineColor = {131, 131, 131}, fillColor = {255, 255, 255}, lineThickness = 1, extent = {{-84, 81}, {84, -81}}), Bitmap(origin = {1, 2}, extent = {{-80, -90}, {80, 90}}, imageSource = "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")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end rss_leg;
