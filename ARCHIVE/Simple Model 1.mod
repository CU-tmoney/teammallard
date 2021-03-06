# Defining Variables

param m; # the number of shifts (variables)
# n = 1: Shift 1: 6 AM - 2 PM
# n = 2: Shift 2: 7 AM - 3 PM
# n = 3: Shift 3: 8 AM - 4 PM
# n = 4: Shift 4: 9 AM - 5 PM
# n = 5: Shift 5: 10 AM - 6 PM

param n; # the hours in a work day (constraints)
# m = 1: Hour 600
# m = 2: Hour 700
# m = 3: Hour 800
# m = 4: Hour 900
# m = 5: Hour 1000
# m = 6: Hour 1100
# m = 7: Hour 1200
# m = 8: Hour 1300
# m = 9: Hour 1400
# m = 10: Hour 1500
# m = 11: Hour 1600
# m = 12: Hour 1700

param p;
param o;

set I := {1..m}; #shifts
set J := {1..n}; #hours
set K := {1..p}; #products
set L := {1..o}; #teams

param c{I}; #objective function coefficient
param a{I, J}; #constraint coefficient matrix
param d{L, K}; #constraint coef matrix teams/producs
param b{J}; #RHS of constraints

# 1. Decision Variable

var x{I} integer; #people to shift


# 2. Objective Function: Minimize Staffing Cost

minimize obj_function:
	sum{i in I} c[i] * x[i];
	
# 3. Constraints

subject to schedule {i in I}:
	sum{j in J} a[i, j]*x[i] >= b[i];

subject to products {l in L}:
	sum{k in K} d[l,k]*x[l] >= b[l];