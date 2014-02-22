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

posToXy :: Position -> (Int, Int)
posToXy pos = (x, y)
  where
    x = pos `mod` boardSize + 1
    y = pos `div` boardSize + 1
--    y = pos / boardSize + 1

xyToPos :: (Int, Int) -> Position
xyToPos (x,y) = (x - 1) + (y - 1) * boardSize
