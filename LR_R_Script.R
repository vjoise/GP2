#coefficients(player_sal_reg)
#confint(player_sal_reg, level=0.95) # CIs for model parameters 
#fitted(player_sal_reg) # predicted values
#residuals(player_sal_reg) # residuals
#anova(player_sal_reg) # anova table 
#vcov(player_sal_reg) # covariance matrix for model parameters 
#influence(player_sal_reg) # regression diagnostics
####ENV CONFIG#######
library(ggplot2)
library(plm)
install.packages('plm')
#Read the player salary data here
PLOT_DIR<-'~/GP2/GP2/plots'
#####################

######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS 
                     + player_salary$PLAYER_SEASON_STATS_TRB
                     + player_salary$PLAYER_SEASON_STATS_AST
                    , player_salary)
summary(player_sal_reg)
#Plot the trend of FGA vs salary
png(paste(PLOT_DIR, '/Multiple-Salary.png', sep=''))
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(player_sal_reg)

#abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ 
                       player_salary$AGE
                       + player_salary$PLAYER_SEASON_STATS_STL
                       + player_salary$PLAYER_SEASON_STATS_BLK, 
                     player_salary)
summary(player_sal_reg)
#Plot the trend of FGA vs salary
png(paste(PLOT_DIR, '/STL_BLK_AGE-Salary.png', sep=''))
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(player_sal_reg)
dev.off()
png(paste(PLOT_DIR, '/STL_BLK_AGE_Influence-Salary.png', sep=''))
#avPlots(player_sal_reg, id.n=2, id.cex=0.7)
showLabels
outlierTest(player_sal_reg)
influencePlot(player_sal_reg, id.n=3)
#qqplot(resid(player_sal_reg), id.method = "identify")
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ 
                       player_salary$PLAYER_SEASON_STATS_PTS, 
                     player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png(paste(PLOT_DIR, '/PTS-Salary.png' , sep=''))
plot(player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary, xlab='POINTS',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs FGP parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ 
                       player_salary$PLAYER_SEASON_STATS_FGP, 
                     player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png(paste(PLOT_DIR, '/FGP-Salary.png' , sep=''))
plot(player_salary$PLAYER_SEASON_STATS_FGP, player_salary$salary, xlab='FGP',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Rebounds parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_TRB, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR,'/TRB-Salary.png' , sep=''))
plot(player_salary$PLAYER_SEASON_STATS_TRB, player_salary$salary, xlab='Defensive + Offensive Rebounds',ylab='Salary')
anova(player_sal_reg) # anova table
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Height parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$HEIGHT, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR,'/Height-Salary.png' , sep=''))
plot(player_salary$HEIGHT, player_salary$salary, xlab='Height',ylab='Salary')
anova(player_sal_reg) # anova table
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Experience parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$experience, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR,'/Experience-Salary.png' , sep=''))
plot(player_salary$experience, player_salary$salary, xlab='Experience',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs AGE parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$AGE, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR, '/Age-Salary.png' , sep=''))
plot(player_salary$AGE, player_salary$salary, xlab='Age',ylab='Salary')
anova(player_sal_reg) # anova table
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs AGE+Experience parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
  player_sal_reg <- lm(player_salary$salary ~ player_salary$AGE + player_salary$PLAYER_SEASON_STATS_PTS, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR, '/AgeAndPoints-Salary.png' , sep=''))
#layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
#plot(player_sal_reg)
#abline(player_sal_reg)
#dev.off()

df = data.frame(player_salary$AGE, player_salary$PLAYER_SEASON_STATS_PTS, player_salary$salary)
#dev.new()
anova(player_sal_reg) # anova table
qplot(player_salary$AGE, player_salary$salary, color=player_salary$PLAYER_SEASON_STATS_PTS, data=df)
dev.off()
######################################################################################################



######################################################################################################
#Player regresion analysis on Salary vs Position parameter
player_salary <- read.csv("~/GP2/GP2/player_position.csv")
player_salary$position <- factor(player_salary$position)
player_sal_reg <- lm(player_salary$salary ~ player_salary$PLAYER_SEASON_STATS_PTS + 
                        player_salary$PLAYER_SEASON_STATS_ST + 
                          player_salary$position, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR, '/Exp-Position-Salary.png' , sep=''))
df = data.frame(player_salary$experience, player_salary$position, player_salary$salary)
qplot(player_salary$experience, player_salary$salary, color=player_salary$position, data=df)
dev.off()
######################################################################################################
