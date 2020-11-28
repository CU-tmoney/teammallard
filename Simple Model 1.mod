# Defining Variables

param m; # the number of shifts (variables)
# n = 1: Shift 1: 6 AM - 2 PM
# n = 2: Shift 2: 7 AM - 3 PM
# n = 3: Shift 3: 8 AM - 4 PM
# n = 4: Shift 4: 9 AM - 5 PM
# n = 5: Shift 5: 10 AM - 6 PM

param n; # the hours in a work day (constraints)
# m = 1: Hour 6 AM
# m = 2: Hour 7 AM
# m = 3: Hour 8 AM
# m = 4: Hour 9 AM
# m = 5: Hour 10 AM
# m = 6: Hour 11 AM
# m = 7: Hour 12 PM
# m = 8: Hour 13 PM
# m = 9: Hour 14 PM
# m = 10: Hour 15 PM
# m = 11: Hour 16 PM
# m = 12: Hour 17 PM

set I := {1..m}; #shifts
set J := {1..n}; #hours

param c{I}; #objective function coefficient
param a{I, J}; #constraint coefficient matrix
param b{J}; #RHS of constraints

# 1. Decision Variable: The Number of People Assigned to Shift i (i = 1, 2, ,3 ,4 ,5)

var x{I} integer; 

# 2. Objective Function: Minimize Staffing Cost

minimize obj_function:
	sum{i in I} c[i] * x[i];
	
# 3. Constraints

subject to schedule {i in I}:
	sum{j in J} a[i, j]*x[i] >= b[j];