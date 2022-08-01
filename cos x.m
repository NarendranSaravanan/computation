angle = [0,0.5233,0.785,1.046,1.57,2.093,3.14,6.28,1.347,2.144]; % Reading angle 
l = 10;
i = 1;
while i<=l
angle1 = angle(i);
c = 1; % Initially assign value 1
n = 0;
new = 0;
old = 0;
count = 0;
y1 = zeros(1,21);
while  n<20
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
    if i == 2
        y1(1,n) = Old;
    end
      
end
fprintf("\n The sin of %.2f is %.8f, and convergent value if %f \n", angle1, old, count);% Printing resultant values
i = i+1;
end
fprintf("%f", y1);
x = linspace(1,19,1);
figure(1)
plot(y1)
function [term] = myterm(n,angle)
      term = ( ((-1)^n) / (factorial((2*n))) ) * ( angle ^ ((2*n) ) );
end 
% (-1)^n/(2n)n!(x^2n)