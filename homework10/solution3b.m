clear
close all
b = firpm(14, [0,0.25,0.45,1], [1,1,0,0]);
[h,w]=freqz(b);
plot(w/pi,abs(h));
title('magnitude')


beta = -0.3129;
Mat = zeros(14,15,15);
for i = 1 : 14
    Mat(i,:,1) = [1,-beta,zeros(1,13)];
end
for i = 1 : 14
    Mat(i,:,15) = [-beta,1,zeros(1,13)];
end
for j = 2:13
    for i = 1 : j-1
        Mat(i,:,j) = [-beta,1,zeros(1,13)];
    end
    for i = j : 14
        Mat(i,:,j) = [1,-beta,zeros(1,13)];
    end
end

sum = zeros(1,15);
for l = 1 : 15
    multiTemp = ones(1,15);
    for i = 1 : 14
        multiTemp = multiTemp .* fft(Mat(i,:,l));
    end
    sum = sum + ifft(multiTemp) * b(l);
end
dedominator = zeros(1,15);
for i = 0 : 14
    dedominator(i+1) = nchoosek(14,i)*((-beta)^i);
end
figure
[h,w]=freqz(sum,dedominator);
plot(w/pi,abs(h));
title('magnitude')



