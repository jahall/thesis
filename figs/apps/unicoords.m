% Find important coordinates for funky 3D plot!
a = -30; a = a*pi/180;
b = 10;  b = b*pi/180;
c = 15;  c = c*pi/180;

rp = 5;    % distance of wheel base from origin
rw = 1.5;  % wheel radius
r = 6;     % full height of unicycle

A = [cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1];
B = [cos(b) 0 sin(b); 0 1 0; -sin(b) 0 cos(b)];
C = [1 0 0; 0 cos(c) -sin(c); 0 sin(c) cos(c)];

sca = 3;
offset = 2*[cos(a); sin(a); 0];

x0 = A*[0;rp;0]+offset;
x1 = A*[0;rp;0];
x2 = A*B*[0;rp;rw];
x3 = A*B*[0;rp;sca*rw];
x4 = A*B*C*[0;0;r-rw]+x2;
x5 = (x4+x2)/2;

disp(['\coordinate (O) at (' num2str(offset(1)) ',' num2str(offset(2)) ',0);'])
disp(['\coordinate (B) at (' num2str(x1(1)) ',' num2str(x1(2)) ',0);'])
disp(['\coordinate (Bp) at (' num2str(x0(1)) ',' num2str(x0(2)) ',0);'])
disp(['\coordinate (W) at (' num2str(x2(1)) ',' num2str(x2(2)) ',' num2str(x2(3)) ');'])
disp(['\coordinate (Wt) at (' num2str(x3(1)) ',' num2str(x3(2)) ',' num2str(x3(3)) ');'])
disp(['\coordinate (Wtp) at (' num2str(x2(1)) ',' num2str(x2(2)) ',' num2str(x2(3)*sca) ');'])
disp(['\coordinate (Wbp) at (' num2str(x2(1)) ',' num2str(x2(2)) ',0);'])
disp(['\coordinate (T) at (' num2str(x4(1)) ',' num2str(x4(2)) ',' num2str(x4(3)) ');'])
disp(['\coordinate (F) at (' num2str(x5(1)) ',' num2str(x5(2)) ',' num2str(x5(3)) ');'])