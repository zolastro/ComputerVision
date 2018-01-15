T1 = [1 0 0 0.5; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2 = [1 0 0 0; 0 cos(0.610865) -sin(0.610865) 0; 0 sin(0.610865) cos(0.610865) 0; 0 0 0 1];
T3 = [cos(0.610865) 0 sin(0.610865) 0; 0 1 0 0; -sin(0.610865) 0 cos(0.610865) 0.5; 0 0 0 1];

showTransformation(T1);
showTransformation(T2);
showTransformation(T3);
