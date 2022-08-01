a = input('enter the lower limit');
b = input('enter the upper limit');
integral = 0;
for i = a:+0.01:b
 angle1 = i;
 angle2 = i+0.01;
 for j = 0:+1:1
  c = 1; % Initially assign value 1
  n = 0;
  new = 0;
  old = 0;
  count = 0;
  if j == 0
   while  n<20
    term = myterm(n,angle1);
    if n == 0
      old = term; % Updating SOld
      c = round(new - old,6); % Calculating c
    else     
      new = old + term; % CAdding term to series
      c = round(new - old,6);  % Calculating c
      old = new; % Updating SOld value
    end
    n = n + 1;    
   end
   temp1 = old;
  end 
  if j == 1
      while  n<20
       term = myterm(n,angle2);
       if n == 0
        old = term; % Updating SOld
        c = round(new - old,6); % Calculating c
       else     
        new = old + term; % CAdding term to series
        c = round(new - old,6);  % Calculating c
        old = new; % Updating SOld value
       end
        n = n + 1;    
      end
   temp2 = old;
  end 
 end
 temp = ((temp1+temp2)/2)*(angle2-angle1);
 integral = integral + temp;
end 
fprintf('integral value is %.8f', integral);
function [term] = myterm(n,angle)
      term = ( ((-1)^n) / (factorial((2*n) + 1)) ) * ( angle ^ ((2*n) + 1) );
end 


