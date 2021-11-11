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
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[6] annotation(
    Placement(visible = true, transformation(origin = {-74, 8}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = legPlatformRelativePositions[1]) annotation(
      Placement(visible = true, transformation(origin = {0, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = legPlatformRelativePositions[2]) annotation(
      Placement(visible = true, transformation(origin = {0, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = legPlatformRelativePositions[3]) annotation(
      Placement(visible = true, transformation(origin = {0, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = legPlatformRelativePositions[4]) annotation(
      Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = legPlatformRelativePositions[5]) annotation(
      Placement(visible = true, transformation(origin = {0, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = legPlatformRelativePositions[6]) annotation(
      Placement(visible = true, transformation(origin = {0, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.Body platform(m = 1, r_CM = {0, 0, 0}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {72, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


equation
  connect(fixedTranslation1.frame_a, platform.frame_a) annotation(
      Line(points = {{10, 56}, {40, 56}, {40, 4}, {62, 4}}));
  connect(fixedTranslation2.frame_a, platform.frame_a) annotation(
      Line(points = {{10, 36}, {40, 36}, {40, 4}, {62, 4}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_a, platform.frame_a) annotation(
      Line(points = {{10, 14}, {40, 14}, {40, 4}, {62, 4}}));
  connect(fixedTranslation4.frame_a, platform.frame_a) annotation(
      Line(points = {{10, -4}, {40, -4}, {40, 4}, {62, 4}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_a, platform.frame_a) annotation(
      Line(points = {{10, -24}, {40, -24}, {40, 4}, {62, 4}}));
  connect(fixedTranslation6.frame_a, platform.frame_a) annotation(
      Line(points = {{10, -46}, {40, -46}, {40, 4}, {62, 4}}));
  connect(fixedTranslation1.frame_b, frame_b[1]) annotation(
      Line(points = {{-10, 56}, {-42, 56}, {-42, 8}, {-74, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, frame_b[2]) annotation(
      Line(points = {{-10, 36}, {-42, 36}, {-42, 8}, {-74, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, frame_b[3]) annotation(
      Line(points = {{-10, 14}, {-42, 14}, {-42, 8}, {-74, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, frame_b[4]) annotation(
      Line(points = {{-10, -4}, {-42, -4}, {-42, 8}, {-74, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_b, frame_b[5]) annotation(
      Line(points = {{-10, -24}, {-42, -24}, {-42, 8}, {-74, 8}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_b, frame_b[6]) annotation(
      Line(points = {{-10, -46}, {-42, -46}, {-42, 8}, {-74, 8}}));
    annotation(
    uses(Modelica(version = "3.2.3")));

end platform;
