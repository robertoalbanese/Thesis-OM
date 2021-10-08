within OM_SP7.Body;

model rrs_leg
  import Modelica.SIunits;
  parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
  parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
  output SIunits.Position prism_s "distance of prismatic joint prismatic";
  output SIunits.Velocity prism_v "axis velocity of prismatic joint prismatic";
  parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
  parameter SIunits.Length baseZ = 0 "location of base_manipulator in y axis";
  parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
  parameter Integer side = 1 "right=1, left=-1";
  
  output SIunits.Angle j1_phi "angle of revolute joint j1";
  output SIunits.AngularVelocity j1_w "axis speed of revolute joint j1";
  
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(animateSphere = false, m = 0.1, r = { 0.2, -0.01, 0}, r_CM = { 0.1, 0, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {4, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, w(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-28, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(animateSphere = false, m = 0.1, r = {0.1, 0.31, 0}, r_CM = {0.1, 0.155, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {28, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-18, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {0, 0, 255}, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-24, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = false, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.never, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {28, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = false, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.never, w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(animateSphere = false, m = 0.1, r = {0.1, -0.33, 0}, r_CM = {0, -0.15, 0}, width = bodyWidth) annotation(
    Placement(visible = true, transformation(origin = {60, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-102, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(cylinderDiameter = jointWidth, n = {0, 0, 1}, phi(displayUnit = "rad", fixed = false), stateSelect = StateSelect.never, w(fixed = false, start = 1)) annotation(
        Placement(visible = true, transformation(origin = {60, -68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic annotation(
        Placement(visible = true, transformation(origin = {10, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(animation = false, r = {0.6, 0, 0}) annotation(
        Placement(visible = true, transformation(origin = {-50, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
      connect(revolute1.frame_b, bodyShape.frame_a) annotation(
        Line(points = {{-18, -64}, {-6, -64}}, color = {95, 95, 95}));
      connect(bodyShape1.frame_b, fixedFrame2.frame_a) annotation(
        Line(points = {{28, 32}, {28, 52}, {-34, 52}}, color = {95, 95, 95}));
      connect(bodyShape.frame_b, fixedFrame.frame_a) annotation(
        Line(points = {{14, -64}, {20, -64}, {20, -36}, {-52, -36}, {-52, -22}, {-28, -22}}));
      connect(bodyShape.frame_b, revolute.frame_a) annotation(
        Line(points = {{14, -64}, {28, -64}, {28, -22}}, color = {95, 95, 95}));
      connect(revolute.frame_b, bodyShape1.frame_a) annotation(
        Line(points = {{28, -2}, {28, 12}}));
      connect(bodyShape1.frame_b, revolute2.frame_a) annotation(
        Line(points = {{28, 32}, {28, 44}, {60, 44}, {60, 8}}));
      connect(revolute2.frame_b, bodyShape2.frame_a) annotation(
        Line(points = {{60, -12}, {60, -24}}, color = {95, 95, 95}));
      connect(bodyShape2.frame_b, revolute3.frame_a) annotation(
        Line(points = {{60, -44}, {60, -58}}));
      connect(prismatic.frame_b, revolute3.frame_b) annotation(
        Line(points = {{20, -88}, {60, -88}, {60, -78}}, color = {95, 95, 95}));
      connect(world.frame_b, fixedTranslation1.frame_a) annotation(
        Line(points = {{-92, -64}, {-82, -64}, {-82, -86}, {-60, -86}}));
      connect(fixedTranslation1.frame_b, prismatic.frame_a) annotation(
        Line(points = {{-40, -86}, {0, -86}, {0, -88}}, color = {95, 95, 95}));
      j1_phi = revolute1.phi;
      j1_w = revolute1.w;
      prism_s = prismatic.s;
      prism_v = prismatic.v;
  connect(revolute1.frame_a, world.frame_b) annotation(
        Line(points = {{-38, -64}, {-92, -64}}));
    end rrs_leg;
