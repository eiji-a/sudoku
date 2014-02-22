--
-- Solution: tests of Solution module
--

module UnitTest.Sudoku.Solution where

import Test.Framework
import Test.Framework.HUnit
import Test.Framework.QuickCheck
import Test.HUnit
import Test.QuickCheck

import Sudoku.Solution

main :: IO ()
main = defaultMain testSuite

testSuite :: [Test]
testSuite = [
    testGroup "conversion" [
    ]
  , testGroup "value" [
    ]
  ]
