-- Drop views if they exist
IF OBJECT_ID('LOL.FilterPlayers', 'V') IS NOT NULL
    DROP VIEW LOL.FilterPlayers;
GO

IF OBJECT_ID('LOL.AverageIndividualStatisticsDetails', 'V') IS NOT NULL
    DROP VIEW LOL.AverageIndividualStatisticsDetails;
GO

IF OBJECT_ID('LOL.ContractDetails', 'V') IS NOT NULL
    DROP VIEW LOL.ContractDetails;
GO

-- Drop procedures if they exist
IF OBJECT_ID('LOL.AddOrUpdatePlayer', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdatePlayer;
GO

IF OBJECT_ID('LOL.DeletePlayer', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeletePlayer;
GO

IF OBJECT_ID('LOL.FilterPlayersProcedure', 'P') IS NOT NULL
    DROP PROCEDURE LOL.FilterPlayersProcedure;
GO

-- Drop foreign key constraints
IF OBJECT_ID('LOL.FK_Store_Team_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Store DROP CONSTRAINT FK_Store_Team_ID;
GO
IF OBJECT_ID('LOL.FK_Store_Owner_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Store DROP CONSTRAINT FK_Store_Owner_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Product_Store_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Product DROP CONSTRAINT FK_Product_Store_ID;
GO
IF OBJECT_ID('LOL.FK_Average_Team_Statistics_Team_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Average_Team_Statistics DROP CONSTRAINT FK_Average_Team_Statistics_Team_ID;
GO
IF OBJECT_ID('LOL.FK_Standings_Team_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Standings DROP CONSTRAINT FK_Standings_Team_ID;
GO
IF OBJECT_ID('LOL.FK_Standings_League_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Standings DROP CONSTRAINT FK_Standings_League_ID;
GO
IF OBJECT_ID('LOL.FK_Roles_Coach_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Roles DROP CONSTRAINT FK_Roles_Coach_CCNumber;
GO
IF OBJECT_ID('LOL.FK_PlayerContracts_Player_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.PlayerContracts DROP CONSTRAINT FK_PlayerContracts_Player_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Individual_Statistics_Player_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Individual_Statistics DROP CONSTRAINT FK_Individual_Statistics_Player_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Average_Individual_Statistics_Player_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Average_Individual_Statistics DROP CONSTRAINT FK_Average_Individual_Statistics_Player_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Game_Team_ID', 'F') IS NOT NULL
    ALTER TABLE LOL.Game DROP CONSTRAINT FK_Game_Team_ID;
GO
IF OBJECT_ID('LOL.FK_Team_Coach_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Team DROP CONSTRAINT FK_Team_Coach_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Owner_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Owner DROP CONSTRAINT FK_Owner_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Coachs_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Coachs DROP CONSTRAINT FK_Coachs_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Player_CCNumber', 'F') IS NOT NULL
    ALTER TABLE LOL.Player DROP CONSTRAINT FK_Player_CCNumber;
GO
IF OBJECT_ID('LOL.FK_Player_teamname', 'F') IS NOT NULL
    ALTER TABLE LOL.Player DROP CONSTRAINT FK_Player_teamname;
GO

-- Drop tables if they exist
IF OBJECT_ID('LOL.Store', 'U') IS NOT NULL
    DROP TABLE LOL.Store;
GO
IF OBJECT_ID('LOL.Product', 'U') IS NOT NULL
    DROP TABLE LOL.Product;
GO
IF OBJECT_ID('LOL.Average_Team_Statistics', 'U') IS NOT NULL
    DROP TABLE LOL.Average_Team_Statistics;
GO
IF OBJECT_ID('LOL.Standings', 'U') IS NOT NULL
    DROP TABLE LOL.Standings;
GO
IF OBJECT_ID('LOL.Roles', 'U') IS NOT NULL
    DROP TABLE LOL.Roles;
GO
IF OBJECT_ID('LOL.PlayerContracts', 'U') IS NOT NULL
    DROP TABLE LOL.PlayerContracts;
GO
IF OBJECT_ID('LOL.Individual_Statistics', 'U') IS NOT NULL
    DROP TABLE LOL.Individual_Statistics;
GO
IF OBJECT_ID('LOL.Average_Individual_Statistics', 'U') IS NOT NULL
    DROP TABLE LOL.Average_Individual_Statistics;
GO
IF OBJECT_ID('LOL.Game', 'U') IS NOT NULL
    DROP TABLE LOL.Game;
GO
IF OBJECT_ID('LOL.Player', 'U') IS NOT NULL
    DROP TABLE LOL.Player;
GO
IF OBJECT_ID('LOL.Team', 'U') IS NOT NULL
    DROP TABLE LOL.Team;
GO
IF OBJECT_ID('LOL.League', 'U') IS NOT NULL
    DROP TABLE LOL.League;
GO
IF OBJECT_ID('LOL.Owner', 'U') IS NOT NULL
    DROP TABLE LOL.Owner;
GO
IF OBJECT_ID('LOL.Coachs', 'U') IS NOT NULL
    DROP TABLE LOL.Coachs;
GO
IF OBJECT_ID('LOL.Person', 'U') IS NOT NULL
    DROP TABLE LOL.Person;
GO

-- Drop schema if it exists
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'LOL')
    DROP SCHEMA LOL;
GO
