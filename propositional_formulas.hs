data Formula
 = Atom Bool -- atomic formula
 | And Formula Formula -- f /\ f
 | Or Formula Formula -- f \/ f
 | Implies Formula Formula -- f -> f
 | Not Formula -- not(f)
 

collect_atoms :: Formula -> [Bool]
collect_atoms (Atom True) = [True]
collect_atoms (Atom False) = [False]
collect_atoms (And x y) = collect_atoms (x)++collect_atoms(y)
collect_atoms (Or x y) = collect_atoms (x)++collect_atoms(y)
collect_atoms (Implies x y) = collect_atoms (x)++collect_atoms(y)
collect_atoms (Not x) = collect_atoms (x) 


eval :: Formula -> Bool
eval (Atom True) = True
eval (Atom False) = False
eval (And x y) = eval (x)&&eval(y)
eval (Or x y) = eval (x)||eval(y)
eval (Implies x y) = eval(x)<=eval(y)
eval (Not x) = not(eval (x))
