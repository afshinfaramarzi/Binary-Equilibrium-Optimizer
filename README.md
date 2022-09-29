## Binary-Equilibrium-Optimizer
This is the source code of Binary Equilibrium Optimizer (BiEO) written in MATLAB.

Binary Equilibrium Optimizer (BiEO) is a binary version of an original continuous novel optimization algorithm called Equilibrium Optimizer (EO) which is inspired by control volume mass balance to estimate both dynamic and equilibrium state. We employed a V-type transfer function to map a continuous search space into a binary one and also used a random search approach for invigorating the exploration ability of BiEO. 

The performance of BiEO was validated against 19 mathematical functions including unimodal, multimodal, hybrid and composition functions as well as three building optimal control problems including (i) control of switchable Ethylene tetrafluoroethylene (ETFE) cushions, (ii) operation of motorized shades, and (iii) schedule of window opening during natural ventilation. The results of BiEO in all test suites were compared to Binary Particle Swarm Optimization with S-shape (BPSO/S) and V-shape (BPSO/V) transfer functions, Binary Dragonfly Algorithm (BDA), and Genetic Algorithm (GA).

The proposed BiEO method shows a fast rate of convergence compared to its competitors in most mathematical and optimal control problems (i.e., on average 5 times). This characteristic highlights the merits of BiEO and makes it a powerful binary optimizer specially when there are limited budget of time and iterations for solving an optimization problem.

You can download the main paper here: https://doi.org/10.1016/j.enbuild.2022.112503

If you don’t have access to the paper, just leave me a message at afaramar@hawk.iit.edu or afshin.faramarzi@gmail.com and I will get back to you soon!
