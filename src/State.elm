module State exposing (init, update, subscriptions)

import Types exposing (..)

init : (Circle, Cmd Msg)
init =
    (
      { radius = 250
      , thickness = 1
      , color = "red"
      , points = (createPoints 250 1 "red")
      }
      , Cmd.none
    )

createPoints : Int -> Int -> String -> List Point
createPoints radius thickness color =
  List.concatMap (createPoint radius thickness color) (List.range 0 900)

createPoint : Int -> Int -> String -> Int -> List Point
createPoint radius thickness color angle =
  let
    radians =
      (toFloat angle) / 10.0 * pi / 180.0
    x =
      round ((toFloat radius) * (sin radians))
    y =
      round ((toFloat radius) * (cos radians))
  in
    [
      { x = x
      , y = y
      , thickness = thickness
      , color = color
      }
    , { x = -x
      , y = y
      , thickness = thickness
      , color = color
      }
    , { x = x
      , y = -y
      , thickness = thickness
      , color = color
      }
    , { x = -x
      , y = -y
      , thickness = thickness
      , color = color
      }
    ]

-- UPDATE

update : Msg -> Circle -> (Circle, Cmd Msg)
update msg circle =
    case msg of
        ChangeColor color ->
          (
            { radius = 250
            , thickness = 1
            , color = color
            , points = (createPoints 250 1 color)
            }
            , Cmd.none
          )
        ChangeThickness thickness ->
          (
            { radius = 250
            , thickness = thickness
            , color = "red"
            , points = (createPoints 250 thickness "red")
            }
            , Cmd.none
          )

-- SUBSCRIPTIONS


subscriptions : Circle -> Sub Msg
subscriptions circle =
    Sub.none
