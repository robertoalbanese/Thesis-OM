package six_rrr_3arm_implementation_unconnected_poscontroller
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
      
      Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad", fixed = true, start = motorInitialAngle * (3.14159265358979323846 / 180)), stateSelect = StateSelect.always, useAxisFlange = true, w(fixed = false, start = motorInitialVelocity)) annotation(
        Placement(visible = true, transformation(origin = {2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b1(animateSphere = false, m = 1, r = {side *0.2, 0, 0}, r_CM = {side *0.1, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {38, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b2(animateSphere = false, m = 1, r = {-side *0.2, 0.3, 0}, r_CM = {-side *0.1, 0.15, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j2(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad"))  annotation(
        Placement(visible = true, transformation(origin = {60, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
        Placement(visible = true, transformation(origin = {-74, -48}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-70, -54}, extent = {{-16, -16}, {16, 16}}, rotation = 180)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
        Placement(visible = true, transformation(origin = {60, 80}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {-10, 118}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {side *baseX, baseY, 0}) annotation(
        Placement(visible = true, transformation(origin = {-22, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = theta, n = {0, 1, 0}) annotation(
        Placement(visible = true, transformation(origin = {-66, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = -90, animation = false, n = {0, 1, 0}, r = {distance, 0, 0}) annotation(
        Placement(visible = true, transformation(origin = {-38, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
        Placement(visible = true, transformation(origin = {12, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
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
      connect(j1.axis, flange_a) annotation(
        Line(points = {{2, -38}, {12, -38}, {12, 78}}));
    
    annotation(
        Icon(graphics = {Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {8, -53}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {27.4355, 16.7005}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Ellipse(origin = {-40, -53}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Ellipse(origin = {57, -52}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {-7, 92}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360)}));
    end rss_leg;
    
    
    model six_rss_closedloop
      //parameter SIunits.Position pos[3]
      //"Vector from frame_a to frame_b resolved in frame_a";
      import Modelica.SIunits;
      inner Modelica.Mechanics.MultiBody.World world annotation(
        Placement(visible = true, transformation(origin = {-270, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
      parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
      parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
      OM_SP7.Body.rss_leg rss_leg_a1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = 1, theta = 0) annotation(
        Placement(visible = true, transformation(origin = {168, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_a2(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1, theta = 0) annotation(
        Placement(visible = true, transformation(origin = {172, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_b1(baseX = 0.05, baseY = 0, distance = 0.3, motorInitialAngle = 0, theta = 120) annotation(
        Placement(visible = true, transformation(origin = {172, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_b2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 120) annotation(
        Placement(visible = true, transformation(origin = {176, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_c1(baseX = 0.05, baseY = 0, distance = 0.3, theta = 240) annotation(
        Placement(visible = true, transformation(origin = {176, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg_c2(baseX = 0.05, baseY = 0, distance = 0.3, side = -1, theta = 240) annotation(
        Placement(visible = true, transformation(origin = {178, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j_b1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {210, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_b2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {212, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j_c1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {214, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_2c(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {216, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_b(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {256, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_a(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {256, 72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape b_c(animateSphere = false, m = 0.1, r = {-0.1, 0, 0}, r_CM = {-0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {258, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint j_a2(cylinderDiameter = jointWidth, cylinderLength = jointLength) annotation(
        Placement(visible = true, transformation(origin = {216, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j_a1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {216, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_a1(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-120, 66}, {-100, 86}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_a2(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-120, 38}, {-100, 58}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant Constant2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
        Placement(visible = true, transformation(extent = {{-178, 38}, {-158, 58}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
        Placement(visible = true, transformation(extent = {{-218, -2}, {-198, 18}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const2(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
        Placement(visible = true, transformation(extent = {{-180, -30}, {-160, -10}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_b2(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-122, -30}, {-102, -10}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_b1(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-122, -2}, {-102, 18}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const3(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
        Placement(visible = true, transformation(extent = {{-216, -68}, {-196, -48}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const4(k = Modelica.SIunits.Conversions.from_deg(0)) annotation(
        Placement(visible = true, transformation(extent = {{-178, -96}, {-158, -76}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_c2(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-120, -96}, {-100, -76}}, rotation = 0)));
      OM_SP7.Axis.PositionAxis positionAxis_c1(DParam1Position = 0, DParam1Velocity = 0, DParam2Position = 0, DParam2Velocity = 0, DParamCurrent = 0, IClip1Position = 500, IClip1Velocity = 500, IClip2Position = 1000, IClip2Velocity = 1000, IClipCurrent = 1000, IParam1Position = 0, IParam1Velocity = 200, IParam2Position = 0, IParam2Velocity = 600, IParamCurrent = 4000, PIDPeriodCurrent = 0.001, PIDPeriodPosition = 0.001, PParam1Position = 50, PParam1Velocity = 200, PParam2Position = 50, PParam2Velocity = 800, PParamCurrent = 4000, armatureInductance = 0.00773, armatureResistance = 13.7, encoderTickPerRound = 4000, gearboxInertia = 0.000000071, gearboxRatio = 71, maximumCurrent = 1.75, maximumPWM = 32767, maximumVelocity = 5.8997, motorInertia = 0.0000035, nominalCurrent = 0.49, nominalRPM = 2800, nominalVoltage = 24, thresholdPosition = 0, thresholdVelocity = 0) annotation(
        Placement(visible = true, transformation(extent = {{-120, -68}, {-100, -48}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = Modelica.SIunits.Conversions.from_deg(10), offset = Modelica.SIunits.Conversions.from_deg(0), startTime = 0) annotation(
        Placement(visible = true, transformation(origin = {-250, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
    //pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
    //pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
    //pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
      connect(world.frame_b, rss_leg_a2.frame_a) annotation(
        Line(points = {{-260, 4}, {-58, 4}, {-58, 41}, {165, 41}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_a1.frame_a) annotation(
        Line(points = {{-260, 4}, {-58, 4}, {-58, 69}, {161, 69}}, color = {95, 95, 95}));
      connect(rss_leg_b1.frame_b, j_b1.frame_a) annotation(
        Line(points = {{171, 18}, {200, 18}}, color = {95, 95, 95}));
      connect(rss_leg_b2.frame_b, j_b2.frame_a) annotation(
        Line(points = {{175, -10}, {202, -10}}, color = {95, 95, 95}));
      connect(j_b2.frame_b, b_b.frame_b) annotation(
        Line(points = {{222, -10}, {256, -10}, {256, -4}}));
      connect(rss_leg_c1.frame_b, j_c1.frame_a) annotation(
        Line(points = {{175, -48}, {204, -48}}, color = {95, 95, 95}));
      connect(rss_leg_c2.frame_b, j_2c.frame_a) annotation(
        Line(points = {{177, -74}, {206, -74}}, color = {95, 95, 95}));
      connect(j_c1.frame_b, b_c.frame_a) annotation(
        Line(points = {{224, -48}, {258, -48}, {258, -52}}));
      connect(j_2c.frame_b, b_c.frame_b) annotation(
        Line(points = {{226, -74}, {258, -74}, {258, -72}}));
      connect(world.frame_b, rss_leg_b1.frame_a) annotation(
        Line(points = {{-260, 4}, {165, 4}, {165, 1}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_b2.frame_a) annotation(
        Line(points = {{-260, 4}, {-58, 4}, {-58, -27}, {169, -27}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg_c1.frame_a) annotation(
        Line(points = {{-260, 4}, {-58, 4}, {-58, -65}, {169, -65}}));
      connect(world.frame_b, rss_leg_c2.frame_a) annotation(
        Line(points = {{-260, 4}, {-58, 4}, {-58, -91}, {171, -91}}));
      connect(j_a2.frame_b, b_a.frame_b) annotation(
        Line(points = {{226, 58}, {256, 58}, {256, 62}}, color = {95, 95, 95}));
      connect(rss_leg_a2.frame_b, j_a2.frame_a) annotation(
        Line(points = {{171, 58}, {206, 58}}, color = {95, 95, 95}));
      connect(j_b1.frame_b, b_b.frame_a) annotation(
        Line(points = {{220, 18}, {238, 18}, {238, 16}, {256, 16}}, color = {95, 95, 95}));
      connect(b_a.frame_a, j_a1.frame_b) annotation(
        Line(points = {{256, 82}, {256, 86}, {226, 86}}, color = {95, 95, 95}));
      connect(rss_leg_a1.frame_b, j_a1.frame_a) annotation(
        Line(points = {{167, 86}, {206, 86}}, color = {95, 95, 95}));
      connect(positionAxis_a2.flange_b, rss_leg_a2.flange_a) annotation(
        Line(points = {{-101, 48}, {166, 48}}));
      connect(positionAxis_a1.flange_b, rss_leg_a1.flange_a) annotation(
        Line(points = {{-101, 76}, {162, 76}}));
      connect(Constant2.y, positionAxis_a2.setPosition) annotation(
        Line(points = {{-157, 48}, {-110, 48}}, color = {0, 0, 127}));
      connect(positionAxis_b1.flange_b, rss_leg_b1.flange_a) annotation(
        Line(points = {{-103, 8}, {166, 8}}));
      connect(positionAxis_b2.flange_b, rss_leg_b2.flange_a) annotation(
        Line(points = {{-103, -20}, {170, -20}}));
      connect(positionAxis_c1.flange_b, rss_leg_c1.flange_a) annotation(
        Line(points = {{-101, -58}, {170, -58}}));
      connect(positionAxis_c2.flange_b, rss_leg_c2.flange_a) annotation(
        Line(points = {{-101, -86}, {171, -86}, {171, -85}}));
      connect(const4.y, positionAxis_c2.setPosition) annotation(
        Line(points = {{-157, -86}, {-110, -86}}, color = {0, 0, 127}));
      connect(const3.y, positionAxis_c1.setPosition) annotation(
        Line(points = {{-195, -58}, {-110, -58}}, color = {0, 0, 127}));
      connect(const2.y, positionAxis_b2.setPosition) annotation(
        Line(points = {{-159, -20}, {-112, -20}}, color = {0, 0, 127}));
      connect(const1.y, positionAxis_b1.setPosition) annotation(
        Line(points = {{-197, 8}, {-112, 8}}, color = {0, 0, 127}));
      connect(ramp.y, positionAxis_a1.setPosition) annotation(
        Line(points = {{-238, 74}, {-110, 74}, {-110, 76}}, color = {0, 0, 127}));
    protected
      annotation(
        Diagram(coordinateSystem(extent = {{-500, -500}, {500, 500}})),
        Icon(coordinateSystem(extent = {{-500, -500}, {500, 500}})));
    end six_rss_closedloop;
    
    
    model rss_closedloop
      import Modelica.SIunits;
      parameter SIunits.Length bodyWidth = 0.02 "Width of bodies for animation";
      parameter SIunits.Length jointWidth = 0.02 "Width of joints for animation";
      parameter SIunits.Length jointLength = 0.02 "Lenght of joints for animation";
      parameter SIunits.Conversions.NonSIunits.Angle_deg theta = 0 "Angle position of the joints w.r.t. the centre of the base";
      parameter SIunits.Length distance = 1 "Joint distance from the center of the base";
      //output SIunits.Position w_ee_pos[3]"Absolute position vector resolved in world frame";
      OM_SP7.Body.rss_leg rss_leg1(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, distance = 0, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 1, side = 1) annotation(
        Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      OM_SP7.Body.rss_leg rss_leg2(baseX = 0.05, baseY = 0, bodyWidth = bodyWidth, distance = 0, jointLength = jointLength, jointWidth = jointWidth, motorInitialAngle = 0, motorInitialVelocity = 0, side = -1) annotation(
        Placement(visible = true, transformation(origin = {10, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Parts.BodyShape plat_1(animateSphere = false, m = 0.1, r = {0.1, 0, 0}, r_CM = {0.05, 0, 0}, width = bodyWidth) annotation(
        Placement(visible = true, transformation(origin = {32, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      inner Modelica.Mechanics.MultiBody.World world annotation(
        Placement(visible = true, transformation(origin = {-54, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Spherical j2(enforceStates = true) annotation(
        Placement(visible = true, transformation(origin = {62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.MultiBody.Joints.Revolute j1(cylinderDiameter = jointWidth, cylinderLength = jointLength, phi(displayUnit = "rad")) annotation(
        Placement(visible = true, transformation(origin = {-6, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
    //w_ee_pos = ee_cart_pos_world.r;
      connect(world.frame_b, rss_leg2.frame_a) annotation(
        Line(points = {{-44, -54}, {-12, -54}, {-12, -32}, {4, -32}}, color = {95, 95, 95}));
      connect(world.frame_b, rss_leg1.frame_a) annotation(
        Line(points = {{-44, -54}, {42, -54}, {42, -32}, {52, -32}}, color = {95, 95, 95}));
      connect(plat_1.frame_b, j2.frame_a) annotation(
        Line(points = {{42, 14}, {52, 14}}, color = {95, 95, 95}));
      connect(j2.frame_b, rss_leg1.frame_b) annotation(
        Line(points = {{72, 14}, {82, 14}, {82, -8}, {58, -8}, {58, -14}}, color = {95, 95, 95}));
      connect(j1.frame_b, plat_1.frame_a) annotation(
        Line(points = {{4, 14}, {22, 14}}));
      connect(rss_leg2.frame_b, j1.frame_a) annotation(
        Line(points = {{10, -16}, {10, -10}, {-30, -10}, {-30, 14}, {-16, 14}}));
    protected
      annotation(
        Icon(graphics = {Text(origin = {3, -124}, lineColor = {0, 60, 255}, fillColor = {0, 68, 255}, fillPattern = FillPattern.Solid, extent = {{-145, 32}, {145, -32}}, textString = "%name"), Rectangle(origin = {79.4355, -1.2995}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Rectangle(origin = {60, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {109, -68}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Rectangle(origin = {79.4355, -1.2995}, rotation = -65, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.0206, 14.0286}, {81.0206, -14.0286}}), Rectangle(origin = {60, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {109, -68}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {24, -69}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Rectangle(origin = {-80.56, 0.7}, rotation = -115, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-81.02, 14.03}, {81.02, -14.03}}), Rectangle(origin = {-70, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Rectangle(origin = {-70, -71}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {-24, -69}, fillColor = {134, 170, 92}, fillPattern = FillPattern.CrossDiag, extent = {{-22, 23}, {22, -23}}, endAngle = 360), Ellipse(origin = {-111, -66}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Rectangle(origin = {-2, 73}, fillColor = {200, 213, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 13}, {38, -13}}), Ellipse(origin = {-43, 78}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360), Ellipse(origin = {41, 78}, fillColor = {137, 199, 148}, fillPattern = FillPattern.Sphere, extent = {{-19, 20}, {19, -20}}, endAngle = 360)}));
    end rss_closedloop;
    
  end Body;
  package Axis
    
    model PositionAxis
      import Modelica.SIunits;
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM(IaNominal = nominalCurrent, Jr = motorInertia + gearboxInertia, La = armatureInductance, Ra = armatureResistance, VaNominal = nominalVoltage, phiMechanical(displayUnit = "rad"), wMechanical(displayUnit = "rad/s"), wNominal = nominalRPM * 2 * 3.14159265358979323846 / 60) annotation(
        Placement(transformation(extent = {{-30, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
        Placement(transformation(origin = {-20, 48}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(
        Placement(transformation(extent = {{10, 20}, {30, 40}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = gearboxRatio, useSupport = false) annotation(
        Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
        Placement(transformation(extent = {{20, -80}, {0, -60}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
        Placement(transformation(extent = {{20, -60}, {0, -40}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos = [0, 0.0328; 3, 0.063; 4, 0.0731], useSupport = false) annotation(
        Placement(visible = true, transformation(extent = {{62, -10}, {82, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput setPosition annotation(
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180), iconTransformation(extent = {{10, 10}, {-10, -10}}, rotation = 180)));
      parameter SIunits.Voltage nominalVoltage = 24 "|Motor||";
      parameter SIunits.Current nominalCurrent = 2.36 "|Motor||";
      parameter SIunits.Conversions.NonSIunits.AngularVelocity_rpm nominalRPM = 6700 "|Motor||";
      parameter SIunits.Resistance armatureResistance = 0.978 "|Motor||";
      parameter SIunits.Inductance armatureInductance = 0.000573 "|Motor||";
      parameter SIunits.Inertia motorInertia = 0.0000135 "|Motor||";
      parameter SIunits.Inertia gearboxInertia = 0.000000409 "|Motor||";
      parameter Real gearboxRatio = 100 "|Motor||";
      parameter Integer encoderTickPerRound = 4000 "|Motor||";
      parameter SIunits.AngularVelocity thresholdPosition "|Position Controller|| threshold velocity for position controller";
      parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
      parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
      parameter Integer PParam1Position "|Position Controller|| first parameter for proportional gain in position controller";
      parameter Integer PParam2Position "|Position Controller|| second parameter for proportional gain in position controller";
      parameter Integer IParam1Position "|Position Controller|| first parameter for integral gain in position controller";
      parameter Integer IParam2Position "|Position Controller|| second parameter for integral gain in position controller";
      parameter Integer DParam1Position "|Position Controller|| first parameter for derivative gain in position controller";
      parameter Integer DParam2Position "|Position Controller|| second parameter for derivative gain in position controller";
      parameter Integer IClip1Position "|Position Controller|| first parameter for integral clip in position controller";
      parameter Integer IClip2Position "|Position Controller|| second parameter for integral clip in position controller";
      parameter SIunits.AngularVelocity thresholdVelocity "|Velocity Controller|| threshold velocity for velocity controller";
      parameter Modelica.SIunits.Current maximumCurrent = 2.68 "|Velocity Controller|| maximum allowable current set";
      parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
      parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
      parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
      parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
      parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
      parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
      parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
      parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
      parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
      parameter Integer maximumPWM = 32767 "|Current Controller|| maximum allowable PWM set";
      parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
      parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
      parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
      parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
      parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
      OM_SP7.Controller.Modes.PositionMode positionMode(motorVoltage = nominalVoltage, encoderTickPerRound = encoderTickPerRound, thresholdPosition = thresholdPosition, maximumVelocity = maximumVelocity, PIDPeriodPosition = PIDPeriodPosition, PParam1Position = PParam1Position, PParam2Position = PParam2Position, IParam1Position = IParam1Position, IParam2Position = IParam2Position, DParam1Position = DParam1Position, DParam2Position = DParam2Position, IClip1Position = IClip1Position, IClip2Position = IClip2Position, thresholdVelocity = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriodVelocity = PIDPeriodVelocity, PParam1Velocity = PParam1Velocity, PParam2Velocity = PParam2Velocity, IParam1Velocity = IParam1Velocity, IParam2Velocity = IParam2Velocity, DParam1Velocity = DParam1Velocity, DParam2Velocity = DParam2Velocity, IClip1Velocity = IClip1Velocity, IClip2Velocity = IClip2Velocity, maximumPWM = maximumPWM, PIDPeriodCurrent = PIDPeriodCurrent, PParamCurrent = PParamCurrent, IParamCurrent = IParamCurrent, DParamCurrent = DParamCurrent, IClipCurrent = IClipCurrent, gearRatio = idealGear.ratio) annotation(
        Placement(visible = true, transformation(extent = {{-88, 60}, {-48, 80}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
        Placement(transformation(extent = {{110, -10}, {130, 10}}, rotation = 0)));
    equation
      connect(ground.p, signalVoltage.p) annotation(
        Line(points = {{20, 40}, {20, 48}, {-10, 48}}, color = {0, 0, 255}));
      connect(idealGear.flange_b, bearingFriction.flange_a) annotation(
        Line(points = {{40, 0}, {62, 0}}));
      positionMode.currentFeedback = DCPM.airGapDC.ia;
      connect(signalVoltage.n, DCPM.pin_an) annotation(
        Line(points = {{-30, 48}, {-40, 48}, {-40, 10}, {-26, 10}}, color = {0, 0, 255}));
      connect(signalVoltage.p, DCPM.pin_ap) annotation(
        Line(points = {{-10, 48}, {0, 48}, {0, 10}, {-14, 10}}, color = {0, 0, 255}));
      connect(bearingFriction.flange_b, flange_b) annotation(
        Line(points = {{82, 0}, {120, 0}}));
      connect(speedSensor.flange, flange_b) annotation(
        Line(points = {{20, -50}, {100, -50}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
      connect(angleSensor.flange, flange_b) annotation(
        Line(points = {{20, -70}, {100, -70}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
      connect(DCPM.flange, idealGear.flange_a) annotation(
        Line(points = {{-10, 0}, {20, 0}}, color = {0, 0, 0}));
      connect(setPosition, positionMode.setPosition) annotation(
        Line(points = {{-120, 0}, {-100, 0}, {-100, 70}, {-86, 70}}, color = {0, 0, 127}));
      connect(speedSensor.w, positionMode.velocityFeedback) annotation(
        Line(points = {{-1, -50}, {-68, -50}, {-68, 62}}, color = {0, 0, 127}));
      connect(angleSensor.phi, positionMode.positionFeedback) annotation(
        Line(points = {{-1, -70}, {-80, -70}, {-80, 62}}, color = {0, 0, 127}));
      connect(positionMode.setVoltage, signalVoltage.v) annotation(
        Line(points = {{-50, 70}, {-20, 70}, {-20, 55}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Line(origin = {-0.863013, -4.0394e-05},points = {{0, 0}, {-58, 0}, {-58, 62}}, color = {0, 0, 255}, pattern = LinePattern.Dot)}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Rectangle(lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-140, 60}, {140, -60}}), Text(pattern = LinePattern.None, extent = {{-100, 40}, {100, 0}}, textString = "Position"), Text(pattern = LinePattern.None, extent = {{-102, -2}, {98, -42}}, textString = "Axis"), Text(lineColor = {0, 0, 255}, extent = {{-140, 100}, {140, 60}}, textString = "%name")}));
    end PositionAxis;
    
    
    model VRampAxis
      import Modelica.SIunits;
      import Modelica.SIunits.Conversions.NonSIunits;
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM(IaNominal = nominalCurrent, Jr = motorInertia + gearboxInertia, Ra = armatureResistance, La = armatureInductance, VaNominal = nominalVoltage, wNominal = nominalRPM * 2 * 3.14159265358979323846 / 60) annotation(
        Placement(transformation(extent = {{-30, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
        Placement(transformation(origin = {-20, 48}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(
        Placement(transformation(extent = {{10, 20}, {30, 40}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = gearboxRatio, useSupport = false) annotation(
        Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
        Placement(transformation(extent = {{20, -80}, {0, -60}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
        Placement(transformation(extent = {{20, -60}, {0, -40}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos = [0, 0.0328; 3, 0.063; 4, 0.0731], useSupport = false) annotation(
        Placement(transformation(extent = {{60, -10}, {80, 10}}, rotation = 0)));
    public
      parameter SIunits.Voltage nominalVoltage = 24 "|Motor||";
      parameter SIunits.Current nominalCurrent = 2.36 "|Motor||";
      parameter SIunits.Conversions.NonSIunits.AngularVelocity_rpm nominalRPM = 6700 "|Motor||";
      parameter SIunits.Resistance armatureResistance = 0.978 "|Motor||";
      parameter SIunits.Inductance armatureInductance = 0.000573 "|Motor||";
      parameter SIunits.Inertia motorInertia = 0.0000135 "|Motor||";
      parameter SIunits.Inertia gearboxInertia = 0.000000409 "|Motor||";
      parameter Real gearboxRatio = 100 "|Motor||";
      parameter Integer encoderTickPerRound = 4000 "|Motor||";
      parameter SIunits.AngularAcceleration acceleration = 2 "|Velocity Ramp Generator|| Acceleration";
      parameter Real positionTolerance = 5 "|Velocity Ramp Generator|| Position tolerance, EncoderTick";
      parameter SIunits.AngularVelocity velocityTolerance "|Velocity Ramp Generator|| Velocity tolerance";
      parameter SIunits.Angle stoppingDistanceAdjustment = 0.05 "|Velocity Ramp Generator|| Stopping distance adjusment";
      parameter SIunits.Time startTime = 0.1 "|Velocity Ramp Generator|| Time when Velocity Ramp Generator is active";
      parameter SIunits.AngularVelocity thresholdPosition "|Position Controller|| threshold velocity for position controller";
      parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
      parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
      parameter Integer PParam1Position "|Position Controller|| first parameter for proportional gain in position controller";
      parameter Integer PParam2Position "|Position Controller|| second parameter for proportional gain in position controller";
      parameter Integer IParam1Position "|Position Controller|| first parameter for integral gain in position controller";
      parameter Integer IParam2Position "|Position Controller|| second parameter for integral gain in position controller";
      parameter Integer DParam1Position "|Position Controller|| first parameter for derivative gain in position controller";
      parameter Integer DParam2Position "|Position Controller|| second parameter for derivative gain in position controller";
      parameter Integer IClip1Position "|Position Controller|| first parameter for integral clip in position controller";
      parameter Integer IClip2Position "|Position Controller|| second parameter for integral clip in position controller";
      parameter SIunits.AngularVelocity thresholdVelocity "|Velocity Controller|| threshold velocity for velocity controller";
      parameter SIunits.Current maximumCurrent = 2 "|Velocity Controller|| (A), maximum allowable current set";
      parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
      parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
      parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
      parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
      parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
      parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
      parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
      parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
      parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
      parameter Integer maximumPWM "|Current Controller|| maximum allowable PWM set";
      parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
      parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
      parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
      parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
      parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
        Placement(transformation(extent = {{110, -10}, {130, 10}}, rotation = 0)));
      OM_SP7.Controller.Modes.VRampMode Controller_VRampMode2_1(motorVoltage = nominalVoltage, maximumVelocity = maximumVelocity, thresholdVelocity = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriodVelocity = PIDPeriodVelocity, PParam1Velocity = PParam1Velocity, PParam2Velocity = PParam2Velocity, IParam1Velocity = IParam1Velocity, IParam2Velocity = IParam2Velocity, DParam1Velocity = DParam1Velocity, DParam2Velocity = DParam2Velocity, IClip1Velocity = IClip1Velocity, IClip2Velocity = IClip2Velocity, velocityTolerance = velocityTolerance, PIDPeriodCurrent = PIDPeriodCurrent, PParamCurrent = PParamCurrent, IParamCurrent = IParamCurrent, DParamCurrent = DParamCurrent, IClipCurrent = IClipCurrent, acceleration = acceleration, stoppingDistanceAdjustment = stoppingDistanceAdjustment, PIDPeriodPosition = PIDPeriodPosition, PParam1Position = PParam1Position, PParam2Position = PParam2Position, IParam1Position = IParam1Position, IParam2Position = IParam2Position, DParam1Position = DParam1Position, DParam2Position = DParam2Position, IClip1Position = IClip1Position, IClip2Position = IClip2Position, thresholdPosition = thresholdPosition, startTime = 1, positionTolerance = positionTolerance / encoderTickPerRound * (65535 / encoderTickPerRound) * 2 / idealGear.ratio * Modelica.Constants.pi) annotation(
        Placement(transformation(extent = {{-90, 60}, {-48, 80}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput setPosition annotation(
        Placement(transformation(origin = {-120, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
    equation
      connect(ground.p, signalVoltage.p) annotation(
        Line(points = {{20, 40}, {20, 48}, {-10, 48}}, color = {0, 0, 255}));
      connect(idealGear.flange_b, bearingFriction.flange_a) annotation(
        Line(points = {{40, 0}, {60, 0}}, color = {0, 0, 0}));
      Controller_VRampMode2_1.currentFeedback = DCPM.airGapDC.ia;
      connect(signalVoltage.n, DCPM.pin_an) annotation(
        Line(points = {{-30, 48}, {-40, 48}, {-40, 10}, {-26, 10}}, color = {0, 0, 255}));
      connect(signalVoltage.p, DCPM.pin_ap) annotation(
        Line(points = {{-10, 48}, {0, 48}, {0, 10}, {-14, 10}}, color = {0, 0, 255}));
      connect(speedSensor.flange, flange_b) annotation(
        Line(points = {{20, -50}, {100, -50}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
      connect(bearingFriction.flange_b, flange_b) annotation(
        Line(points = {{80, 0}, {120, 0}}, color = {0, 0, 0}));
      connect(angleSensor.flange, flange_b) annotation(
        Line(points = {{20, -70}, {100, -70}, {100, 0}, {120, 0}}, color = {0, 0, 0}));
      connect(DCPM.flange, idealGear.flange_a) annotation(
        Line(points = {{-10, 0}, {20, 0}}, color = {0, 0, 0}));
      connect(angleSensor.phi, Controller_VRampMode2_1.positionFeedback) annotation(
        Line(points = {{-1, -70}, {-83.7, -70}, {-83.7, 62.2}}, color = {0, 0, 127}));
      connect(Controller_VRampMode2_1.setVoltage, signalVoltage.v) annotation(
        Line(points = {{-50.1, 70}, {-20, 70}, {-20, 55}}, color = {0, 0, 127}));
      connect(setPosition, Controller_VRampMode2_1.setPosition) annotation(
        Line(points = {{-120, 0}, {-100, 0}, {-100, 70}, {-87.9, 70}}, color = {0, 0, 127}));
      connect(speedSensor.w, Controller_VRampMode2_1.velocityFeedback) annotation(
        Line(points = {{-1, -50}, {-64.8, -50}, {-64.8, 62}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Line(points = {{-58, 62}, {-58, 0}, {-30, 0}}, color = {0, 0, 255}, pattern = LinePattern.Dot)}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}}), graphics = {Rectangle(extent = {{-140, 60}, {140, -60}}, lineColor = {255, 128, 0}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-100, 40}, {100, 0}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, textString = "VRamp"), Text(extent = {{-102, -2}, {98, -42}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, textString = "Axis"), Text(extent = {{-140, 100}, {140, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
    end VRampAxis;
    
  end Axis;
  package Controller
    package Components
      
      model P2V "output a signal from a pwm input signal"
        Modelica.Blocks.Interfaces.RealInput inputPWM annotation(
          Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput outputVoltage annotation(
          Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
        parameter Modelica.SIunits.Voltage maximumVoltage = 24 "voltage source range = (-maximum_voltage) - maximum_voltage";
        parameter Real maximumPWM = 100 "pwm input range = (-maximum_pwm) - maximum_pwm";
      equation
        outputVoltage = inputPWM / maximumPWM * maximumVoltage;
        annotation(
          Icon(graphics = {Text(extent = {{-100, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-60, 22}, {60, -28}}, lineColor = {0, 0, 255}, textString = "P2V")}),
          Diagram(graphics = {Text(extent = {{-50, 30}, {50, -30}}, lineColor = {0, 0, 255}, textString = "P2V"), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255})}));
      end P2V;
      
      
      model Gain2
        import Modelica.Blocks.Interfaces;
        parameter Real k1 "first gain parameter";
        parameter Real k2 "second gain parameter";
        parameter Real threshold "Threshold value";
        Real gain;
        Interfaces.RealInput inputGain2 annotation(
          Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
        Interfaces.RealOutput outputGain2 annotation(
          Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
        Interfaces.RealInput feedbackVelocity annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
      equation
        gain = if abs(feedbackVelocity) < threshold and threshold > 0 then k1 + abs(feedbackVelocity) / threshold * (k2 - k1) else k2;
        outputGain2 = gain * inputGain2;
        annotation(
          Diagram(graphics = {Polygon(points = {{-100, 100}, {-100, -100}, {100, 0}, {-100, 100}}, lineColor = {0, 0, 225}), Ellipse(extent = {{-10, 10}, {10, -10}}, lineColor = {0, 0, 255}), Line(points = {{0, -100}, {0, -10}}, color = {0, 0, 255}), Text(extent = {{-80, 60}, {0, 0}}, lineColor = {0, 0, 225}, textString = "k1"), Text(extent = {{-80, 0}, {0, -60}}, lineColor = {0, 0, 225}, textString = "k2")}),
          Icon(graphics = {Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Polygon(points = {{-100, 100}, {-100, -100}, {100, 0}, {-100, 100}}, lineColor = {0, 0, 225}), Ellipse(extent = {{-10, 10}, {10, -10}}, lineColor = {0, 0, 255}), Line(points = {{0, -100}, {0, -10}}, color = {0, 0, 255}), Text(extent = {{-80, 60}, {0, 0}}, lineColor = {0, 0, 225}, textString = "k1"), Text(extent = {{-80, 0}, {0, -60}}, lineColor = {0, 0, 225}, textString = "k2")}));
      end Gain2;
      
      
      model DiscreteDerivative
        import Modelica.Blocks.Interfaces;
        import Modelica.Blocks.Discrete;
        import Modelica.Blocks.Math;
        parameter Modelica.SIunits.Time SampleTime;
        Interfaces.RealInput inputValue annotation(
          Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
        Interfaces.RealOutput outputValue annotation(
          Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
        Discrete.UnitDelay UnitDelay1(samplePeriod = SampleTime) annotation(
          Placement(transformation(extent = {{-10, 10}, {10, 30}}, rotation = 0)));
        Math.Add Add1(k1 = 1, k2 = -1) annotation(
          Placement(transformation(extent = {{30, -10}, {50, 10}}, rotation = 0)));
        Discrete.ZeroOrderHold ZeroOrderHold1(samplePeriod = SampleTime) annotation(
          Placement(transformation(extent = {{-48, -10}, {-28, 10}}, rotation = 0)));
      equation
        connect(UnitDelay1.y, Add1.u1) annotation(
          Line(points = {{11, 20}, {20, 20}, {20, 6}, {28, 6}}, color = {0, 0, 127}));
        connect(Add1.y, outputValue) annotation(
          Line(points = {{51, 0}, {80.5, 0}, {80.5, 0}, {110, 0}}, color = {0, 0, 127}));
        connect(inputValue, ZeroOrderHold1.u) annotation(
          Line(points = {{-120, 0}, {-50, 0}}, color = {0, 0, 127}));
        connect(ZeroOrderHold1.y, UnitDelay1.u) annotation(
          Line(points = {{-27, 0}, {-20, 0}, {-20, 20}, {-12, 20}}, color = {0, 0, 127}));
        connect(ZeroOrderHold1.y, Add1.u2) annotation(
          Line(points = {{-27, 0}, {-20, 0}, {-20, -6}, {28, -6}}, color = {0, 0, 127}));
        annotation(
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
          DymolaStoredErrors,
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "  E(t-1) - E(t)  "), Rectangle(extent = {{-100, 40}, {100, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-100, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
      end DiscreteDerivative;
      
      
      model Limiter2 "Clip signal with a threshold and 2 parameter set"
        Real clip;
        import Modelica.Blocks.Interfaces;
        parameter Real k1 "first clip value";
        parameter Real k2 "second clip value";
        parameter Real threshold "Threshold value";
        Interfaces.RealInput inputClip annotation(
          Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
        Interfaces.RealOutput outputClip annotation(
          Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
        Interfaces.RealInput feedbackVelocity annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
      equation
        clip = if abs(feedbackVelocity) < threshold and threshold > 0 then k1 + abs(feedbackVelocity) / threshold * (k2 - k1) else k2;
        outputClip = if abs(inputClip) < clip then inputClip else if abs(inputClip) > clip and inputClip > 0 then clip else -clip;
        annotation(
          Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{60, 60}, {100, 20}}, lineColor = {0, 0, 255}, textString = "k2"), Text(extent = {{60, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "k1"), Line(points = {{0, 80}, {0, -80}}, color = {0, 0, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {0, 0, 255}), Line(points = {{80, 60}, {20, 60}, {-20, -60}, {-80, -60}}, color = {95, 95, 95}), Line(points = {{80, 20}, {18, 20}, {-20, -20}, {-80, -20}}, color = {95, 95, 95}, pattern = LinePattern.Dot, thickness = 0.5)}),
          Icon(graphics = {Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{60, 60}, {100, 20}}, lineColor = {0, 0, 255}, textString = "k2"), Text(extent = {{60, 100}, {100, 60}}, lineColor = {0, 0, 255}, textString = "k1"), Line(points = {{-80, 0}, {80, 0}}, color = {0, 0, 255}), Line(points = {{80, 60}, {20, 60}, {-20, -60}, {-80, -60}}, color = {95, 95, 95}), Line(points = {{80, 20}, {18, 20}, {-20, -20}, {-80, -20}}, color = {95, 95, 95}, pattern = LinePattern.Dot, thickness = 0.5), Line(points = {{0, 80}, {0, -80}}, color = {0, 0, 255})}),
          DymolaStoredErrors);
      end Limiter2;
      
      
      model VelocityRampGenerator
        import Modelica.SIunits;
        import Modelica.Blocks.Interfaces;
        parameter SIunits.AngularVelocity maximumVelocity;
        parameter SIunits.AngularAcceleration acceleration;
        parameter SIunits.Angle positionTolerance;
        parameter SIunits.AngularVelocity velocityTolerance;
        parameter SIunits.Angle stoppingDistanceAdjustment = 0.1;
        SIunits.AngularAcceleration setAcceleration;
        SIunits.AngularVelocity velocity;
        SIunits.Angle stoppingDistance;
        parameter SIunits.Time startTime = 1 "Start time when Velocity Ramp Generator is active";
        Boolean positionEndFlag(start = false);
        Boolean positionReachFlag(start = true);
        Interfaces.RealInput feedbackPosition annotation(
          Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
        Interfaces.RealOutput setVelocity annotation(
          Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
      public
        Interfaces.RealInput feedbackVelocity annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
      equation
        positionReachFlag = if abs(feedbackPosition) < positionTolerance and abs(feedbackVelocity) < velocityTolerance then true else false;
        stoppingDistance = 0.5 * feedbackVelocity ^ 2 / acceleration + stoppingDistanceAdjustment;
        positionEndFlag = if positionReachFlag then false else if abs(feedbackPosition) > stoppingDistance then false else true;
        setAcceleration = if positionEndFlag then if abs(velocity) < 0.001 then 0 else if velocity < 0 then acceleration else -acceleration else if positionReachFlag or time < startTime then 0 else if abs(velocity) < maximumVelocity then if feedbackPosition < 0 then -acceleration else acceleration else 0;
        der(velocity) = setAcceleration;
        velocity = setVelocity;
        when positionReachFlag and abs(velocity) > 0 then
          reinit(velocity, 0);
        end when;
        annotation(
          extent = [12, -38; 32, -18],
          Diagram(graphics),
          Icon(graphics = {Line(points = {{-60, 60}, {-60, -60}, {60, -60}}, color = {0, 0, 255}), Line(points = {{-40, -60}, {-20, 0}, {20, 0}, {40, -60}}, color = {0, 0, 0}), Text(extent = {{-100, 140}, {100, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
          Placement(transformation(extent = {{12, -38}, {32, -18}}, rotation = 0)),
          Diagram);
      end VelocityRampGenerator;
      
    end Components;
    package PIDs
      
      model PositionPID
        import Modelica.SIunits;
        import OM_SP7.Controller.Components;
        Modelica.Blocks.Interfaces.RealOutput setVelocity annotation(
          Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));
      public
        parameter Real gearRatio = 1 / 156;
        parameter Integer encoderTickPerRound = 4000;
        parameter SIunits.AngularVelocity maximumVelocity = 10 "rad/s, maximum allowable velocity";
        parameter SIunits.Time PIDPeriod = 0.001 "s, pid time period";
        parameter Modelica.SIunits.AngularVelocity threshold = 0 "(rad/s)";
        parameter Integer IClip1 = 0 "Integral Clip Limit 1";
        parameter Integer IClip2 = 0 "Integral Clip Limit 2";
        parameter Integer PParam1 = 0 "Proportional gain 1";
        parameter Integer PParam2 = 0 "Proportional gain 2";
        parameter Integer IParam1 = 0 "Integral gain 1";
        parameter Integer IParam2 = 0 "Integral gain 2";
        parameter Integer DParam1 = 0 "Derivative gain 1";
        parameter Integer DParam2 = 0 "Derivative gain 2";
        Components.Gain2 integralGain(threshold = threshold, k1 = IParam1, k2 = IParam2) annotation(
          Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
        Components.Gain2 derivativeGain(threshold = threshold, k1 = DParam1, k2 = DParam2) annotation(
          Placement(transformation(extent = {{20, -50}, {40, -30}}, rotation = 0)));
        Modelica.Blocks.Math.Add3 sum annotation(
          Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput positionError annotation(
          Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
        Components.Gain2 proportionalGain(threshold = threshold, k1 = PParam1, k2 = PParam2) annotation(
          Placement(transformation(extent = {{-10, 30}, {10, 50}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gearBoxNormalization(k = 2 / gearRatio * Modelica.Constants.pi) annotation(
          Placement(transformation(extent = {{120, -10}, {140, 10}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter positionErrorLimiter(uMax = 65535 / encoderTickPerRound * 2 / gearRatio * Modelica.Constants.pi, uMin = -positionErrorLimiter.uMax) annotation(
          Placement(transformation(extent = {{-180, -10}, {-160, 10}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter setVelocityLimiter(uMax = maximumVelocity, uMin = -setVelocityLimiter.uMax) annotation(
          Placement(transformation(extent = {{160, -10}, {180, 10}}, rotation = 0)));
        Components.DiscreteDerivative discreteDerivative(SampleTime = PIDPeriod) annotation(
          Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput velocityFeedback annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
        Components.Limiter2 integralLimiter2(threshold = threshold, k1 = IClip1 * 0.001 * maximumVelocity, k2 = IClip2 * 0.001 * maximumVelocity) annotation(
          Placement(transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.Integrator integrator annotation(
          Placement(transformation(extent = {{-100, -10}, {-80, 10}}, rotation = 0)));
      equation
        connect(sum.y, gearBoxNormalization.u) annotation(
          Line(points = {{101, 0}, {118, 0}}, color = {0, 0, 127}));
        connect(gearBoxNormalization.y, setVelocityLimiter.u) annotation(
          Line(points = {{141, 0}, {158, 0}}, color = {0, 0, 127}));
        connect(setVelocityLimiter.y, setVelocity) annotation(
          Line(points = {{181, 0}, {220, 0}}, color = {0, 0, 127}));
        connect(positionError, positionErrorLimiter.u) annotation(
          Line(points = {{-220, 0}, {-182, 0}}, color = {0, 0, 127}));
        connect(positionErrorLimiter.y, integrator.u) annotation(
          Line(points = {{-159, 0}, {-102, 0}}, color = {0, 0, 127}));
        connect(integrator.y, integralLimiter2.inputClip) annotation(
          Line(points = {{-79, 0}, {-42, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, integralLimiter2.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -20}, {-30, -20}, {-30, -12}}, color = {0, 0, 127}));
        connect(positionErrorLimiter.y, proportionalGain.inputGain2) annotation(
          Line(points = {{-159, 0}, {-120, 0}, {-120, 40}, {-12, 40}}, color = {0, 0, 127}));
        connect(proportionalGain.outputGain2, sum.u1) annotation(
          Line(points = {{11, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
        connect(velocityFeedback, proportionalGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, 28}}, color = {0, 0, 127}));
        connect(integralLimiter2.outputClip, integralGain.inputGain2) annotation(
          Line(points = {{-19, 0}, {18, 0}}, color = {0, 0, 127}));
        connect(integralGain.outputGain2, sum.u2) annotation(
          Line(points = {{41, 0}, {78, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, integralGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -20}, {30, -20}, {30, -12}}, color = {0, 0, 127}));
        connect(velocityFeedback, derivativeGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -60}, {30, -60}, {30, -52}}, color = {0, 0, 127}));
        connect(derivativeGain.outputGain2, sum.u3) annotation(
          Line(points = {{41, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
        connect(positionErrorLimiter.y, discreteDerivative.inputValue) annotation(
          Line(points = {{-159, 0}, {-120, 0}, {-120, -40}, {-62, -40}}, color = {0, 0, 127}));
        connect(discreteDerivative.outputValue, derivativeGain.inputGain2) annotation(
          Line(points = {{-39, -40}, {18, -40}}, color = {0, 0, 127}));
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-198, 138}, {200, 100}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-80, 80}, {80, 0}}, lineColor = {0, 0, 255}, textString = "PID"), Text(extent = {{-80, 0}, {80, -80}}, lineColor = {0, 0, 255}, textString = "Position")}),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
          DymolaStoredErrors);
      end PositionPID;
      
      
      model VelocityPID
        import Modelica.SIunits;
        import OM_SP7.Controller.Components;
        Modelica.Blocks.Interfaces.RealInput setVelocity annotation(
          Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput velocityFeedback annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
        Modelica.Blocks.Math.Feedback feedback1 annotation(
          Placement(transformation(extent = {{-170, -10}, {-150, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput setCurrent annotation(
          Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));
      public
        parameter SIunits.Time PIDPeriod = 0.05 "Time period for PID controller";
        parameter Modelica.SIunits.Current maximumCurrent = 2.68 "maximum allowable current set";
        parameter Modelica.SIunits.AngularVelocity threshold = 0 "Velocity limit for PID controller parameter";
        parameter Integer IClip1 "Integral Clip Limit 1";
        parameter Integer IClip2 "Integral Clip Limit 2";
        parameter Integer PParam1 "Proportional gain 1";
        parameter Integer PParam2 "Proportional gain 2";
        parameter Integer IParam1 "Integral gain 1";
        parameter Integer IParam2 "Integral gain 2";
        parameter Integer DParam1 "Derivative gain 1";
        parameter Integer DParam2 "Derivative gain 2";
        Components.Gain2 derivativeGain(threshold = threshold, k1 = DParam1, k2 = DParam2) annotation(
          Placement(transformation(extent = {{20, -50}, {40, -30}}, rotation = 0)));
        Components.Gain2 integralGain(threshold = threshold, k1 = IParam1, k2 = IParam2) annotation(
          Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
        Components.Gain2 proportionalGain(threshold = threshold, k1 = PParam1, k2 = PParam2) annotation(
          Placement(transformation(extent = {{-10, 30}, {10, 50}}, rotation = 0)));
        Modelica.Blocks.Math.Add3 sum annotation(
          Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain currentNormalization(k = 0.001) annotation(
          Placement(transformation(extent = {{120, -10}, {140, 10}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter currentSetLimiter(uMax = maximumCurrent, uMin = -currentSetLimiter.uMax) annotation(
          Placement(transformation(extent = {{160, -10}, {180, 10}}, rotation = 0)));
        Components.DiscreteDerivative discreteDerivative(SampleTime = PIDPeriod) annotation(
          Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
        Components.Limiter2 integralLimiter2(k1 = IClip1 * 0.001 * maximumCurrent, k2 = IClip2 * 0.001 * maximumCurrent, threshold = threshold) annotation(
          Placement(transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.Integrator integrator annotation(
          Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
      equation
        connect(velocityFeedback, feedback1.u2) annotation(
          Line(points = {{0, -120}, {0, -60}, {-160, -60}, {-160, -8}}, color = {0, 0, 127}));
        connect(sum.y, currentNormalization.u) annotation(
          Line(points = {{101, 0}, {118, 0}}, color = {0, 0, 127}));
        connect(currentNormalization.y, currentSetLimiter.u) annotation(
          Line(points = {{141, 0}, {158, 0}}, color = {0, 0, 127}));
        connect(currentSetLimiter.y, setCurrent) annotation(
          Line(points = {{181, 0}, {220, 0}}, color = {0, 0, 127}));
        connect(setVelocity, feedback1.u1) annotation(
          Line(points = {{-220, 0}, {-168, 0}}, color = {0, 0, 127}));
        connect(feedback1.y, integrator.u) annotation(
          Line(points = {{-151, 0}, {-82, 0}}, color = {0, 0, 127}));
        connect(integrator.y, integralLimiter2.inputClip) annotation(
          Line(points = {{-59, 0}, {-42, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, integralLimiter2.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -20}, {-30, -20}, {-30, -12}}, color = {0, 0, 127}));
        connect(feedback1.y, proportionalGain.inputGain2) annotation(
          Line(points = {{-151, 0}, {-120, 0}, {-120, 40}, {-12, 40}}, color = {0, 0, 127}));
        connect(integralLimiter2.outputClip, integralGain.inputGain2) annotation(
          Line(points = {{-19, 0}, {18, 0}}, color = {0, 0, 127}));
        connect(integralGain.outputGain2, sum.u2) annotation(
          Line(points = {{41, 0}, {78, 0}}, color = {0, 0, 127}));
        connect(proportionalGain.outputGain2, sum.u1) annotation(
          Line(points = {{11, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
        connect(velocityFeedback, proportionalGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, 28}}, color = {0, 0, 127}));
        connect(velocityFeedback, derivativeGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -60}, {30, -60}, {30, -52}}, color = {0, 0, 127}));
        connect(velocityFeedback, integralGain.feedbackVelocity) annotation(
          Line(points = {{0, -120}, {0, -20}, {30, -20}, {30, -12}}, color = {0, 0, 127}));
        connect(derivativeGain.outputGain2, sum.u3) annotation(
          Line(points = {{41, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
        connect(feedback1.y, discreteDerivative.inputValue) annotation(
          Line(points = {{-151, 0}, {-120, 0}, {-120, -40}, {-62, -40}}, color = {0, 0, 127}));
        connect(discreteDerivative.outputValue, derivativeGain.inputGain2) annotation(
          Line(points = {{-39, -40}, {18, -40}}, color = {0, 0, 127}));
        annotation(
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-80, 80}, {80, 0}}, lineColor = {0, 0, 255}, textString = "PID"), Text(extent = {{-80, 0}, {80, -80}}, lineColor = {0, 0, 255}, textString = "Velocity"), Text(extent = {{-198, 138}, {200, 100}}, lineColor = {0, 0, 255}, textString = "%name")}),
          DymolaStoredErrors);
      end VelocityPID;
      
      
      model CurrentPID
        import Modelica.SIunits;
        import youBot.Controller.Components;
        Modelica.Blocks.Math.Feedback feedback annotation(
          Placement(transformation(extent = {{-180, -10}, {-160, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput setCurrent annotation(
          Placement(transformation(extent = {{-240, -20}, {-200, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput currentFeedback annotation(
          Placement(transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
        Modelica.Blocks.Interfaces.RealOutput setPWM annotation(
          Placement(transformation(extent = {{200, -20}, {240, 20}}, rotation = 0)));
      public
        parameter SIunits.Time PIDPeriod = 0.05 "Time period for PID controller";
        parameter Integer maximumPWM = 32767 "PWM Input Limiter";
        parameter Integer IClip = 1000 "Integral Clip Limit";
        parameter Integer PParam = 4000 "Proportional gain";
        parameter Integer IParam = 4000 "Integral gain";
        parameter Integer DParam = 0 "Derivative gain";
        Modelica.Blocks.Math.Add3 sum annotation(
          Placement(transformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
        Components.DiscreteDerivative DiscreteDerivative1(SampleTime = PIDPeriod) annotation(
          Placement(transformation(extent = {{-60, -50}, {-40, -30}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter PWMLimiter(uMax = maximumPWM, uMin = -PWMLimiter.uMax) annotation(
          Placement(transformation(extent = {{130, -10}, {150, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain currentNormalization(k = 1000) annotation(
          Placement(transformation(extent = {{-130, -10}, {-110, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain integralGain(k = IParam) annotation(
          Placement(transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain derivativeGain(k = DParam) annotation(
          Placement(transformation(extent = {{20, -50}, {40, -30}}, rotation = 0)));
        Modelica.Blocks.Math.Gain proportionalGain(k = PParam) annotation(
          Placement(transformation(extent = {{-6, 30}, {14, 50}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter integralLimiter(uMax = IClip * 0.001 * maximumPWM, uMin = -integralLimiter.uMax) annotation(
          Placement(transformation(extent = {{-34, -10}, {-14, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.Integrator Integrator1 annotation(
          Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
      equation
        connect(currentFeedback, feedback.u2) annotation(
          Line(points = {{0, -120}, {0, -80}, {-170, -80}, {-170, -8}}, color = {0, 0, 127}));
        connect(sum.y, PWMLimiter.u) annotation(
          Line(points = {{101, 0}, {128, 0}}, color = {0, 0, 127}));
        connect(PWMLimiter.y, setPWM) annotation(
          Line(points = {{151, 0}, {220, 0}}, color = {0, 0, 127}));
        connect(feedback.y, currentNormalization.u) annotation(
          Line(points = {{-161, 0}, {-132, 0}}, color = {0, 0, 127}));
        connect(derivativeGain.y, sum.u3) annotation(
          Line(points = {{41, -40}, {60, -40}, {60, -8}, {78, -8}}, color = {0, 0, 127}));
        connect(integralGain.y, sum.u2) annotation(
          Line(points = {{41, 0}, {78, 0}}, color = {0, 0, 127}));
        connect(currentNormalization.y, proportionalGain.u) annotation(
          Line(points = {{-109, 0}, {-100, 0}, {-100, 40}, {-8, 40}}, color = {0, 0, 127}));
        connect(proportionalGain.y, sum.u1) annotation(
          Line(points = {{15, 40}, {60, 40}, {60, 8}, {78, 8}}, color = {0, 0, 127}));
        connect(integralLimiter.y, integralGain.u) annotation(
          Line(points = {{-13, 0}, {18, 0}}, color = {0, 0, 127}));
        connect(Integrator1.y, integralLimiter.u) annotation(
          Line(points = {{-59, 0}, {-36, 0}}, color = {0, 0, 127}));
        connect(currentNormalization.y, Integrator1.u) annotation(
          Line(points = {{-109, 0}, {-82, 0}}, color = {0, 0, 127}));
        connect(setCurrent, feedback.u1) annotation(
          Line(points = {{-220, 0}, {-178, 0}}, color = {0, 0, 127}));
        connect(currentNormalization.y, DiscreteDerivative1.inputValue) annotation(
          Line(points = {{-109, 0}, {-100, 0}, {-100, -40}, {-62, -40}}, color = {0, 0, 127}));
        connect(DiscreteDerivative1.outputValue, derivativeGain.u) annotation(
          Line(points = {{-39, -40}, {18, -40}}, color = {0, 0, 127}));
        annotation(
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-80, 80}, {80, 0}}, lineColor = {0, 0, 255}, textString = "PID"), Text(extent = {{-80, 0}, {80, -80}}, lineColor = {0, 0, 255}, textString = "Current"), Text(extent = {{-198, 138}, {200, 100}}, lineColor = {0, 0, 255}, textString = "%name")}));
      end CurrentPID;
      
    end PIDs;
    package Modes
      
      model PositionMode
        import Modelica.SIunits;
        import Modelica.Blocks.Interfaces;
        import OM_SP7;
        Interfaces.RealInput positionFeedback annotation(
          Placement(transformation(origin = {-120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Interfaces.RealInput velocityFeedback annotation(
          Placement(transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Interfaces.RealInput currentFeedback annotation(
          Placement(transformation(origin = {90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        OM_SP7.Controller.PIDs.PositionPID positionPID(threshold = thresholdPosition, IClip1 = IClip1Position, IClip2 = IClip2Position, PParam1 = PParam1Position, PParam2 = PParam2Position, IParam1 = IParam1Position, IParam2 = IParam2Position, DParam1 = DParam1Position, DParam2 = DParam2Position, encoderTickPerRound = encoderTickPerRound, maximumVelocity = maximumVelocity, gearRatio = gearRatio, PIDPeriod = PIDPeriodPosition) annotation(
          Placement(transformation(extent = {{-90, -10}, {-50, 10}}, rotation = 0)));
        OM_SP7.Controller.PIDs.VelocityPID velocityPID(PParam1 = PParam1Velocity, PParam2 = PParam2Velocity, IClip1 = IClip1Velocity, IClip2 = IClip2Velocity, IParam1 = IParam1Velocity, IParam2 = IParam2Velocity, DParam1 = DParam1Velocity, DParam2 = DParam2Velocity, threshold = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriod = PIDPeriodVelocity) annotation(
          Placement(transformation(extent = {{-20, -10}, {20, 10}}, rotation = 0)));
        OM_SP7.Controller.PIDs.CurrentPID currentPID(maximumPWM = maximumPWM, PIDPeriod = PIDPeriodCurrent, IClip = IClipCurrent, PParam = PParamCurrent, IParam = IParamCurrent, DParam = DParamCurrent) annotation(
          Placement(transformation(extent = {{70, -10}, {110, 10}}, rotation = 0)));
        Interfaces.RealOutput setVoltage annotation(
          Placement(transformation(extent = {{170, -10}, {190, 10}}, rotation = 0)));
        OM_SP7.Controller.Components.P2V P2V1(maximumVoltage = motorVoltage, maximumPWM = maximumPWM) annotation(
          Placement(transformation(extent = {{130, -10}, {150, 10}}, rotation = 0)));
      public
        parameter Real gearRatio = 156 "Gearbox Ratio";
        parameter Integer encoderTickPerRound = 4000 "Motor Encoder Tick";
        parameter SIunits.AngularVelocity thresholdPosition "|Position Controller|| threshold velocity for position controller";
        parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
        parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
        parameter Integer PParam1Position "|Position Controller|| first parameter for proportional gain in position controller";
        parameter Integer PParam2Position "|Position Controller|| second parameter for proportional gain in position controller";
        parameter Integer IParam1Position "|Position Controller|| first parameter for integral gain in position controller";
        parameter Integer IParam2Position "|Position Controller|| second parameter for integral gain in position controller";
        parameter Integer DParam1Position "|Position Controller|| first parameter for derivative gain in position controller";
        parameter Integer DParam2Position "|Position Controller|| second parameter for derivative gain in position controller";
        parameter Integer IClip1Position "|Position Controller|| first parameter for integral clip in position controller";
        parameter Integer IClip2Position "|Position Controller|| second parameter for integral clip in position controller";
        parameter SIunits.AngularVelocity thresholdVelocity "|Velocity Controller|| threshold velocity for velocity controller";
        parameter Modelica.SIunits.Current maximumCurrent = 2.68 "|Velocity Controller|| maximum allowable current set";
        parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
        parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
        parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
        parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
        parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
        parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
        parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
        parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
        parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
        parameter Integer maximumPWM = 32767 "|Current Controller|| maximum allowable PWM set";
        parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
        parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
        parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
        parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
        parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
        parameter Real motorVoltage "(V) Source voltage";
        Modelica.Blocks.Interfaces.RealInput setPosition annotation(
          Placement(transformation(extent = {{-190, -10}, {-170, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Feedback feedback annotation(
          Placement(transformation(extent = {{-130, -10}, {-110, 10}}, rotation = 0)));
      equation
        connect(setPosition, feedback.u1) annotation(
          Line(points = {{-180, 0}, {-128, 0}}, color = {0, 0, 127}));
        connect(positionFeedback, feedback.u2) annotation(
          Line(points = {{-120, -80}, {-120, -8}}, color = {0, 0, 127}));
        connect(P2V1.outputVoltage, setVoltage) annotation(
          Line(points = {{151, 0}, {180, 0}}, color = {0, 0, 127}));
        connect(feedback.y, positionPID.positionError) annotation(
          Line(points = {{-111, 0}, {-92, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, positionPID.velocityFeedback) annotation(
          Line(points = {{0, -80}, {0, -40}, {-70, -40}, {-70, -12}}, color = {0, 0, 127}));
        connect(positionPID.setVelocity, velocityPID.setVelocity) annotation(
          Line(points = {{-48, 0}, {-22, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, velocityPID.velocityFeedback) annotation(
          Line(points = {{0, -80}, {0, -12}}, color = {0, 0, 127}));
        connect(velocityPID.setCurrent, currentPID.setCurrent) annotation(
          Line(points = {{22, 0}, {68, 0}}, color = {0, 0, 127}));
        connect(currentFeedback, currentPID.currentFeedback) annotation(
          Line(points = {{90, -80}, {90, -12}}, color = {0, 0, 127}));
        connect(currentPID.setPWM, P2V1.inputPWM) annotation(
          Line(points = {{112, 0}, {128, 0}}, color = {0, 0, 127}));
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-160, 60}, {140, 0}}, lineColor = {0, 0, 255}, textString = "Position"), Text(extent = {{-160, 0}, {140, -60}}, lineColor = {0, 0, 255}, textString = "Mode")}),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics));
      end PositionMode;
      
      
      model VRampMode
        import OM_SP7;
        import Modelica.SIunits;
        import Modelica.Blocks.Math;
        import Modelica.Blocks.Interfaces;
        Interfaces.RealInput positionFeedback annotation(
          Placement(transformation(origin = {-140, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Interfaces.RealInput velocityFeedback annotation(
          Placement(transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Interfaces.RealInput currentFeedback annotation(
          Placement(transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        OM_SP7.Controller.PIDs.VelocityPID velocityPID(PParam1 = PParam1Velocity, PParam2 = PParam2Velocity, IClip1 = IClip1Velocity, IClip2 = IClip2Velocity, IParam1 = IParam1Velocity, IParam2 = IParam2Velocity, DParam1 = DParam1Velocity, DParam2 = DParam2Velocity, threshold = thresholdVelocity, maximumCurrent = maximumCurrent, PIDPeriod = PIDPeriodVelocity) annotation(
          Placement(transformation(extent = {{20, -10}, {60, 10}}, rotation = 0)));
        OM_SP7.Controller.PIDs.CurrentPID currentPID(maximumPWM = maximumPWM, PIDPeriod = PIDPeriodCurrent, IClip = IClipCurrent, PParam = PParamCurrent, IParam = IParamCurrent, DParam = DParamCurrent) annotation(
          Placement(transformation(extent = {{80, -10}, {120, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput setVoltage annotation(
          Placement(transformation(extent = {{170, -10}, {190, 10}}, rotation = 0)));
        OM_SP7.Controller.Components.P2V P2V1(maximumVoltage = motorVoltage, maximumPWM = 1799) annotation(
          Placement(transformation(extent = {{140, -10}, {160, 10}}, rotation = 0)));
      public
        parameter Integer encoderTickPerRound = 4000 "Motor Encoder Tick";
        parameter Real gearRatio = 156 "Gearbox Ratio";
        parameter SIunits.AngularVelocity thresholdPosition = 0 "|Position Controller|| threshold velocity for position controller";
        parameter SIunits.AngularVelocity maximumVelocity = 2 "|Position Controller|| maximum allowable velocity set";
        parameter SIunits.Time PIDPeriodPosition = 0.001 "|Position Controller|| Time period for position pid controller";
        parameter Integer PParam1Position "|Position Controller|| first parameter for proportional gain in position controller";
        parameter Integer PParam2Position "|Position Controller|| second parameter for proportional gain in position controller";
        parameter Integer IParam1Position "|Position Controller|| first parameter for integral gain in position controller";
        parameter Integer IParam2Position "|Position Controller|| second parameter for integral gain in position controller";
        parameter Integer DParam1Position "|Position Controller|| first parameter for derivative gain in position controller";
        parameter Integer DParam2Position "|Position Controller|| second parameter for derivative gain in position controller";
        parameter Integer IClip1Position "|Position Controller|| first parameter for integral clip in position controller";
        parameter Integer IClip2Position "|Position Controller|| second parameter for integral clip in position controller";
        parameter SIunits.AngularAcceleration acceleration "|Velocity Ramp Generator|| Acceleration";
        parameter SIunits.Angle positionTolerance "|Velocity Ramp Generator|| Position tolerance";
        parameter SIunits.AngularVelocity velocityTolerance "|Velocity Ramp Generator|| Velocity tolerance";
        parameter SIunits.Angle stoppingDistanceAdjustment = 0.05 "|Velocity Ramp Generator|| Stopping distance adjusment";
        parameter SIunits.Time startTime = 0.1 "|Velocity Ramp Generator|| Time when Velocity Ramp Generator is active";
        parameter SIunits.AngularVelocity thresholdVelocity "|Velocity Controller|| threshold velocity for velocity controller";
        parameter Modelica.SIunits.Current maximumCurrent = 2.68 "|Velocity Controller|| maximum allowable current set";
        parameter SIunits.Time PIDPeriodVelocity = 0.001 "|Velocity Controller|| Time period for velocity pid controller";
        parameter Integer PParam1Velocity "|Velocity Controller|| first parameter for proportional gain in velocity controller";
        parameter Integer PParam2Velocity "|Velocity Controller|| second parameter for proportional gain in velocity controller";
        parameter Integer IParam1Velocity "|Velocity Controller|| first parameter for integral gain in velocity controller";
        parameter Integer IParam2Velocity "|Velocity Controller|| second parameter for integral gain in velocity controller";
        parameter Integer DParam1Velocity "|Velocity Controller|| first parameter for derivative gain in velocity controller";
        parameter Integer DParam2Velocity "|Velocity Controller|| second parameter for derivative gain in velocity controller";
        parameter Integer IClip1Velocity "|Velocity Controller|| first parameter for integral clip in velocity controller";
        parameter Integer IClip2Velocity "|Velocity Controller|| second parameter for integral clip in velocity controller";
        parameter Integer maximumPWM = 32767 "|Current Controller|| maximum allowable PWM set";
        parameter SIunits.Time PIDPeriodCurrent = 0.001 "|Current Controller|| Time period for current pid controller";
        parameter Integer PParamCurrent "|Current Controller|| proportional gain in current controller";
        parameter Integer IParamCurrent "|Current Controller|| integral gain in current controller";
        parameter Integer DParamCurrent "|Current Controller|| derivative gain in current controller";
        parameter Integer IClipCurrent = 0 "|Current Controller|| integral clip in current controller";
        parameter SIunits.Voltage motorVoltage " Source voltage";
        OM_SP7.Controller.Components.VelocityRampGenerator velocityRampGenerator(maximumVelocity = maximumVelocity, acceleration = acceleration, positionTolerance = positionTolerance, velocityTolerance = velocityTolerance, stoppingDistanceAdjustment = stoppingDistanceAdjustment, startTime = startTime) annotation(
          Placement(transformation(extent = {{-110, 20}, {-90, 40}}, rotation = 0)));
        Interfaces.RealInput setPosition annotation(
          Placement(transformation(extent = {{-190, -10}, {-170, 10}}, rotation = 0)));
        Math.Feedback feedback annotation(
          Placement(transformation(extent = {{-150, -10}, {-130, 10}}, rotation = 0)));
        OM_SP7.Controller.PIDs.PositionPID positionPID(threshold = thresholdPosition, IClip1 = IClip1Position, IClip2 = IClip2Position, PParam1 = PParam1Position, PParam2 = PParam2Position, IParam1 = IParam1Position, IParam2 = IParam2Position, DParam1 = DParam1Position, DParam2 = DParam2Position, encoderTickPerRound = encoderTickPerRound, maximumVelocity = maximumVelocity, gearRatio = gearRatio, PIDPeriod = PIDPeriodPosition) annotation(
          Placement(transformation(extent = {{-80, -40}, {-40, -20}}, rotation = 0)));
        Modelica.Blocks.Logical.Switch switch annotation(
          Placement(transformation(extent = {{-14, -10}, {6, 10}}, rotation = 0)));
        Modelica.Blocks.Sources.BooleanStep BooleanStep1(startTime = startTime, startValue = false) annotation(
          Placement(transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
      equation
        connect(setPosition, feedback.u1) annotation(
          Line(points = {{-180, 0}, {-148, 0}}, color = {0, 0, 127}));
        connect(positionFeedback, feedback.u2) annotation(
          Line(points = {{-140, -78}, {-140, -8}}, color = {0, 0, 127}));
        connect(P2V1.outputVoltage, setVoltage) annotation(
          Line(points = {{161, 0}, {180, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, positionPID.velocityFeedback) annotation(
          Line(points = {{40, -80}, {40, -60}, {-60, -60}, {-60, -42}}, color = {0, 0, 127}));
        connect(switch.y, velocityPID.setVelocity) annotation(
          Line(points = {{7, 0}, {18, 0}}, color = {0, 0, 127}));
        connect(velocityFeedback, velocityPID.velocityFeedback) annotation(
          Line(points = {{40, -80}, {40, -12}}, color = {0, 0, 127}));
        connect(feedback.y, positionPID.positionError) annotation(
          Line(points = {{-131, 0}, {-120, 0}, {-120, -30}, {-82, -30}}, color = {0, 0, 127}));
        connect(positionPID.setVelocity, switch.u3) annotation(
          Line(points = {{-38, -30}, {-30, -30}, {-30, -8}, {-16, -8}}, color = {0, 0, 127}));
        connect(velocityPID.setCurrent, currentPID.setCurrent) annotation(
          Line(points = {{62, 0}, {78, 0}}, color = {0, 0, 127}));
        connect(currentFeedback, currentPID.currentFeedback) annotation(
          Line(points = {{100, -80}, {100, -12}}, color = {0, 0, 127}));
        connect(currentPID.setPWM, P2V1.inputPWM) annotation(
          Line(points = {{122, 0}, {138, 0}}, color = {0, 0, 127}));
        connect(feedback.y, velocityRampGenerator.feedbackPosition) annotation(
          Line(points = {{-131, 0}, {-120, 0}, {-120, 30}, {-112, 30}}, color = {0, 0, 127}));
        connect(velocityFeedback, velocityRampGenerator.feedbackVelocity) annotation(
          Line(points = {{40, -80}, {40, -60}, {-100, -60}, {-100, 18}}, color = {0, 0, 127}));
        connect(velocityRampGenerator.setVelocity, switch.u1) annotation(
          Line(points = {{-89, 30}, {-30, 30}, {-30, 8}, {-16, 8}}, color = {0, 0, 127}));
        connect(BooleanStep1.y, switch.u2) annotation(
          Line(points = {{-59, 0}, {-16, 0}}, color = {255, 0, 255}));
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-160, 60}, {140, 0}}, lineColor = {0, 0, 255}, textString = "VRAmp"), Text(extent = {{-160, 0}, {140, -60}}, lineColor = {0, 0, 255}, textString = "Mode")}),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {200, 100}}), graphics));
      end VRampMode;
      
    end Modes;
  end Controller;
  annotation(
    uses(Modelica(version = "3.2.3")));
end six_rrr_3arm_implementation_unconnected_poscontroller;
