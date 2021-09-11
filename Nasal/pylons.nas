var cannon = stations.SubModelWeapon.new(
	"GSh-23L 23mm Cannon",
	0.39,
	200,
	[0,1],
	[2,3],
	props.globals.getNode("controls/armament/Gun_trigger",1),
	0,
	func{return 1;}
);
cannon.brevity = "Guns guns";

#var droptank = stations.FuelTank.new("500 l Droptank", "droptank", 1, 132, "");

var l_128_04 = stations.SubModelWeapon.new(
	"L-128-04",
	96.3,
	4,
	[4],
	[],
	props.globals.getNode("fdm/jsbsim/fcs/l12804trigger",1),
	1,
	func{return getprop("payload/armament/fire-control/serviceable");},
	1
);

var pylonSets = {
	empty: {
		name: "none",
		content: [],
		fireOrder: [],
		launcherDragArea: 0.0,
		launcherMass: 0,
		launcherJettisonable: 0,
		showLongTypeInsteadOfCount: 0,
		category: 1
	},
	e: {
		name: "GSh-23L 23mm Cannon",
		content: [cannon],
		fireOrder: [0],
		launcherDragArea: 0.0,
		launcherMass: 0,
		launcherJettisonable: 0,
		showLongTypeInsteadOfCount: 0,
		category: 1
	},
#	t: {name: "500 l Droptank", content: [droptank], fireOrder: [0], launcherDragArea: 0.18, launcherMass:  880, launcherJettisonable: 1, showLongTypeInsteadOfCount: 1, category: 1},
	l: {
		name: "L-128-04",
		content: [l_128_04],
		fireOrder: [0],
		launcherDragArea: 0.12,
		launcherMass: 187,
		launcherJettisonable: 1,
		showLongTypeInsteadOfCount: 0,
		category: 2
	},
};

# PYLONS SCHEME (BOTTOM VIEW) 
#\-----------------|     |---------------- /
# \  1.L           |     |           1.R  /
#  \ (0)      2.L  |  C  |  2.R      (4) /
#   \         (1)  | (2) |  (3)         /
#    -----------   |     |   -----------
#               \  |     |  /
#                \ |     | /
#                 \|     |/
#                  |     |
#                  |__I__|
#                    (5)
pylon1L = stations.Pylon.new(
	"Pylon 1 L", 
	0,
	[0.63, -3.29, -0.06],
	[pylonSets.empty],
	0,
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[1]",1),
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-dragarea-sqft[1]",1)
);
pylon2L = stations.Pylon.new(
	"Pylon 2 L",
	1,
	[-0.24, -2.16, 0.01],
	[pylonSets.empty, pylonSets.l],
	1,
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[2]",1),
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-dragarea-sqft[2]",1)
);
pylonC = stations.Pylon.new(
	"Pylon C",
	2,
	[-1.75, 0, -0.92],
	[pylonSets.empty],
	2,
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[3]",1),
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-dragarea-sqft[3]",1)
);
pylon2R = stations.Pylon.new(
	"Pylon2 R",
	3,
	[-0.24, 2.16, 0.01],
	[pylonSets.empty, pylonSets.l],
	3,
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[4]",1),
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-dragarea-sqft[4]",1)
);
pylon1R = stations.Pylon.new(
	"Pylon1 R",
	4,
	[0.63, 3.29, -0.06],
	[pylonSets.empty],
	4,
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[5]",1),
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-dragarea-sqft[5]",1)
);
    
pylonI = stations.InternalStation.new(
	"Internal gun mount",
	5,
	[pylonSets.e],
	props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[6]",1)
);

pylonI.loadSet(pylonSets.e);
pylon1L.loadSet(pylonSets.empty);
pylon2L.loadSet(pylonSets.l);
pylonC.loadSet(pylonSets.empty);
pylon2R.loadSet(pylonSets.l);
pylon1R.loadSet(pylonSets.empty);
