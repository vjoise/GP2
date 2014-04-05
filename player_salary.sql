select tp.player_id, 
       salary, 
       tp.team_code, 
       height, 
       experience, 
       age,
       PLAYER_SEASON_STATS_FG, 
       PLAYER_SEASON_STATS_FGA,
       PLAYER_SEASON_STATS_FGP, 
       PLAYER_SEASON_STATS_TRB, 
       PLAYER_SEASON_STATS_pts            
from   player_season_stats stats , 
       team_player tp, 
       player pl
where stats.PLAYER_SEASON_STATS_SEASON = tp.season 
      and stats.player_id = tp.player_id
      and tp.season ='2010-11'
      and pl.player_id = tp.player_id
      and tp.team_code = stats.player_season_stats_team_code
group by tp.player_id, salary, tp.team_code, height, experience, age,
         PLAYER_SEASON_STATS_FG, 
         PLAYER_SEASON_STATS_FGA,PLAYER_SEASON_STATS_FGP, 
         PLAYER_SEASON_STATS_TRB, 
         PLAYER_SEASON_STATS_pts;