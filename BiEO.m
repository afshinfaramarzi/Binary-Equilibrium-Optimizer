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

function [Convergence_curve,Ave,Sd]=BiEO(Particles_no,Max_iter,dim,fobj,Run_no)


for irun=1:Run_no

Ceq1=zeros(1,dim);   Ceq1_fit=inf; 
Ceq2=zeros(1,dim);   Ceq2_fit=inf; 
Ceq3=zeros(1,dim);   Ceq3_fit=inf; 
Ceq4=zeros(1,dim);   Ceq4_fit=inf;    
    
C_old=zeros(Particles_no,dim);
DeltaC=zeros(Particles_no,dim);
V=zeros(Particles_no,dim);
Convergence_curve=zeros(1,dim);
Ceqfit_run=zeros(1,Run_no);


[C]=initialization(Particles_no,dim);           % Eq(1)

Iter=0;
while Iter<Max_iter
  
      for i=1:size(C,1)  
           
        fitness(i)=fobj(C(i,:));

        if fitness(i)<Ceq1_fit 
              Ceq1_fit=fitness(i);  Ceq1=C(i,:);
        elseif fitness(i)>Ceq1_fit && fitness(i)<Ceq2_fit  
              Ceq2_fit=fitness(i);  Ceq2=C(i,:);              
        elseif fitness(i)>Ceq1_fit && fitness(i)>Ceq2_fit && fitness(i)<Ceq3_fit
              Ceq3_fit=fitness(i);  Ceq3=C(i,:);
        elseif fitness(i)>Ceq1_fit && fitness(i)>Ceq2_fit && fitness(i)>Ceq3_fit && fitness(i)<Ceq4_fit
              Ceq4_fit=fitness(i);  Ceq4=C(i,:);
              
        end    
      end
      
           
%---------------- Memory saving-------------------   
     if Iter==0
        fit_old=fitness;  C_old=C;
     end
    
     for i=1:Particles_no
         if fit_old(i)<fitness(i)
             fitness(i)=fit_old(i); C(i,:)=C_old(i,:);
         end
     end

    C_old=C;  fit_old=fitness;
%-------------------------------------------------
  

 Ceq_ave=round((Ceq1+Ceq2+Ceq3+Ceq4)/4);                           % Averaged candidate 
 C_pool=[Ceq1; Ceq2; Ceq3; Ceq4; Ceq_ave];                         % Equilibrium pool

 a1=2;
 a2=1;
 t=(1-Iter/Max_iter)^(a2*Iter/Max_iter);                           % Eq(4)
 GP=0.5;
 
 for i=1:Particles_no
           lambda=rand(1,dim);                                     % lambda in Eq(3)
           r=rand(1,dim);  
           Ceq=C_pool(randi(size(C_pool,1)),:);                    % random selection of one candidate from the pool
           F=a1*sign(r-0.5).*(exp(-lambda.*t)-1);                  % Eq(3)
           GCP=0.5*rand()*ones(1,dim)*(rand>=GP);                  % Eq(7)
           G0=GCP.*(Ceq-lambda.*C(i,:));                           % Eq(6)
           G=G0.*F;                                                % Eq(5)
           Alpha=GP*(rand>GP);                                     % Eq(13)
           DeltaC(i,:)=((Alpha+C(i,:)-Ceq).*F+(G./lambda).*(1-F)); % Eq(12)
                     
           V(i,:)=abs((2/pi)*atan((pi/2)*DeltaC(i,:)));            % Eq(11)
           
           if rand<0.5
             for j=1:dim            
                  if rand<V(i,j)
                   C(i,j)=~C(i,j);         
                  end  
             end
                
           else                                                    % Eq(14)
               
              for j=1:dim    
                  if rand<V(i,j)
                   C(i,j)=round(rand); 
                  end 
              end
           end            

 end
 
 
       Iter=Iter+1;  
       Convergence_curve(Iter)=Ceq1_fit; 
       Ceqfit_run(irun)=Ceq1_fit;
        
end
  
display(['Run no : ', num2str(irun)]);
display(['The best solution obtained by BiEO is : ', num2str(Ceq1,10)]);
display(['The best optimal value of the objective function found by BiEO is : ', num2str(Ceq1_fit,10)]);
disp(sprintf('--------------------------------------'));
end

Ave=mean(Ceqfit_run);
Sd=std(Ceqfit_run);
