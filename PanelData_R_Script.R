#Created: 5 Apr 2014
######################################################################################################

# select tp.player_id,tp.team_code,tp.season,PLAYER_SEASON_STATS_age,p.experience, p.height, p.weight, salary, 
# PLAYER_SEASON_STATS_FG, PLAYER_SEASON_STATS_FGA,PLAYER_SEASON_STATS_FGP, PLAYER_SEASON_STATS_DRB,
# PLAYER_SEASON_STATS_pts,PLAYER_SEASON_STATS_FT,PLAYER_SEASON_STATS_FTP
# from player_season_stats stats , team_salary tp , player p
# where stats.player_id = tp.player_id and stats.PLAYER_SEASON_STATS_SEASON = tp.season and tp.player_id = p.player_id
# and tp.season BETWEEN '2001-02' AND '2010-11'
# group by tp.player_id, tp.season ;

#Read the player salary data here
panel_sal_csv<-read.table("/Users/vinutha/IS5126/GP2/csv/panel_data.csv",header=T,sep=",")
panel_sal_csv

fixed_age <- plm(SALARY ~ AGE, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within",, effect="time")
summary(fixed_age)
#Adj. R-Squared :  0.22965 
fixed_fg <- plm(SALARY ~ FG, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_fg)
#Adj. R-Squared :  0.30677

fixed_pts <- plm(SALARY ~ PTS, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_pts)
#Adj. R-Squared :  0.30829

fixed_exp <- plm(SALARY ~ EXPERIENCE, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_exp)
#Adj. R-Squared :  0.50251

fixed_fgp <- plm(SALARY ~ FGP, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_fgp)
#Adj. R-Squared :  0.018306

fixed_height <- plm(SALARY ~ HEIGHT, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_height)
#Adj. R-Squared :  0.0073353 
fixed_weight <- plm(SALARY ~ WEIGHT, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_weight)


#Random Method
rand_age <- plm(SALARY ~ AGE, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model="random", effect="time")
summary(rand_age)
rand6 <- plm(SALARY ~ AGE + EXPERIENCE + HEIGHT, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "random", effect="time")


fixed6 <- plm(SALARY ~ AGE + EXPERIENCE + HEIGHT, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
fixed_few <- plm(SALARY ~ EXPERIENCE + FG  + DRB + FGA , data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
rand_few <- plm(SALARY ~ FG  + DRB + FGA , data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "random", effect="time")


#Maximum R-squared 

fixed_all <- plm(SALARY ~ AGE + EXPERIENCE + PTS + FG  + FGP + FTP+ DRB + FGA , data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model = "within", effect="time")
summary(fixed_all)

#rand_all <- plm(SALARY ~ AGE + FG + FGP + FTP, data = panel_sal_csv, index=c("PLAYER_ID","SEASON"), model="random", effect="time")
rand_all <- plm(SALARY ~ AGE + FG + FGP + FTP, data = panel_sal_csv, model="random",, effect="individual")
summary(rand_all)

