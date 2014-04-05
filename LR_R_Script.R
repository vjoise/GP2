#Read the player salary data here
player_salary <- read.csv("~/Downloads/Final-BA/r-stats/player_salary.csv")
attach(player_salary)

######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS + player_salary$PLAYER_SEASON_STATS_FGA + player_salary$PLAYER_SEASON_STATS_FGP, player_salary)
summary(player_sal_reg)

#Plot the trend of FGA vs salary
png('~/GP-2/GP-2/FGA-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_FGA, player_salary$salary, xlab='FGA + FGP + PTS',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS, player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png('~/GP-2/GP-2/PTS-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary, xlab='POINTS',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_FGP, player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png('~/GP-2/GP-2/FGP-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_FGP, player_salary$salary, xlab='FGA',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter

player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_DRB 
                                          + player_salary$PLAYER_SEASON_STATS_ORB, player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png('~/GP-2/GP-2/TRB-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary, xlab='Defensive + Offensive Rebounds',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################