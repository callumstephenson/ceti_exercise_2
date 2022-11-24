% constants

% pipe len
l_a = 25;
l_b = 90;
l_c = 130;
l_d = 0;

% roughness
roughness = 0.0046 * 10.^-3;

% heights
h_0 = 1.3;
h_1 = 0;
h_2 = 0;
h_3 = 6;
h_4 = 6;
h_5 = 10;

% diameters
d_a = 0.09;
d_d = 0.09;
d_b = 0.05;
d_c = 0.05;

% constants
cf_cst = 0.005;
g = 9.81;

vels_u3 = linspace(1, 2.8, 10);
for i = 1:length(vels_u3)
    vels_pure(i) = vel_finder(vels_u3(i), g, cf_cst);
    vels_u4(i) = double(vels_pure(i).u_4(1,1));
    vels_u5(i) = double(vels_pure(i).u_5(1,1));

end