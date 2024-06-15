CREATE SCHEMA LOL;
GO

CREATE TABLE LOL.Person (
    CCNumber int NOT NULL CHECK (LEN(CAST(CCNumber AS VARCHAR)) = 8),
    [Name] varchar(50) NOT NULL,
    Age int NOT NULL CHECK (Age > 0),
    PRIMARY KEY (CCNumber)
);

CREATE TABLE LOL.Owner (
    CCNumber int NOT NULL CHECK (LEN(CAST(CCNumber AS VARCHAR)) = 8),
    PRIMARY KEY (CCNumber),
    FOREIGN KEY (CCNumber) REFERENCES LOL.Person(CCNumber)
);

CREATE TABLE LOL.Coachs (
    CCNumber int NOT NULL CHECK (LEN(CAST(CCNumber AS VARCHAR)) = 8),
    PRIMARY KEY (CCNumber),
    FOREIGN KEY (CCNumber) REFERENCES LOL.Person(CCNumber)
);

CREATE TABLE LOL.League (
    ID int NOT NULL,
    [Name] varchar(50) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE ([Name])
);

CREATE TABLE LOL.Team (
    ID int NOT NULL,
    [Name] varchar(50) NOT NULL,
    Region varchar(50) NOT NULL,
    Total_Earnings float NOT NULL CHECK (Total_Earnings > 0),
    Sponsors varchar(50) NOT NULL,
    Coach_CCNumber int NULL,
    League_ID int NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE ([Name]),
    FOREIGN KEY (Coach_CCNumber) REFERENCES LOL.Coachs(CCNumber),
    FOREIGN KEY (League_ID) REFERENCES LOL.League(ID)
);

CREATE TABLE LOL.Player (
    CCNumber int NOT NULL CHECK (LEN(CAST(CCNumber AS VARCHAR)) = 8),
    nickname varchar(50) NOT NULL,
    realname varchar(50) NOT NULL,
    Roles varchar(50) NOT NULL,
    Ranks varchar(50) NOT NULL,
    MainChampion varchar(50) NOT NULL,
    earnings float NOT NULL CHECK (earnings > 0),
    teamname varchar(50) NOT NULL,
    PRIMARY KEY (CCNumber),
    UNIQUE (nickname),
    FOREIGN KEY (CCNumber) REFERENCES LOL.Person(CCNumber),
    FOREIGN KEY (teamname) REFERENCES LOL.Team([Name])
);

CREATE TABLE LOL.Store (
    ID int NOT NULL,
    [Name] varchar(50) NOT NULL,
    Team_ID int NOT NULL,
    Owner_CCNumber int NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE ([Name]),
    FOREIGN KEY (Team_ID) REFERENCES LOL.Team(ID),
    FOREIGN KEY (Owner_CCNumber) REFERENCES LOL.Owner(CCNumber)
);

CREATE TABLE LOL.Product (
    ID int NOT NULL,
    [Name] varchar(50) NOT NULL,
    Price float NOT NULL CHECK (Price > 0),
    Sizes varchar(50) NOT NULL,
    Types varchar(50) NOT NULL,
    Store_ID int NOT NULL,
    Stock int NOT NULL CHECK (Stock > 0),
    PRIMARY KEY (ID),
    UNIQUE ([Name]),
    FOREIGN KEY (Store_ID) REFERENCES LOL.Store(ID)
);

CREATE TABLE LOL.Average_Team_Statistics (
    Assists float NOT NULL CHECK (Assists > 0),
    Baron float NOT NULL CHECK (Baron > 0),
    Drakes float NOT NULL CHECK (Drakes > 0),
    Gold float NOT NULL CHECK (Gold > 0),
    Kills float NOT NULL CHECK (Kills > 0),
    Deaths float NOT NULL CHECK (Deaths > 0),
    Towers float NOT NULL CHECK (Towers > 0),
    Inibs float NOT NULL CHECK (Inibs > 0),
    Team_ID int NOT NULL,
    PRIMARY KEY (Team_ID),
    FOREIGN KEY (Team_ID) REFERENCES LOL.Team(ID)
);

CREATE TABLE LOL.Standings (
    Points int NOT NULL,
    Position int NOT NULL,
    Win_Rate float NOT NULL CHECK (Win_Rate >= 0),
    Number_Games int NOT NULL CHECK (Number_Games >= 0),
    Team_ID int NOT NULL,
    League_ID int NOT NULL,
    PRIMARY KEY (Team_ID),
    FOREIGN KEY (Team_ID) REFERENCES LOL.Team(ID),
    FOREIGN KEY (League_ID) REFERENCES LOL.League(ID)
);

CREATE TABLE LOL.Roles (
    RoleDescription varchar(50) NOT NULL,
    Coach_CCnumber int NOT NULL,
    Contract_ID int NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    PRIMARY KEY (Coach_CCNumber, Contract_ID),
    FOREIGN KEY (Coach_CCNumber) REFERENCES LOL.Coachs(CCNumber)
);

CREATE TABLE LOL.PlayerContracts (
    Player_CCNumber int NOT NULL,
    Contract_ID int NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    PRIMARY KEY (Player_CCNumber, Contract_ID),
    FOREIGN KEY (Player_CCNumber) REFERENCES LOL.Player(CCNumber)
);


CREATE TABLE LOL.Average_Individual_Statistics (
    Assists float NOT NULL CHECK (Assists >= 0),
    Baron float NOT NULL CHECK (Baron >= 0),
    Drakes float NOT NULL CHECK (Drakes >= 0),
    Gold float NOT NULL CHECK (Gold >= 0),
    Kills float NOT NULL CHECK (Kills >= 0),
    Deaths float NOT NULL CHECK (Deaths >= 0),
    Towers float NOT NULL CHECK (Towers >= 0),
    Inibs float NOT NULL CHECK (Inibs >= 0),
    Player_CCNumber int NOT NULL,
    PRIMARY KEY (Player_CCNumber),
    FOREIGN KEY (Player_CCNumber) REFERENCES LOL.Player(CCNumber)
);


CREATE TABLE LOL.Game (
    ID int NOT NULL,
    [Name] varchar(50) NOT NULL,
    Team_ID int NOT NULL,
    Team_ID2 int NOT NULL,
    Date date NOT NULL,
    Winner varchar(50) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE ([Name]),
    FOREIGN KEY (Team_ID) REFERENCES LOL.Team(ID),
    FOREIGN KEY (Team_ID2) REFERENCES LOL.Team(ID)
);

CREATE TABLE LOL.Individual_Statistics (
    Game_ID int NOT NULL,
    Player_CCNumber int NOT NULL,
    Assists float NOT NULL CHECK (Assists >= 0),
    Baron float NOT NULL CHECK (Baron >= 0),
    Drakes float NOT NULL CHECK (Drakes >= 0),
    Gold float NOT NULL CHECK (Gold >= 0),
    Kills float NOT NULL CHECK (Kills >= 0),
    Deaths float NOT NULL CHECK (Deaths >= 0),
    Towers float NOT NULL CHECK (Towers >= 0),
    Inibs float NOT NULL CHECK (Inibs >= 0),
    PRIMARY KEY (Game_ID, Player_CCNumber),
    FOREIGN KEY (Game_ID) REFERENCES LOL.Game(ID),
    FOREIGN KEY (Player_CCNumber) REFERENCES LOL.Player(CCNumber)
);