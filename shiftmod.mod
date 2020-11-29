# Defining Variables

param shifts; # the number of shifts (variables)
param hours; # the hours in a work day (constraints)
param teams; # number of teams
var hrcost := 20; # avg cost per hour labor

set I := {1..shifts}; #shifts
set J := {1..hours}; #hours
set L := {1..teams}; #teams

# param hrcost{J}; #objective function coefficient
param hr{I, J}; #constraint coefficient matrix
param tm{L, J}; #teams per hour
# param b{J}; #RHS of constraints

# 1. Decision Variable

var x{J} integer; #people per hour


# 2. Objective Function: Minimize Staffing Cost

minimize obj_function:
	sum{j in J} hrcost * x[hours];
	
# 3. Constraints

subject to schedule {i in I}:
	sum{j in J} hr[shifts, hours]*x[hours] >= 1;

subject to teamstaff {l in L}:
	sum{j in J} tm[teams, hours]*x[hours] >= 1;
