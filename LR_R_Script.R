library(ggplot2)
#Read the player salary data here
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
attach(player_salary)
summary(player_salary)
######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS + player_salary$PLAYER_SEASON_STATS_FG+ player_salary$PLAYER_SEASON_STATS_TRB, player_salary)
summary(player_sal_reg)

#Plot the trend of FGA vs salary
png('~/GP2/GP2/plots/Multiple-Salary.png')

#coefficients(player_sal_reg)
#confint(player_sal_reg, level=0.95) # CIs for model parameters 
#fitted(player_sal_reg) # predicted values
#residuals(player_sal_reg) # residuals
#anova(player_sal_reg) # anova table 
#vcov(player_sal_reg) # covariance matrix for model parameters 
#influence(player_sal_reg) # regression diagnostics

layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 

plot(player_sal_reg)
#abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS, player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png('~/GP2/GP2/plots/PTS-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary, xlab='POINTS',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_FGP, player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png('~/GP2/GP2/plots/FGP-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_FGP, player_salary$salary, xlab='FGP',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Rebounds parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_TRB, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png('~/GP2/GP2/plots/TRB-Salary.png')
plot(player_salary$PLAYER_SEASON_STATS_TRB, player_salary$salary, xlab='Defensive + Offensive Rebounds',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Height parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$HEIGHT, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png('~/GP2/GP2/plots/Height-Salary.png')
plot(player_salary$HEIGHT, player_salary$salary, xlab='Height',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Experience parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$experience, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png('~/GP2/GP2/plots/Experience-Salary.png')
plot(player_salary$experience, player_salary$salary, xlab='Experience',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs AGE parameter
player_sal_reg <- lm(player_salary$salary ~ player_salary$AGE, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png('~/GP2/GP2/plots/Age-Salary.png')
plot(player_salary$AGE, player_salary$salary, xlab='Age',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################


######################################################################################################
#Player regresion analysis on Salary vs AGE+Experience parameter
  player_sal_reg <- lm(player_salary$salary ~ player_salary$AGE + player_salary$PLAYER_SEASON_STATS_PTS, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png('~/GP2/GP2/plots/AgeAndPoints-Salary.png')
#layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
#plot(player_sal_reg)
#abline(player_sal_reg)
#dev.off()

df = data.frame(player_salary$AGE, player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary)
#dev.new()
qplot(player_salary$AGE, player_salary$salary, color=player_salary$PLAYER_SEASON_STATS_PTS, data=df)
dev.off()
######################################################################################################
