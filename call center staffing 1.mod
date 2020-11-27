# Call Center Staffing
# Simplified Model 3
# Assumptions:
# 1. Specific Teams Can Handle Specific Calls
# 2. The call volume varies Monday through friday
# Goal: Minimize Staffing Costs

# Part 1: Decision Variables
var x{i,j,k} > 0 integer;

# Part 2: Objective Function

# Part 3: Constraints

param n; # number of variables
param m; # number of constraints

set J:= {1..n}; #variable indicies
set I := {1..m} #constraint numbers

param c{J}; #obj function coefficent
param a{I,J}; #constraint  oefficients

#DECISION VARIABLE
var c{J} integer;

