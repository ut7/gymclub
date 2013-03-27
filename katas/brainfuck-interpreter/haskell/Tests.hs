module Tests
where
import Test.HUnit
import BrainFuck

main = runTestTT $ TestList [
  "Empty script returns empty string" ~:
  evalBF "" ~?= "",

  "'.' instruction prints value on pointer" ~:
  TestList [
    evalBF "." ~?= "\0",
    evalBF ".." ~?= "\0\0"
    ],

  "'+' instruction increments value on pointer" ~:
    evalBF "+." ~?= "\1",

  "'-' instruction decrements value on pointer" ~:
    evalBF "++-." ~?= "\1",

  "'>' instruction moves pointer to right" ~:
    evalBF "++>+." ~?= "\1",

  "'<' instruction moves pointer to left" ~: TestList [
    evalBF "++>+<." ~?= "\2",
    evalBF "<." ~?= "\0"
    ],

  "'[' instruction moves instruction pointer to right if current value on pointer is not zero" ~:
    evalBF "+[+.--]" ~?= "\2",

  "'[' instruction jumps after next ']' if current value is 0" ~:
    evalBF "[++.]." ~?= "\0"
  ]

