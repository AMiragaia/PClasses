-- Trigger for INSERT
CREATE TRIGGER trgAfterInsertGame
ON LOL.Game
AFTER INSERT
AS
BEGIN
    EXEC UpdateStandings;
END;
GO

-- Trigger for UPDATE
CREATE TRIGGER trgAfterUpdateGame
ON LOL.Game
AFTER UPDATE
AS
BEGIN
    EXEC UpdateStandings;
END;
GO

-- Trigger for DELETE
CREATE TRIGGER trgAfterDeleteGame
ON LOL.Game
AFTER DELETE
AS
BEGIN
    EXEC UpdateStandings;
END;
GO


-- Create indexes to improve performance of common queries

-- Trigger to ensure the total earnings for a team is updated when individual earnings are updated
CREATE TRIGGER trg_UpdateTeamEarnings
ON LOL.Player
AFTER UPDATE
AS
BEGIN
    DECLARE @TeamName NVARCHAR(100);
    
    SELECT @TeamName = teamname FROM inserted;

    UPDATE LOL.Team
    SET Total_Earnings = (
        SELECT SUM(earnings) 
        FROM LOL.Player 
        WHERE teamname = @TeamName
    )
    WHERE Name = @TeamName;
END;
GO

-- Trigger to ensure the total earnings for a team is updated when individual earnings are inserted
CREATE TRIGGER trg_InsertTeamEarnings
ON LOL.Player
AFTER INSERT
AS
BEGIN
    DECLARE @TeamName NVARCHAR(100);
    
    SELECT @TeamName = teamname FROM inserted;

    UPDATE LOL.Team
    SET Total_Earnings = (
        SELECT SUM(earnings) 
        FROM LOL.Player 
        WHERE teamname = @TeamName
    )
    WHERE Name = @TeamName;
END;
GO