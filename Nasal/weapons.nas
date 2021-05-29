# GSh-23L guns
fire_MG = func {
	setprop("/controls/armament/trigger", 1);
}

stop_MG = func {
	setprop("/controls/armament/trigger", 0); 
}

var flash_trigger = props.globals.getNode("controls/armament/trigger", 0);

# L-128-04 rocket pods
fire_Rocket = func {
	setprop("/controls/armament/trigger1", 1);
}

stop_Rocket = func {
	setprop("/controls/armament/trigger1", 0);
}

var flash_trigger1 = props.globals.getNode("controls/armament/trigger1", 0);


