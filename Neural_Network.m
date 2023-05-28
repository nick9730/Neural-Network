clc;
%[X,T] = bodyfat_dataset;
w = readtable('data.xlsx');
A = table2array(w);
X = A(1:6,1:177);
T = A(11,1:177);
%[ I, N ] = size(X);
%[ O, N ] = size(T);
r =0 ;
pinakas = zeros(1,11);
str = input('Vale th synarthsh energopoihshs(logsig,tansig,purelin): ','s');
if strcmp( str, 'logsig' ) || strcmp( str, 'tansig' ) || strcmp( str, 'purelin' )
k = input ('Give a number for neurons: ');
switch str 
    case 'logsig'
 for i= 1 : k
r = r +1;
net = feedforwardnet(k,'trainlm');
net.trainFcn = 'trainlm';
[net,tr] = train(net,X,T);
net.layers{1}.transferFcn = 'logsig'; 
y= net(X);
e = T - y;
ploterrhist(e)
IW = net.IW;
bias=net.b;
x = (sum(X).^2) - (sum(y).^2);  %calculation of R^2
t = (sum(X).^2) - (sum(mean(X)).^2); %calculation R^2
l(r)= 1 - x/t; %calculation R^2
pinakas_R(i) = l(r); %matrix R^2 
R_2 = max(pinakas_R);
elaxisto(r) = mse(net,y,T); % calculatin mse 
pinakas_Mse(i) = elaxisto(r); % matrix MSE     
Mse = min(pinakas_Mse);
perf(r) = perform(net,T,y); % calculation performance
pinakas(i) = perf(r); % matrix perfromance
Perf= max(pinakas);
end
fprintf('The maximum perfomance in neural: %4.2f\n',Perf);
fprintf('The minimun mse in neural: %4.02f\n',Mse);
fprintf('The maximum R_2 in neural: %4.2f\n',R_2);
fprintf('dwse ta warh %d\n',IW{:,:});
fprintf('dwse to bias %d\n',bias{:,:});
    case 'tansig'
 for i= 1 : k
r = r +1;
net = feedforwardnet(k,'trainlm');
[net,tr] = train(net,X,T);
net.layers{1}.transferFcn = 'tansig';
y= net(X);
e = T - y;
ploterrhist(e)
IW = net.IW;
bias=net.b;
x = (sum(X).^2) - (sum(y).^2);  %υπολογισμος R^2
t = (sum(X).^2) - (sum(mean(X)).^2); %υπολογισμος R^2
l(r)= 1 - x/t; %υπολογισμος R^2
pinakas_R(i) = l(r); %πινακας R^2 
R_2 = max(pinakas_R);
elaxisto(r) = mse(net,y,T); % υπολογισμος mse 
pinakas_Mse(i) = elaxisto(r); % πινακας MSE     
Mse = min(pinakas_Mse);
perf(r) = perform(net,T,y); % υπολογισμος performance
pinakas(i) = perf(r); % πινακας perfromance
Perf= max(pinakas);
 end
 
 fprintf('The maximum perfomance for tansig function in neural: %d\n',Perf);
fprintf('The minimun mse for tansig function in neural: %d\n',Mse);
fprintf('The maximum R_2 for tansig function in neural: %4.2f\n',R_2);
fprintf('dwse ta warh %d\n',IW{:,:});
fprintf('dwse to bias %d\n',bias{:,:});
    case 'purelin'
        for i= 1 : k
r = r +1;
net = feedforwardnet(k,'trainlm');
[net,tr] = train(net,X,T);
net.layers{1}.transferFcn = 'purelin';
y= net(X);
e = T - y;
ploterrhist(e)
IW = net.IW;
bias=net.b;
x = (sum(X).^2) - (sum(y).^2);  %υπολογισμος R^2
t = (sum(X).^2) - (sum(mean(X)).^2); %υπολογισμος R^2
l(r)= 1 - x/t; %υπολογισμος R^2
pinakas_R(i) = l(r); %πινακας R^2 
R_2 = max(pinakas_R);
elaxisto(r) = mse(net,y,T); % υπολογισμος mse 
pinakas_Mse(i) = elaxisto(r); % πινακας MSE     
Mse = min(pinakas_Mse);
perf(r) = perform(net,T,y); % υπολογισμος performance
pinakas(i) = perf(r); % πινακας perfromance
Perf= max(pinakas);
        end
fprintf('The maximum perfomance in neural: %4.2f\n',Perf);
fprintf('The minimun mse in neural: %4.02f\n',Mse);
fprintf('The maximum R_2 for purelin function in neural: %4.2f\n',R_2);

end
else
      disp('Try again')
end