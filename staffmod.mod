# Defining Variables

param shifts; # the number of shifts (variables)
param hours; # the hours in a work day (constraints)
param teams; # number of teams
#param prod; # number of products
param wage := 20; # avg cost per hour labor

set SHIFTS := {1..shifts}; #shifts
set HOURS := {1..hours}; #hours
set TEAMS := {1..teams}; #teams
#set PROD := {1..prod}; #products

param hr{SHIFTS, HOURS}; #shifts matrix
param calls{TEAMS, HOURS}; #teams call volume matrix
#param prodtm{TEAMS, PROD}; #team prod matrix

# 1. Decision Variable
var staff{SHIFTS, HOURS} integer; #people per shift per hour
var stafftm{TEAMS, HOURS} integer; #people per team per hour

# 2. Objective Function: Minimize Staffing Cost
minimize obj_func:
	sum{j in HOURS, l in SHIFTS} staff[l,j]*wage;
	
# 3. Constraints

# minimum required teams per shift
s.t. schedule {l in SHIFTS, j in HOURS}:
	staff[l,j] >= hr[l,j]*teams;

# 8 hour shift per person
s.t. shiftlimit {l in SHIFTS, j in HOURS}:
	staff[l,j] = staff[l,l]*hr[l,j];

# minimum required people per team based on call freq
s.t. teamstaff {i in TEAMS, j in HOURS}: 
	stafftm[i,j] >= calls[i,j]/5;

# people per hour based on team call freq
s.t. shiftreq {l in SHIFTS, j in HOURS}:
	staff[l,j] >= sum{i in TEAMS}stafftm[i, j]*hr[l,j]