module BrainFuck
where
import Data.Char

type Script = [Instruction]
type Instruction = Char
type State = ([Int], [Int])
type Result = String

evalBF :: Script -> Result
evalBF s = evalBF' s (repeat 0, repeat 0)

evalBF' :: Script -> State -> Result
evalBF' "" _ = ""
evalBF' ('.':is) state@(_, r:_) = (toEnum r):(evalBF' is state)
evalBF' ('+':is) (ls, r:rs) = (evalBF' is (ls, (r + 1):rs))
evalBF' ('-':is) (ls, r:rs) = (evalBF' is (ls, (r - 1):rs))
evalBF' ('>':is) (ls, r:rs) = (evalBF' is (r:ls, rs))
evalBF' ('<':is) (l:ls, rs) = (evalBF' is (ls, l:rs))

evalBF' ('[':is) state@(ls, 0:rs) = (evalBF' afterJump state)
  where
  afterJump :: Script
  afterJump = tail $ dropWhile (/= ']') is
evalBF' ('[':is) state = (evalBF' is state)

evalBF' (']':is) state = evalBF' is state
