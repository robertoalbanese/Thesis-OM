within OM_SP7.Body;

model platform
  import Modelica.SIunits;
  import Modelica.Math;
  import Modelica.Constants;
  
  constant SIunits.Length l = 0.7;
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  parameter SIunits.Angle alpha = Modelica.SIunits.Conversions.from_deg(120);
  parameter SIunits.Angle betha = Modelica.SIunits.Conversions.from_deg(5);
  parameter Real legPlatformRelativePositions[6, 3] = {{l * cos(0 * alpha + (-betha) ), 0, l * sin(0 * alpha  + (-betha) )}, {l * cos(0 * alpha + betha ), 0, l * sin(0 * alpha  + betha )}, {l * cos(1 * alpha + (-betha)), 0, l * sin(1 * alpha + (-betha))}, {l * cos(1 * alpha + betha), 0, l * sin(1 * alpha + betha)}, {l * cos(2 * alpha + (-betha)), 0, l * sin(2 * alpha + (-betha))}, {l * cos(2 * alpha + betha), 0, l * sin(2 * alpha + betha)}};
  outer Modelica.Mechanics.MultiBody.World world;
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = legPlatformRelativePositions[1]) annotation(
    Placement(visible = true, transformation(origin = {-10, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = legPlatformRelativePositions[3]) annotation(
      Placement(visible = true, transformation(origin = {-10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = legPlatformRelativePositions[4]) annotation(
      Placement(visible = true, transformation(origin = {-10, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = legPlatformRelativePositions[6]) annotation(
      Placement(visible = true, transformation(origin = {-10, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = legPlatformRelativePositions[2]) annotation(
      Placement(visible = true, transformation(origin = {-10, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[6] annotation(
    Placement(visible = true, transformation(origin = {-84, 8}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-121, -11}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j_vertical(n = {0, 1, 0}, phi(displayUnit = "rad", fixed = true), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {60, 6}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body platform(angles_fixed = true,m = 15, r_0(each fixed = true, start = {0, 0.5, 0}), r_CM = {0, 0, 0}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {92, 6}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = legPlatformRelativePositions[5]) annotation(
    Placement(visible = true, transformation(origin = {-10, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {60, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {-121, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(fixedTranslation2.frame_b, frame_b[2]) annotation(
    Line(points = {{-20, 36}, {-52, 36}, {-52, 8}, {-84, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, 36}, {30, 36}, {30, 6}, {52, 6}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, 56}, {30, 56}, {30, 6}, {52, 6}}));
  connect(fixedTranslation3.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, 14}, {30, 14}, {30, 6}, {52, 6}}));
  connect(fixedTranslation6.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, -46}, {30, -46}, {30, 6}, {52, 6}}));
  connect(fixedTranslation5.frame_b, frame_b[5]) annotation(
    Line(points = {{-20, -24}, {-52, -24}, {-52, 8}, {-84, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, -24}, {30, -24}, {30, 6}, {52, 6}}));
  connect(fixedTranslation3.frame_b, frame_b[3]) annotation(
    Line(points = {{-20, 14}, {-52, 14}, {-52, 8}, {-84, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_b, frame_b[6]) annotation(
    Line(points = {{-20, -46}, {-52, -46}, {-52, 8}, {-84, 8}}));
  connect(fixedTranslation1.frame_b, frame_b[1]) annotation(
    Line(points = {{-20, 56}, {-52, 56}, {-52, 8}, {-84, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_a, j_vertical.frame_a) annotation(
    Line(points = {{0, -4}, {30, -4}, {30, 6}, {52, 6}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, frame_b[4]) annotation(
    Line(points = {{-20, -4}, {-52, -4}, {-52, 8}, {-84, 8}}, color = {95, 95, 95}));
  connect(j_vertical.frame_b, platform.frame_a) annotation(
    Line(points = {{68, 6}, {84, 6}}, color = {95, 95, 95}));
  connect(flange_a, j_vertical.axis) annotation(
    Line(points = {{60, 80}, {60, 14}}));
    annotation(
    uses(Modelica(version = "3.2.3")),
  Icon(graphics = {Bitmap(origin = {3, 0}, extent = {{111, -88}, {-111, 88}}, imageSource = "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"), Text(origin = {-5, -71}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-115, 15}, {115, -15}}, textString = "%name")}, coordinateSystem(extent = {{-120, -100}, {120, 100}})),
  Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})));

end platform;
