package sixRSS_closedloop_SP
model platform
  import Modelica.SIunits;
  import Modelica.Math;
  import Modelica.Constants;
  
  constant SIunits.Length l = 0.7;
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  parameter SIunits.Angle alpha = 120*(Constants.pi/180);
  parameter SIunits.Angle betha = 5*(Constants.pi/180);
  //outer
  parameter Real legPlatformRelativePositions[6, 3] = {{l * cos(0 * alpha + (-betha) ), 0, l * sin(0 * alpha  + (-betha) )}, {l * cos(0 * alpha + betha ), 0, l * sin(0 * alpha  + betha )}, {l * cos(1 * alpha + (-betha)), 0, l * sin(1 * alpha + (-betha))}, {l * cos(1 * alpha + betha), 0, l * sin(1 * alpha + betha)}, {l * cos(2 * alpha + (-betha)), 0, l * sin(2 * alpha + (-betha))}, {l * cos(2 * alpha + betha), 0, l * sin(2 * alpha + betha)}};
  inner Modelica.Mechanics.MultiBody.World world;
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

model base
  import Modelica.SIunits;
  import Modelica.Math;
  import Modelica.Constants;
  
  constant SIunits.Length l = 0.7;
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  parameter SIunits.Angle alpha = 120*(Constants.pi/180);
  parameter SIunits.Angle betha = 5*(Constants.pi/180);
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
  Modelica.Mechanics.MultiBody.Parts.Body body(enforceStates = stateSelect == StateSelect.always,m = 5, r_CM = {0, 0, 0}, useQuaternions = useQuat)  annotation(
    Placement(visible = true, transformation(origin = {12, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(fixed.frame_b, body.frame_a) annotation(
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

model fullmodel
  import Modelica.SIunits;
  sixRSS_closedloop_SP.base base(useQuat = false)  annotation(
  Placement(visible = true, transformation(origin = {-138, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  constant SIunits.Length l = 0.7;
  constant SIunits.Length h = 0.2;
  constant SIunits.Angle alpha = 120*(pi/180);
  constant SIunits.Angle betha = 5*(pi/180);
  final constant Real pi = 2 * Modelica.Math.asin(1.0);
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(m = 0.01, r = {h*sin(0*alpha), 0, -h*cos(0*alpha)}, r_CM = {h * sin(0 * alpha) / 2, 0 / 2, -h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-23, 79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {cos(0 * alpha), 0, sin(0 * alpha)}, phi(displayUnit = "rad", fixed = false), useAxisFlange = true, w(fixed = false)) annotation(
      Placement(visible = true, transformation(origin = {-43, 79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical2(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-1, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(m = 0.01, r = {-h * sin(0 * alpha), 0.5, h * cos(0 * alpha)}, r_CM = {-h * sin(0 * alpha) / 2, 0.25, h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {23, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical3(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {43, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {l * cos(0 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(0 * (pi / 180) + (-5) * (pi / 180))}) annotation(
      Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 1, r_CM = {0, 0, 0}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {116, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {cos(0 * alpha), 0, sin(0 * alpha)}, phi(displayUnit = "rad", fixed = true), useAxisFlange = true, w(fixed = true)) annotation(
      Placement(visible = true, transformation(origin = {-45, 43}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(m = 0.01, r = {-h * sin(0 * alpha), 0, h * cos(0 * alpha)}, r_CM = {-h * sin(0 * alpha) / 2, 0 / 2, h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-23, 43}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-1, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical1(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {43, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 0.01, r = {h * sin(0 * alpha), 0.5, -h * cos(0 * alpha)}, r_CM = {h * sin(0 * alpha) / 2, 0.25, -h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {23, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {l * cos(0 * alpha + betha), 0, l * sin(0 * alpha + betha)}) annotation(
      Placement(visible = true, transformation(origin = {70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {cos(1 * alpha), 0, sin(1 * alpha)}, phi(displayUnit = "rad"), useAxisFlange = true) annotation(
      Placement(visible = true, transformation(origin = {-43, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(m = 0.01, r = {h * sin(1 * alpha), 0, -h * cos(1 * alpha)}, r_CM = {h * sin(1 * alpha) / 2, 0 / 2, -h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-23, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical4(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-1, 13}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape5(m = 0.01, r = {-h * sin(1 * alpha), 0.5, h * cos(1 * alpha)}, r_CM = {-h * sin(1 * alpha) / 2, 0.25, h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {23, 13}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical5(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {43, 13}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {l * cos(1 * alpha + (-betha)), 0, l * sin(1 * alpha + (-betha))}) annotation(
      Placement(visible = true, transformation(origin = {70, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape6(m = 0.01, r = {h * sin(1 * alpha), 0.5, -h * cos(1 * alpha)}, r_CM = {h * sin(1 * alpha) / 2, 0.25, -h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {25, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical6(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {1, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape7(m = 0.01, r = {-h * sin(1 * alpha), 0, h * cos(1 * alpha)}, r_CM = {-h * sin(1 * alpha) / 2, 0 / 2, h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-21, -19}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {cos(1 * alpha), 0, sin(1 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.default, useAxisFlange = true) annotation(
      Placement(visible = true, transformation(origin = {-43, -19}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {l * cos(1 * alpha + betha), 0, l * sin(1 * alpha + betha)}) annotation(
      Placement(visible = true, transformation(origin = {72, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical7(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {45, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape8(m = 0.01, r = {h * sin(2 * alpha), 0, -h * cos(2 * alpha)}, r_CM = {h * sin(2 * alpha) / 2, 0 / 2, -h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-21, -49}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute4(n = {cos(2 * alpha), 0, sin(2 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.avoid, useAxisFlange = true) annotation(
      Placement(visible = true, transformation(origin = {-41, -49}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical8(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {1, -47}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape9(m = 0.01, r = {-h * sin(2 * alpha), 0.5, h * cos(2 * alpha)}, r_CM = {-h * sin(2 * alpha) / 2, 0.25, h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {25, -47}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical9(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {45, -47}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {l * cos(2 * alpha + (-betha)), 0, l * sin(2 * alpha + (-betha))}) annotation(
      Placement(visible = true, transformation(origin = {72, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute5(n = {cos(2 * alpha), 0, sin(2 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.avoid, useAxisFlange = true) annotation(
      Placement(visible = true, transformation(origin = {-41, -79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape10(m = 0.01, r = {-h * sin(2 * alpha), 0, h * cos(2 * alpha)}, r_CM = {-h * sin(2 * alpha) / 2, 0 / 2, h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {-19, -79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical10(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {3, -77}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape11(m = 0.01, r = {h * sin(2 * alpha), 0.5, -h * cos(2 * alpha)}, r_CM = {h * sin(2 * alpha) / 2, 0.25, -h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {27, -77}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical11(useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {47, -77}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {l * cos(2 * alpha + betha), 0, l * sin(2 * alpha + betha)}) annotation(
      Placement(visible = true, transformation(origin = {74, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(base.frame_a[1], revolute1.frame_a) annotation(
      Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, 79}, {-49.2, 79}}, color = {95, 95, 95}));
    connect(revolute1.frame_b, bodyShape2.frame_a) annotation(
      Line(points = {{-36, 79}, {-30, 79}}));
    connect(bodyShape2.frame_b, spherical2.frame_a) annotation(
      Line(points = {{-16, 79}, {-12, 79}, {-12, 80}, {-8, 80}}, color = {95, 95, 95}));
    connect(spherical2.frame_b, bodyShape3.frame_a) annotation(
      Line(points = {{6, 81}, {16, 81}}, color = {95, 95, 95}));
    connect(bodyShape3.frame_b, spherical3.frame_a) annotation(
      Line(points = {{30, 81}, {36, 81}, {36, 80}}, color = {95, 95, 95}));
    connect(spherical3.frame_b, fixedTranslation1.frame_b) annotation(
      Line(points = {{50, 81}, {60, 81}, {60, 79}}));
    connect(fixedTranslation1.frame_a, body1.frame_a) annotation(
      Line(points = {{80, 80}, {106, 80}}));
    connect(revolute.frame_b, bodyShape.frame_a) annotation(
      Line(points = {{-38, 43}, {-33, 43}, {-33, 44}, {-30, 44}}, color = {95, 95, 95}));
    connect(bodyShape.frame_b, spherical.frame_a) annotation(
      Line(points = {{-16, 43}, {-12, 43}, {-12, 45}, {-8, 45}}, color = {95, 95, 95}));
    connect(spherical.frame_b, bodyShape1.frame_a) annotation(
      Line(points = {{6, 45}, {16, 45}}));
    connect(bodyShape1.frame_b, spherical1.frame_a) annotation(
      Line(points = {{30, 45}, {36, 45}}, color = {95, 95, 95}));
    connect(spherical1.frame_b, fixedTranslation.frame_b) annotation(
      Line(points = {{50, 45}, {60, 45}, {60, 43}}, color = {95, 95, 95}));
    connect(revolute.frame_a, base.frame_a[2]) annotation(
      Line(points = {{-52, 43}, {-78, 43}, {-78, 19}, {-128, 19}}, color = {95, 95, 95}));
    connect(base.frame_a[3], revolute2.frame_a) annotation(
      Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, 11}, {-50, 11}}, color = {95, 95, 95}));
    connect(revolute2.frame_b, bodyShape4.frame_a) annotation(
      Line(points = {{-36, 11}, {-30, 11}}, color = {95, 95, 95}));
    connect(bodyShape4.frame_b, spherical4.frame_a) annotation(
      Line(points = {{-16, 11}, {-8, 11}, {-8, 13}}));
    connect(spherical4.frame_b, bodyShape5.frame_a) annotation(
      Line(points = {{6, 13}, {16, 13}}));
    connect(bodyShape5.frame_b, spherical5.frame_a) annotation(
      Line(points = {{30, 13}, {36, 13}}));
    connect(spherical5.frame_b, fixedTranslation2.frame_b) annotation(
      Line(points = {{50, 13}, {55, 13}, {55, 11}, {60, 11}}));
    connect(revolute3.frame_b, bodyShape7.frame_a) annotation(
      Line(points = {{-36, -19}, {-28, -19}}));
    connect(bodyShape7.frame_b, spherical6.frame_a) annotation(
      Line(points = {{-14, -19}, {-10, -19}, {-10, -17}, {-6, -17}}));
    connect(spherical6.frame_b, bodyShape6.frame_a) annotation(
      Line(points = {{8, -17}, {18, -17}}, color = {95, 95, 95}));
    connect(bodyShape6.frame_b, spherical7.frame_a) annotation(
      Line(points = {{32, -17}, {38, -17}}));
    connect(spherical7.frame_b, fixedTranslation3.frame_b) annotation(
      Line(points = {{52, -17}, {62, -17}, {62, -19}}, color = {95, 95, 95}));
    connect(base.frame_a[4], revolute3.frame_a) annotation(
      Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, -19}, {-50, -19}}, color = {95, 95, 95}));
    connect(fixedTranslation.frame_a, body1.frame_a) annotation(
      Line(points = {{80, 44}, {92, 44}, {92, 80}, {106, 80}}, color = {95, 95, 95}));
    connect(fixedTranslation2.frame_a, body1.frame_a) annotation(
      Line(points = {{80, 12}, {92, 12}, {92, 80}, {106, 80}}));
    connect(fixedTranslation3.frame_a, body1.frame_a) annotation(
      Line(points = {{82, -18}, {92, -18}, {92, 80}, {106, 80}}, color = {95, 95, 95}));
    connect(fixedTranslation4.frame_a, body1.frame_a) annotation(
      Line(points = {{82, -48}, {92, -48}, {92, 80}, {106, 80}}));
    connect(spherical9.frame_b, fixedTranslation4.frame_b) annotation(
      Line(points = {{52, -47}, {62, -47}, {62, -49}}, color = {95, 95, 95}));
    connect(bodyShape9.frame_b, spherical9.frame_a) annotation(
      Line(points = {{32, -47}, {38, -47}}));
    connect(spherical8.frame_b, bodyShape9.frame_a) annotation(
      Line(points = {{8, -47}, {18, -47}}));
    connect(bodyShape8.frame_b, spherical8.frame_a) annotation(
      Line(points = {{-14, -49}, {-6, -49}, {-6, -47}}, color = {95, 95, 95}));
    connect(revolute4.frame_b, bodyShape8.frame_a) annotation(
      Line(points = {{-34, -49}, {-28, -49}}, color = {95, 95, 95}));
    connect(revolute4.frame_a, base.frame_a[5]) annotation(
      Line(points = {{-48, -49}, {-78, -49}, {-78, 20}, {-128, 20}}, color = {95, 95, 95}));
    connect(fixedTranslation5.frame_b, spherical11.frame_b) annotation(
      Line(points = {{64, -78}, {54, -78}, {54, -76}}, color = {95, 95, 95}));
    connect(spherical11.frame_a, bodyShape11.frame_b) annotation(
      Line(points = {{40, -77}, {34, -77}}));
    connect(bodyShape11.frame_a, spherical10.frame_b) annotation(
      Line(points = {{20, -77}, {10, -77}}));
    connect(spherical10.frame_a, bodyShape10.frame_b) annotation(
      Line(points = {{-4, -77}, {-12, -77}, {-12, -79}}, color = {95, 95, 95}));
    connect(bodyShape10.frame_a, revolute5.frame_b) annotation(
      Line(points = {{-26, -79}, {-34, -79}}, color = {95, 95, 95}));
    connect(revolute5.frame_a, base.frame_a[6]) annotation(
      Line(points = {{-48, -79}, {-78, -79}, {-78, 20}, {-128, 20}}, color = {95, 95, 95}));
    connect(fixedTranslation5.frame_a, body1.frame_a) annotation(
      Line(points = {{84, -78}, {92, -78}, {92, 80}, {106, 80}}));
  protected
  annotation(
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=infoXmlOperations -d=backenddaeinfo -d=stateselection -d=discreteinfo",
      __OpenModelica_simulationFlags(s = "dassl"));end fullmodel;
  annotation(
    uses(Modelica(version = "3.2.3"), youBot(version = "1")));
end sixRSS_closedloop_SP;
