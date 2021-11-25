model rrrr_closedLoop
  import Modelica.SIunits;
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
  parameter SIunits.Length baseZ = 0 "location of base_manipulator in y axis";
  parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
  parameter Integer side = 1 "right=1, left=-1";
  //output SIunits.Position prism_s "distance of prismatic joint prismatic";
  //output SIunits.Velocity prism_v "axis velocity of prismatic joint prismatic";
  //output SIunits.Angle j1_phi "angle of revolute joint j1";
  //output SIunits.AngularVelocity j1_w "axis speed of revolute joint j1";
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-56, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, phi(displayUnit = "rad", fixed = false), stateSelect = StateSelect.always, w(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {24, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j2(cylinderDiameter = jointWidth) annotation(
    Placement(visible = true, transformation(origin = {70, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b1(animateSphere = false, m = 1, r = {0.2, 0, 0}, r_CM = {0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {56, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b2(animateSphere = false, m = 1, r = {-0.2, 0.3, 0}, r_CM = {-0.1, 0.15, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {70, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape b3(animateSphere = false, height = bodyWidth, m = 1, r = {-0.2, -0.3, 0}, r_CM = {-0.1, -0.15, 0}) annotation(
    Placement(visible = true, transformation(origin = {-86, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(animateSphere = false, m = 1, r = {0.2, 0, 0}, r_CM = {0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {-26, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j4(cylinderDiameter = jointWidth, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {-60, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute j3(cylinderDiameter = jointWidth, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {-2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
//j1_phi = revolute1.phi;
//j1_w = revolute1.w;
//prism_s = prismatic.s;
//prism_v = prismatic.v;
  connect(j1.frame_b, b1.frame_a) annotation(
    Line(points = {{34, -38}, {46, -38}}));
  connect(b1.frame_b, j2.frame_a) annotation(
    Line(points = {{66, -38}, {70, -38}, {70, -2}}, color = {95, 95, 95}));
  connect(j2.frame_b, b2.frame_a) annotation(
    Line(points = {{70, 18}, {70, 32}}, color = {95, 95, 95}));
  connect(b3.frame_b, j4.frame_a) annotation(
    Line(points = {{-86, 20}, {-86, -38}, {-70, -38}}));
  connect(j4.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{-50, -38}, {-36, -38}}));
  connect(bodyShape.frame_b, j1.frame_b) annotation(
    Line(points = {{-16, -38}, {-6, -38}, {-6, -18}, {38, -18}, {38, -38}, {34, -38}}, color = {95, 95, 95}));
  connect(j3.frame_a, b2.frame_b) annotation(
    Line(points = {{8, 70}, {70, 70}, {70, 52}}, color = {95, 95, 95}));
  connect(j3.frame_b, b3.frame_a) annotation(
    Line(points = {{-12, 70}, {-86, 70}, {-86, 40}}, color = {95, 95, 95}));
  connect(world.frame_b, j1.frame_a) annotation(
    Line(points = {{-46, -82}, {6, -82}, {6, -38}, {14, -38}}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end rrrr_closedLoop;
