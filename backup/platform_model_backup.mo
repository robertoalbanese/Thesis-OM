model platform_model_backup
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-96, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = 120, animation = false, n = {0, 1, 0})  annotation(
    Placement(visible = true, transformation(origin = {-72, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = 0, animation = false, n = {0, 1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(angle = -120, animation = false, n = {0, 1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-72, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {1, 0, 0}, animation = false) annotation(
    Placement(visible = true, transformation(origin = {-18, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {1, 0, 0}, animation = false) annotation(
    Placement(visible = true, transformation(origin = {-72, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation(
    Placement(visible = true, transformation(origin = {-66, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1 annotation(
    Placement(visible = true, transformation(origin = {-34, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2 annotation(
    Placement(visible = true, transformation(origin = {10, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 1, r = {0, 1, 0}, r_CM = {0, 0.05, 0})  annotation(
    Placement(visible = true, transformation(origin = {-34, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(m = 1, r = {0, 1, 0}, r_CM = {0, 0.05, 0}) annotation(
    Placement(visible = true, transformation(origin = {-56, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(m = 1, r = {0, 1, 0}, r_CM = {0, 0.05, 0}) annotation(
    Placement(visible = true, transformation(origin = {38, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation5(angle = -60, animation = false, n = {0, 1, 0}, r = {-1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {108, 74}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-72, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3( animation = false, n = {0, 1, 0}, r = {-1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(angle = 120, animation = false, n = {0, 1, 0}, r = {-1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {108, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(animateSphere = false, m = 1, r = {0, 0.05, 0}, r_CM = {0, 0.0025, 0}, width = 2) annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedRotation2.frame_b, fixedTranslation2.frame_a) annotation(
    Line(points = {{-72, -28}, {-72, -42}}, color = {95, 95, 95}));
  connect(fixedRotation1.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{-40, 10}, {-28, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedFrame2.frame_a) annotation(
    Line(points = {{-8, 10}, {-5, 10}, {-5, -12}, {0, -12}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{-72, -62}, {-72, -68}, {-92, -68}, {-92, -84}, {-76, -84}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedRotation1.frame_a) annotation(
    Line(points = {{-86, 10}, {-60, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, bodyShape1.frame_a) annotation(
    Line(points = {{-72, -62}, {-72, -68}, {-44, -68}}));
  connect(world.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-86, 10}, {-72, 10}, {-72, 22}}));
  connect(world.frame_b, fixedRotation2.frame_a) annotation(
    Line(points = {{-86, 10}, {-72, 10}, {-72, -8}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, bodyShape2.frame_a) annotation(
    Line(points = {{-8, 10}, {28, 10}}, color = {95, 95, 95}));
  connect(bodyShape3.frame_b, fixedRotation5.frame_a) annotation(
    Line(points = {{-46, 88}, {108, 88}, {108, 84}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, bodyShape3.frame_a) annotation(
    Line(points = {{-72, 68}, {-72, 88}, {-66, 88}}));
  connect(fixedTranslation.frame_b, fixedFrame1.frame_a) annotation(
    Line(points = {{-72, 68}, {-44, 68}}));
  connect(fixedRotation.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-72, 42}, {-72, 48}}));
  connect(bodyShape2.frame_b, fixedRotation3.frame_a) annotation(
    Line(points = {{48, 10}, {72, 10}}, color = {95, 95, 95}));
  connect(bodyShape1.frame_b, fixedRotation4.frame_a) annotation(
    Line(points = {{-24, -68}, {108, -68}, {108, -60}}, color = {95, 95, 95}));
  connect(fixedRotation5.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{108, 64}, {108, 26}, {164, 26}, {164, 10}, {138, 10}}));
  connect(fixedRotation3.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{92, 10}, {104, 10}, {104, 20}, {152, 20}, {152, 10}, {138, 10}}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end platform_model_backup;
