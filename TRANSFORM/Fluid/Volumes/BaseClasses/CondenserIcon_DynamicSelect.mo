within TRANSFORM.Fluid.Volumes.BaseClasses;
model CondenserIcon_DynamicSelect

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{5,75},{1,75},{-5,65},{-5,-65},{1,-75},{5,-75},{5,75}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          origin={95,-5},
          rotation=180),
        Rectangle(
          extent={{-90,70},{90,-80}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-98,137},{102,107}},
          lineColor={0,0,0},
          textString="%name"),
        Polygon(
          points={{-40,20},{-40,20}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-60,20},{-54,18},{-50,16},{-50,14},{-48,16},{-44,18},{-38,18},
              {-36,18},{-34,20},{-60,20}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-166,78},{-166,78}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{10,40},{16,38},{20,36},{20,34},{22,36},{26,38},{32,38},{34,
              38},{36,40},{10,40}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{4,0},{10,-2},{14,-4},{14,-6},{16,-4},{20,-2},{26,-2},{28,-2},
              {30,0},{4,0}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-66,-20},{-60,-22},{-56,-24},{-56,-26},{-54,-24},{-50,-22},{
              -44,-22},{-42,-22},{-40,-20},{-66,-20}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-48,12},{-50,8}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{22,32},{20,28}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,-8},{12,-12}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-56,-28},{-58,-32}},
          lineColor={0,0,0},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-90,-50},{90,-80}},
          lineColor={0,0,0},
          fillColor={0,122,236},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-90,70},{-94,70},{-100,60},{-100,-70},{-94,-80},{-90,-80},{
              -90,70}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{100,40},{-59.1953,40},{-64,40},{-68,36},{-70,30},{-68,24},{
              -64,20},{-60,20},{58,20},{64,20},{68,16},{70,10},{68,4},{64,0},{
              58,0},{-58,0},{-64,0},{-68,-4},{-70,-10},{-68,-16},{-64,-20},{-58,
              -20},{100,-20}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{-40,-80},{40,-100}},
          lineColor={0,0,0},
          fillColor={0,122,236},
          fillPattern=FillPattern.Solid)}),                                             Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end CondenserIcon_DynamicSelect;
