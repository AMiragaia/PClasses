
-- Index on Player CCNumber
CREATE INDEX idx_Player_CCNumber ON LOL.Player(CCNumber);
GO

-- Index on Team ID
CREATE INDEX idx_Team_ID ON LOL.Team(ID);
GO

-- Index on League ID
CREATE INDEX idx_League_ID ON LOL.League(ID);
GO

-- Index on Game ID
CREATE INDEX idx_Game_ID ON LOL.Game(ID);
GO

-- Index on PlayerContracts Player_CCNumber
CREATE INDEX idx_PlayerContracts_Player_CCNumber ON LOL.PlayerContracts(Player_CCNumber);
GO

-- Index on Standings Team_ID
CREATE INDEX idx_Standings_Team_ID ON LOL.Standings(Team_ID);
GO

-- Index on Standings League_ID
CREATE INDEX idx_Standings_League_ID ON LOL.Standings(League_ID);
GO