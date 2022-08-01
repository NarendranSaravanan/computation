l = 10; i = 1;a = 0:20; 
sinx = zeros(10,20); cosx = zeros(10,20); tanx = zeros(10,20);
angle = [0,0.5233,0.785,1.046,1.57,2.093,3.14,6.28,1.347,2.144]; 
while i<=l 
    angle1 = angle(i); 
    c = 1;c1 = 1;n = 0;pres = 0;prev = 0;count = 0;prev1 = 0;pres1 = 0;count1 = 0;
    while n<21 
        term = mytermsin(n,angle1); term1 = mytermcos(n,angle1);
            pres = prev + term; 
            c = round(pres - prev,6); 
            prev = pres; 
            pres1 = prev1 + term1; 
            c1 = round(pres1 - prev1,6); 
            prev1 = pres1;
        if count1 == 0 
            if c1 == 0 
                count1 = n; 
            end
        end
        if count == 0 
            if c == 0 
                count = n; 
            end
        end
        n = n + 1; 
        sinx(i,n) = prev;cosx(i,n) = prev1;  
    end
    fprintf("\n The sin of %.2f is %.8f, and convergent value if %f", angle1, prev,count);
    fprintf("\n The cos of %.2f is %.8f, and convergent value is %f \n", angle1, prev1, count1);
    i = i+1; 
end
for i = 1:10 
    for n = 1:21 
        tanx(i,n) = sinx(i,n)/cosx(i,n); %calculating tan x (i.e) tanx = sinx/cosx
    end
end
figure;%ploting first 5 terms of sin x
hold on
grid on
plot(a,sinx(1,:),'b'); 
plot(a,sinx(2,:),'k'); 
plot(a,sinx(3,:),'r'); 
plot(a,sinx(4,:),'m'); 
plot(a,sinx(5,:),'g'); 
xlabel('No. of terms') 
ylabel('Sin Values for each x values') 
title('Sinx values:') 
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2') 

figure;%ploting last 5 terms of sin x
hold on
grid on
plot(a,sinx(6,:),'b'); 
plot(a,sinx(7,:),'k'); 
plot(a,sinx(8,:),'r'); 
plot(a,sinx(9,:),'m'); 
plot(a,sinx(10,:),'g'); 
xlabel('No. of terms ') 
ylabel('Sin Values for each x values') 
title(' Sinx values :') 
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π') 

figure;%ploting first 5 terms of cosx
hold on
grid on
plot(a,cosx(1,:),'b'); 
plot(a,cosx(2,:),'k'); 
plot(a,cosx(3,:),'r'); 
plot(a,cosx(4,:),'m'); 
plot(a,cosx(5,:),'g'); 
xlabel('No. of terms ') 
ylabel('Cos Values for each x values') 
title(' Cosx values :') 
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2') 

figure; 
hold on
grid on
plot(a,cosx(6,:),'b'); 
plot(a,cosx(7,:),'k'); 
plot(a,cosx(8,:),'r'); 
plot(a,cosx(9,:),'m'); 
plot(a,cosx(10,:),'g'); 
xlabel('No. of terms ') 
ylabel('Cos Values for each x values') 
title(' Cosx values:') 
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π') 

figure;%ploting first 5 terms of tan x
hold on
grid on
plot(a,tanx(1,:),'b'); 
plot(a,tanx(2,:),'k'); 
plot(a,tanx(3,:),'r'); 
plot(a,tanx(4,:),'m'); 
plot(a,tanx(5,:),'g'); 
xlabel('No. of terms ') 
ylabel('Tan Values for each x values') 
title(' Tanx values :') 
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2') 

figure;%ploting last 5 terms of tan x
hold on
grid on
plot(a,tanx(6,:),'b'); 
plot(a,tanx(7,:),'k'); 
plot(a,tanx(8,:),'r'); 
plot(a,tanx(9,:),'m'); 
plot(a,tanx(10,:),'g'); 
xlabel('No. of terms ') 
ylabel('Tan Values for each x ') 
title(' Tanx values :') 
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π') 
function [term] = mytermsin(n,angle) %sinx tylor series formula
 term = ( ((-1)^n) / (factorial((2*n) + 1)) ) * ( angle ^ ((2*n) + 1) ); 
end 
function [term1] = mytermcos(n,angle) %cos x tylor series formula
 term1 = ( ((-1)^n) / (factorial((2*n))) ) * ( angle ^ ((2*n) ) ); 
end
function fact = factorial(a)
   if (a <= 0)
       fact = 1;
   else 
       fact = factorial(a-1) * a;
   end
end