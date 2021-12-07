within OM_SP7.Body;

model six_rss_legs
  outer Modelica.Mechanics.MultiBody.World world;
  parameter Boolean useQuat = false annotation(
    Dialog(tab = "Advanced"));
  Body.rss_leg rss_leg6(lefPositionConfig = {2, -1}, stateSelect = StateSelect.avoid) annotation(
    Placement(visible = true, transformation(origin = {1, -85}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Body.rss_leg rss_leg5(lefPositionConfig = {2, 1}, stateSelect = StateSelect.avoid) annotation(
    Placement(visible = true, transformation(origin = {1, -49}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Body.rss_leg rss_leg2(lefPositionConfig = {0, -1}) annotation(
    Placement(visible = true, transformation(origin = {1, 59}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Body.rss_leg rss_leg4(lefPositionConfig = {1, -1}, stateSelect = StateSelect.avoid) annotation(
    Placement(visible = true, transformation(origin = {1, -13}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Body.rss_leg rss_leg3(lefPositionConfig = {1, 1}) annotation(
    Placement(visible = true, transformation(origin = {1, 23}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Body.rss_leg rss_leg1(lefPositionConfig = {0, 1}, useQuat = useQuat) annotation(
    Placement(visible = true, transformation(origin = {1, 93}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a[6] annotation(
    Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, -4}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[6] annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a[6] annotation(
    Placement(visible = true, transformation(origin = {-98, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6.66134e-16, 102}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(rss_leg1.frame_a, frame_a[1]) annotation(
    Line(points = {{-12, 90}, {-60, 90}, {-60, 0}, {-98, 0}}, color = {95, 95, 95}));
  connect(rss_leg2.frame_a, frame_a[2]) annotation(
    Line(points = {{-12, 56}, {-60, 56}, {-60, 0}, {-98, 0}}, color = {95, 95, 95}));
  connect(rss_leg3.frame_a, frame_a[3]) annotation(
    Line(points = {{-12, 20}, {-60, 20}, {-60, 0}, {-98, 0}}));
  connect(rss_leg4.frame_a, frame_a[4]) annotation(
    Line(points = {{-12, -16}, {-60, -16}, {-60, 0}, {-98, 0}}));
  connect(rss_leg5.frame_a, frame_a[5]) annotation(
    Line(points = {{-12, -52}, {-60, -52}, {-60, 0}, {-98, 0}}));
  connect(rss_leg6.frame_a, frame_a[6]) annotation(
    Line(points = {{-12, -88}, {-60, -88}, {-60, 0}, {-98, 0}}, color = {95, 95, 95}));
  connect(rss_leg1.frame_b, frame_b[1]) annotation(
    Line(points = {{14, 94}, {60, 94}, {60, 0}, {100, 0}}));
  connect(rss_leg2.frame_b, frame_b[2]) annotation(
    Line(points = {{14, 60}, {60, 60}, {60, 0}, {100, 0}}));
  connect(rss_leg3.frame_b, frame_b[3]) annotation(
    Line(points = {{14, 24}, {60, 24}, {60, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(rss_leg4.frame_b, frame_b[4]) annotation(
    Line(points = {{14, -12}, {60, -12}, {60, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(rss_leg5.frame_b, frame_b[5]) annotation(
    Line(points = {{14, -48}, {60, -48}, {60, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(rss_leg6.frame_b, frame_b[6]) annotation(
    Line(points = {{14, -84}, {60, -84}, {60, 0}, {100, 0}}));
  connect(rss_leg1.flange_a, flange_a[1]) annotation(
    Line(points = {{-12, 97}, {-62, 97}, {-62, 28}, {-98, 28}}));
  connect(rss_leg2.flange_a, flange_a[2]) annotation(
    Line(points = {{-12, 63}, {-62, 63}, {-62, 28}, {-98, 28}}));
  connect(rss_leg3.flange_a, flange_a[3]) annotation(
    Line(points = {{-12, 27}, {-62, 27}, {-62, 28}, {-98, 28}}));
  connect(rss_leg4.flange_a, flange_a[4]) annotation(
    Line(points = {{-12, -9}, {-62, -9}, {-62, 28}, {-98, 28}}));
  connect(rss_leg5.flange_a, flange_a[5]) annotation(
    Line(points = {{-12, -45}, {-62, -45}, {-62, 28}, {-98, 28}}));
  connect(rss_leg6.flange_a, flange_a[6]) annotation(
    Line(points = {{-12, -81}, {-62, -81}, {-62, 28}, {-98, 28}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -110}, {100, 110}})),
    Icon( coordinateSystem(extent = {{-100, -110}, {100, 110}}), graphics = {Text(origin = {0, -59}, lineColor = {0, 0, 255}, fillColor = {85, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 25}, {60, -25}}, textString = "%name")}));
end six_rss_legs;
