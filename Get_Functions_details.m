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

function [dim,fobj] = Get_Functions_details(F)


switch F
    case 'F1'
        fobj = @F1;
        dim=50;
end
end


function o = F1(x)
o=sum(x.^2);
end

