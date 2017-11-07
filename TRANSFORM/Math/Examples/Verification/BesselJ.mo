within TRANSFORM.Math.Examples.Verification;
model BesselJ

  extends Modelica.Icons.Example;

  Utilities.ErrorAnalysis.Errors_AbsRelRMSold[2] summary_Error(
    n={n,n},
    x_1={J0,J1},
    x_2={J0_Matlab,J1_Matlab})
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  final parameter Integer n=100 "Number of values of x in Jk(x)";

  Real[n] J0 "J0 function value";
  Real[n] J1 "J0 function value";

  Real[n] x = linspace(0,10,n) "Value in Jk(x)";
  Real[2] k = {0,1} "Order value";

  Real[n] J0_Matlab = {1,0.997450866006856,0.989822955517259,
        0.97717457740866,0.959602362647066,0.937240443698823,0.910259315971194,0.878864391432786,
        0.843294257304748,0.803818655335421,0.76073619965063,0.71437185348644,0.665074187239829,
        0.613212442195977,0.559173425991192,0.503358267332581,0.446179058706176,
        0.388055416753523,0.329410990674378,0.270669949414216,0.21225347851644,0.154576317359807,
        0.0980433670635496,0.0430463986304266,-0.0100391100814465,-0.060856981204206,
        -0.109073161652391,-0.154378341705272,-0.196490345152973,-0.235156270907135,
        -0.270154368281192,-0.301295630605128,-0.328425094431908,-0.351422834293302,
        -0.370204645746466,-0.38472241229342,-0.394964154627174,-0.400953763534056,
        -0.402750420635215,-0.400447713955069,-0.39417245803475,-0.384083230939507,
        -0.370368643016348,-0.353245354619327,-0.332955862213238,-0.309766074272513,
        -0.283962700192671,-0.255850477010996,-0.225749260077154,-0.193991004911748,
        -0.160916668331995,-0.126873057502003,-0.0922096558760923,-0.0572754550455453,
        -0.0224158212725931,0.0120305749962735,0.0457347390968848,0.0783802150558169,
        0.10966580614635,0.139308129269776,0.167043981025587,0.19263249521668,0.215857073596776,
        0.236527073886553,0.254479241441101,0.269578873421509,0.281720706883881,
        0.290829524825532,0.29686047689541,0.299799114158753,0.299661139979235,0.296491881720376,
        0.290365490546894,0.281383879102245,0.269675409227407,0.255393344146231,
        0.238714081653581,0.219835186784883,0.198973244202073,0.176361552085638,
        0.152247680661739,0.126890919605872,0.100559639440578,0.0735285926775531,
        0.0460761808391926,0.0184817136289359,-0.00897731359620063,-0.036027898261425,
        -0.0624041397357219,-0.0878497548794931,-0.112120476708153,-0.134986314186229,
        -0.156233652653024,-0.175667176053693,-0.193111593991925,-0.208413158613459,
        -0.221440958453665,-0.232087978616263,-0.240271918971821,-0.245935764451348}
      "Result of BesselJ0 from Matlab built-in function";

    Real[n] J1_Matlab = {0,0.050440664748465,0.100495671469118,
        0.149782638417423,0.197925707190716,0.244558731605566,0.289328379971115,
        0.331897123130027,0.371946081686273,0.409177707130056,0.443318273092609,
        0.474120154703155,0.501363875960872,0.524859907157959,0.544450196676246,
        0.560009423907773,0.5714459625968,0.578702546543082,0.58175663231935,0.580620456414541,
        0.575340786992761,0.565998373230498,0.552707097935459,0.535612841834235,
        0.514892070517924,0.49075015753094,0.463419459455348,0.43315716105958,0.400242910625865,
        0.364976267426481,0.327673984968218,0.288667155052074,0.248298238888647,
        0.206918012458089,0.164882453998712,0.122549601944347,0.0802764118040793,
        0.0384156403877425,-0.00268721457164558,-0.0426968919578407,-0.0812912353953262,
        -0.118163926484323,-0.15302705901151,-0.185613531557783,-0.215679237684931,
        -0.243005034830588,-0.267398475156372,-0.288695283857598,-0.306760572832662,
        -0.321489780103387,-0.332809327950718,-0.340676995358693,-0.345082003018921,
        -0.346044811812758,-0.343616638334014,-0.337878693616653,-0.328941153765206,
        -0.316941873627078,-0.30204485697291,-0.284438498842289,-0.264333617747169,
        -0.241961297286011,-0.217570558390768,-0.191425884891741,-0.163804626328773,
        -0.134994302950571,-0.105289838618395,-0.0749907478596602,-0.0443983035970865,
        -0.0138127121083716,0.016469678449374,0.0461591100837908,0.0749750624224411,
        0.102648791364138,0.128925735878045,0.153567771280423,0.176355288894809,
        0.197089083759329,0.215592033967138,0.231710557293711,0.245315832957593,
        0.256304778657804,0.264600775409079,0.270154135132515,0.27294230843047,0.272969832457107,
        0.270268021265924,0.264894403449628,0.256931914262592,0.246487851709565,
        0.233692608274705,0.21869819203201,0.201676552802475,0.182817730787351,0.162327846694285,
        0.140426953769791,0.117346773344862,0.0933283364800872,0.0686195550541594,
        0.0434727461688614}
"Result of BesselJ1 from Matlab built-in function";
equation

  for i in 1:n loop
    J0[i] = TRANSFORM.Math.BesselJ(
                k=k[1],
                x=x[i]);
    J1[i] = TRANSFORM.Math.BesselJ(
                k=k[2],
                x=x[i]);
  end for;

  annotation (experiment(StopTime=10),__Dymola_experimentSetupOutput);
end BesselJ;
