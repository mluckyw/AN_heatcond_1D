# Introduction
Hello There! 
I'm A Aerospace/Aeronautical Engineering Students currently diving too much time in MATLAB With further intrest in Java and Phyton.<br>
As this is my first time uploading my works to GitHub, Please do forgive me for doing something wrong.<br>
Further Feedback is welcomed as i dont get one from my proffesor.<br>

# Story Behind this Program
Started as a homework for just plotting a general heat equation in MATLAB.<br>
Later turns out to be a user based input calculation of Homogenous 1D Heat Equation Calculations and plotting Using analytical equation.<br>
and yes, i put too much work for this program that probably does not affect my grade so much.<br>

# What can this program do
- Calculating the temperature for one dimensional heat conduction with each end holds at 0 degree celcius with the equation below<br>
  <img src = "https://github.com/mluckyw/AN_heatcond_1D/blob/main/Heat_Conduction_Homogeneous_test_run/General_equation.PNG" /><br>
  <img src = "https://github.com/mluckyw/AN_heatcond_1D/blob/main/Heat_Conduction_Homogeneous_test_run/Cn_value.PNG" /><br>
- With input at the command window such as :<br>
  - Rod length<br>
  - Order of Fourier Series<br>
  - Thermal Diffusifity<br>
  - Step of iteration in the rod<br>
  - Initial condition (Polynominal or constant)<br>
  - Time elapsed<br>
- With Output of : <br>
  - Cn Variable and General Equation of U(x,t) (V2.0)<br>
  - Temperature Distribution across the rod<br>
  - Plotting the Temperature based on order and time categorizations (V2.0)<br>
  <p align = "center"> Temperature Plotting from V1.0 <p/>
  <img src = "https://github.com/mluckyw/AN_heatcond_1D/blob/main/Heat_Conduction_Homogeneous_test_run/Heat_Conduction_Homogeneous_1D_V1_0_n_10.jpg?raw=true" />
  <p align = "center"> Temperature Plotting from V2.0 <p/>
  <p align = "center"> Grouping based on Time input <p/>
  <img src = "https://github.com/mluckyw/AN_heatcond_1D/blob/main/Heat_Conduction_Homogeneous_test_run/Heat_Conduction_Homogeneous_1D_V2_0_Time_based.jpg?raw=true" />
  <p align = "center"> Grouping based on Order input  <p/>
  <img src = "https://github.com/mluckyw/AN_heatcond_1D/blob/main/Heat_Conduction_Homogeneous_test_run/Heat_Conduction_Homogeneous_1D_V2_0_Order_based.jpg?raw=true" />
<br>

# What this program does not do (yet)
- Calculating the temperature for one dimensional heat conduction with each end holds at a different temperature (Non - Homogeneous)<br>
- Determining The time with a maximum temperature as an input<br>
# What's The difference in difference version? <br>
Glad you ask because this code already have two version available (30 June 2021)<br>
- Version 1.0 <br>
  - Computation of The temperature using a single loop for the temperature by using Matlab Integral Fucntion<br>
  - Does not give the equation for Cn and U(x,t)<br>
  - Computation requires long time for 3000 data points at 100 order within +-5 minutes per temperature<br>
  - Computation is limited with one order input and three time elapsed input<br>
  - Plotting only based on a sigle order input<br>
- Version 2.0 <br>
  - Computation of Temperature are splitted into two loops with Cn and U(x,t) separated by using Matlab int function for Cn<br>
  - Displaying equation for Cn and U(x,t) in the command window<br>
  - Computational time is shortened as it does not requiring integration at each loop<br>
  - Computational is unlimited with as much as user input for order count and time elapsed (Though only debugged at max 3 each)<br>
  - Plotting Based on categorization of order and time elapsed<br>
# Disclaimer
- If you are using this code to do a calculation i did not held any responsiblility of any wrong data outputs that may affected you (altough Feedback is very much welcomed)<br>
- This is copyrighted by using MIT license with the details in the license file<br>
