
--Delete Lol.InitStandings if it exists
IF OBJECT_ID('LOL.InitStandings', 'P') IS NOT NULL
    DROP PROCEDURE LOL.InitStandings;
GO
CREATE PROCEDURE LOL.InitStandings
AS
BEGIN
    -- Clear current standings
    DELETE FROM LOL.Standings;

    -- Insert initial standings
    INSERT INTO LOL.Standings (Team_ID, Points, Position, Win_Rate, Number_Games, League_ID)
    SELECT 
        t.ID AS Team_ID,
        SUM(CASE WHEN g.Winner = t.Name THEN 3 ELSE 0 END) AS Points,
        ROW_NUMBER() OVER(PARTITION BY t.League_ID ORDER BY SUM(CASE WHEN g.Winner = t.Name THEN 3 ELSE 0 END) DESC) AS Position,
        ROUND(SUM(CASE WHEN g.Winner = t.Name THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(g.ID), 0), 2) AS Win_Rate,
        COUNT(g.ID) AS Number_Games,
        t.League_ID
    FROM 
        LOL.Team t
    LEFT JOIN 
        LOL.Game g ON t.ID = g.Team_ID OR t.ID = g.Team_ID2
    GROUP BY 
        t.ID, t.League_ID;
END;


GO
--Delete Lol.UpdateAverageIndividualStatistics if it exists
IF OBJECT_ID('LOL.UpdateAverageIndividualStatistics', 'P') IS NOT NULL
    DROP PROCEDURE LOL.UpdateAverageIndividualStatistics;
GO

CREATE PROCEDURE LOL.UpdateAverageIndividualStatistics
AS
BEGIN
    SET NOCOUNT ON;
    -- Clear current average individual statistics
    DELETE FROM LOL.Average_Individual_Statistics;

    -- Insert new average individual statistics with rounded values
    INSERT INTO LOL.Average_Individual_Statistics (Assists, Baron, Drakes, Gold, Kills, Deaths, Towers, Inibs, Player_CCNumber)
    SELECT 
        ROUND(AVG(Assists), 2) AS AvgAssists,
        ROUND(AVG(Baron), 2) AS AvgBaron,
        ROUND(AVG(Drakes), 2) AS AvgDrakes,
        ROUND(AVG(Gold), 2) AS AvgGold,
        ROUND(AVG(Kills), 2) AS AvgKills,
        ROUND(AVG(Deaths), 2) AS AvgDeaths,
        ROUND(AVG(Towers), 2) AS AvgTowers,
        ROUND(AVG(Inibs), 2) AS AvgInibs,
        Player_CCNumber
    FROM 
        LOL.Individual_Statistics
    GROUP BY 
        Player_CCNumber;
END;
GO


IF OBJECT_ID('LOL.UpdateAverageTeamStatistics', 'P') IS NOT NULL
    DROP PROCEDURE LOL.UpdateAverageTeamStatistics;
GO
CREATE PROCEDURE LOL.UpdateAverageTeamStatistics
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM LOL.Average_Team_Statistics;

    
    INSERT INTO LOL.Average_Team_Statistics (Assists, Baron, Drakes, Gold, Kills, Deaths, Towers, Inibs, Team_ID)
    SELECT 
        ROUND(AVG(ais.Assists), 2) AS AvgAssists,
        ROUND(AVG(ais.Baron), 2) AS AvgBaron,
        ROUND(AVG(ais.Drakes), 2) AS AvgDrakes,
        ROUND(AVG(ais.Gold), 2) AS AvgGold,
        ROUND(AVG(ais.Kills), 2) AS AvgKills,
        ROUND(AVG(ais.Deaths), 2) AS AvgDeaths,
        ROUND(AVG(ais.Towers), 2) AS AvgTowers,
        ROUND(AVG(ais.Inibs), 2) AS AvgInibs,
        t.ID AS Team_ID
    FROM 
        LOL.Team t
    JOIN 
        LOL.Player p ON t.Name = p.teamname
    JOIN 
        LOL.Average_Individual_Statistics ais ON p.CCNumber = ais.Player_CCNumber
    GROUP BY 
        t.ID;
END;
GO
IF OBJECT_ID('LOL.InitializeAndUpdateStandings', 'P') IS NOT NULL
    DROP PROCEDURE LOL.InitializeAndUpdateStandings;
GO

-- Create the procedure with transaction handling
CREATE PROCEDURE LOL.InitializeAndUpdateStandings
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Initialize standings
        EXEC LOL.InitStandings;
        
        -- Update average individual statistics
        EXEC LOL.UpdateAverageIndividualStatistics;
        
        -- Update average team statistics
        EXEC LOL.UpdateAverageTeamStatistics;

        -- Commit the transaction if everything is successful
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if there is an error
        ROLLBACK;

        -- Raise an error with the details of the exception
        THROW;
    END CATCH
END;
GO
-- Drop the procedure if it exists
IF OBJECT_ID('LOL.AddOrUpdatePerson', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdatePerson;
GO

-- Create the stored procedure to add or update a person
CREATE PROCEDURE LOL.AddOrUpdatePerson
    @CCNumber int,
    @Name varchar(50),
    @Age int
AS
BEGIN
    SET NOCOUNT ON;

    MERGE LOL.Person AS target
    USING (SELECT @CCNumber AS CCNumber, @Name AS Name, @Age AS Age) AS source
    ON (target.CCNumber = source.CCNumber)
    WHEN MATCHED THEN
        UPDATE SET 
            [Name] = source.[Name], 
            Age = source.Age
    WHEN NOT MATCHED THEN
        INSERT (CCNumber, [Name], Age)
        VALUES (source.CCNumber, source.[Name], source.Age);
END;
GO
-- Excluir o procedimento armazenado se ele já existir
IF OBJECT_ID('LOL.AddOrUpdatePlayer', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdatePlayer;
GO

-- Criar o procedimento armazenado para adicionar ou atualizar jogadores
CREATE PROCEDURE LOL.AddOrUpdatePlayer
    @CCNumber INT,
    @Nickname VARCHAR(50),
    @RealName VARCHAR(50),
    @Roles VARCHAR(50),
    @Ranks VARCHAR(50),
    @MainChampion VARCHAR(50),
    @Earnings FLOAT,
    @Command VARCHAR(50),
    @TeamName VARCHAR(50),
    @ContractID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        INSERT INTO LOL.Player (CCNumber, nickname, realname, Roles, Ranks, MainChampion, earnings, teamname)
        VALUES (@CCNumber, @Nickname, @RealName, @Roles, @Ranks, @MainChampion, @Earnings, @TeamName);
        INSERT INTO LOL.PlayerContracts (Player_CCNumber, contract_id, data_inicio, data_fim)
        VALUES (@CCNumber, @ContractID, @StartDate, @EndDate);
    END
    ELSE IF @Command = 'alterar'
    BEGIN
        UPDATE LOL.Player
        SET 
            nickname = @Nickname,
            realname = @RealName,
            Roles = @Roles,
            Ranks = @Ranks,
            MainChampion = @MainChampion,
            earnings = @Earnings
        WHERE CCNumber = @CCNumber;
        UPDATE LOL.PlayerContracts
        SET 
            contract_id = @ContractID,
            data_inicio = @StartDate,
            data_fim = @EndDate
        WHERE Player_CCNumber = @CCNumber;
    END
END
GO

-- Drop the procedure if it exists
IF OBJECT_ID('LOL.AddOrUpdatePlayerWithTransaction', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdatePlayerWithTransaction;
GO

-- Create the procedure with transaction handling
CREATE PROCEDURE LOL.AddOrUpdatePlayerWithTransaction
    @CCNumber INT,
    @Age INT,
    @Nickname NVARCHAR(50),
    @RealName NVARCHAR(50),
    @Roles NVARCHAR(50),
    @Ranks NVARCHAR(50),
    @MainChampion NVARCHAR(50),
    @Earnings FLOAT,
    @Command NVARCHAR(50),
    @TeamName NVARCHAR(50),
    @ContractID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Add or update the person
        EXEC LOL.AddOrUpdatePerson @CCNumber, @RealName, @Age;

        -- Add or update the player
        EXEC LOL.AddOrUpdatePlayer 
            @CCNumber, 
            @Nickname, 
            @RealName, 
            @Roles, 
            @Ranks, 
            @MainChampion, 
            @Earnings, 
            @Command, 
            @TeamName, 
            @ContractID, 
            @StartDate, 
            @EndDate;

        -- Commit the transaction if everything is successful
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if there is an error
        ROLLBACK;

        -- Raise an error with the details of the exception
        THROW;
    END CATCH
END;
GO

-- Excluir o procedimento armazenado se ele já existir
IF OBJECT_ID('LOL.DeletePlayer', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeletePlayer;
GO

-- Criar o procedimento armazenado para excluir jogadores
CREATE PROCEDURE LOL.DeletePlayer
    @CCNumber INT
AS
BEGIN
    DELETE FROM LOL.Player
    WHERE CCNumber = @CCNumber;
END
GO

-- Excluir o procedimento armazenado se ele já existir
IF OBJECT_ID('LOL.FilterPlayersProcedure', 'P') IS NOT NULL
    DROP PROCEDURE LOL.FilterPlayersProcedure;
GO

-- Criar o procedimento armazenado para filtrar jogadores
CREATE PROCEDURE LOL.FilterPlayersProcedure
    @Roles NVARCHAR(50) = NULL,
    @Team NVARCHAR(50) = NULL,
    @Contract NVARCHAR(50) = NULL
AS
BEGIN
    SELECT p.*
    FROM LOL.Player p
    JOIN LOL.ContractDetails cd ON p.CCNumber = cd.CCNumber
    WHERE (@Roles IS NULL OR p.Roles = @Roles)
      AND (@Team IS NULL OR p.teamname = @Team)
      AND (@Contract IS NULL OR cd.ContractStatus = @Contract);
END;
GO

-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.DeletePlayer', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeletePlayer;
GO

-- Create the stored procedure to delete a player
CREATE PROCEDURE LOL.DeletePlayer
    @CCNumber INT
AS
BEGIN
    -- Delete from dependent tables first
    DELETE FROM LOL.Average_Individual_Statistics WHERE Player_CCNumber = @CCNumber;
    DELETE FROM LOL.PlayerContracts WHERE Player_CCNumber = @CCNumber;
    DELETE FROM LOL.Individual_Statistics WHERE Player_CCNumber = @CCNumber;

    -- Delete the player
    DELETE FROM LOL.Player WHERE CCNumber = @CCNumber;
END
GO

-- Drop AddOrUpdateCoach procedure if exists
IF OBJECT_ID('LOL.AddOrUpdateCoach', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateCoach;
GO

-- Create AddOrUpdateCoach procedure
CREATE PROCEDURE LOL.AddOrUpdateCoach
    @CCNumber INT,
    @RealName VARCHAR(50),
    @Age INT,
    @ContractID INT,
    @Role VARCHAR(50),
    @StartDate DATE,
    @EndDate DATE,
    @Command VARCHAR(50),
    @TeamName VARCHAR(50)
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        -- Ensure the person exists or add them
        EXEC LOL.AddOrUpdatePerson @CCNumber, @RealName, @Age;

        -- Insert into Coachs table if not exists
        IF NOT EXISTS (SELECT 1 FROM LOL.Coachs WHERE CCNumber = @CCNumber)
        BEGIN
            INSERT INTO LOL.Coachs (CCNumber)
            VALUES (@CCNumber);
        END
        
        -- Insert into Roles table only if the role doesn't already exist
        IF NOT EXISTS (SELECT 1 FROM LOL.Roles WHERE Coach_CCNumber = @CCNumber AND Contract_ID = @ContractID)
        BEGIN
            INSERT INTO LOL.Roles (RoleDescription, Coach_CCNumber, Contract_ID, data_inicio, data_fim)
            VALUES (@Role, @CCNumber, @ContractID, @StartDate, @EndDate);
        END

        -- Update the team to assign the coach
        UPDATE LOL.Team
        SET Coach_CCNumber = @CCNumber
        WHERE Name = @TeamName;
    END
    ELSE IF @Command = 'alterar'
    BEGIN
        -- Update the person details
        EXEC LOL.AddOrUpdatePerson @CCNumber, @RealName, @Age;

        -- Update Roles table
        UPDATE LOL.Roles
        SET RoleDescription = @Role, data_inicio = @StartDate, data_fim = @EndDate
        WHERE Coach_CCNumber = @CCNumber AND Contract_ID = @ContractID;

        -- Update the team to assign the coach
        UPDATE LOL.Team
        SET Coach_CCNumber = @CCNumber
        WHERE Name = @TeamName;
    END
END;
GO
-- Drop DeleteCoach procedure if exists
IF OBJECT_ID('LOL.DeleteCoach', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeleteCoach;
GO

-- Create DeleteCoach procedure with transaction handling
CREATE PROCEDURE LOL.DeleteCoach
    @CCNumber INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Update the team to remove the coach reference
        UPDATE LOL.Team
        SET Coach_CCNumber = NULL
        WHERE Coach_CCNumber = @CCNumber;

        -- Delete from dependent tables first
        DELETE FROM LOL.Roles WHERE Coach_CCNumber = @CCNumber;
        DELETE FROM LOL.Coachs WHERE CCNumber = @CCNumber;
        DELETE FROM LOL.Person WHERE CCNumber = @CCNumber;

        -- Commit the transaction if everything is successful
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if there is an error
        ROLLBACK;

        -- Raise an error with the details of the exception
        THROW;
    END CATCH
END;
GO


-- Drop the procedure if it exists
IF OBJECT_ID('LOL.AddOrUpdateTeam', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateTeam;
GO

-- Create the stored procedure to add or update a team
CREATE PROCEDURE LOL.AddOrUpdateTeam
    @ID INT,
    @Name NVARCHAR(100),
    @Region NVARCHAR(100),
    @TotalEarnings FLOAT,
    @Sponsors NVARCHAR(255),
    @Coach_CCNumber INT,
    @LeagueID INT,
    @Command NVARCHAR(10)
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        INSERT INTO LOL.Team (ID, Name, Region, Total_Earnings, Sponsors, Coach_CCNumber, League_ID)
        VALUES (@ID, @Name, @Region, @TotalEarnings, @Sponsors, @Coach_CCNumber, @LeagueID);
    END
    ELSE
    BEGIN
        UPDATE LOL.Team
        SET Name = @Name,
            Region = @Region,
            Total_Earnings = @TotalEarnings,
            Sponsors = @Sponsors,
            Coach_CCNumber = @Coach_CCNumber,
            League_ID = @LeagueID
        WHERE ID = @ID;
    END
END;
GO
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.AddOrUpdateTeamStandings', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateTeamStandings;
GO

CREATE PROCEDURE LOL.AddOrUpdateTeamStandings
    @TeamID INT,
    @Points INT,
    @Position INT,
    @WinRate FLOAT,
    @NumberOfGames INT,
    @LeagueID INT,
    @Command VARCHAR(50)
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        INSERT INTO LOL.Standings (Team_ID, Points, Position, Win_Rate, Number_Games, League_ID)
        VALUES (@TeamID, @Points, @Position, @WinRate, @NumberOfGames, @LeagueID);
    END
    ELSE
    BEGIN
        UPDATE LOL.Standings
        SET Points = @Points, Position = @Position, Win_Rate = @WinRate, Number_Games = @NumberOfGames, League_ID = @LeagueID
        WHERE Team_ID = @TeamID;
    END
END;
GO

-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.AddOrUpdateTeam', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateTeam;
GO

CREATE PROCEDURE LOL.AddOrUpdateTeam
    @ID INT,
    @Name VARCHAR(50),
    @Region VARCHAR(50),
    @TotalEarnings FLOAT,
    @Sponsors VARCHAR(100),
    @Coach_CCNumber INT,
    @LeagueID INT,
    @Command VARCHAR(50)
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        INSERT INTO LOL.Team (ID, [Name], Region, Total_Earnings, Sponsors, Coach_CCNumber, League_ID)
        VALUES (@ID, @Name, @Region, @TotalEarnings, @Sponsors, @Coach_CCNumber, @LeagueID);
    END
    ELSE
    BEGIN
        UPDATE LOL.Team
        SET [Name] = @Name, Region = @Region, Total_Earnings = @TotalEarnings, Sponsors = @Sponsors, Coach_CCNumber = @Coach_CCNumber, League_ID = @LeagueID
        WHERE ID = @ID;
    END
END;
GO
-- Drop the existing procedure if it exists
if OBJECT_ID('LOL.GetTeamsByLeagueName', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetTeamsByLeagueName;
GO
CREATE PROCEDURE LOL.GetTeamsByLeagueName
    @LeagueName NVARCHAR(100)
AS
BEGIN
    SELECT t.Name
    FROM LOL.Team t
    INNER JOIN LOL.League l ON t.League_ID = l.ID
    WHERE l.Name = @LeagueName
END
GO
-- Drop the procedure if it exists
IF OBJECT_ID('LOL.GetTeamDetails', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetTeamDetails;
GO

-- Create the stored procedure to get team details
CREATE PROCEDURE LOL.GetTeamDetails
    @TeamName NVARCHAR(100)
AS
BEGIN
    SELECT 
        t.ID,
        t.Name,
        t.Region,
        t.Total_Earnings,
        t.Sponsors,
        c.CCNumber AS Coach_CCNumber,
        p.Name AS CoachName,
        s.Points,
        s.Position,
        s.Win_Rate,
        s.Number_Games,
        t.League_ID
    FROM 
        LOL.Team t
    LEFT JOIN 
        LOL.Coachs c ON t.Coach_CCNumber = c.CCNumber
    LEFT JOIN 
        LOL.Person p ON c.CCNumber = p.CCNumber
    LEFT JOIN 
        LOL.Standings s ON t.ID = s.Team_ID
    WHERE 
        t.Name = @TeamName;

    SELECT 
        g.ID AS GameID,
        g.Name AS GameName,
        g.Date AS GameDate,
        g.Winner AS GameWinner
    FROM 
        LOL.Game g
    WHERE 
        g.Team_ID = (SELECT ID FROM LOL.Team WHERE Name = @TeamName)
        OR g.Team_ID2 = (SELECT ID FROM LOL.Team WHERE Name = @TeamName);

    SELECT 
        AVG(i.Assists) AS Assists,
        AVG(i.Baron) AS Baron,
        AVG(i.Drakes) AS Drakes,
        AVG(i.Gold) AS Gold,
        AVG(i.Kills) AS Kills,
        AVG(i.Deaths) AS Deaths,
        AVG(i.Towers) AS Towers,
        AVG(i.Inibs) AS Inibs
    FROM 
        LOL.Individual_Statistics i
    WHERE 
        i.Game_ID IN (SELECT g.ID 
                      FROM LOL.Game g 
                      WHERE g.Team_ID = (SELECT ID FROM LOL.Team WHERE Name = @TeamName)
                      OR g.Team_ID2 = (SELECT ID FROM LOL.Team WHERE Name = @TeamName));
END;
GO


-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.OrderTeamsAlphabetically', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderTeamsAlphabetically;
GO
-- Create stored procedure to order teams alphabetically
CREATE PROCEDURE LOL.OrderTeamsAlphabetically
AS
BEGIN
    SELECT [Name] FROM LOL.Team ORDER BY [Name];
END;
GO

-- Drop OrderTeamsByPoints procedure if exists
IF OBJECT_ID('LOL.OrderTeamsByPoints', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderTeamsByPoints;
GO

-- Create stored procedure to order teams by points
CREATE PROCEDURE LOL.OrderTeamsByPoints
AS
BEGIN
    SELECT t.[Name], s.Points
    FROM LOL.Team t
    LEFT JOIN LOL.Standings s ON t.ID = s.Team_ID
    ORDER BY s.Points DESC;
END;
GO
IF OBJECT_ID('LOL.AddOrUpdateProduct', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateProduct;
GO

CREATE PROCEDURE LOL.AddOrUpdateProduct
    @Product_ID INT,
    @Name VARCHAR(50),
    @Price FLOAT,
    @Sizes VARCHAR(50),
    @Types VARCHAR(50),
    @Store_ID INT,
    @Stock INT,
    @Command VARCHAR(50)
AS
BEGIN
    IF @Command = 'adicionar'
    BEGIN
        INSERT INTO LOL.Product (ID, Name, Price, Sizes, Types, Store_ID, Stock)
        VALUES (@Product_ID, @Name, @Price, @Sizes, @Types, @Store_ID, @Stock);
    END
    ELSE IF @Command = 'alterar'
    BEGIN
        UPDATE LOL.Product
        SET 
            Name = @Name,
            Price = @Price,
            Sizes = @Sizes,
            Types = @Types,
            Store_ID = @Store_ID,
            Stock = @Stock
        WHERE ID = @Product_ID;
    END
END;
GO
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.FilterProductsByTeam', 'P') IS NOT NULL
    DROP PROCEDURE LOL.FilterProductsByTeam;
GO

-- Create stored procedure to filter products by team and type
CREATE PROCEDURE LOL.FilterProductsByTeam
    @TeamName VARCHAR(50) = NULL,
    @Type VARCHAR(50) = NULL
AS
BEGIN
    SELECT 
        p.ID, 
        p.Name, 
        p.Price, 
        p.Sizes, 
        p.Types, 
        p.Store_ID, 
        p.Stock, 
        t.Name AS TeamName, 
        s.Name AS StoreName, 
        o.CCNumber AS Owner_CCNumber
    FROM 
        LOL.Product p
    JOIN 
        LOL.Store s ON p.Store_ID = s.ID
    JOIN 
        LOL.Team t ON s.Team_ID = t.ID
    JOIN 
        LOL.Owner o ON s.Owner_CCNumber = o.CCNumber
    WHERE 
        (@TeamName IS NULL OR t.Name = @TeamName)
        AND (@Type IS NULL OR p.Types = @Type);
END;
GO
IF OBJECT_ID('LOL.DeleteProduct', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeleteProduct;
GO

CREATE PROCEDURE LOL.DeleteProduct
    @Product_ID INT
AS
BEGIN
    DELETE FROM LOL.Product WHERE ID = @Product_ID;
END;
GO


IF OBJECT_ID('LOL.OrderProductsByPrice', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderProductsByPrice;
GO

CREATE PROCEDURE LOL.OrderProductsByPrice
    @TeamName VARCHAR(50) = NULL,
    @Type VARCHAR(50) = NULL
AS
BEGIN
    IF @TeamName IS NULL AND @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        ORDER BY p.Price ASC;
    END
    ELSE IF @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName
        ORDER BY p.Price ASC;
    END
    ELSE IF @TeamName IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        WHERE p.Types = @Type
        ORDER BY p.Price ASC;
    END
    ELSE
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName AND p.Types = @Type
        ORDER BY p.Price ASC;
    END
END;
GO



IF OBJECT_ID('LOL.OrderProductsBySizes', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderProductsBySizes;
GO

CREATE PROCEDURE LOL.OrderProductsBySizes
    @TeamName VARCHAR(50) = NULL,
    @Type VARCHAR(50) = NULL
AS
BEGIN
    IF @TeamName IS NULL AND @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        ORDER BY 
            CASE p.Sizes
                WHEN 'XS' THEN 1
                WHEN 'S' THEN 2
                WHEN 'M' THEN 3
                WHEN 'L' THEN 4
                WHEN 'XL' THEN 5
                WHEN 'XXL' THEN 6
            END, p.Stock DESC;
    END
    ELSE IF @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName
        ORDER BY 
            CASE p.Sizes
                WHEN 'XS' THEN 1
                WHEN 'S' THEN 2
                WHEN 'M' THEN 3
                WHEN 'L' THEN 4
                WHEN 'XL' THEN 5
                WHEN 'XXL' THEN 6
            END, p.Stock DESC;
    END
    ELSE IF @TeamName IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        WHERE p.Types = @Type
        ORDER BY 
            CASE p.Sizes
                WHEN 'XS' THEN 1
                WHEN 'S' THEN 2
                WHEN 'M' THEN 3
                WHEN 'L' THEN 4
                WHEN 'XL' THEN 5
                WHEN 'XXL' THEN 6
            END, p.Stock DESC;
    END
    ELSE
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName AND p.Types = @Type
        ORDER BY 
            CASE p.Sizes
                WHEN 'XS' THEN 1
                WHEN 'S' THEN 2
                WHEN 'M' THEN 3
                WHEN 'L' THEN 4
                WHEN 'XL' THEN 5
                WHEN 'XXL' THEN 6
            END, p.Stock DESC;
    END
END;
GO

IF OBJECT_ID('LOL.OrderProductsByStock', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderProductsByStock;
GO

CREATE PROCEDURE LOL.OrderProductsByStock
    @TeamName VARCHAR(50) = NULL,
    @Type VARCHAR(50) = NULL
AS
BEGIN
    IF @TeamName IS NULL AND @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        ORDER BY p.Stock DESC;
    END
    ELSE IF @Type IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName
        ORDER BY p.Stock DESC;
    END
    ELSE IF @TeamName IS NULL
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        WHERE p.Types = @Type
        ORDER BY p.Stock DESC;
    END
    ELSE
    BEGIN
        SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
        FROM LOL.Product p
        JOIN LOL.Store s ON p.Store_ID = s.ID
        JOIN LOL.Team t ON s.Team_ID = t.ID
        WHERE t.Name = @TeamName AND p.Types = @Type
        ORDER BY p.Stock DESC;
    END
END;
GO
--Drop the existing procedure if it exists
IF OBJECT_ID('LOL.FilterProductsByType', 'P') IS NOT NULL
    DROP PROCEDURE LOL.FilterProductsByType;
GO

CREATE PROCEDURE LOL.FilterProductsByType
    @Type VARCHAR(50)
AS
BEGIN
    SELECT p.Name, p.ID, p.Price, p.Sizes, p.Stock, p.Types
    FROM LOL.Product p
    WHERE p.Types = @Type;
END;
GO



-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.DeleteLeague', 'P') IS NOT NULL
    DROP PROCEDURE LOL.DeleteLeague;
GO

-- Create the stored procedure to delete a league
CREATE PROCEDURE LOL.DeleteLeague
    @ID INT
AS
BEGIN
    DELETE FROM LOL.Standings WHERE League_ID = @ID;
    DELETE FROM LOL.League WHERE ID = @ID;
END;
GO

-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.AddLeague', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddLeague;
GO

-- Create the stored procedure to add a league
CREATE PROCEDURE LOL.AddLeague
    @Name VARCHAR(50)
AS
BEGIN
    INSERT INTO LOL.League ([Name])
    VALUES (@Name);
END;
GO


IF OBJECT_ID('LOL.AddOrUpdateLeague', 'P') IS NOT NULL
    DROP PROCEDURE LOL.AddOrUpdateLeague;
GO

CREATE PROCEDURE LOL.AddOrUpdateLeague
    @ID INT,
    @Name VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM LOL.League WHERE ID = @ID)
    BEGIN
        UPDATE LOL.League
        SET [Name] = @Name
        WHERE ID = @ID;
    END
    ELSE
    BEGIN
        INSERT INTO LOL.League (ID, [Name])
        VALUES (@ID, @Name);
    END
END;
GO
-- Drop the procedure if it exists
IF OBJECT_ID('LOL.GetLeagueDetails', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetLeagueDetails;
GO

-- Create the stored procedure to get league details
CREATE PROCEDURE LOL.GetLeagueDetails
    @LeagueID INT
AS
BEGIN
    SELECT 
        l.ID, 
        l.Name AS LeagueName, 
        s.Points, 
        s.Position, 
        s.Win_Rate, 
        s.Number_Games, 
        t.Name AS TeamName
    FROM 
        LOL.League l
    LEFT JOIN 
        LOL.Standings s ON l.ID = s.League_ID
    LEFT JOIN 
        LOL.Team t ON s.Team_ID = t.ID
    WHERE 
        l.ID = @LeagueID;
END;
GO
-- Drop the procedure if it exists
IF OBJECT_ID('LOL.GetTeamGames', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetTeamGames;
GO

CREATE PROCEDURE LOL.GetTeamGames
    @TeamID INT
AS
BEGIN
    SELECT 
        g.ID AS GameID,
        g.[Name] AS GameName,
        t1.Name AS TeamName1,
        t2.Name AS TeamName2,
        g.Date AS GameDate,
        g.Winner AS GameWinner
    FROM 
        LOL.Game g
    INNER JOIN 
        LOL.Team t1 ON g.Team_ID = t1.ID
    INNER JOIN 
        LOL.Team t2 ON g.Team_ID2 = t2.ID
    WHERE 
        g.Team_ID = @TeamID OR g.Team_ID2 = @TeamID;
END;
GO
-- Drop the procedure if it exists
-- Drop the procedure if it exists
IF OBJECT_ID('LOL.GetGameDetails', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetGameDetails;
GO

-- Create the stored procedure to get game details
CREATE PROCEDURE LOL.GetGameDetails
    @GameID INT
AS
BEGIN
    -- Select game details
    SELECT 
        g.ID AS GameID,
        g.Date AS GameDate,
        g.Winner AS GameWinner
    FROM 
        LOL.Game g
    WHERE 
        g.ID = @GameID;

    -- Select individual statistics for the game
    SELECT 
        i.Player_CCNumber,
        p.nickname AS PlayerName,
        i.Assists,
        i.Baron,
        i.Drakes,
        i.Gold,
        i.Kills,
        i.Deaths,
        i.Towers,
        i.Inibs
    FROM 
        LOL.Individual_Statistics i
    JOIN 
        LOL.Player p ON i.Player_CCNumber = p.CCNumber
    WHERE 
        i.Game_ID = @GameID;
END;
GO

-- Drop the existing procedure if it exists
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.OrderTeamsByPosition', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderTeamsByPosition;
GO

-- Create the stored procedure to order teams by position
CREATE PROCEDURE LOL.OrderTeamsByPosition
    @LeagueID INT
AS
BEGIN
    SELECT 
        t.Name AS TeamName,
        s.Position,
        s.Points,
        s.Win_Rate,
        s.Number_Games
    FROM 
        LOL.Team t
    JOIN 
        LOL.Standings s ON t.ID = s.Team_ID
    WHERE 
        s.League_ID = @LeagueID
    ORDER BY 
        s.Position;
END;
GO
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.OrderTeamsByWinRate', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderTeamsByWinRate;
GO

-- Create the stored procedure to order teams by win rate
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.OrderTeamsByWinRate', 'P') IS NOT NULL
    DROP PROCEDURE LOL.OrderTeamsByWinRate;
GO

-- Create the stored procedure to order teams by win rate
CREATE PROCEDURE LOL.OrderTeamsByWinRate
    @LeagueID INT
AS
BEGIN
    SELECT 
        t.Name AS TeamName,
        s.Win_Rate,
        s.Points,
        s.Position,
        s.Number_Games
    FROM 
        LOL.Team t
    JOIN 
        LOL.Standings s ON t.ID = s.Team_ID
    WHERE 
        s.League_ID = @LeagueID
    ORDER BY 
        s.Win_Rate DESC;
END;
GO
-- Drop the existing procedure if it exists
IF OBJECT_ID('LOL.GetTeamsByLeague', 'P') IS NOT NULL
    DROP PROCEDURE LOL.GetTeamsByLeague;
GO

-- Create the stored procedure to get teams by league
CREATE PROCEDURE LOL.GetTeamsByLeague
    @LeagueID INT
AS
BEGIN
    SELECT t.Name AS TeamName
    FROM LOL.Team t
    WHERE t.League_ID = @LeagueID;
END;
GO
