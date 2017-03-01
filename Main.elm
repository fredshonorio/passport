import Html exposing (Html, pre, text, div, p)
import Tree exposing (fromList, show, balanced)

unbalancedT = [1, 5, 3, 2, 10]
balancedT = [7, 3, 1, 2, 5, 4, 6, 11, 9, 8, 10, 13, 12, 14]

display list =
    let
        tree = fromList list
        label = if balanced tree then "balanced" else "not balanced"
    in
        div [] [ p [] [ text "---------------" ]
               , text <| toString list
               , pre [] [ text (show tree) ]
               , text label
               ]

main = div [] [ display balancedT
              , display unbalancedT
              ]
