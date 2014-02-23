--
-- Solution: solution of one position on the board
--

module Sudoku.Solution (
  Position
, Value
, Solution
, posToXy
, xyToPos
) where

import Sudoku.Config

type Position = Int
type Value    = Int
type Solution = (Position, Value)

posToXy :: Position -> Maybe (Int, Int)
posToXy pos
  | pos < 0            = Nothing
  | pos >= boardSize^2 = Nothing
  | otherwise          = Just (x, y)
  where
    x = pos `mod` boardSize + 1
    y = pos `div` boardSize + 1

xyToPos :: (Int, Int) -> Maybe Position
xyToPos (x,y) 
  | p < 0            = Nothing
  | p >= boardSize^2 = Nothing
  | otherwise        = Just p
  where
    p = (x - 1) + (y - 1) * boardSize

{-
solutionX :: Solution -> Int
solutionX (p, v)
  | xy == Nothing     = 0
  | xy == Just (x, y) = x
  where
    xy = posToXy p

solutionY :: Solution -> Int
solutionY (p, v)
  | xy == Nothing     = 0
  | xy == Just (x, y) = y
  where
    xy = posToXy p

solutionVal :: Solution -> Value
solutionVal (p, v) = v
-}

