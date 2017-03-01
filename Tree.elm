module Tree exposing (insert, fromList, show, balanced)

type Tree a
    = Empty
    | Node a (Tree a) (Tree a)

fromList : List comparable -> Tree comparable
fromList xs =
    List.foldl insert Empty xs

insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
        Empty -> Node x Empty Empty
        Node y left right ->
            if x > y then
                Node y left (insert x right)
            else if x < y then
                Node y (insert x left) right
            else
                tree

depth : Tree a -> Int
depth t =
    case t of
        Empty -> 0
        Node _ l r -> max ((depth l) + 1) ((depth r) + 1)

balanced : Tree a -> Bool
balanced t =
    case t of
        Empty -> True
        Node _ l r -> balanced l && balanced r && (abs (depth l - depth r) <= 1)

show : Tree a -> String
show t =
    shw "" False t

show1 isLeft =
    if isLeft then "├─ " else "└─ "
show2 isLeft =
    if isLeft then "|  " else "   "

shw : String -> Bool -> Tree a -> String
shw prefix isLeft t =
    case t of
        Empty -> ""
        Node v l r ->
                  prefix ++ (show1 isLeft) ++ toString v ++ "\n" ++
            (shw (prefix ++ (show2 isLeft)) True  l) ++
            (shw (prefix ++ (show2 isLeft)) False r)
