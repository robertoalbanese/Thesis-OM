within OM_SP7.Body;

model base
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
  parameter Real legBasePoints[6, 3] = {{l * cos(0 * alpha + (-betha) ), 0, l * sin(0 * alpha  + (-betha) )}, {l * cos(0 * alpha + betha ), 0, l * sin(0 * alpha  + betha )}, {l * cos(1 * alpha + (-betha)), 0, l * sin(1 * alpha + (-betha))}, {l * cos(1 * alpha + betha), 0, l * sin(1 * alpha + betha)}, {l * cos(2 * alpha + (-betha)), 0, l * sin(2 * alpha + (-betha))}, {l * cos(2 * alpha + betha), 0, l * sin(2 * alpha + betha)}};
  outer Modelica.Mechanics.MultiBody.World world;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a[6] annotation(
    Placement(visible = true, transformation(origin = {104, 16}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-16, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r = legBasePoints[1]) annotation(
    Placement(visible = true, transformation(origin = {54, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(r = legBasePoints[2]) annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(r = legBasePoints[3]) annotation(
    Placement(visible = true, transformation(origin = {-46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed4(r = legBasePoints[4]) annotation(
    Placement(visible = true, transformation(origin = {-74, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed5(r = legBasePoints[5]) annotation(
    Placement(visible = true, transformation(origin = {-68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed6(r = legBasePoints[6]) annotation(
    Placement(visible = true, transformation(origin = {-44, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body base(enforceStates = stateSelect == StateSelect.always,m = 5, r_CM = {0, 0, 0}, useQuaternions = useQuat)  annotation(
    Placement(visible = true, transformation(origin = {12, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(fixed.frame_b, base.frame_a) annotation(
    Line(points = {{-6, 12}, {2, 12}}, color = {95, 95, 95}));
connect(fixed1.frame_b, frame_a[1]) annotation(
    Line(points = {{64, -2}, {86, -2}, {86, 16}, {104, 16}}));
connect(fixed2.frame_b, frame_a[2]) annotation(
    Line(points = {{62, 30}, {86, 30}, {86, 16}, {104, 16}}, color = {95, 95, 95}));
connect(fixed3.frame_b, frame_a[3]) annotation(
    Line(points = {{-36, 76}, {86, 76}, {86, 16}, {104, 16}}));
connect(fixed4.frame_b, frame_a[4]) annotation(
    Line(points = {{-64, 50}, {86, 50}, {86, 16}, {104, 16}}));
connect(fixed5.frame_b, frame_a[5]) annotation(
    Line(points = {{-58, -26}, {86, -26}, {86, 16}, {104, 16}}));
connect(fixed6.frame_b, frame_a[6]) annotation(
    Line(points = {{-34, -68}, {86, -68}, {86, 16}, {104, 16}}));
  annotation(
    uses(Modelica(version = "3.2.3")));

end base;
