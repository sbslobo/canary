-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 49,
		multiplier = 150,
	},
	{
		minlevel = 50,
		maxlevel = 79,
		multiplier = 90,
	},
	{
		minlevel = 80,
		maxlevel = 129,
		multiplier = 50,
	},
	{
		minlevel = 130,
		maxlevel = 199,
		multiplier = 35,
	},
	{	
		minlevel = 200,
		maxlevel = 249,
		multiplier = 25,
	},	
	{	
		minlevel = 250,
		maxlevel = 299,
		multiplier = 18,
	},	
	{	
		minlevel = 300,
		maxlevel = 449,
		multiplier = 10,
	},	
	{	
		minlevel = 450,
		maxlevel = 699,
		multiplier = 7,
	},
	{	
		minlevel = 700,
		maxlevel = 999,
		multiplier = 4,
	},	
	{
		minlevel = 1000,
		multiplier = 2.5,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 30,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 20,
	},
	{
		minlevel = 81,
		maxlevel = 110,
		multiplier = 6,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 4,
	},
	{
		minlevel = 126,
		multiplier = 2,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 18,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 10,
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 6,
	},
	{
		minlevel = 101,
		maxlevel = 110,
		multiplier = 4,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 3,
	},
	{
		minlevel = 126,
		multiplier = 2,
	},
}
