# Linear Least Squares Polynomial
**<h1>Purpose</h1>**  
The received signal level at the terminals of a receiver antenna located between 1-2 km away from the transmitting antenna is measured with 100 m steps. The measured values are plotted in Figure 1 and given in the data file 1(pr5data.dat), where the first column is the distance in m and the second column is the measured signal level in V. Note that the received signal is distorted due to noise, environmental effects, and polarization mismatches.  

![1](/images/1.png)  

Write a code to determine

•	Linear least squares polynomial
•	Least squares polynomial of degree 2
•	Least squares polynomial of degree 3

Fits to the measured data and compute the errors for each polynomial fit. Also include the followings to your report:

•	Present the formulas that are used to generate the least squares polynomials.
•	Present the error values and coefficients of the polynomial fits in a table.
•	Plot the determined polynomial fits and the measured data.  

**<h1>Preparatory Work</h1>**  

The methods to be used can be examined. In general, it is desired to express the data obtained in all 3 methods as a polynomial. A polynomial can be expressed as in equation 1.1.

y_i= a_1 x_i+a_0      (1.1)

x_i as a exact independent variable and y_i as a also independent varible. Equation 1.1 can be used to express data as polynomials. In order to use equation 1.1, the coefficients must be calculated. If the polynomial that will express the data set is desired to be linear, the coefficients can be found with equations 1.2 and 1.3.

a_0=  (∑_1^m x_i^2 .  ∑_1^m y_i - ∑_1^m 〖x_i y_i  .  ∑_1^m x_i 〗)/(m(∑_1^m x_i^2 )-(∑_1^m x_i )^2 )         (1.2)
a_1=  (m∑_1^m 〖x_i y_i 〗- ∑_1^m 〖x_i  .  ∑_1^m y_i 〗)/(m(∑_1^m x_i^2 )-(∑_1^m x_i )^2 )          (1.3)

The m value used in equations 1.2 and 1.3 defines the number of data. If the coefficients are calculated using the equations 1.2 and 1.3 and replaced in the 1.1 equation, the linear polynomial equation that best expresses the data set is calculated. This expression is referred to as Linear Least Squares Polynomial. If the graph of the calculated polynomial is drawn, a graph will be created as in Figure 2.

![2](/images/2.png)  

If the polynomial that will express the data set is desired to be of the 2nd degree, the coefficients should be calculated with different equations.

a_0  ∑_1^m x_i^0 + a_1  ∑_1^m x_i^1 + a_2  ∑_1^m x_i^2 +⋯+ a_n  ∑_1^m x_i^n = ∑_1^m 〖y_i x_i^0 〗
a_0  ∑_1^m x_i^1 + a_1  ∑_1^m x_i^2 + a_2  ∑_1^m x_i^3 +⋯+ a_n  ∑_1^m x_i^(n+1) = ∑_1^m 〖y_i x_i^1 〗
⋮
a_0  ∑_1^m x_i^n + a_1  ∑_1^m x_i^(n+1) + a_2  ∑_1^m x_i^(n+2) +⋯+ a_n  ∑_1^m x_i^2n = ∑_1^m 〖y_i x_i^n 〗

Coefficients can be found by creating and solving the equation system, which has more than one coefficient, in a way similar to the above outline, if you want to obtain a polynomial of what degree. For example, if it is desired to obtain a 2nd degree polynomial, a polynomial can be created by establishing an equation system as below and calculating the coefficients.

a_0  ∑_1^m x_i^0 + a_1  ∑_1^m x_i^1 + a_2  ∑_1^m x_i^2 = ∑_1^m 〖y_i x_i^0 〗
a_0  ∑_1^m x_i^1 + a_1  ∑_1^m x_i^2 + a_2  ∑_1^m x_i^3 = ∑_1^m 〖y_i x_i^1 〗
a_0  ∑_1^m x_i^2 + a_1  ∑_1^m x_i^3 + a_2  ∑_1^m x_i^4 = ∑_1^m 〖y_i x_i^2 〗

If the graph of the calculated polynomial is drawn, a graph like in Figure 3 can be formed according to the degree of the polynomial.

![3](/images/3.png)  

**<h1>Analysis</h1>**  

![4](/images/4.png)  

First, it was requested to express the data set with a first order, that is, a linear polynomial. First, the coefficients are wanted to be calculated in the code. Then, as in equations 1.2 and 1.3, the series sums are calculated in a for loop. The formula can be applied now that the values of the series totals are calculated (Figure 4).  

![5](/images/5.png)  

The coefficients were calculated by using the values of the series totals according to equations 1.2 and 1.3 and assigned to variables a0 and a1 (Figure 5). The polynomial equation can now be created.  

![6](/images/6.png)  

In order to plot the graph of the polynomial created in Figure 6, the x_i values have been put into the polynomial and these values have been assigned to the Pvalues matrix.  

![7](/images/7.png)  

All the operations performed are numerical methods. Naturally, they contain certain amounts of errors. The error can be calculated using equation 1.4.

E= ∑_1^m (y_i-P(x_i ))^2         (1.4)

As seen in Figure 7, the same equation is applied in the code and the error value is assigned to the E1 variable.  

![8](/images/8.png)  

Finally, graphics were created with the data obtained (Figure 8).

The coefficients obtained are assigned to the first column of the variable named Coefficients. Since we have a linear equation, there will be 2 coefficients.  

![9](/images/9.png)  

The coefficient data goes as the first line a_0, the second line as a_1, and the third line as a_2. There are only two coefficients in our linear polynomial (Figure 9).

Error values have been assigned to the variable named Errors. The first line is the 1st degree, the second line is the 2nd degree and the third line is the error values of the 3rd degree polynomials.  

![10](/images/10.png)  

The error value of the polynomial calculated by the Linear Least Squares method is given in Figure 10.  

![11](/images/11.png)  

It can be seen that the graph turns out to be linear as expected. Linear graph represents signal level data as polynomial. It can be easily seen in Figure 11 that a polynomial is obtained in accordance with the purpose of the method used.

The data set can also be represented as a 2nd order polynomial. When it is desired to represent the data set with a polynomial greater than 1st degree, the equation system given in the preparatory work and its coefficients must be found. The equation system to be solved for a 2nd order polynomial coefficients is as follows.

a_0 ∑_1^m x_i^0 + a_1  ∑_1^m x_i^1 + a_2  ∑_1^m x_i^2 = ∑_1^m 〖y_i x_i^0 〗
a_0  ∑_1^m x_i^1 + a_1  ∑_1^m x_i^2 + a_2  ∑_1^m x_i^3 = ∑_1^m 〖y_i x_i^1 〗
a_0  ∑_1^m x_i^2 + a_1  ∑_1^m x_i^3 + a_2  ∑_1^m x_i^4 = ∑_1^m 〖y_i x_i^2 〗

The above equation system can be thought of as a matrix since it will be solved on Matlab.

[■(∑_1^m x_i^0 &∑_1^m x_i^1 &∑_1^m x_i^2 @∑_1^m x_i^1 &∑_1^m x_i^2 &∑_1^m x_i^3 @∑_1^m x_i^2 &∑_1^m x_i^3 &∑_1^m x_i^4 )]  .[■(a_0@a_1@a_2 )]  = [■(∑_1^m 〖y_i x_i^0 〗@∑_1^m 〖y_i x_i^1 〗@∑_1^m 〖y_i x_i^2 〗)]

The equation system can be expressed in matrices like the one above. Matrices can be named to show the operations performed in a simpler way. Matrices can be named from left to right as A, X and B. It is the matrix X whose values we need to find. To find the matrix X, A can be thrown to the other side of the equation. When crossing the other side of the equation, matrix A passes as the inverse of A. The new equation will be as follows.

X = B .A^(-1)       (1.5)

The steps described so far will be done exactly on Matlab. The coefficients will be found by applying equation 1.5. In this way, the 2nd order polynomial equation can also be created.

In the part of the code shown in Figure 12, the series total values in matrix A and B are calculated in a single for loop and assigned to the relevant variables. Expressions with xi are the serial sum values of matrix A, and statements with yixi are the series sum values of matrix B.

![12](/images/12.png)  

![13](/images/13.png)  

The series sums calculated before in the for loop are assigned to the A and B matrices created (Figure 13). The inverse of matrix A is obtained using the inv command. The values of matrix X are found by multiplying matrix B with the inverse of matrix A. The coefficients obtained are assigned to the variable named Coefficients so that they cannot be kept on a variable or lost. As a result, g function was created by using the calculated coefficient values. The function g represents the 2nd order polynomial to be obtained.

g = a_0  + a_1  .x + a_2  .x^2       (1.6)

The function g was created according to equation 1.6.  

![14](/images/14.png)  

In order to plot the graph of the function g, the x values are written in place in a for loop and assigned to the variable named Pvalues (Figure 14).  

![15](/images/15.png)  

The error calculation was made according to equation 1.4 in this method (Figure 15). Since the error value is calculated in the second method, it is assigned to the variable named E2.  

![16](/images/16.png)  

The graph of the calculated polynomial is plotted as in the previous method (Figure 16). The code logic used is exactly the same, only the values belong to the new method.  

![17](/images/17.png)  

Since the calculated polynomial is of 2nd degree, it has 3 coefficients. Coefficients are recorded in variable named Coefficients. The coefficient values in the 2nd column belong to the 2nd order polynomial (Figure 17).  

![18](/images/18.png)  

The error value was calculated with the equation used in the 1st degree polynomial (Equation 1.4). The error value is assigned to the variable named Errors and the error value in line 2 belongs to the 2nd degree polynomial (Figure 18).  

![19](/images/19.png)  

As seen in Figure 19, the polynomial graph followed a parabolic path. An expected way has emerged from a 2nd order polynomial. When the signal values are also taken into consideration, it can be said that a polynomial that represents the values well occurs.

A 3rd order polynomial can also be used to represent signal values. The way to follow when creating a 3rd order polynomial is very similar to the way to follow when creating a 2nd order polynomial. To find the polynomial coefficients, the system of equations described in the preparatory work will be used. It has 4 coefficients because it will be created from a 3rd degree polynomial. This can be shown differently from what is done when creating a 2nd order polynomial. The equation system to be used will be as given below.

a_0  ∑_1^m x_i^0 + a_1  ∑_1^m x_i^1 + a_2  ∑_1^m x_i^2   +  a_3  ∑_1^m x_i^3 = ∑_1^m 〖y_i x_i^0 〗
a_0  ∑_1^m x_i^1 + a_1  ∑_1^m x_i^2 + a_2  ∑_1^m x_i^3   + a_3  ∑_1^m x_i^4 = ∑_1^m 〖y_i x_i^1 〗
a_0  ∑_1^m x_i^2 + a_1  ∑_1^m x_i^3 + a_2  ∑_1^m x_i^4 + a_3  ∑_1^m x_i^5 = ∑_1^m 〖y_i x_i^2 〗
a_0  ∑_1^m x_i^3 + a_1  ∑_1^m x_i^4 + a_2  ∑_1^m x_i^5 + a_3  ∑_1^m x_i^6 = ∑_1^m 〖y_i x_i^3 〗
The above equation system can be thought of as a matrix since it will be solved on Matlab.

[■(∑_1^m x_i^0 &∑_1^m x_i^1 &∑_1^m x_i^2 &∑_1^m x_i^3 @∑_1^m x_i^1 &∑_1^m x_i^2 &∑_1^m x_i^3 &∑_1^m x_i^4 @∑_1^m x_i^2 &∑_1^m x_i^3 &∑_1^m x_i^4 &∑_1^m x_i^5 @∑_1^m x_i^3 &∑_1^m x_i^4 &∑_1^m x_i^5 &∑_1^m x_i^6 )]   .  [■(a_0@a_1@a_2@a_3 )]   =  [■(∑_1^m 〖y_i x_i^0 〗@∑_1^m 〖y_i x_i^1 〗@∑_1^m 〖y_i x_i^2 〗@∑_1^m 〖y_i x_i^3 〗)]

The equation system can be expressed in matrices like the one above. Matrices can be named to show the operations performed in a simpler way. Matrices can be named from left to right as A, X and B. It is the matrix X whose values we need to find. To find the matrix X, A can be thrown to the other side of the equation. When crossing the other side of the equation, matrix A passes as the inverse of A. The new equation will be like equation 1.5.

The steps described so far will be done exactly on Matlab. The coefficients will be found by applying equation 1.5. In this way, the 3rd order polynomial equation can also be created.

![20](/images/20.png)  

What is done on the code is very similar to what is done when creating a 2nd order polynomial. The only difference in the part shown in Figure 20 is that more series total values are calculated.  

![21](/images/21.png)  

In Figure 21, the same is done with the second order polynomial. As explained in the previous paragraphs of the report, series totals have been calculated and assigned to matrices as shown in figure 21. The inverse of the A matrix with the inv command has been multiplied by the B matrix and the coefficient values are found. In order to see all the coefficient values together, coefficient values are assigned to the variable named Coefficients. Using the coefficient values, a function named p is also created. The p function expresses the desired 3rd order polynomial.  

![22](/images/22.png)  

It can be graphed by substituting the x values in the p function, that is, in the generated 3rd degree polynomial (Figure  22).  

![23](/images/23.png)  

The error value was made in the same way as in the previous methods (Figure 23).  

![24](/images/24.png)  

The graphing process was done in the same way as in the previous methods (Figure 24).  

![25](/images/25.png)  

A warning has been received in Matlab, as seen in figure 25. As it is written in the warning, while calculating the coefficients of the 3rd degree polynomial, a problem was encountered while taking the inverse of the A matrix. It is said that the inverse matrix of A is very close to being an identity matrix because the values in reverse of the matrix A are very small. Matlab gives a warning that maybe there is an error. The warning can be ignored since there is no error in the calculation.  

![26](/images/26.png)  

Since the calculated polynomial is of 3nd degree, it has 4 coefficients. Coefficients are recorded in variable named Coefficients. The coefficient values in the 3rd column belong to the 3rd order polynomial (Figure 26).  

![27](/images/27.png)  

The error value was calculated with the equation used in the 1st degree polynomial (Equation 1.4). The error value is assigned to the variable named Errors and the error value in line 3 belongs to the 3rd degree polynomial (Figure 27).  

![28](/images/28.png)  

As can be seen in Figure 28, the 3rd degree polynomial has followed the expected path. The difference with the 2nd degree polynomial may not be seen due to the frequency of the data set. All polynomials can be plotted on a single graph to see the difference better.  

![29](/images/29.png)  

As mentioned in the previous paragraph, the difference between the 2nd and 3rd polynomials is not very clear due to the small number of data (Figure 29). A closer look at the graph of the 2nd and 3rd polynomials can be found.

When looking at Figure 30, the difference can be seen. 2nd and 3rd order polynomials do not follow exactly the same path. Since the number of data is not large, polynomial graphs follow a short path and this causes the appearance that 2nd and 3rd order polynomials follow a similar path to each other.  

![30](/images/30.png)
