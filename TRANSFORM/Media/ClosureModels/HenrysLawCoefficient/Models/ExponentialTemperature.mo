within TRANSFORM.Media.ClosureModels.HenrysLawCoefficient.Models;
model ExponentialTemperature
  "Exponential Temperature y = A*exp(B*T)"

  extends PartialHenrysLawCoefficient;

  parameter Boolean use_RecordData=true "=true then use predefined data";

  parameter Integer iTable[nC]=fill(1, nC)
    "Index of pre-defined values in data table: See Info page."
    annotation (Dialog(enable=use_RecordData));

  parameter TRANSFORM.Units.HenrysLawCoefficient kH0=0 "Pre-exponential factor"
    annotation (Dialog(enable=not use_RecordData));
  parameter TRANSFORM.Units.HenrysLawCoefficient kHs0[nC]=fill(kH0, nC)
    "if non-uniform then set" annotation (Dialog(enable=not use_RecordData));

  parameter SI.LinearTemperatureCoefficient B=0 "Exponential coefficient"
    annotation (Dialog(enable=not use_RecordData));
  parameter SI.LinearTemperatureCoefficient Bs[nC]=fill(B, nC)
    "if non-uniform then set" annotation (Dialog(enable=not use_RecordData));

  TRANSFORM.Blocks.DataTable data(table=[8.27273e-09,0.0042667; 0.00565,-0.0042991])
    "Col 1 = kH0; Col 2 = B"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation

  if use_RecordData then
    for i in 1:nC loop
      kHs[i] = data.table[iTable[i], 1]*exp(data.table[iTable[i], 2]*T);
    end for;
  else
    for i in 1:nC loop
      kHs[i] = kHs0[i]*exp(Bs[i]*T);
    end for;
  end if;

  annotation (defaultComponentName="henrysLawCoeff",
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model returns the coefficient kHs using the equation:</p>
<p>kHs = kH0*exp(B*T)</p>
<p>If pre-defined data parameters are to be used then specify the row number of the desired substance(s).</p>
<p>Below is the definition associated with each entry of the dataTable:</p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td style=\"background-color: #11d200\"><p align=\"center\"><b><span style=\"font-family: Arial,Helvetica,sans-serif; color: #ffffff; background-color: #11d200;\">Index</span></b></p></td>
<td style=\"background-color: #11d200\"><p align=\"center\"><b><span style=\"font-family: Arial,Helvetica,sans-serif; color: #ffffff; background-color: #11d200;\">Description</span></b></p></td>
<td style=\"background-color: #11d200\"><p align=\"center\"><b><span style=\"font-family: Arial,Helvetica,sans-serif; color: #ffffff; background-color: #11d200;\">kH0 [mol/(m3.Pa)]</span></b></p></td>
<td style=\"background-color: #11d200\"><p align=\"center\"><b><span style=\"font-family: Arial,Helvetica,sans-serif; color: #ffffff; background-color: #11d200;\">B [1/K]</span></b></p></td>
<td style=\"background-color: #11d200\"><p align=\"center\"><b><span style=\"font-family: Arial,Helvetica,sans-serif; color: #ffffff; background-color: #11d200;\">Source</span></b></p></td>
</tr>
<tr>
<td><p><span style=\"font-family: Arial,Helvetica,sans-serif;\">1</span></p></td>
<td><p><span style=\"font-family: Arial,Helvetica,sans-serif;\">H2_LiFBeF2_66_34</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">8.27e-9</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">4.27e-3</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">1. Eq. 2.13 (modified for K), pg. 72</span></p></td>
</tr>
<tr>
<td><p><span style=\"font-family: Arial,Helvetica,sans-serif;\">1</span></p></td>
<td><p><span style=\"font-family: Arial,Helvetica,sans-serif;\">HF_LiFBeF2_66_34</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">5.65e-3</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">-4.30e-3</span></p></td>
<td><p align=\"center\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">1. Eq. 2.12 (modified for K), pg. 72</span></p></td>
</tr>
</table>
<p><br><br><br>Source:</p>
<p><br>1. Stempien thesis</p>
</html>"));
end ExponentialTemperature;
