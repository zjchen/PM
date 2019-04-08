%PM wave spectrum
clear

fengji = 3
duanshu = 7
dx = 0.1;
dz = 0.1;
distance = 50;

wavewmin = [2.438306 1.462983 1.044989 0.812770 0.664988 0.562683 0.487659 0.430288];
wavewmax = [16.444115 9.866469 7.04748 5.481373 4.484760 3.794799 3.288826 2.901905];

%-----------------------------------------------------
u = [3 5 7 9 11 13 15 17];
%---------------------------------------------------

if fengji > 8
    fengji = 8;
end
if fengji < 1
    fengji = 1;
end
fi = fengji;
wmin = wavewmin(fi);
wmax = wavewmax(fi);

ui = u(fi);
M = duanshu;

wavewn = (wmax - wmin) / M;

x = [0 : dx : distance];
z = [0 : dz : distance];

[x, z] = meshgrid(x, z);
y = zeros(size(x));
for wi = 1 : M
    epsin = rand * 2 * pi;
    w = wmin + (wi - 1) * wavewn;
    swi = 0.81 * exp(-7400 / (w * ui).^4) / w.^5;
    an = sqrt(2 * swi * wavewn);
    PM_y = w * w * x / 9.8 + epsin;
    y = an * cos(PM_y) + y;
end

PM_y = y(25,:);
PM_x = [0 : dx : distance];
    
figure;    
plot(PM_x, PM_y, 'k');
xlim([0 50]);
ylim([-5 10]);