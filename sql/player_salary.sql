select tp.player_id, 
       tp.team_code, 
       height, 
       experience, 
       age,
       stats.PLAYER_SEASON_STATS_AGE AGE,
       sum(salary) salary,  
       sum(PLAYER_SEASON_STATS_TRB) TRB,  
       sum(PLAYER_SEASON_STATS_PTS) PTS,  
       sum(PLAYER_SEASON_STATS_3P) THREE_P,  
       sum(PLAYER_SEASON_STATS_FG) FG 
from   player_season_stats stats, 
       team_salary tp, 
       player pl
where stats.PLAYER_SEASON_STATS_SEASON = tp.season 
      and stats.player_id = pl.player_id
      and tp.season ='2010-11'
      and pl.player_id = tp.player_id
group by tp.player_id;