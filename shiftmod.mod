# Defining Variables

param shifts; # the number of shifts (variables)
param hours; # the hours in a work day (constraints)
param teams; # number of teams
var hrcost := 20; # avg cost per hour labor

set SHIFTS := {1..shifts}; #shifts
set HOURS := {1..hours}; #hours
set TEAMS := {1..teams}; #teams

param hr{SHIFTS, HOURS}; #shifts matrix
param tm{TEAMS, HOURS}; #teams call volume matrix


# 1. Decision Variable

var x{HOURS} integer; #people per hour


# 2. Objective Function: Minimize Staffing Cost

minimize obj_func:
	sum{j in HOURS} hrcost * x[j];
	
# 3. Constraints

# minimum required people per shift
subject to schedule {i in SHIFTS}:
	sum{j in HOURS} hr[i, j]*x[j] >= 1;

# minimum required people per team based on call freq
subject to teamstaff {l in TEAMS}:
	sum{j in HOURS} x[j] >= tm[l, j]/10;