within OM_SP7.Body;

model sp7_test
  import Modelica.SIunits;
  constant SIunits.Length l = 0.7;
  constant SIunits.Length h = 0.2;
  constant SIunits.Angle alpha = 120*(pi/180);
  constant SIunits.Angle betha = 5*(pi/180);
  final constant Real pi = 2 * Modelica.Math.asin(1.0);
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical8(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {1, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(m = 0.01, r = {-h * sin(0 * alpha), 0, h * cos(0 * alpha)}, r_CM = {-h * sin(0 * alpha) / 2, 0 / 2, h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-23, 43}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical2(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-1, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical5(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {43, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute5(n = {cos(2 * alpha), 0, sin(2 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.avoid, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-41, -67}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape10(m = 0.01, r = {-h * sin(2 * alpha), 0, h * cos(2 * alpha)}, r_CM = {-h * sin(2 * alpha) / 2, 0 / 2, h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-19, -67}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {cos(1 * alpha), 0, sin(1 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.default, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-43, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(m = 0.01, r = {h * sin(1 * alpha), 0, -h * cos(1 * alpha)}, r_CM = {h * sin(1 * alpha) / 2, 0 / 2, -h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-23, 9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {cos(0 * alpha), 0, sin(0 * alpha)}, phi(displayUnit = "rad", fixed = true), useAxisFlange = true, w(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-45, 43}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {l * cos(0 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(0 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape11(m = 0.01, r = {h * sin(2 * alpha), 0.5, -h * cos(2 * alpha)}, r_CM = {h * sin(2 * alpha) / 2, 0.25, -h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {27, -65}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical10(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {3, -65}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical3(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {43, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {l * cos(0 * alpha + betha), 0, l * sin(0 * alpha + betha)}) annotation(
    Placement(visible = true, transformation(origin = {70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical11(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {47, -65}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical9(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {45, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute4(n = {cos(2 * alpha), 0, sin(2 * alpha)}, phi(displayUnit = "rad"), stateSelect = StateSelect.avoid, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-41, -41}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape7(m = 0.01, r = {-h * sin(1 * alpha), 0, h * cos(1 * alpha)}, r_CM = {-h * sin(1 * alpha) / 2, 0 / 2, h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-21, -17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape8(m = 0.01, r = {h * sin(2 * alpha), 0, -h * cos(2 * alpha)}, r_CM = {h * sin(2 * alpha) / 2, 0 / 2, -h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-21, -41}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(m = 0.01, r = {h * sin(0 * alpha), 0, -h * cos(0 * alpha)}, r_CM = {h * sin(0 * alpha) / 2, 0 / 2, -h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-23, 79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {l * cos(2 * alpha + (-betha)), 0, l * sin(2 * alpha + (-betha))}) annotation(
    Placement(visible = true, transformation(origin = {72, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-1, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OM_SP7.Body.base base(useQuat = false) annotation(
    Placement(visible = true, transformation(origin = {-138, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {cos(1 * alpha), 0, sin(1 * alpha)}, phi(displayUnit = "rad"), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-43, 9}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape6(m = 0.01, r = {h * sin(1 * alpha), 0.5, -h * cos(1 * alpha)}, r_CM = {h * sin(1 * alpha) / 2, 0.25, -h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {25, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical4(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-1, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {l * cos(2 * alpha + betha), 0, l * sin(2 * alpha + betha)}) annotation(
    Placement(visible = true, transformation(origin = {74, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(m = 0.01, r = {-h * sin(0 * alpha), 0.5, h * cos(0 * alpha)}, r_CM = {-h * sin(0 * alpha) / 2, 0.25, h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {23, 81}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 0.01, r = {h * sin(0 * alpha), 0.5, -h * cos(0 * alpha)}, r_CM = {h * sin(0 * alpha) / 2, 0.25, -h * cos(0 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {23, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical7(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {45, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical1(useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {43, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {cos(0 * alpha), 0, sin(0 * alpha)}, phi(displayUnit = "rad", fixed = false), useAxisFlange = true, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-43, 79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 1, r_CM = {0, 0, 0}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {116, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape5(m = 0.01, r = {-h * sin(1 * alpha), 0.5, h * cos(1 * alpha)}, r_CM = {-h * sin(1 * alpha) / 2, 0.25, h * cos(1 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {23, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {l * cos(1 * alpha + betha), 0, l * sin(1 * alpha + betha)}) annotation(
    Placement(visible = true, transformation(origin = {72, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape9(m = 0.01, r = {-h * sin(2 * alpha), 0.5, h * cos(2 * alpha)}, r_CM = {-h * sin(2 * alpha) / 2, 0.25, h * cos(2 * alpha) / 2}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {25, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {l * cos(1 * alpha + (-betha)), 0, l * sin(1 * alpha + (-betha))}) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical6(sequence_angleStates = {2, 3, 1}, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {1, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(bodyShape7.frame_b, spherical6.frame_a) annotation(
    Line(points = {{-14, -17}, {-10, -17}, {-10, -15}, {-6, -15}}));
  connect(spherical9.frame_b, fixedTranslation4.frame_b) annotation(
    Line(points = {{52, -38}, {62, -38}, {62, -40}}, color = {95, 95, 95}));
  connect(bodyShape3.frame_b, spherical3.frame_a) annotation(
    Line(points = {{30, 81}, {36, 81}, {36, 80}}, color = {95, 95, 95}));
  connect(spherical10.frame_a, bodyShape10.frame_b) annotation(
    Line(points = {{-4, -64}, {-12, -64}, {-12, -66}}, color = {95, 95, 95}));
  connect(spherical2.frame_b, bodyShape3.frame_a) annotation(
    Line(points = {{6, 81}, {16, 81}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_b, spherical11.frame_b) annotation(
    Line(points = {{64, -66}, {54, -66}, {54, -64}}, color = {95, 95, 95}));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{-38, 43}, {-33, 43}, {-33, 44}, {-30, 44}}, color = {95, 95, 95}));
  connect(revolute4.frame_b, bodyShape8.frame_a) annotation(
    Line(points = {{-34, -40}, {-28, -40}}, color = {95, 95, 95}));
  connect(revolute5.frame_a, base.frame_a[6]) annotation(
    Line(points = {{-48, -66}, {-78, -66}, {-78, 20}, {-128, 20}}, color = {95, 95, 95}));
  connect(spherical3.frame_b, fixedTranslation1.frame_b) annotation(
    Line(points = {{50, 81}, {60, 81}, {60, 79}}));
  connect(revolute1.frame_b, bodyShape2.frame_a) annotation(
    Line(points = {{-36, 79}, {-30, 79}}));
  connect(bodyShape2.frame_b, spherical2.frame_a) annotation(
    Line(points = {{-16, 79}, {-12, 79}, {-12, 80}, {-8, 80}}, color = {95, 95, 95}));
  connect(bodyShape4.frame_b, spherical4.frame_a) annotation(
    Line(points = {{-16, 9}, {-8, 9}, {-8, 11}}));
  connect(revolute.frame_a, base.frame_a[2]) annotation(
    Line(points = {{-52, 43}, {-78, 43}, {-78, 19}, {-128, 19}}, color = {95, 95, 95}));
  connect(base.frame_a[3], revolute2.frame_a) annotation(
    Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, 9}, {-49.2, 9}}, color = {95, 95, 95}));
  connect(spherical11.frame_a, bodyShape11.frame_b) annotation(
    Line(points = {{40, -64}, {34, -64}}));
  connect(fixedTranslation1.frame_a, body1.frame_a) annotation(
    Line(points = {{80, 80}, {106, 80}}));
  connect(spherical6.frame_b, bodyShape6.frame_a) annotation(
    Line(points = {{8, -15}, {18, -15}}, color = {95, 95, 95}));
  connect(base.frame_a[1], revolute1.frame_a) annotation(
    Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, 79}, {-49.2, 79}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_a, body1.frame_a) annotation(
    Line(points = {{80, 44}, {92, 44}, {92, 80}, {106, 80}}, color = {95, 95, 95}));
  connect(revolute4.frame_a, base.frame_a[5]) annotation(
    Line(points = {{-48, -40}, {-78, -40}, {-78, 20}, {-128, 20}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_a, body1.frame_a) annotation(
    Line(points = {{82, -16}, {92, -16}, {92, 80}, {106, 80}}, color = {95, 95, 95}));
  connect(bodyShape5.frame_b, spherical5.frame_a) annotation(
    Line(points = {{30, 11}, {36, 11}}));
  connect(bodyShape11.frame_a, spherical10.frame_b) annotation(
    Line(points = {{20, -64}, {10, -64}}));
  connect(fixedTranslation4.frame_a, body1.frame_a) annotation(
    Line(points = {{82, -40}, {92, -40}, {92, 80}, {106, 80}}));
  connect(spherical8.frame_b, bodyShape9.frame_a) annotation(
    Line(points = {{8, -38}, {18, -38}}));
  connect(bodyShape9.frame_b, spherical9.frame_a) annotation(
    Line(points = {{32, -38}, {38, -38}}));
  connect(revolute2.frame_b, bodyShape4.frame_a) annotation(
    Line(points = {{-36, 9}, {-30, 9}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_a, body1.frame_a) annotation(
    Line(points = {{84, -66}, {92, -66}, {92, 80}, {106, 80}}));
  connect(bodyShape8.frame_b, spherical8.frame_a) annotation(
    Line(points = {{-14, -40}, {-6, -40}, {-6, -38}}, color = {95, 95, 95}));
  connect(spherical1.frame_b, fixedTranslation.frame_b) annotation(
    Line(points = {{50, 45}, {60, 45}, {60, 43}}, color = {95, 95, 95}));
  connect(revolute3.frame_b, bodyShape7.frame_a) annotation(
    Line(points = {{-36, -17}, {-28, -17}}));
  connect(bodyShape1.frame_b, spherical1.frame_a) annotation(
    Line(points = {{30, 45}, {36, 45}}, color = {95, 95, 95}));
  connect(base.frame_a[4], revolute3.frame_a) annotation(
    Line(points = {{-127.2, 20}, {-77.2, 20}, {-77.2, -17}, {-49.2, -17}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_a, body1.frame_a) annotation(
    Line(points = {{80, 10}, {92, 10}, {92, 80}, {106, 80}}));
  connect(bodyShape.frame_b, spherical.frame_a) annotation(
    Line(points = {{-16, 43}, {-12, 43}, {-12, 45}, {-8, 45}}, color = {95, 95, 95}));
  connect(bodyShape6.frame_b, spherical7.frame_a) annotation(
    Line(points = {{32, -15}, {38, -15}}));
  connect(spherical5.frame_b, fixedTranslation2.frame_b) annotation(
    Line(points = {{50, 11}, {55, 11}, {55, 9}, {60, 9}}));
  connect(spherical.frame_b, bodyShape1.frame_a) annotation(
    Line(points = {{6, 45}, {16, 45}}));
  connect(spherical4.frame_b, bodyShape5.frame_a) annotation(
    Line(points = {{6, 11}, {16, 11}}));
  connect(bodyShape10.frame_a, revolute5.frame_b) annotation(
    Line(points = {{-26, -66}, {-34, -66}}, color = {95, 95, 95}));
  connect(spherical7.frame_b, fixedTranslation3.frame_b) annotation(
    Line(points = {{52, -15}, {62, -15}, {62, -17}}, color = {95, 95, 95}));
end sp7_test;
