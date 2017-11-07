within TRANSFORM.HeatAndMassTransfer.FinEfficiency;
model SpineTriangular
  extends
    TRANSFORM.HeatAndMassTransfer.FinEfficiency.BaseClasses.PartialFinEfficiency;

  parameter Boolean use_NonDimensional = false;

  input SI.CoefficientOfHeatTransfer alpha "Average heat transfer coefficient" annotation(Dialog(group="Input Variables",enable=not use_NonDimensional));
  input SI.ThermalConductivity lambda "Thermal conductivity" annotation(Dialog(group="Input Variables",enable=not use_NonDimensional));
  input SI.Length D "Fin diameter" annotation(Dialog(group="Input Variables",enable=not use_NonDimensional));
  input SI.Length L "Fin length" annotation(Dialog(group="Input Variables",enable=not use_NonDimensional));

  input Units.nonDim mL = sqrt(2*alpha/(lambda*D))*L "Non-dimensional fin parameter" annotation(Dialog(group="Input Variables",enable=use_NonDimensional));

  SI.Area surfaceArea= 0.5*Modelica.Constants.pi*D*sqrt(L^2+0.25*D^2);

algorithm

  eta :=2*Math.BesselI(2,2*mL)/(mL*Math.BesselI(1,2*mL));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://TRANSFORM/Resources/Images/Icons/SpineTriangular.jpg")}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SpineTriangular;
