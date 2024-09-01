# borrrowed from:
# McDonnell Douglas MD-81
#
# Custom Flight Surface Operations
#
# Gary Neely aka 'Buckaroo'



# cross linking engine to mixture with handpump strokes


var pos_pump	= props.globals.getNode("/controls/engines/engine[0]/primer");
var pos_fueltap	= props.globals.getNode("/controls/engines/engine[0]/mixture");

setlistener("/controls/engines/engine[0]/primer", func {
  var pump = pos_pump.getValue();
  if (pump >= 0.95)	{ pos_fueltap.setValue(1.0); return 0; }
  if (pump = 0)	{ pos_fueltap.setValue(0.0); return 0; }
  pos_fueltap.setValue(0);
});

var FueltapInit = func {

  settimer(env_effects, 2);
  settimer(fueltap_loop, 3);				# Delay startup a bit to allow things to initialize
}

