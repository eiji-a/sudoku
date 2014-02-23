--
-- Problem: tests of Problem module
--

module UnitTest.Sudoku.Problem where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck
import Test.HUnit
import Test.QuickCheck

import Sudoku.Solution
import Sudoku.Problem

main :: IO ()
main = defaultMain testSuite

testSuite = hUnitTestToTests $ tests

tests = "Sudoku Problem" ~: [
    "mark check" ~: test_mark
  , "multi marks" ~: test_multimark
  ]

test_mark = test [
    "'-'" ~: problemToSolution "-" ~=? []
  , "'0'" ~: problemToSolution "0" ~=? []
  , "'1'" ~: problemToSolution "1" ~=? [(0,1)]
  , "'9'" ~: problemToSolution "9" ~=? [(0,9)]
  , "'a'" ~: problemToSolution "a" ~=? []
  ]

test_multimark = test [
    "'12'" ~: problemToSolution "12" ~=? [(0,1),(1,2)]
  , "'-3'" ~: problemToSolution "-3" ~=? [(1,3)]
  , "'3-'" ~: problemToSolution "3-" ~=? [(0,3)]
  , "'--1---5-3'" ~: problemToSolution "--1---5-3" ~=? [(2,1),(6,5),(8,3)]
  ]