clc
clear
close all
%Introduction
disp('Welcome to Homogeneous 1D Heat Conduction Problems ver 2.0');
disp('DISCLAIMER: The program took a long time to run, please do be patient');
disp('This MatLab code are made for Heat Conduction Problems');
disp('The modes in this codes are: Plotting and calculating Homogenous heat conduction,');
disp('With plotting variation on time (max = 3) and N');
disp('Further optimization and range addition could be conducted with more time');
disp('The program made by M.Lucky Witjaksono');
disp('The program will be beneficial for faster system analsys');
disp(' ')
disp('This programs run on the equations of: ');
disp('U(X,T) = X(x)T(t)');
disp('u(x,t) = Cn Un (x,t) = sigma Cn exp^((-(n^2)(phi^2)(a^2)(t))/(L^2)) sin(n phi x/L)');
disp('With Cn of (2/L)Integral[L to 0] f(x) sin(n phi x / L) dx');

%User data input
disp('The following are the input required by the program');
L       = input('Rod length (meter): ');
A       = input('Thermal diffusivity (alpha^2): ');
step    = input('Step along the rod (min 1): ');
if step<=0
    disp('Invalid input, Please Re-Run The program');
    return
end
n       = input('n Value (n>1): ');
%Initial Condition Input
syms x
ICC     = input('initial conditon is a polynominal with fuction of X? yes(1),no(0): ');
if ICC ==1
    ICCP = input('Power of the equation (max =3): ');
    if ICCP == 1
        var1 = input('Variable from X^1: ');
        varC = input('Variable from X^0: ');
        IC   = (var1*(x^1))+(varC);
    elseif ICCP == 2
        var1 = input('variable from X^2: ');
        var2 = input('variable from X^1: ');
        varC = input('Variable from X^0: ');
        IC   = (var1*(x^2))+(var2*(x))+(varC);
    elseif ICCP == 3
        var1 = input('variable from X^3: ');
        var2 = input('variable from X^2: ');
        var3 = input('variable from X^1: ');
        varC = input('Variable from X^0: ');
        IC   = (var1*(x^3))+(var2*(x^2))+(var3*(x))+(varC);
    else
        disp('Invalid Input, Please re-run the program')
        return
    end
elseif ICC ==0
    IC = input('Initial Temperature: ');
else
    disp('Invalid Input, Please re-run the program');
    return
end

%User input summary
disp('The user input are as follows:');
disp('Rod Length: ');
disp(L);
disp('Thermal diffusivity (alpha^2)');
disp(A);
disp('Initial temperature distribution [f(x)]');
disp(IC);
disp('Step along the rod:');
disp(step)

%rod coordinate matrix
rodplot(1,1:((L/step)+1))=0:step:L;
%Time variation based plotting
iet  = input('how much t(second) are wanted to be plotted (max = 3)? ');
if iet ==1
    %Temperature calculation based on 1 time input
    T1  = input('T1 value (Seconds): ');
    Matiex  = 1;
    iex     = 0;
    while iex <= L
        ien     = 1;
        while ien<=n
           FM(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T1))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        dX(1,Matiex)= iex;
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM_sum = FM;
    else
        FM_sum  = sum(FM);
    end
    %Graph Plotting
    plot(dX,FM_sum,'DisplayName','T1')
    xlabel('Rod length');
    ylabel('Temperature');
    lgd = legend;
    legend('show')
    title('Temperature Distribution')
elseif iet ==2
    %Temperature calculation based on 2 time input
    T1  = input('T1 value (Seconds): ');
    T2  = input('T2 value (Seconds): ');
    %Calculation for T1
    Matiex  = 1;
    iex     = 0;
    while iex <= L
        ien     = 1;
        while ien<=n
           FM1(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T1))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        dX(1,Matiex)= iex;
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM1_sum = FM1;
    else
        FM1_sum  = sum(FM1);
    end
    %Calculation for T2
    Matiex  = 1;
    iex     = 0;   
     while iex <= L
        ien     = 1;
        while ien<=n
           FM2(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T2))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM2_sum = FM2;
    else
        FM2_sum  = sum(FM2);
    end   
    %Graph Plotting
    plot(dX,FM1_sum,'DisplayName','T1')
    hold on
    plot(dX,FM2_sum,'DisplayName','T2')
    hold off
    xlabel('Rod length');
    ylabel('Temperature');
    lgd = legend;
    legend('show')
    title('Temperature Distribution')
elseif iet ==3
    %Temperature calculation based on 2 time input
    T1  = input('T1 value (Seconds): ');
    T2  = input('T2 value (Seconds): ');
    T3  = input('T3 value (Seconds): ');
    %Calculation for T1
    Matiex  = 1;
    iex     = 0;
    while iex <= L
        ien     = 1;
        while ien<=n
           FM1(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T1))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        dX(1,Matiex)= iex;
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM1_sum = FM1;
    else
        FM1_sum  = sum(FM1);
    end
    %Calculation for T2
    Matiex  = 1;
    iex     = 0;   
     while iex <= L
        ien     = 1;
        while ien<=n
           FM2(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T2))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM2_sum = FM2;
    else
        FM2_sum  = sum(FM2);
    end
    %Calculation for T3
    Matiex  = 1;
    iex     = 0;
    while iex <= L
        ien     = 1;
        while ien<=n
           FM3(ien,Matiex)   = ((exp(((-1)*(ien^2)*(pi^2)*(A^2)*(T3))/(L^2)))...
                              *(sin((ien*pi*iex)/(L)))*...
                              (integral(matlabFunction((2/L)*IC*sin((ien*pi*x)/(L))),0,L)));
           ien              = 1+ien;
        end
        iex         = iex+step;
        Matiex      = 1+Matiex;
    end
    if n==1
        FM3_sum = FM3;
    else
        FM3_sum  = sum(FM3);
    end
    %Graph Plotting
    plot(dX,FM1_sum,'DisplayName','T1')
    hold on
    plot(dX,FM2_sum,'DisplayName','T2')
    plot(dX,FM3_sum,'DisplayName','T3')
    hold off
    xlabel('Rod length');
    ylabel('Temperature');
    lgd = legend;
    legend('show')
    title('Temperature Distribution')
end
disp('Thank you for using the program');
disp('CopyRight - Muhammad Lucky Witjaksono');
disp('Contact: github.com/mluckyw');

