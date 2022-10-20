classdef solFinite
    properties (Access = public)
        u;
        f;
    end
    
    methods
        function soln = solFinite()

        end % end of solFinite
        
        function soln = computeSol(soln,prob)
            soln.u = zeros(length(prob.x), 1);
            soln.u(1) = 0;
            soln.u(end) = 0;
            soln.f = zeros(length(prob.x), 1);
            for i = 1 : length(prob.x)
               soln.f(i) = prob.f(i * prob.h); 
            end
            solnum1 = soln.u(end);
            soln.u(2) = (soln.f(2)+ prob.p(i * prob.h - 0.5* prob.h) * solnum1 / (prob.h)^2 ...
               - ((prob.p(2 * prob.h - 0.5* prob.h)+prob.p(2 * prob.h + 0.5* prob.h))/(prob.h)^2 +prob.q(2*prob.h))*soln.u(1) )...
               * (-1 * prob.p(2 * prob.h + 0.5* prob.h)/(prob.h)^2)^-1;             
            for i = 3: length(prob.x)
               soln.u(i) = (soln.f(i)+ prob.p(i * prob.h - 0.5* prob.h) * soln.u(i-2) / (prob.h)^2 ...
                   - ((prob.p(i * prob.h - 0.5* prob.h)+prob.p(i * prob.h + 0.5* prob.h))/(prob.h)^2 +prob.q(i*prob.h))*soln.u(i-1) )...
                   * (-1 * prob.p(i * prob.h + 0.5* prob.h)/(prob.h)^2)^-1 ;
            end            
        end % end of computeSol
        
        function soln = solve(soln, prob)
            soln = soln.computeSol(prob);
            plot(prob.x, soln.u,...
                prob.x, soln.f)
            legend('u', 'f')
        end % end of solve
        
    end % end of methods
 
end