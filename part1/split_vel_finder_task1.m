function output = split_vel_finder_task1(n, g, cf)
    % pipe len
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
    eqn_1 = (u_4.^2 / (2 * g)) * ((4 * cf * l_c / d_c) + 1) ==...
        (u_5.^2 / (2 * g)) * ((4 * cf * l_b / d_b) + 1) + 4;
    eqn_2 = (d_a.^2 * n * pi * 0.25) == (d_b.^2 * pi * 0.25)*(u_4 + u_5);
    output = solve(eqn_1, eqn_2);
end

