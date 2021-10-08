within OM_SP7.Body;

model sixRSS_R
  //parameter SIunits.Position pos[3]
  //"Vector from frame_a to frame_b resolved in frame_a";
  import Modelica.SIunits;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-12, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  rrs_leg rrs_leg1(baseX = 0.05, baseZ = 0, motorInitialAngle = 0, side = 1) annotation(
    Placement(visible = true, transformation(origin = {22, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//pos = (rss_leg1.frame_b.r_0) - (rss_leg2.frame_b.r_0);
//pos[2] = (rss_leg1.frame_b.r_0[2]) - (rss_leg2.frame_b.r_0[2]);
//pos[3] = (rss_leg1.frame_b.r_0[3]) - (rss_leg2.frame_b.r_0[3]);
  connect(world.frame_b, rrs_leg1.frame_a) annotation(
    Line(points = {{-2, -82}, {4, -82}, {4, -34}, {12, -34}}, color = {95, 95, 95}));
protected
end sixRSS_R;
