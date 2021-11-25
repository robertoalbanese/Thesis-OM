package six_rrr_3arm_implementation_unconnected
  package Body
    model rss_leg
      import Modelica.SIunits;
      parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
      parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
      parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
      parameter SIunits.Length baseX = 0 "location of base_manipulator in x axis";
      parameter SIunits.Length baseY = 0 "location of base_manipulator in y axis";
      parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
      parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
      parameter SIunits.Conversions.NonSIunits.Angle_deg motorInitialAngle = 0 "Initial angle at start of simulation";
      parameter SIunits.AngularVelocity motorInitialVelocity = 0 "Axis speed of revolute joint j1";
      parameter Integer side = 1 "right=1, left=-1";
      Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, w(fixed = false, start = motorInitialVelocity)) annotation(
        Placement(visible = true, transformation(origin = {2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b1(animateSphere = false, m = 1, r = {side * 0.2, 0, 0}, r_CM = {side * 0.1, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {38, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b2(animateSphere = false, m = 1, r = {-side * 0.2, 0.3, 0}, r_CM = {-side * 0.1, 0.15, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j2(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {60, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
        Placement(visible = true, transformation(origin = {-74, -48}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-70, -54}, extent = {{-16, -16}, {16, 16}}, rotation = 180)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
        Placement(visible = true, transformation(origin = {60, 80}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {-10, 118}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {side * baseX, baseY, 0}) annotation(
        Placement(visible = true, transformation(origin = {-22, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = theta, n = {0, 1, 0}) annotation(
        Placement(visible = true, transformation(origin = {-66, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, animation = false, n = {0, 1, 0}, r = {distance, 0, 0}) annotation(
        Placement(visible = true, transformation(origin = {-38, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(j1.frame_b, b1.frame_a) annotation(
        Line(points = {{12, -48}, {28, -48}}));
      connect(b1.frame_b, j2.frame_a) annotation(
        Line(points = {{48, -48}, {60, -48}, {60, -26}}, color = {95, 95, 95}));
      connect(j2.frame_b, b2.frame_a) annotation(
        Line(points = {{60, -6}, {60, 10}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_b, j1.frame_a) annotation(
        Line(points = {{-12, -48}, {-8, -48}}));
      connect(fixedRotation.frame_b, fixedRotation1.frame_a) annotation(
        Line(points = {{-56, -6}, {-48, -6}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_a, fixedRotation1.frame_b) annotation(
        Line(points = {{-32, -48}, {-40, -48}, {-40, -20}, {-14, -20}, {-14, -6}, {-28, -6}}, color = {95, 95, 95}));
      connect(frame_a, fixedRotation.frame_a) annotation(
        Line(points = {{-74, -48}, {-64, -48}, {-64, -24}, {-88, -24}, {-88, -6}, {-76, -6}}));
      connect(b2.frame_b, frame_b) annotation(
        Line(points = {{60, 30}, {60, 80}}));
      annotation(
        Icon(graphics = {Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {8, -53}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {27.4355, 16.7005}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Ellipse(origin = {-40, -53}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Ellipse(origin = {57, -52}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {-7, 92}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360)}));
    end rss_leg;

    model six_rss_closedloop
      //parameter SIunits.Position pos[3]
      //"Vector from frame_a to frame_b resolved in frame_a";
      import Modelica.SIunits;
      inner Modelica.Mechanics.MultiBody.World world annotation(
        Placement(visible = true, transformation(origin = {-82, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
      parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
      parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
      Modelica.Mechanics.MultiBody.Joints.Revolute j_b1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {2, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_b2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j_c1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {6, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_2c(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {8, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_b(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {48, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_c(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {50, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      OM_SP7.Body.rss_leg rss_leg_c2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 240) annotation(
        Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_c1(baseX = 0.05, baseY = 0, distance = 0.3, theta = 240) annotation(
        Placement(visible = true, transformation(origin = {-32, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_b2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 120) annotation(
        Placement(visible = true, transformation(origin = {-32, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_b1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, theta = 120) annotation(
        Placement(visible = true, transformation(origin = {-36, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_a2(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1, theta = 0) annotation(
        Placement(visible = true, transformation(origin = {-36, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_a1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = 1, theta = 0) annotation(
        Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_a(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {48, 78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j_a1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {8, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_a2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {8, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
//pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
//pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
      connect(j_b2.frame_b, b_b.frame_b) annotation(
        Line(points = {{14, -4}, {48, -4}, {48, 2}}));
      connect(j_b1.frame_b, b_b.frame_a) annotation(
        Line(points = {{12, 24}, {30, 24}, {30, 22}, {48, 22}}, color = {95, 95, 95}));
      connect(j_c1.frame_b, b_c.frame_a) annotation(
        Line(points = {{16, -42}, {50, -42}, {50, -46}}));
      connect(j_2c.frame_b, b_c.frame_b) annotation(
        Line(points = {{18, -68}, {50, -68}, {50, -66}}));
      connect(world.frame_b, rss_leg_c2.frame_a) annotation(
        Line(points = {{-72, 4}, {-58, 4}, {-58, -85}, {-37, -85}}));
      connect(rss_leg_c2.frame_b, j_2c.frame_a) annotation(
        Line(points = {{-31, -68.2}, {-3, -68.2}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_c1.frame_a) annotation(
        Line(points = {{-72, 4}, {-58, 4}, {-58, -59}, {-39, -59}}));
      connect(rss_leg_c1.frame_b, j_c1.frame_a) annotation(
        Line(points = {{-33, -42.2}, {-5, -42.2}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_b2.frame_a) annotation(
        Line(points = {{-72, 4}, {-58, 4}, {-58, -21}, {-39, -21}}, color = {95, 95, 95}));
      connect(rss_leg_b2.frame_b, j_b2.frame_a) annotation(
        Line(points = {{-33, -4.2}, {-7, -4.2}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_b1.frame_a) annotation(
        Line(points = {{-72, 4}, {-43, 4}, {-43, 7}}, color = {95, 95, 95}));
      connect(rss_leg_b1.frame_b, j_b1.frame_a) annotation(
        Line(points = {{-37, 23.8}, {-23.5, 23.8}, {-23.5, 24}, {-8, 24}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_a2.frame_a) annotation(
        Line(points = {{-72, 4}, {-58, 4}, {-58, 47}, {-43, 47}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_a1.frame_a) annotation(
        Line(points = {{-72, 4}, {-58, 4}, {-58, 75}, {-47, 75}}, color = {95, 95, 95}));
      connect(b_a.frame_a, j_a1.frame_b) annotation(
        Line(points = {{48, 88}, {48, 92}, {18, 92}}, color = {95, 95, 95}));
      connect(rss_leg_a1.frame_b, j_a1.frame_a) annotation(
        Line(points = {{-41, 91.8}, {-3, 91.8}}, color = {95, 95, 95}));
      connect(j_a2.frame_b, b_a.frame_b) annotation(
        Line(points = {{18, 64}, {48, 64}, {48, 68}}, color = {95, 95, 95}));
      connect(rss_leg_a2.frame_b, j_a2.frame_a) annotation(
        Line(points = {{-37, 63.8}, {-3, 63.8}}, color = {95, 95, 95}));
    protected
      annotation(
        Diagram);
    end six_rss_closedloop;

    model rss_closedloop
      import Modelica.SIunits;
      parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
      parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
      parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
      parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
      parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
      OM_SP7.Body.rss_leg rss_leg1(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 1, side = 1) annotation(
        Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg2(baseX = -0.05, baseY = 0, bodyWidth = bodyWidth, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1) annotation(
        Placement(visible = true, transformation(origin = {10, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape plat_1(animateSphere = false, m = 0.1, r = {0.1, 0, 0}, r_CM = {0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {32, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {-6, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j2(cylinderColor = {0, 255, 0}, cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {66, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = theta, n = {0, 1, 0}) annotation(
        Placement(visible = true, transformation(origin = {-48, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
        Placement(visible = true, transformation(origin = {-76, -52}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-102, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, animation = false, n = {0, 1, 0}, r = {distance, 0, 0}) annotation(
        Placement(visible = true, transformation(origin = {-20, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(rss_leg2.frame_b, j1.frame_a) annotation(
        Line(points = {{10, -16}, {10, -10}, {-30, -10}, {-30, 14}, {-16, 14}}));
      connect(j1.frame_b, plat_1.frame_a) annotation(
        Line(points = {{4, 14}, {22, 14}}));
      connect(plat_1.frame_b, j2.frame_a) annotation(
        Line(points = {{42, 14}, {56, 14}}));
      connect(j2.frame_b, rss_leg1.frame_b) annotation(
        Line(points = {{76, 14}, {88, 14}, {88, -10}, {58, -10}, {58, -16}}));
      connect(frame_a, fixedRotation.frame_a) annotation(
        Line(points = {{-76, -52}, {-58, -52}}));
      connect(fixedRotation.frame_b, fixedRotation1.frame_a) annotation(
        Line(points = {{-38, -52}, {-30, -52}}, color = {95, 95, 95}));
      connect(fixedRotation1.frame_b, rss_leg2.frame_a) annotation(
        Line(points = {{-10, -52}, {10, -52}, {10, -36}}, color = {95, 95, 95}));
      connect(fixedRotation1.frame_b, rss_leg1.frame_a) annotation(
        Line(points = {{-10, -52}, {58, -52}, {58, -36}}, color = {95, 95, 95}));
    protected
    end rss_closedloop;
  end Body;
  annotation(
    uses(Modelica(version = "3.2.3")));
end six_rrr_3arm_implementation_unconnected;
