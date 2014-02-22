--
-- UnitTest.Sudoku: test suites of Sudoku modules
--

module UnitTest.Sudoku where

import Test.Framework
import qualified UnitTest.Sudoku.Solution as Solution (testSuite)

main :: IO ()
main = defaultMain testSuite

testSuite :: [Test]
testSuite = foldl (++) [] [
    Sudoku.testSuite
  ]
