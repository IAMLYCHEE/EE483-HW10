b = firpm(14, [0,0.25,0.45,1], [1,1,0,0]);
[h,w]=freqz(b);
plot(w/pi,abs(h));
title('magnitude')

figure
b = firpm(14, [0,0.5,0.6,1], [0,0,1,1]);
[h,w]=freqz(b);
plot(w/pi,abs(h));
title('magnitude')
