# file containing the pipe class

class pipe:

    def __init__(self, name, p_entry, v_entry, bend_no, diameter, length, delta_h, simple=True):

        self.name = name
        self.p_entry = p_entry
        self.v_entry = v_entry
        self.bend_no = bend_no
        self.diameter = diameter
        self.length = length
        self.delta_h = delta_h
        self.simple = simple
        self.reynolds = (1000 * v_entry * diameter) / 0.001

        if not self.simple:
            self.cf = 0.001375 * (1 + ((2e4 * 0.0046 / self.diameter*1000) + 10e6 / self.reynolds)**(1/3))
        else:
            self.cf = 0.005
        
    def __repr__(self):
        'Print statement for pipe class'
        d = "Pipe name:         {}\n".format(self.name)
        d += "Entry Pressure:           {}\n".format(self.p_entry)
        d += "Velocity:           {}\n".format(self.v_entry)
        d += "Number of bends:           {}\n".format(self.bend_no)
        d += "Pipe Diameter:           {}\n".format(self.diameter)
        d += "Pipe Length:           {}\n".format(self.length)
        d += "Friction Factor:           {}\n".format(self.cf)
        d += "Delta Height:         {}\n".format(self.delta_h)
        return d

    def loss_calc(self):
        vel_head_loss = self.bend_no
        vel_head_loss += (4 * self.cf * self.length * self.v_entry**2) / (self.diameter * 19.61)