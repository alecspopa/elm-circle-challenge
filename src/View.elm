module View exposing (rootView)

import Html exposing (Html, text, div, button)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)

import Types exposing (..)

rootView : Circle -> Html Msg
rootView circle =
  div []
    [ div [ style [ ("position", "absolute")
              , ("top", "300px")
              , ("left", "300px")
              ]
      ] (List.map pointDraw circle.points)
    , toggleColor circle.color
    , toggleThickness circle.thickness
    , toggleColorThickness circle.color circle.thickness
    ]

pointDraw : Point -> Html Msg
pointDraw point =
  div [ style [ ("background-color", point.color)
              , ("width", (toString point.thickness) ++ "px")
              , ("height", (toString point.thickness) ++ "px")
              , ("position", "absolute")
              , ("top", (toString point.x) ++ "px")
              , ("left", (toString point.y) ++ "px")
              ]
      ] []

toggleColor : String -> Html Msg
toggleColor currentColor =
  if currentColor == "red" then
    button [ onClick (ChangeColor "blue") ] [ text "Change color to blue" ]
  else
    button [ onClick (ChangeColor "red") ] [ text "Change color to red" ]

toggleThickness : Int -> Html Msg
toggleThickness currentThickness =
  if currentThickness == 1 then
    button [ onClick (ChangeThickness 10) ] [ text "Change thickness to 10 " ]
  else
    button [ onClick (ChangeThickness 1) ] [ text "Change thickness to 1" ]

toggleColorThickness : String -> Int -> Html Msg
toggleColorThickness currentColor currentThickness =
  if currentColor == "red" then
    button [ onClick (ChangeColorThickness "blue" 10) ] [ text "Change color to blue and thickness to 10" ]
  else
    button [ onClick (ChangeColorThickness "red" 1) ] [ text "Change color to red and thickness to 1" ]
