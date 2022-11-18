# file containing the pump function

def pump(flowrate):
    'Function that calculates pressure change for a given flowrate'
    pumpchar = [5e5, 1.2e9]
    delta_p = pumpchar[0] - pumpchar[1] * flowrate**2
    return delta_p