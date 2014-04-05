#Created: 5 Apr 2014
######################################################################################################
# SQL Query to join player stats and salary
# select tp.player_id, salary, PLAYER_SEASON_STATS_FG, PLAYER_SEASON_STATS_FGA,PLAYER_SEASON_STATS_FGP, PLAYER_SEASON_STATS_DRB,PLAYER_SEASON_STATS_pts
# from player_season_stats stats , team_player tp 
# where stats.player_id = tp.player_id 
# and tp.season ='2010-11'
# group by tp.player_id, salary ;

# ######################################################################################################
# #SQL Query to join player sal, stats and Age
# select p.age,p.experience,p.weight,tp.player_id, salary, PLAYER_SEASON_STATS_FG, PLAYER_SEASON_STATS_FGA,PLAYER_SEASON_STATS_FGP, PLAYER_SEASON_STATS_DRB,PLAYER_SEASON_STATS_pts
# from player_season_stats stats , team_player tp , player p
# where stats.player_id = tp.player_id and p.player_id = tp.player_id
# and tp.season ='2010-11'
# group by tp.player_id, salary ;

#Read the player salary data here
salary_player<-read.table("/Users/vinutha/Desktop/sal_season.csv",header=T,sep=",")
player_sal_stat<-read.table("/Users/vinutha/Desktop/player_stat.csv",header=T,sep=",")
######################################################################################################
#K Means Plot: FG Vs Salary
sal_fg<-subset(salary_player,select=c(FG,SALARY))
x<-data.matrix(sal_fg,rownames.force = NA)
(cl=kmeans(x,3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_FG.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
#K Means Plot: FGA Vs Salary
sal_fga<-subset(salary_player,select=c(FGA,SALARY))
x<-data.matrix(sal_fga,rownames.force = NA)
(cl=kmeans(x,3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_FGA.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
#K Means Plot: FGP Vs Salary
sal_fgp<-subset(salary_player,select=c(FGP,SALARY))
x<-data.matrix(sal_fgp,rownames.force = NA)
(cl=kmeans(x,3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_FGP.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
#K Means Plot: DRB Vs Salary
sal_drb<-subset(salary_player,select=c(DRB,SALARY))
x<-data.matrix(sal_drb,rownames.force = NA)
(cl=kmeans(x,3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_DRB.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
#K Means Plot: POINTS Vs Salary
sal_pts<-subset(salary_player,select=c(POINTS,SALARY))
ptsx<-data.matrix(sal_pts,rownames.force = NA)
(cl=kmeans(ptsx,3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_POINTS.png')
plot(ptsx,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
#K Means Plot: POINTS Vs Salary
sal_age<-subset(player_sal_stat,select=c(AGE,SALARY))
x<-data.matrix(sal_age,rownames.force = NA)
(cl=kmeans(na.omit(x),3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_AGE.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

#K Means Plot: Experience Vs Salary
sal_exp<-subset(player_sal_stat,select=c(EXPERIENCE,SALARY))
x<-data.matrix(sal_exp,rownames.force = NA)
(cl=kmeans(na.omit(x),3))
png('/Users/vinutha/IS5126/GP2/plots/kmeans/Sal_EXP.png')
plot(x,col=cl$cluster)
points(cl$centers,col=1:3,pch=8,cex=2)
dev.off()

######################################################################################################
# Determine number of clusters
wss <- (nrow(ptsx)-1)*sum(apply(ptsx,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(ptsx, 
  	 centers=i)$withinss)
png('/Users/vinutha/IS5126/GP2/plots/kmeans/RPlot.png')
plot(1:15, wss, type="b", xlab="Number of Clusters",
  ylab="Within groups sum of squares")
dev.off()

######################################################################################################
