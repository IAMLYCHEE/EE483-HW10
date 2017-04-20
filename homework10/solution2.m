% solution2
a = zeros(17,18);
c = 0.4636;
for l = 1 : 17
    a(l,1:2) = [1-c*exp(1j*( (8+l)/17 )*pi),-1-c*exp(1j*( (8+l)/17 )*pi)];
end
multifft = ones(1,18);
for l = 1 : 17
    multifft = fft(a(l,:)) .* multifft; 
end
coefficientDe = ifft(multifft);
% dominator
dominator = zeros(1,18);
for i = 0 : 17
    dominator(i+1) = nchoosek(17,i);
end
dominator = c^17 * dominator;
[h,w]=freqz(dominator,coefficientDe);
plot(w/pi,abs(h));
title('magnitude');

