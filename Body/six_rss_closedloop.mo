within OM_SP7.Body;

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
