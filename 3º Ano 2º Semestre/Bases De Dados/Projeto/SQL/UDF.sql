-- Excluir a função se ela já existir
IF OBJECT_ID('LOL.FilterPlayers', 'FN') IS NOT NULL
    DROP FUNCTION LOL.FilterPlayers;
GO

-- Criar a função para filtrar jogadores
CREATE FUNCTION LOL.FilterPlayers(@Roles VARCHAR(50), @Contract VARCHAR(3))
RETURNS TABLE
AS
RETURN
(
    SELECT P.*
    FROM LOL.Player P
    LEFT JOIN LOL.PlayerContracts PC ON P.CCNumber = PC.Player_CCNumber
    WHERE (@Roles IS NULL OR P.Roles = @Roles)
      AND (@Contract IS NULL OR 
          (@Contract = 'Sim' AND PC.data_fim >= GETDATE()) OR 
          (@Contract = 'Nao' AND PC.data_fim < GETDATE() OR PC.data_fim IS NULL))
);
GO