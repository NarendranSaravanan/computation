 iteration=25;
 x=30:30:180;
 x=angle_radians(x)
 while E > 1*10^(-6) 
    for i = 0:n
   y = ((-1)^i)*x^(2*i+1)/factorial(2*i+1);
       end
    sinx= summation(y)
  Sn =sum(y)-y(n);
 end
        %fprintf('x(deg)     |  sin(x)  \n', x, sinx)
        %fprintf('x=    %0.4f   S=    /n', n, sinx) 
 function x =angle_radians(x)
 x=pi/180*x;
 end
 function E =stopValue(sinx,Sn)
        E=abs(((sinx-Sn))/Sn);
        sinx = sum(y);
        Sn =sum(y)-y(n);
 end
 function sinx = summation(~)
 y = ((-1)^i)*x^(2*i+1)/factorial(2*i+1);
 sinx = factorial(y)
 end                   