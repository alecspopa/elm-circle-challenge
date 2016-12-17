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
    , colorToggle circle.color
    , thicknessToggle circle.thickness
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

colorToggle : String -> Html Msg
colorToggle currentColor =
  if currentColor == "red" then
    button [ onClick (ChangeColor "blue") ] [ text "Change color to blue" ]
  else
    button [ onClick (ChangeColor "red") ] [ text "Change color to red" ]

thicknessToggle : Int -> Html Msg
thicknessToggle currentThickness =
  if currentThickness == 1 then
    button [ onClick (ChangeThickness 5) ] [ text "Change thickness to 5" ]
  else
    button [ onClick (ChangeThickness 1) ] [ text "Change thickness to 1" ]
