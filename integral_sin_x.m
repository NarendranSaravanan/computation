a1 = input('enter the lower limit: ');
b1 = input('enter the upper limit: ');
a = (a1*3.14)/180;
b = (b1*3.14)/180;
axis = 1:20;
integral = 0; integral1 = 0; integral2 = 0; integral_cosx = 0; integral_cosx1 = 0; integral_cosx2 = 0; index = 1;
interval = [b,(a+b)/2,(a+b)/3,(a+b)/4,(a+b)/5,(a+b)/6,(a+b)/7,(a+b)/8,(a+b)/9,(a+b)/10,(a+b)/11,(a+b)/12,(a+b)/13,(a+b)/14,(a+b)/15,(a+b)/16,(a+b)/17,(a+b)/18,(a+b)/19,(a+b)/20,(a+b)/21,(a+b)/22,(a+b)/23,(a+b)/24,(a+b)/25,(a+b)/26,(a+b)/27,(a+b)/28,(a+b)/29,(a+b)/30];
sinx  = zeros(3,20); cosx  = zeros(3,20);
while index <= 20
    for i = a:+interval(index):b
        angle1 = i;angle2 = i+interval(index);anglemid = (angle1+angle2)/2;anglesim1 = (angle1+anglemid)/2;anglesim2 = (angle2+anglemid)/2;
        for j = 0:+1:4
            n = 0;new = 0;old = 0;new1 = 0;old1 = 0;
            while  n<20
                    if j == 0
                        term = myterm(n,angle1); term1 = myterm1(n,angle1);
                    elseif j == 1
                        term = myterm(n,angle2); term1 = myterm1(n,angle2);  
                    elseif j == 2
                        term = myterm(n,anglemid);  term1 = myterm1(n,anglemid);
                    elseif j == 3
                        term = myterm(n,anglesim1); term1 = myterm1(n,anglesim1);
                    elseif j == 4
                        term = myterm(n,anglesim2); term1 = myterm1(n,anglesim2);
                    end    
                        new = old + term;  old = new;                         
                        new1 = old1 + term1; old1 = new1;     
             n = n + 1;    
             end
            if j == 0
                temp1 = old;flag1 = old1; 
            elseif j == 1
                temp2 = old;flag2 = old1;
            elseif j == 2
                tempmid = old;flagmid = old1;  
            elseif j == 3
                tempsim1 = old;flagsim1 = old1;
            elseif j == 4
                tempsim2 = old; flagsim2 = old1;
            end
        end
        temp = ((temp1+temp2)/2)*(angle2-angle1); %trapizoidal rule
        integral = integral + temp;
        sinx(1,index) = integral;

        tempsim = ((temp1+ (4*tempmid) +temp2)/3)*((angle2-angle1)/2); %simson 1/3 rule
        integral1 = integral1 + tempsim;
        sinx(2,index) = integral1;

        tempsim2 = ((temp1 + (3*tempsim1) + (3*tempsim2) + temp2)/4)*((angle2-angle1)/2);
        integral2 = integral2 + tempsim2; %simson 3/8 rule
        sinx(3,index) = integral2;

        flag = ((flag1+flag2)/2)*(angle2-angle1); %trapizoidal rule
        integral_cosx = integral_cosx + flag;
        cosx(1,index) = integral_cosx;

        flagsim = ((flag1+ (4*flagmid) +flag2)/3)*((angle2-angle1)/2); %simson 1/3 rule
        integral_cosx1 = integral_cosx1 + flagsim;
        cosx(2,index) = integral_cosx1;

        flagsimpson2 = ((flag1 + (3*flagsim1) + (3*flagsim2) + flag2)/4)*((angle2-angle1)/2);
        integral_cosx2 = integral_cosx2 + flagsimpson2;  %simson 3/8 rule
        cosx(3,index) = integral_cosx2;
    end 
    fprintf('integral sinx value is %.3f with interval %d using trapizoidal rule\n', integral, index);
    fprintf('integral sinx value is %.3f with interval %d using simpson 1/3 rule\n', integral1, index);
    fprintf('integral sinx value is %.3f with interval %d using simpson 3/8 rule\n', integral2, index);
    fprintf('integral cosx value is %.3f with interval %d using trapizoidal rule\n', integral_cosx, index);
    fprintf('integral cosx value is %.3f with interval %d using simpson 1/3 rule\n', integral_cosx1, index);
    fprintf('integral cosx value is %.3f with interval %d using simpson 3/8 rule\n\n', integral_cosx2, index);
    index = index + 1;
    integral = 0;integral1 = 0; integral2 = 0; integral_cosx = 0; integral_cosx1 = 0; integral_cosx2 = 0;   
end
figure;
grid on
plot(axis,sinx(1,:));
xlabel('No. of terms')
ylabel('integral Sin x Values ')
title('Sinx integral trapizoidal rule:')
figure;
grid on
plot(axis,sinx(2,:));
xlabel('No. of terms')
ylabel('integral Sin x Values ')
title('Sinx integral using simpson 1/3 rule:')
figure;
grid on
plot(axis,sinx(3,:));
xlabel('No. of terms')
ylabel('integral Sin x Values ')
title('Sinx integral using simpson 3/8 rule:')
figure;
grid on
plot(axis,cosx(1,:));
xlabel('No. of terms')
ylabel('integral cos x Values ')
title('cosx integral trapizoidal rule:')
figure;
grid on
plot(axis,cosx(2,:));
xlabel('No. of terms')
ylabel('integral cos x Values ')
title('cosx values simpson 1/3 rule:')
figure;
grid on
plot(axis,cosx(3,:));
xlabel('No. of terms')
ylabel('integral cos x Values ')
title('cosx values simpson 3/8 rule:')
function [term] = myterm(n,angle)
      term = ( ((-1)^n) / (factorial((2*n) + 1)) ) * ( angle ^ ((2*n) + 1) );
end 
function [term1] = myterm1(n,angle)
      term1 = ( ((-1)^n) / (factorial((2*n))) ) * ( angle ^ ((2*n)) );
end 
function fact = factorial(a)
   if (a <= 0)
       fact = 1;
   else 
       fact = factorial(a-1) * a;
   end
end
