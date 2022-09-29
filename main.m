%_________________________________________________________________________________
%  Binary Equilibrium Optimizer source code (Developed in MATLAB R2015a)
%
%  Lead Programmer: Afshin Faramarzi
%  E-mail: afaramar@hawk.iit.edu, afshin.faramarzi@gmail.com
%
%  Contributing Programmer: Seyedali Mirjalili
%  E-mail: ali.mirjalili@laureate.edu.au, ali.mirjalili.com
%
%  Supervision: Mohammad Heidarinejad
%  E-mail: muh182@iit.edu
%
%  paper:
%  A. Faramarzi, S. Mirjalili, M. Heidarinejad,
%  Binary Equilibrium Optimizer: theory and application in building optimal control problems
%  Energy and Buildings
%  DOI: https://doi.org/10.1016/j.enbuild.2022.112503
%____________________________________________________________________________________

% --------------------------------------------
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of iterations
% Particles_no = number of particles (search agents)
% ---------------------------------------------------------
 
clear all
clc
Run_no=10;              % Number of independent runs 
Particles_no=30;        % Number of particles
Max_iteration=500;      % Maximum number of iterations

Function_name='F1';

[dim,fobj]=Get_Functions_details(Function_name);

 
[Convergence_curve,Ave,Sd]=BiEO(Particles_no,Max_iteration,dim,fobj,Run_no);


display(['The average objective function over all runs found by BiEO is : ', num2str(Ave,7)]);
display(['The standard deviation over all runs found by BiEO is : ', num2str(Sd,7)]);
 
semilogy(Convergence_curve,'Color','r')
title('Convergence Curve')
xlabel('Iteration');
ylabel('Objective function');

