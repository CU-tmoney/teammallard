# Defining Variables

param m; # the number of shifts (variables)
param n; # the hours in a work day (constraints)
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