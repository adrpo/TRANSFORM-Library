within TRANSFORM.Fluid.Examples.SpeciesTransportProgressionProblems;
model Problem_4
  "Delayed neutron precursor drift with production and decay"
  extends TRANSFORM.Icons.Example;

  package Medium = Modelica.Media.Water.StandardWater (extraPropertiesNames=fill(
           "a", nC), C_nominal=fill(1.0, nC));

  constant Integer nC=6;
  parameter Integer nV=10;
  parameter SI.Length length=0.400;
  parameter SI.Length dimension=0.01;

  parameter SI.Velocity v=0.025;
  final parameter SI.MassFlowRate m_flow = Medium.density_pT(1e5,293.15)*Modelica.Constants.pi*dimension^2/4*v;

  parameter TRANSFORM.Units.InverseTime lambda_i[nC]=fill(0.1, nC);
  parameter Real beta_i[nC] = fill(1,nC);
  parameter SIadd.ExtraPropertyConcentration C_i_start[nV,nC]=zeros(nV, nC);

  final parameter SIadd.ExtraProperty Cs_start[nV,nC]={{C_i_start[i, j]/
      Medium.density_pT(pipe.p_a_start, pipe.T_a_start) for j in 1:nC} for i in 1
      :nV};
  SI.Length x[nV]=pipe.summary.xpos;

  SIadd.ExtraPropertyConcentration C_i[nV,nC];
  SIadd.ExtraPropertyConcentration C_i_analytical[nV,nC];

  Real phi[nV] = {if x[i] > 100 then 0 else 10^(10)*cos(Modelica.Constants.pi*x[i]) for i in 1:nV};
  SIadd.ExtraPropertyFlowRate[nV,nC] mC_gens={{-lambda_i[j]*pipe.mCs[i, j]*pipe.nParallel + phi[i]*beta_i[j]
      for j in 1:nC} for i in 1:nV};

  Pipes.GenericPipe_MultiTransferSurface pipe(
    redeclare package Medium = Medium,
    Cs_start=Cs_start,
    p_a_start=100000,
    T_a_start=293.15,
    redeclare model Geometry =
        TRANSFORM.Fluid.ClosureRelations.Geometry.Models.DistributedVolume_1D.StraightPipe
        (
        dimension=dimension,
        length=length,
        nV=nV),
    redeclare model InternalTraceGen =
        TRANSFORM.Fluid.ClosureRelations.InternalTraceGeneration.Models.DistributedVolume_Trace_1D.GenericTraceGeneration
        (mC_gens=mC_gens))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BoundaryConditions.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_C_in=true,
    m_flow=m_flow,
    T=293.15,
    C=Cs_start[1, :],
    nPorts=1) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  BoundaryConditions.Boundary_pT boundary1(
    redeclare package Medium = Medium,
    p=100000,
    T=293.15,
    nPorts=1) annotation (Placement(transformation(extent={{60,-10},{40,10}})));

  Sensors.TraceSubstancesTwoPort_multi sensor_C(redeclare package Medium =
        Medium) annotation (Placement(transformation(extent={{16,10},{36,-10}})));
equation

  // Create variable for volume based concentration
  for j in 1:nV loop
    for i in 1:nC loop
      C_i[j, i] = pipe.Cs[j, i]*pipe.mediums[j].d;
    end for;
  end for;

  // Analytical Solution
  for j in 1:nV loop
    if x[j] < v*time then
      for i in 1:nC loop
        C_i_analytical[j, i] = C_i_start[j, i]*exp(-lambda_i[i]*x[j]/v);
      end for;
    else
      for i in 1:nC loop
        C_i_analytical[j, i] = C_i_start[j, i]*exp(-lambda_i[i]*time);
      end for;
    end if;
  end for;

  connect(boundary.ports[1], pipe.port_a)
    annotation (Line(points={{-40,0},{-10,0}}, color={0,127,255}));
  connect(pipe.port_b, sensor_C.port_a)
    annotation (Line(points={{10,0},{16,0}}, color={0,127,255}));
  connect(sensor_C.port_b, boundary1.ports[1])
    annotation (Line(points={{36,0},{40,0}}, color={0,127,255}));
  connect(sensor_C.C, boundary.C_in) annotation (Line(points={{26,-3.6},{26,-20},
          {-70,-20},{-70,-8},{-60,-8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3600,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"));
end Problem_4;
