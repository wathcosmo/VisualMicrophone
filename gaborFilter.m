% GABORFILTER Generate a bi-dimensional Gabor filter
% G = gabor_filter(S,F,theta)
% S : 1/standard deviation
% F : 1/wavelength
% theta : orientation
function G = gaborFilter

S = 0.5;
F = 3;
theta = pi/4;
size=fix(1.5/S); 
G = zeros(2*size+1);

for x = -size : size
    for y = -size : size
        G(size+x+1,size+y+1) = exp(-pi*S^2*(x*x+y*y))*...
            (exp(1i*(2*pi*F*(x*cos(theta)+y*sin(theta))))-exp(-pi*(F/S)^2));
    end
end


  

