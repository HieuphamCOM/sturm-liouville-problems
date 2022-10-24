classdef solFinite
    properties (Access = public)
        u;
    end
    
    methods
        function soln = solFinite(prob)
            soln = soln.computeSol(prob);
            plot(prob.x, soln.u)
        end % end of solFinite
        
        function soln = computeSol(soln,prob)

            soln.u = zeros(prob.n+2,1);
            for i = 1 : prob.n 
               f(i,1) = prob.f(i * prob.h) ;
               pp(i,1) = prob.p(i * prob.h + 0.5 * prob.h);
               pm(i,1) = prob.p(i * prob.h - 0.5 * prob.h);
               q(i,1) = prob.p(i * prob.h);
            end
            
            % Define tridiagonal matrix
            matrixA = zeros(prob.n, prob.n);
            for i = 1 : prob.n 
                matrixA(i,i) = (1/prob.h^2) * (pm(i)+pp(i)) + q(i);
                for j = 1 : prob.n -1
                   matrixA(j+1,j) = -1/prob.h^2 * pm(i) ;
                end
                
                for k = 1:prob.n -1
                   matrixA(k,k+1)  = -1/prob.h^2 * pp(i) ;
                end
            end % end of loop over tridiagonal matrix

            % Assign solution to the soln.uu array
            u = linsolve(matrixA,f);
            for e = 2: prob.n+1
               soln.u(e) = u(e-1);
            end % end of loop over solution

        end % end of computeSol

    end % end of methods
 
end % end of classdef
