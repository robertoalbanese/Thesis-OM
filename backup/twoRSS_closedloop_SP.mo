package twoRSS_closedloop_SP
model platform
  import Modelica.SIunits;
  import Modelica.Math;
  constant SIunits.Length l = 0.7;
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  final constant Real pi = 2 * Modelica.Math.asin(1.0);
  parameter Boolean useQuat = false;
  Modelica.Mechanics.MultiBody.Parts.Body body(enforceStates = stateSelect == StateSelect.always,m = 1, r_0(each fixed = true, start = {0, 0.5, 0}), r_CM = {0, 0, 0}, useQuaternions = useQuat, v_0(each fixed = true, start = {0, 0, 0}), w_a(each fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {l * cos(0 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(0 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-18, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {l * cos(0 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(0 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-14, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {l * cos(120 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(120 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-18, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {l * cos(120 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(120 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-12, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {l * cos(240 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(240 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-14, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = {l * cos(240 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(240 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-16, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  //outer Modelica.Mechanics.MultiBody.World world;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[6] annotation(
    Placement(visible = true, transformation(origin = {-76, 10}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));

equation
  connect(fixedTranslation1.frame_a, body.frame_a) annotation(
    Line(points = {{-8, 68}, {30, 68}, {30, 2}, {60, 2}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_a, body.frame_a) annotation(
    Line(points = {{-4, 50}, {30, 50}, {30, 2}, {60, 2}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_a, body.frame_a) annotation(
    Line(points = {{-8, 24}, {30, 24}, {30, 2}, {60, 2}}));
  connect(fixedTranslation4.frame_a, body.frame_a) annotation(
    Line(points = {{-2, 2}, {60, 2}}));
  connect(fixedTranslation5.frame_a, body.frame_a) annotation(
    Line(points = {{-4, -24}, {30, -24}, {30, 2}, {60, 2}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_a, body.frame_a) annotation(
    Line(points = {{-6, -46}, {30, -46}, {30, 2}, {60, 2}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, frame_b[2]) annotation(
    Line(points = {{-24, 50}, {-56, 50}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, frame_b[3]) annotation(
    Line(points = {{-28, 24}, {-56, 24}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, frame_b[4]) annotation(
    Line(points = {{-22, 2}, {-56, 2}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_b, frame_b[5]) annotation(
    Line(points = {{-24, -24}, {-56, -24}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_b, frame_b[6]) annotation(
    Line(points = {{-26, -46}, {-56, -46}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, frame_b[1]) annotation(
    Line(points = {{-28, 68}, {-56, 68}, {-56, 10}, {-76, 10}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")));

end platform;

model base
  import Modelica.SIunits;
  import Modelica.Math;
  constant SIunits.Length l = 0.7;
  constant StateSelect stateSelect = StateSelect.prefer annotation(
    Dialog(tab = "Advanced"));
  final constant Real pi = 2 * Modelica.Math.asin(1.0);
  parameter Boolean useQuat = false;
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-16, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r = {l * cos(0 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(0 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {54, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(r = {l * cos(0 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(0 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(r = {l * cos(120 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(120 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed4(r = {l * cos(120 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(120 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-74, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed5(r = {l * cos(240 * (pi / 180) + (-5) * (pi / 180)), 0, l * sin(240 * (pi / 180) + (-5) * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed6(r = {l * cos(240 * (pi / 180) + 5 * (pi / 180)), 0, l * sin(240 * (pi / 180) + 5 * (pi / 180))}) annotation(
    Placement(visible = true, transformation(origin = {-44, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(enforceStates = stateSelect == StateSelect.always,m = 5, r_CM = {0, 0, 0}, useQuaternions = useQuat)  annotation(
    Placement(visible = true, transformation(origin = {12, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  outer Modelica.Mechanics.MultiBody.World world;
Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a[6] annotation(
    Placement(visible = true, transformation(origin = {104, 16}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
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
  inner Modelica.Mechanics.MultiBody.World world annotation(
      Placement(visible = true, transformation(origin = {-68, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SP7_test.platform platform(useQuat = false) annotation(
      Placement(visible = true, transformation(origin = {106, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SP7_test.base base(useQuat = false) annotation(
      Placement(visible = true, transformation(origin = {-26, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, phi(displayUnit = "rad")) annotation(
      Placement(visible = true, transformation(origin = {-1, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(m = 0.01, r = {0, 0, -0.2}, r_CM = {0, 0, -0.1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {17, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Spherical spherical(useQuaternions = false)  annotation(
      Placement(visible = true, transformation(origin = {35, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 0.002, r = {0, 0.5, 0.2}, r_CM = {0, 0.25, 0.1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {51, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Spherical spherical1(useQuaternions = false)  annotation(
      Placement(visible = true, transformation(origin = {71, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {1, 0, 0}, phi(displayUnit = "rad")) annotation(
      Placement(visible = true, transformation(origin = {1, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(m = 0.01, r = {0, 0, 0.2}, r_CM = {0, 0, 0.1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {21, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Spherical spherical2(useQuaternions = false)  annotation(
      Placement(visible = true, transformation(origin = {37, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(m = 0.002, r = {0, 0.5, -0.2}, r_CM = {0, 0.25, -0.1}, useQuaternions = false) annotation(
      Placement(visible = true, transformation(origin = {53, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Spherical spherical3(useQuaternions = false)  annotation(
      Placement(visible = true, transformation(origin = {73, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  equation
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
      Line(points = {{6, 29}, {10, 29}}));
  connect(bodyShape.frame_b, spherical.frame_a) annotation(
      Line(points = {{24, 29}, {28, 29}}, color = {95, 95, 95}));
    connect(spherical.frame_b, bodyShape1.frame_a) annotation(
      Line(points = {{42, 29}, {44, 29}}, color = {95, 95, 95}));
    connect(bodyShape1.frame_b, spherical1.frame_a) annotation(
      Line(points = {{58, 30}, {64, 30}}));
    connect(revolute.frame_a, base.frame_a[1]) annotation(
      Line(points = {{-8, 30}, {-10, 30}, {-10, 14}, {-16, 14}}));
    connect(spherical1.frame_b, platform.frame_b[1]) annotation(
      Line(points = {{78, 30}, {88, 30}, {88, 12}, {96, 12}}, color = {95, 95, 95}));
    connect(base.frame_a[2], revolute1.frame_a) annotation(
      Line(points = {{-16, 14}, {-10, 14}, {-10, 0}, {-6, 0}}, color = {95, 95, 95}));
    connect(revolute1.frame_b, bodyShape2.frame_a) annotation(
      Line(points = {{8, 0}, {14, 0}}, color = {95, 95, 95}));
    connect(bodyShape2.frame_b, spherical2.frame_a) annotation(
      Line(points = {{28, 0}, {30, 0}}, color = {95, 95, 95}));
    connect(spherical2.frame_b, bodyShape3.frame_a) annotation(
      Line(points = {{44, 0}, {46, 0}}, color = {95, 95, 95}));
    connect(bodyShape3.frame_b, spherical3.frame_a) annotation(
      Line(points = {{60, 0}, {66, 0}}));
    connect(spherical3.frame_b, platform.frame_b[2]) annotation(
      Line(points = {{80, 0}, {88, 0}, {88, 12}, {96, 12}}));
  end fullmodel;
  annotation(
    uses(Modelica(version = "3.2.3")));
end twoRSS_closedloop_SP;
