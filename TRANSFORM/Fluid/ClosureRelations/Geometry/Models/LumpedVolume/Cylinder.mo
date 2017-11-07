within TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume;
model Cylinder

  input SI.Length length = 1.0 "Cylinder length" annotation (Dialog(group="Input Variables"));
  input SI.Area crossArea = 0.0 "Cross sectional area" annotation (Dialog(group="Input Variables"));

  extends
    TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(
     final V=pi*crossArea*length, dheight=length*sin(angle));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Cylinder;
