-- Excluir a VIEW se ela já existir
IF OBJECT_ID('LOL.FilterPlayers', 'V') IS NOT NULL
    DROP VIEW LOL.FilterPlayers;
GO

-- Criar a VIEW para filtrar jogadores
CREATE VIEW LOL.FilterPlayers AS
SELECT 
    p.CCNumber,
    p.nickname,
    p.realname,
    p.Roles,
    p.Ranks,
    p.MainChampion,
    p.earnings,
    p.teamname,
    per.Age,
    CASE 
        WHEN pc.data_fim >= '2024-05-28' THEN 'Sim'
        ELSE 'Nao'
    END AS ContractStatus
FROM LOL.Player p
LEFT JOIN LOL.PlayerContracts pc ON p.CCNumber = pc.Player_CCNumber
LEFT JOIN LOL.Person per ON p.CCNumber = per.CCNumber;
GO
-- Excluir a VIEW se ela já existir
IF OBJECT_ID('LOL.AverageIndividualStatisticsDetails', 'V') IS NOT NULL
    DROP VIEW LOL.AverageIndividualStatisticsDetails;
GO

-- Criar a VIEW para detalhes das estatísticas médias individuais
CREATE VIEW LOL.AverageIndividualStatisticsDetails AS
SELECT 
    p.CCNumber,
    p.nickname,
    ais.Assists,
    ais.Baron,
    ais.Drakes,
    ais.Gold,
    ais.Kills,
    ais.Deaths,
    ais.Towers,
    ais.Inibs
FROM 
    LOL.Player p
JOIN 
    LOL.Average_Individual_Statistics ais ON p.CCNumber = ais.Player_CCNumber;
GO

-- Excluir a VIEW se ela já existir
IF OBJECT_ID('LOL.ContractDetails', 'V') IS NOT NULL
    DROP VIEW LOL.ContractDetails;
GO

-- Criar a VIEW para detalhes de contratos
CREATE VIEW LOL.ContractDetails AS
SELECT 
    p.CCNumber,
    p.nickname,
    pc.Contract_ID AS ContractID,
    pc.data_inicio AS StartDate,
    pc.data_fim AS EndDate,
    CASE 
        WHEN GETDATE() < pc.data_fim THEN 'Ativo'
        ELSE 'Inativo'
    END AS ContractStatus
FROM 
    LOL.Player p
JOIN 
    LOL.PlayerContracts pc ON p.CCNumber = pc.Player_CCNumber;
GO


-- Drop CoachDetails view if exists
IF OBJECT_ID('LOL.CoachDetails', 'V') IS NOT NULL
    DROP VIEW LOL.CoachDetails;
GO

-- Create CoachDetails view
CREATE VIEW LOL.CoachDetails AS
SELECT 
    c.CCNumber,
    p.Name AS RealName,
    p.Age,
    t.name AS TeamName,
    r.Contract_ID AS ContractID,
    r.data_inicio AS StartDate,
    r.data_fim AS EndDate,
    r.RoleDescription AS Role
FROM 
    LOL.Coachs c
JOIN 
    LOL.Person p ON c.CCNumber = p.CCNumber
JOIN 
    LOL.Roles r ON c.CCNumber = r.Coach_CCNumber
LEFT JOIN 
    LOL.Team t ON t.Coach_CCNumber = c.CCNumber;
GO


-- Excluir a VIEW se ela já existir
IF OBJECT_ID('LOL.FilterCoachs', 'V') IS NOT NULL
    DROP VIEW LOL.FilterCoachs;
GO

-- Criar a VIEW para filtrar treinadores
CREATE VIEW LOL.FilterCoachs AS
SELECT 
    c.CCNumber,
    p.Name AS RealName,
    p.Age,
    r.RoleDescription AS Role,
    t.Name AS TeamName,
    r.Contract_ID AS ContractID,
    r.data_inicio AS StartDate,
    r.data_fim AS EndDate
FROM 
    LOL.Coachs c
JOIN 
    LOL.Person p ON c.CCNumber = p.CCNumber
JOIN 
    LOL.Roles r ON c.CCNumber = r.Coach_CCNumber
LEFT JOIN 
    LOL.Team t ON t.Coach_CCNumber = c.CCNumber;
GO

-- Criar a VIEW para os detalhes da equipe
-- Excluir a VIEW se ela já existir
IF OBJECT_ID('LOL.TeamDetails', 'V') IS NOT NULL
    DROP VIEW LOL.TeamDetails;
GO

-- Criar a VIEW para detalhes da equipe
CREATE VIEW LOL.TeamDetails AS
SELECT 
    t.ID,
    t.Name,
    t.Region,
    t.Total_Earnings,
    t.Sponsors,
    t.Coach_CCNumber,
    p.Name AS CoachName,
    s.Points,
    s.Position,
    s.Win_Rate,
    s.Number_Games
FROM 
    LOL.Team t
LEFT JOIN 
    LOL.Standings s ON t.ID = s.Team_ID
LEFT JOIN 
    LOL.Person p ON t.Coach_CCNumber = p.CCNumber;
GO

-- Drop the existing view if it exists
IF OBJECT_ID('LOL.FilterProducts', 'V') IS NOT NULL
    DROP VIEW LOL.FilterProducts;
GO

-- Create the view for filtering products
CREATE VIEW LOL.FilterProducts AS
SELECT 
    p.ID,
    p.Name,
    p.Price,
    p.Sizes,
    p.Types,
    p.Store_ID,
    s.Name AS StoreName,
    st.Stock
FROM 
    LOL.Product p
JOIN 
    LOL.Store s ON p.Store_ID = s.ID
LEFT JOIN 
    (SELECT Store_ID, Name, COUNT(*) AS Stock FROM LOL.Product GROUP BY Store_ID, Name) st
    ON p.Store_ID = st.Store_ID AND p.Name = st.Name;
GO


-- Drop the existing view if it exists
IF OBJECT_ID('LOL.ProductDetails', 'V') IS NOT NULL
    DROP VIEW LOL.ProductDetails;
GO


-- Create the view for product details with team information
CREATE VIEW LOL.ProductDetails AS
SELECT 
    p.ID,
    p.Name,
    p.Price,
    p.Sizes,
    p.Types,
    p.Stock,
    s.ID AS Store_ID,
    s.Name AS StoreName,
    s.Owner_CCNumber,
    t.ID AS Team_ID,
    t.Name AS TeamName,
    t.Region,
    t.Total_Earnings,
    t.Sponsors,
    t.Coach_CCNumber
FROM 
    LOL.Product p
JOIN 
    LOL.Store s ON p.Store_ID = s.ID
JOIN 
    LOL.Team t ON s.Team_ID = t.ID;
GO


-- Drop the view if it exists
IF OBJECT_ID('LOL.LeagueDetails', 'V') IS NOT NULL
    DROP VIEW LOL.LeagueDetails;
GO

-- Create the view for league details
CREATE VIEW LOL.LeagueDetails AS
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
    LOL.Team t ON s.Team_ID = t.ID;
GO