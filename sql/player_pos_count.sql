select tp.player_id, 
       salary, 
       tp.team_code, 
       height, 
       experience, 
       age,
       stats.*
       count(pos.position) as num_pos
from   player_season_stats stats , 
       team_salary tp, 
       player pl,
       player_position pos
where stats.PLAYER_SEASON_STATS_SEASON = tp.season 
      and stats.player_id = tp.player_id
      and tp.season ='2010-11'
      and pl.player_id = tp.player_id
      and tp.team_code = stats.player_season_stats_team_code
      and pos.player_id = pl.player_id;