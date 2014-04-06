
####ENV CONFIG#######
#library(ggplot2)
#install.packages('plm')
#library(car)
#Read the player salary data here
PLOT_DIR<-'~/GP2/GP2/plots/regression'
#####################

######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg1 <- lm(player_salary$salary ~ player_salary$AGE 
                     + player_salary$PTS
                     + player_salary$TRB
                    , player_salary)
summary(player_sal_reg1)
#Plot the trend of FGA vs salary
png(paste(PLOT_DIR, '/PTS_TRB_AGE-Salary.png', sep=''))
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(player_sal_reg1)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points and Field goal parameters
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg2 <- lm(player_salary$salary ~ 
                       player_salary$AGE
                       + player_salary$THREE_P
                       + player_salary$FG, 
                     player_salary)
summary(player_sal_reg2)
#Plot the trend of FGA vs salary
png(paste(PLOT_DIR, '/AGE_THREEP_FG-Salary.png', sep=''))
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(player_sal_reg2)
dev.off()
anova(player_sal_reg2, test='F')
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs points parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ 
                       player_salary$PTS, 
                     player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png(paste(PLOT_DIR, '/PTS-Salary.png' , sep=''))
plot(player_salary$PTS, player_salary$salary, xlab='POINTS',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on salary vs FGP parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ 
                       player_salary$FG, 
                     player_salary)
summary(player_sal_reg)

#Plot the trend of PTS vs salary
png(paste(PLOT_DIR, '/FGP-Salary.png' , sep=''))
plot(player_salary$FG, player_salary$salary, xlab='FGP',ylab='Salary')
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Rebounds parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
  player_sal_reg <- lm(player_salary$salary ~ player_salary$THREE_P, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR,'/THREEP-Salary.png' , sep=''))
plot(player_salary$THREE_P, player_salary$salary, xlab='3p',ylab='Salary')
anova(player_sal_reg) # anova table
abline(player_sal_reg)
dev.off()
######################################################################################################

######################################################################################################
#Player regresion analysis on Salary vs Height parameter
player_salary <- read.csv("~/GP2/GP2/player_salary.csv")
player_sal_reg <- lm(player_salary$salary ~ player_salary$TRB, player_salary)
summary(player_sal_reg)

#Plot the trend of Rebounds vs salary
png(paste(PLOT_DIR,'/TRB-Salary.png' , sep=''))
plot(player_salary$TRB, player_salary$salary, xlab='TRB',ylab='Salary')
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
