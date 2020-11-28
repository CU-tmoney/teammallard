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

param o; # the number of days in a week
# o = 1: Monday
# o = 2: Tuesday
# o = 3: Wednesday
# o = 4: Thursday
# o = 5: Friday

param p; # the number of product teams
# p = 1: Team 1
# p = 2: Team 2
# p = 3: Team 3
# p = 4: Team 4
# p = 5: Team 5

set I := {1..m}; # shifts
set J := {1..n}; # hours
set K := {1..o}; # days
set L := {1..p}; # teams

param c{I,K}; #objective function coefficient
param a{I, J, K, L}; #constraint coefficient matrix
param b{J,K}; #RHS of constraints

# 1. Decision Variable: The Number of People Assigned to Shift i on Day k who are on team l

var x{I, K, L} integer; 

# 2. Objective Function: Minimize Staffing Cost

minimize obj_function:
	sum{i in I} c[i] * x[i,l,k];
	
# 3. Constraints

subject to schedule {i in I}:
	sum{j in J, k in K, l in L} a[i, j, k, l]*x[i, l, l] >= b[j, k];
	
