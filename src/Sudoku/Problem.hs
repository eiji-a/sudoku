--
-- Problem: problem data of sudoku
--

module Sudoku.Problem (

) where

import Sudoku.Config
import Sudoku.Solution


type Problem = String

problemToSolution :: Problem -> [Solution]
problemToSolution pr = 