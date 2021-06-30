clc
clear 
close all
%Introduction
disp('Welcome to Homogeneous 2D Heat Conduction Problems ver 2.0');
disp('This MatLab code are made for Heat Conduction Problems');
disp('The modes in this codes are: Plotting and calculating Homogenous heat conduction,');
disp('With plotting variation on time and fourier order');
disp('Further optimization and range addition could be conducted with more time');
disp('The program made by M.Lucky Witjaksono');
disp('The program will be beneficial for faster system analsys');
disp(' ')
disp('This programs runs on the equations of: ');
disp('U(X,T) = X(x)T(t)');
disp('u(x,t) = Cn Un (x,t) = sigma Cn exp^((-(n^2)(phi^2)(a^2)(t))/(L^2)) sin(n phi x/L)');
disp('With Cn of (2/L)Integral[L to 0] f(x) sin(n phi x / L) dx');

%% User data input
%Rod properties
disp('The following are the input required by the program');
Rod_L   = input('Rod length (Cm): ');
Rod_A   = input('Thermal diffusivity (alpha^2): ');
step    = input('Step along the rod(Cm): ');
Rod_DL  = (Rod_L/step) + 1;
rodplot(1,(1:Rod_DL)) = 0 : step : Rod_L ;

%Initial Condition properties
syms x n t
IC_poly     = input('initial conditon is a polynominal with fuction of X? yes(1),no(0): ');
if IC_poly ==1
    ICCP = input('Power of the equation: ');
    ICCP = ICCP + 1;
    Mat_IC = zeros(1,ICCP);
    for ie_IC = 1: ICCP
       Mat_IC(1,ie_IC) = input('Input the variables from the highest power to lowest power: '); 
    end
    IC = poly2sym(Mat_IC);
    disp('The equation for initial conditions are: ');
    disp(IC);
elseif IC_poly ==0
    IC = input('Initial Temperature: ');
else
    disp('Invalid Input, Please re-run the program');
    return
end 

%% Calculating Cn
%Order user input
Rod_order = input('How many order of the fourier series that want to be analyzed(n): ');
disp('Please input with the current order value are smaller than the next');
Mat_order = zeros(1,Rod_order);
for ie_order = 1 : Rod_order
    order_disp = '%g order input \n';
    fprintf(order_disp,ie_order)
    Mat_order(1,ie_order) = input('Order value (n>1): ');
end
% Cn value calculation
Mat_CN  = (2/Rod_L)*(int((IC*(sin((n*pi*x)/Rod_L))),0,Rod_L));
disp('The value of CN:  ');
disp(Mat_CN);

%% Calculating the general linear combinations solutions
Mat_sol = Mat_CN*((exp(((-1)*(n^2)*(pi()^2)*((Rod_A)^2)*(t))/(Rod_L)^2))*(sin((n*pi()*x)/(Rod_L))));
disp('Below are the general Solution equations: ');
disp(Mat_sol);
%% Time based iteration 
%User input
Order_max   = Mat_order(end);
Time_plots  = input('How many time want to be analyzed: ');
Mat_time    = zeros(1,Time_plots);
for ie_time = 1 : Time_plots
    time_disp = '%g Time input \n';
    fprintf(time_disp,ie_time)
    Mat_time(1,ie_time) = input('Time value: : ');
end
%calculation for each order
disp('The program are currently calculating, Please wait');
disp('The time are depending on how many order are analyzed');
order_count = size(Mat_order,2);
for ie_time = 1 : Time_plots
    ie_break = 1;
    while ie_break <= order_count
        break_cond = Mat_order(1,ie_break);
        ie_order = 1;
        while ie_order <= break_cond
            Temp_cell{ie_break,ie_time}(ie_order,:) = double(subs(subs(subs(Mat_sol,x,rodplot),n,ie_order),t,Mat_time(1,ie_time)));
            if ie_order == break_cond ; ie_break = ie_break + 1; end
            ie_order = ie_order + 1;
        end
    end
end
%% Summation of each order
for ie_time = 1 : Time_plots
    for ie_order = 1 :Rod_order
        if (size(Temp_cell{ie_order,ie_time},1)) == 1
        else 
            Temp_cell{ie_order,ie_time} = sum((Temp_cell{ie_order,ie_time}));
        end
    end
end

%% Plotting options
Plot_ops = input('Categorized plotting by time(1) or order(2): ');

if Plot_ops == 1
    %Time based categorization
    for ie_order = 1 : order_count
        for ie_time = 1 : Time_plots
            Temp_plot{1,ie_time}(ie_order,:) = Temp_cell{ie_order,ie_time}(:,:);
        end
    end
    for ie_order = 1 : order_count
        legend_info{1,ie_order} = ['N = ' num2str(Mat_order(1,ie_order))];
    end
    for ie_time = 1 : Time_plots
        subplot(Time_plots,1,ie_time)
        plot(rodplot,Temp_plot{1,ie_time});
        title(['Time input (',num2str(ie_time),') With time value of: ',num2str(Mat_time(1,ie_time)),' Seconds'])
        legend(legend_info)
    end
elseif Plot_ops == 2
        %Order based categorization
    for ie_order = 1 : order_count
        for ie_time = 1 : Time_plots
            Temp_plot{1,ie_order}(ie_time,:) = Temp_cell{ie_order,ie_time}(:,:);
        end
    end
    for ie_time = 1 : Time_plots
        legend_info{1,ie_time} = ['T = ' num2str(Mat_time(1,ie_time))];
    end
    for ie_order = 1 : order_count
        subplot(order_count,1,ie_order)
        plot(rodplot,Temp_plot{1,ie_order});
        title(['Order input (',num2str(ie_order),') With Fourier order of: ',num2str(Mat_order(1,ie_order)),' Order'])
        legend(legend_info)
    end
end

disp('Thank you for using the program');
disp('CopyRight - Muhammad Lucky Witjaksono');
disp('Contact: github.com/mluckyw');