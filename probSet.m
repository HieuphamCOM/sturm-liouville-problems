classdef probSet
   properties (Access = public)
       n;
       h;
       u0;
       uEnd;
       x0;
       xEnd;
       x;
       f;
       p;
       q;
       hTest;
   end
   
   methods
       function prob = probSet(type)
           prob.n = 1000;
           prob.h = 1/(prob.n+1);
           prob.u0 = 0;
           prob.uEnd = 0;
           prob.x0 = 0;
           prob.xEnd = 1;
           prob.x = prob.x0 : prob.h : prob.xEnd;
           prob.f = @(x) x;
           prob.p = @(x) 1;
           prob.q = @(x) 1;
           prob.hTest = [prob.h 2*prob.h 4*prob.h 8*prob.h];
       end
   end
    
end