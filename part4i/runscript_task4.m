% constants

% pump characterists
a = 5e5;
b = 1.2e9;

% pipe len
l_a = 25;
l_b = 90;
l_c = 130;
l_d = 0;

% roughness
roughness = 4.6e-5;

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
g = 9.81;
rho = 998;

vels_u3 = linspace(1, 2.8, 10);
for i = 1:length(vels_u3)
    cf_3(i) = cf_finder(vels_u3(i), roughness, d_a);
    vels_pure(i) = split_vel_finder_task4(vels_u3(i), g, roughness, rho);
    vels_u4(i) = double(vels_pure(i).u_4(1,1));
    vels_u5(i) = double(vels_pure(i).u_5(1,1));
    cf_4(i) = cf_finder(vels_u4(i), roughness, d_c);
    cf_5(i) = cf_finder(vels_u5(i), roughness, d_b);
    p1_vals(i) = (1.3 * rho * g) - (vels_u3(i).^2 * rho);
    p3_vals(i) = rho * (0.5 * vels_u4(i).^2 + (2 * cf_4(i) * vels_u4(i).^2 * l_c / d_c));
    p2_vals(i) = p3_vals(i) + (vels_u3(i).^2 * rho * 0.5) * (1 + (4 * cf_3(i) * l_a / d_a)) + (6 * rho * g);
    p2_minus_p1(i) = p2_vals(i) - p1_vals(i);
    vol_flowrate(i) = (vels_u3(i) * d_a.^2 * 0.25 * pi);
    P_pumps(i) = 1 * (a - (b * (vol_flowrate(i)*0.5).^2));
end 

plot(vol_flowrate, p2_minus_p1, vol_flowrate, P_pumps);