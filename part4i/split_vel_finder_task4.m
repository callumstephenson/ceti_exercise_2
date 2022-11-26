function output = split_vel_finder_task4(n, g, roughness, rho)
    % pipe le
    l_a = 25;
    l_b = 90;
    l_c = 130;
    l_d = 0;

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

    syms u_4 u_5
    eqn_1 = (u_4.^2 / (2 * g)) * ((4 * (1.375e-3 * (1 + (2e4 * (roughness / d_c) + (10e3 / (rho * u_4 * d_c))).^(1/3))) * l_c / d_c) + 1) ==...
        (u_5.^2 / (2 * g)) * ((4 * (1.375e-3 * (1 + (2e4 * (roughness / d_b) + (10e3 / (rho * u_5 * d_b))).^(1/3))) * l_b / d_b) + 1) + 4;
    eqn_2 = (d_a.^2 * n) == (d_b.^2)*(u_4 + u_5);
    digits(16)
    output = vpasolve(eqn_1, eqn_2, [u_4 u_5], [2 2]);
end
