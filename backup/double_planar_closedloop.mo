model double_planar_closedloop
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false)  annotation(
    Placement(visible = true, transformation(origin = {-12, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true), w(fixed = false, start = 0.1))  annotation(
    Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(m = 1, r = {0.1, 1, 0}, r_CM = {0.05, 0.5, 0})  annotation(
    Placement(visible = true, transformation(origin = {-78, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 1, r = {1, 0, 0}, r_CM = {0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(displayUnit = "rad"), w(fixed = false, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {-6, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(m = 1, r = {-0.1, -1, 0}, r_CM = {-0.05, -0.5, 0}) annotation(
    Placement(visible = true, transformation(origin = {-6, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(m = 1, r = {-1, 0, 0}, r_CM = {-0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-42, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(m = 1, r = {1, 0, 0}, r_CM = {0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {52, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape5(m = 1, r = {-1, 0, 0}, r_CM = {-0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {38, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape6(m = 1, r = {-0.1, -1, 0}, r_CM = {-0.05, -0.5, 0}) annotation(
    Placement(visible = true, transformation(origin = {74, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(displayUnit = "rad", fixed = true), w(fixed = false, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {-56, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute3 annotation(
    Placement(visible = true, transformation(origin = {-6, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute5(phi(displayUnit = "rad"), w(fixed = false, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {74, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute9(phi(displayUnit = "rad"), w(fixed = false, start = 0.1)) annotation(
    Placement(visible = true, transformation(origin = {22, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute4 annotation(
    Placement(visible = true, transformation(origin = {74, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{-78, 24}, {-78, 42}}, color = {95, 95, 95}));
  connect(bodyShape1.frame_b, revolute2.frame_a) annotation(
    Line(points = {{-20, 74}, {-6, 74}, {-6, 70}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-2, -56}, {-78, -56}, {-78, 4}}, color = {95, 95, 95}));
  connect(bodyShape2.frame_a, revolute2.frame_b) annotation(
    Line(points = {{-6, 44}, {-6, 50}}, color = {95, 95, 95}));
  connect(bodyShape3.frame_b, revolute.frame_a) annotation(
    Line(points = {{-52, -10}, {-78, -10}, {-78, 4}}));
  connect(revolute1.frame_b, bodyShape1.frame_a) annotation(
    Line(points = {{-46, 74}, {-40, 74}}, color = {95, 95, 95}));
  connect(revolute1.frame_a, bodyShape.frame_b) annotation(
    Line(points = {{-66, 74}, {-78, 74}, {-78, 62}}, color = {95, 95, 95}));
  connect(bodyShape2.frame_b, revolute3.frame_a) annotation(
    Line(points = {{-6, 24}, {-6, 20}}, color = {95, 95, 95}));
  connect(revolute3.frame_b, bodyShape3.frame_a) annotation(
    Line(points = {{-6, 0}, {-6, -10}, {-32, -10}}));
  connect(revolute5.frame_b, bodyShape6.frame_a) annotation(
    Line(points = {{74, 50}, {74, 44}}, color = {95, 95, 95}));
  connect(revolute9.frame_b, bodyShape4.frame_a) annotation(
    Line(points = {{32, 74}, {42, 74}}, color = {95, 95, 95}));
  connect(bodyShape6.frame_b, revolute4.frame_a) annotation(
    Line(points = {{74, 24}, {74, 18}}, color = {95, 95, 95}));
  connect(revolute4.frame_b, bodyShape5.frame_a) annotation(
    Line(points = {{74, -2}, {74, -10}, {48, -10}}, color = {95, 95, 95}));
  connect(bodyShape3.frame_a, bodyShape5.frame_b) annotation(
    Line(points = {{-32, -10}, {28, -10}}, color = {95, 95, 95}));
  connect(bodyShape4.frame_b, revolute5.frame_a) annotation(
    Line(points = {{62, 74}, {74, 74}, {74, 70}}));
  connect(bodyShape1.frame_b, revolute9.frame_a) annotation(
    Line(points = {{-20, 74}, {12, 74}}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end double_planar_closedloop;
