# Call Center Staffing
# Simplified Model 3
# Assumptions:
# 1. Specific Teams Can Handle Specific Calls
# 2. The call volume varies Monday through friday
# Goal: Minimize Staffing Costs

param n; # number of variables
param m; # number of constraints

set J:= {1..n}; #variable indicies
set I := {1..m} #constraint numbers

param c{J}; #obj function coefficent
param a{I,J}; #constraint  oefficients

#DECISION VARIABLE
var c{J} integer;

