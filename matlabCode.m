clc; clear all;format long;

load ('pr5data.dat')

%-------------------------------------------------------------------------
%Linear least squares polynomial

m = 11; %The number of data

%Calculating the sums

Sxi2 = 0;
Syi = 0;
Sxiyi = 0;
Sxi = 0;

for i=1:1:11
    Sxi2 = Sxi2 + (pr5data(i:i,1)*pr5data(i:i,1));
    Syi = Syi + pr5data(i:i,2);
    Sxiyi = Sxiyi + (pr5data(i:i,1)*pr5data(i:i,2));
    Sxi = Sxi + pr5data(i:i,1);
end

%calculating the coefficients

a0 = ((Sxi2*Syi) - (Sxiyi*Sxi))/((m*Sxi2)-(Sxi*Sxi));
a1 = ((m*Sxiyi)-(Sxi*Syi))/((m*Sxi2)-(Sxi*Sxi));
Coefficients(1,1) = a0;
Coefficients(2,1) = a1;

f =@(x) a1*x+a0; %polynomial

%Values of polynomial

for i=1:1:11
    Pvalues(i:i,1) = f(pr5data(i:i,1));
end

%Calculation of error

E1 = 0;

for i=1:1:11
    E1 = E1 + (pr5data(i:i,2)-f(pr5data(i:i,1)))^2;
end

%plotting of datas

figure(1);
plot(pr5data(:,1),Pvalues);
hold on
stem(pr5data(:,1),pr5data(:,2));
xlabel("Distance (m)");
ylabel("Signal Level (V)");
title("Linear least squares");
legend("1st Degree Polynomial","Signal Values");

%--------------------------------------------------------------------------
%Least squares polynomial of degree 2

%calculating the sums
xi0 = 0;
xi1 = 0;
xi2 = 0;
xi3 = 0;
xi4 = 0;
yixi0 = 0;
yixi1 = 0;
yixi2 = 0;

for i=1:1:11
    xi0 = xi0 + pr5data(i:i,1)^0;
    xi1 = xi1 + pr5data(i:i,1)^1;
    xi2 = xi2 + pr5data(i:i,1)^2;
    xi3 = xi3 + pr5data(i:i,1)^3;
    xi4 = xi4 + pr5data(i:i,1)^4;
    yixi0 = yixi0 + (pr5data(i:i,2)*(pr5data(i:i,1)^0));
    yixi1 = yixi1 + (pr5data(i:i,2)*(pr5data(i:i,1)^1));
    yixi2 = yixi2 + (pr5data(i:i,2)*(pr5data(i:i,1)^2));
end

%calculating the coefficients
A = [ xi0 xi1 xi2 ; xi1 xi2 xi3 ; xi2 xi3 xi4];
B = [yixi0 yixi1 yixi2];
Ainv = inv(A);
X = B*Ainv;
Coefficients(1,2) = X(1,1);
Coefficients(2,2) = X(1,2);
Coefficients(3,2) = X(1,3);

g = @(x) X(1,1) + X(1,2)*x + X(1,3)*(x^2);

%Values of polynomial
for i=1:1:11
    Pvalues(i:i,2) = g(pr5data(i:i,1));
end

%Calculation of error

E2 = 0;

for i=1:1:11
    E2 = E2 + (pr5data(i:i,2)-g(pr5data(i:i,1)))^2;
end

%plotting the datas
figure(2);
plot(pr5data(:,1),Pvalues(:,2));
hold on
stem(pr5data(:,1),pr5data(:,2));
xlabel("Distance (m)");
ylabel("Signal Level (V)");
title("Least squares polynomial of degree 2");
legend("2nd Degree Polynomial","Signal Values");

%--------------------------------------------------------------------------
%Least squares polynomial of degree 3

%calculating the sums
xi0 = 0;
xi1 = 0;
xi2 = 0;
xi3 = 0;
xi4 = 0;
xi5 = 0;
xi6 = 0;
yixi0 = 0;
yixi1 = 0;
yixi2 = 0;
yixi3 = 0;

for i=1:1:11
    xi0 = xi0 + pr5data(i:i,1)^0;
    xi1 = xi1 + pr5data(i:i,1)^1;
    xi2 = xi2 + pr5data(i:i,1)^2;
    xi3 = xi3 + pr5data(i:i,1)^3;
    xi4 = xi4 + pr5data(i:i,1)^4;
    xi5 = xi5 + pr5data(i:i,1)^5;
    xi6 = xi6 + pr5data(i:i,1)^6;
    yixi0 = yixi0 + (pr5data(i:i,2)*(pr5data(i:i,1)^0));
    yixi1 = yixi1 + (pr5data(i:i,2)*(pr5data(i:i,1)^1));
    yixi2 = yixi2 + (pr5data(i:i,2)*(pr5data(i:i,1)^2));
    yixi3 = yixi3 + (pr5data(i:i,2)*(pr5data(i:i,1)^3));
end

%calculating the coefficients
A = [ xi0 xi1 xi2 xi3 ; xi1 xi2 xi3 xi4; xi2 xi3 xi4 xi5; xi3 xi4 xi5 xi6];
B = [yixi0 yixi1 yixi2 yixi3];
Ainv = inv(A);
X = B*inv(A);
Coefficients(1,3) = X(1,1);
Coefficients(2,3) = X(1,2);
Coefficients(3,3) = X(1,3);
Coefficients(4,3) = X(1,4);

p = @(x) X(1,1) + X(1,2)*x + X(1,3)*(x^2) + X(1,4)*(x^3);

%Values of polynomial
for i=1:1:11
    Pvalues(i:i,3) = p(pr5data(i:i,1));
end

%Calculation of error

E3 = 0;

for i=1:1:11
    E3 = E3 + (pr5data(i:i,2)-p(pr5data(i:i,1)))^2;
end

%plotting the datas
figure(3);
plot(pr5data(:,1),Pvalues(:,3));
hold on
stem(pr5data(:,1),pr5data(:,2));
xlabel("Distance (m)");
ylabel("Signal Level (V)");
title("Least squares polynomial of degree 3");
legend("3rd Degree Polynomial","Signal Values");

%--------------------------------------------------------------------------
Errors(1,1) = E1;
Errors(2,1) = E2;
Errors(3,1) = E3;
%--------------------------------------------------------------------------

%all plots
figure(4);
plot(pr5data(:,1),Pvalues(:,1));
hold on;
plot(pr5data(:,1),Pvalues(:,2),"r-.");
hold on;
plot(pr5data(:,1),Pvalues(:,3),"b--");
hold on;
stem(pr5data(:,1),pr5data(:,2));
xlabel("Distance (m)");
ylabel("Signal Level (V)");
title("All Plots");
legend("1rd Degree Polynomial","2rd Degree Polynomial","3rd Degree Polynomial","Signal Values");