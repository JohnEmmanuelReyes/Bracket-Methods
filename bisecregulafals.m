i=input('Input Interval [a,b]:  ');
a=i(1); b=i(2); a1=i(1); b1=i(2); n=0; t=0;
epsilon=input('Input Error Tolerance: ');
f=inline('(exp(-x)-log(x))','x');

%BISECTION METHOD
if f(a)*f(b)<0
    c=((a+b)/2);
    c1=(a1-((f(a1)*(b1-a1)))/(f(b1)-f(a1)));
    
    while abs(f(c)) > epsilon
       c=((a+b)/2);
           if sign(f(c)) == sign(f(a)) 
               a=c;
               b=b;
           else
               a=a;
               b=c;
           end
       n=n+1;
    end
%REGULA-FALSI METHOD
    while abs(f(c1)) > epsilon
            c1=(a1-((f(a1)*(b1-a1)))/(f(b1)-f(a1)));
           if sign(f(c1)) == sign(f(a1)) 
               a1=c1;
               b1=b1;
           else
               a1=a1;
               b1=c1;
           end
       t=t+1;
    end
else
    disp('!!Error Interval!!')
end

fprintf('\nThe root is %d after %d iterations using BISECTION METHOD\n',c,n)
fprintf('The root is %d after %d iterations using REGULA-FALSI METHOD\n',c1,t)