function cf = cf_finder(velocity, roughness, diameter)
    cf = 1.375e-3 * (1 + (2e4 * (roughness / diameter) + (10e3 / (998 * velocity * diameter))).^(1/3));
end

