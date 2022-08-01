angle = [0,0.5233,0.785,1.046,1.57,2.093,3.14,6.28,1.347,2.144]; % Reading angle 
l = 10;
i = 1;
a = 2:20;
cosx_values  = zeros(10,19);
while i<=l
angle1 = angle(i);
c = 1; % Initially assign value 1
n = 0;
new = 0;
old = 0;
count = 0;
while  n<19
    term = myterm(n,angle1);
    if n == 0
      old = term; % Updating SOld
      c = round(new - old,6); % Calculating E
    else     
      new = old + term; % CAdding term to series
      c = round(new - old,6);  % Calculating E
      old = new; % Updating SOld value
    end
    if count == 0
      if c == 0
        count = n;
      end
    end
    n = n + 1;
    cosx_values(i,n) = old;
end
fprintf("\n The cos of %.2f is %.8f, and convergent value is %f \n", angle1, old, count);% Printing resultant values
i = i+1;
end
figure;
hold on
grid on
plot(a,cosx_values(1,:),'b');
plot(a,cosx_values(2,:),'k');
plot(a,cosx_values(3,:),'r');
plot(a,cosx_values(4,:),'m');
plot(a,cosx_values(5,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Cos Values for each x values')
title('Calculating Cosx values using Taylor Series:')
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2')

figure;
hold on
grid on
plot(a,cosx_values(6,:),'b');
plot(a,cosx_values(7,:),'k');
plot(a,cosx_values(8,:),'r');
plot(a,cosx_values(9,:),'m');
plot(a,cosx_values(10,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Cos Values for each x values')
title('Calculating Cosx values using Taylor Series:')
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π')
function [term] = myterm(n,angle)
      term = ( ((-1)^n) / (factorial((2*n))) ) * ( angle ^ ((2*n) ) );
end 