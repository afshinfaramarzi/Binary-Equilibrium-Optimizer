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
%  E-mail: muh182@iit.edu%
%
%  paper:
%  A. Faramarzi, S. Mirjalili, M. Heidarinejad,
%  Binary Equilibrium Optimizer: theory and application in building optimal control problems
%  Energy and Buildings
%  DOI: https://doi.org/10.1016/j.enbuild.2022.112503
%____________________________________________________________________________________

% This function initialize the first population of search agents

function [C]=initialization(Particles_no,dim)

for i=1:Particles_no   
    for j=1:dim        
        if rand<=0.5
            C(i,j)=0;
        else
            C(i,j)=1;
        end
    end
end