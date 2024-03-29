% sets up an antropomorphic manipulator

setup.origin = [0, 0, 0];
setup.j1.type = 'rotation';
setup.j1.parameters = [0 pi/2 50 0];
setup.j1.min = 0;
setup.j1.max = 2 * pi;

setup.j2.type = 'rotation';
setup.j2.parameters = [100 0 0 0.2];
setup.j2.min = 0;
setup.j2.max = pi;

setup.j3.type = 'rotation';
setup.j3.parameters = [100 0 0 0];
setup.j3.min = -pi + 0.2;
setup.j3.max = pi + 0.2;

manipulator = manipulator_create(setup);
