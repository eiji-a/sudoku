--
-- Solution: tests of Solution module
--

module UnitTest.Sudoku.Solution where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck
import Test.HUnit
import Test.QuickCheck

import Sudoku.Solution

main :: IO ()
main = defaultMain testSuite

testSuite = hUnitTestToTests $ tests

tests = "Sudoku Solution" ~: [
    "posToXy" ~:
    test [
      "pos 0" ~: posToXy 0 ~=? Just (1, 1)
    , "pos 1" ~: posToXy 1 ~=? Just (2, 1)
    , "pos 40" ~: posToXy 40 ~=? Just (5, 5)
    , "pos 80" ~: posToXy 80 ~=? Just (9, 9)
    , "pos -1" ~: posToXy (-1) ~=? Nothing
    , "pos -5" ~: posToXy (-5) ~=? Nothing
    , "pos 81" ~: posToXy 81 ~=? Nothing
    ]
  , "xyToPos" ~:
    test [
      "xy 1,1" ~: xyToPos (1,1) ~=? Just 0
    , "xy 2,1" ~: xyToPos (2,1) ~=? Just 1
    , "xy 9,9" ~: xyToPos (9,9) ~=? Just 80
    , "xy 0,0" ~: xyToPos (0,0) ~=? Nothing
    , "xy -1,0" ~: xyToPos ((-1),0) ~=? Nothing
    , "xy 10,9" ~: xyToPos (10,9) ~=? Nothing
    , "xy 9,10" ~: xyToPos (9,10) ~=? Nothing
    ]
  , "get value" ~:
    test [
      "x (1,1)" ~: solutionX (0, 1) ~=? Just 1
    , "x (9,1)" ~: solutionX (17, 1) ~=? Just 9
    , "x (0,1)" ~: solutionX (-1, 1) ~=? Nothing
    , "y (1,1)" ~: solutionY (0, 1) ~=? Just 1
    , "y (1,9)" ~: solutionY (72, 1) ~=? Just 9
    , "y (0,1)" ~: solutionY (-1, 1) ~=? Nothing
    , "val 1" ~: solutionVal (0, 1) ~=? 1
    , "val 9" ~: solutionVal (0, 9) ~=? 9
    , "val 10" ~: solutionVal (0,10) ~=? 10
    , "val -1" ~: solutionVal (0, (-1)) ~=? -1
    ]
  ]

test_conversion = [
  ]
