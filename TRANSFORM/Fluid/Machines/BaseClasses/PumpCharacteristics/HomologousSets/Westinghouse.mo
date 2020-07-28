within TRANSFORM.Fluid.Machines.BaseClasses.PumpCharacteristics.HomologousSets;
model Westinghouse "Westinghouse pump extracted from TRACE manuals"
  extends PartialHomoSet(
  table_BAN=[ 0.00, 1.01; 0.10, 0.96; 0.20, 0.92; 0.30, 0.90; 0.40, 0.89; 0.50, 0.91; 0.70, 0.99; 0.80, 1.02; 0.90, 1.02; 1.00, 1.00],
  table_BAD=[-1.00, 2.98;-0.82, 2.40;-0.60, 1.87;-0.46, 1.60;-0.34, 1.40;-0.20, 1.21;-0.10, 1.10; 0.00, 1.01],
  table_BAR=[-1.00, 0.00; 0.00,-1.00],
  table_BAT=[ 0.00,-1.00; 0.25,-0.60; 0.40,-0.37; 0.50,-0.25; 0.60,-0.16; 0.80,-0.01; 1.00, 0.11],
  table_BVN=[ 0.00,-0.87; 0.10,-0.76; 0.20,-0.63; 0.30,-0.48; 0.40,-0.31; 0.74, 0.40; 1.00, 1.00],
  table_BVD=[-1.00, 2.98;-0.91, 2.80;-0.80, 2.60;-0.70, 2.42;-0.60, 2.25;-0.42, 2.00; 0.00, 1.42],
  table_BVR=[-1.00, 0.00; 0.00,-0.87],
  table_BVT=[ 0.00, 1.42; 0.60, 0.61; 0.80, 0.35; 1.00, 0.11],
  table_HAN=[ 0.00, 1.73; 0.20, 1.50; 0.46, 1.24; 0.52, 1.23; 0.60, 1.24; 0.66, 1.24; 0.80, 1.17; 0.90, 1.10; 1.00, 1.00],
  table_HAD=[-1.00, 3.55;-0.60, 2.73;-0.32, 2.20;-0.18, 2.00; 0.00, 1.73],
  table_HAR=[-1.00, 0.00; 0.00,-0.16],
  table_HAT=[ 0.00,-0.16; 0.10,-0.12; 0.20,-0.06; 0.28, 0.00; 0.40, 0.09; 0.60, 0.31; 0.70, 0.42; 0.80, 0.50; 0.88, 0.54; 1.00, 0.59],
  table_HVN=[ 0.00,-0.96; 0.10,-0.90; 0.20,-0.81; 0.30,-0.70; 0.40,-0.54; 0.53,-0.30; 0.65, 0.00; 0.80, 0.37; 1.00, 1.00],
  table_HVD=[-1.00, 3.55;-0.89, 3.20;-0.74, 2.80;-0.60, 2.47;-0.46, 2.20;-0.20, 1.73; 0.00, 1.40],
  table_HVR=[-1.00, 0.00; 0.00,-0.96],
  table_HVT=[ 0.00, 1.40; 0.37, 0.80; 0.43, 0.74; 0.50, 0.68; 0.58, 0.64; 0.64, 0.62; 0.70, 0.61; 1.00, 0.59]);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Westinghouse;
