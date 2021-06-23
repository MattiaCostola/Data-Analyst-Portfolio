-- CHESS GAME ANALYSIS FROM 20.000 + GAMES

-- Who win the most?

SELECT winner, COUNT(winner) AS TotalWin, 
  ROUND(COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` ),3)*100 AS WinPercentage
FROM `academic-elixir-311507.Games.chess` 
GROUP BY winner
ORDER BY TotalWin DESC

-- How they win the most?

With VictoryTable
as
(
SELECT victory_status, COUNT(victory_status) AS TotalWin,
  COUNT(victory_status)/(SELECT COUNT(victory_status) FROM `academic-elixir-311507.Games.chess` )*100 AS WinPercentage
FROM `academic-elixir-311507.Games.chess` 
GROUP BY victory_status
)
SELECT victory_status, TotalWin, ROUND(WinPercentage,2) AS WinPercentage
FROM VictoryTable
ORDER BY TotalWin DESC

-- Winner by VictoryStatus

With StatusTable
as
(
SELECT winner, victory_status, COUNT(winner) AS TotalWin,
   COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` )*100 AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE winner IN ('white','black')
GROUP BY winner, victory_status
ORDER BY victory_status
)
SELECT winner, victory_status, TotalWin, ROUND(WinPercentage,2) AS WinPercentage
FROM StatusTable

-- Longest Games by VictoryStatus?

SELECT MAX(turns) AS LongestGameTurns, victory_status
FROM `academic-elixir-311507.Games.chess`
GROUP BY victory_status

-- Shorter Games by VictoryStatus?

SELECT MIN(turns) AS LongestGameTurns, victory_status
FROM `academic-elixir-311507.Games.chess`
GROUP BY victory_status

-- Who win the most games under 10 turns?

With Under10Table
as
(
SELECT winner, victory_status, COUNT(turns) AS GamesUnder10,
  COUNT(turns)/(SELECT COUNT(turns) FROM `academic-elixir-311507.Games.chess` )*100 AS Under10Percentage
FROM `academic-elixir-311507.Games.chess`
WHERE turns < 10
GROUP BY winner, victory_status
)
SELECT winner, victory_status, GamesUnder10, ROUND(Under10Percentage,2) AS Under10Percentage
FROM Under10Table
ORDER BY GamesUnder10 DESC

-- Most used opening moves (TOP 20)

SELECT opening_name, COUNT(opening_name) AS TotalGames,
FROM `academic-elixir-311507.Games.chess`
GROUP BY opening_name
ORDER BY TotalGames DESC
LIMIT 20

-- First Moves Analysis 

SELECT winner, FirstMoves, COUNT(FirstMoves) As TotalGames, ROUND((COUNT(FirstMoves)/TotalMoves*100),2) AS WinPercentage
FROM `academic-elixir-311507.Games.firstmoves`
GROUP BY 1,2, TotalMoves
ORDER BY 2 DESC

-- Player Rating Anlaysis

-- Rating betwenn 1000 and 1100

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1000 AND 1100 AND black_rating BETWEEN 1000 AND 1100)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1000 AND 1100 AND black_rating BETWEEN 1000 AND 1100
GROUP BY winner

-- Rating betwenn 1100 and 1200

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1100 AND 1200 AND black_rating BETWEEN 1100 AND 1200)100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1100 AND 1200 AND black_rating BETWEEN 1100 AND 1200
GROUP BY winner

-- Rating betwenn 1200 and 1300

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1200 AND 1300 AND black_rating BETWEEN 1200 AND 1300)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1200 AND 1300 AND black_rating BETWEEN 1200 AND 1300
GROUP BY winner

-- Rating betwenn 1300 and 1400

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1300 AND 1400 AND black_rating BETWEEN 1300 AND 1400)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1300 AND 1400 AND black_rating BETWEEN 1300 AND 1400
GROUP BY winner

-- Rating betwenn 1400 and 1500

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1400 AND 1500 AND black_rating BETWEEN 1400 AND 1500)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1400 AND 1500 AND black_rating BETWEEN 1400 AND 1500
GROUP BY winner

-- Rating betwenn 1500 and 1600

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1500 AND 1600 AND black_rating BETWEEN 1500 AND 1600)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1500 AND 1600 AND black_rating BETWEEN 1500 AND 1600
GROUP BY winner

-- Rating betwenn 1600 and 1700

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1600 AND 1700 AND black_rating BETWEEN 1600 AND 1700)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1600 AND 1700 AND black_rating BETWEEN 1600 AND 1700
GROUP BY winner

-- Rating betwenn 1700 and 1800

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1700 AND 1800 AND black_rating BETWEEN 1700 AND 1800)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1700 AND 1800 AND black_rating BETWEEN 1700 AND 1800
GROUP BY winner

-- Rating betwenn 1800 and 1900

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1800 AND 1900 AND black_rating BETWEEN 1800 AND 1900)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1800 AND 1900 AND black_rating BETWEEN 1800 AND 1900
GROUP BY winner

-- Rating betwenn 1900 and 2000

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 1900 AND 2000 AND black_rating BETWEEN 1900 AND 2000)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 1900 AND 2000 AND black_rating BETWEEN 1900 AND 2000
GROUP BY winner

-- Rating betwenn 2000 and 2100

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 2000 AND 2100 AND black_rating BETWEEN 2000 AND 2100)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 2000 AND 2100 AND black_rating BETWEEN 2000 AND 2100
GROUP BY winner

-- Rating betwenn 2200 and 2300

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating BETWEEN 2200 AND 2300 AND black_rating BETWEEN 2200 AND 2300)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating BETWEEN 2200 AND 2300 AND black_rating BETWEEN 2200 AND 2300
GROUP BY winner

-- Rating above 2400

SELECT winner, COUNT(winner) AS TotalWin,
  ROUND((COUNT(winner)/(SELECT COUNT(winner) FROM `academic-elixir-311507.Games.chess` WHERE white_rating >= 2400 AND black_rating >= 2400)*100),3) AS WinPercentage
FROM `academic-elixir-311507.Games.chess`
WHERE white_rating >= 2400 AND black_rating >= 2400
GROUP BY winner


