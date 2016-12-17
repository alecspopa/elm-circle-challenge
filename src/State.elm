module State exposing (init, update, subscriptions)

import Types exposing (..)

init : (Circle, Cmd Msg)
init =
    (
      { radius = 250
      , thickness = 1
      , color = "red"
      , points = (createPoints 250 "red" 1)
      }
      , Cmd.none
    )

createPoints : Int -> String -> Int -> List Point
createPoints radius color thickness =
  List.concatMap (createPoint radius color thickness) (List.range 0 900)

createPoint : Int -> String -> Int -> Int -> List Point
createPoint radius color thickness angle =
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

updateCircle : String -> Int -> Circle -> Circle
updateCircle color thickness circle =
  { radius = circle.radius
  , thickness = thickness
  , color = color
  , points = List.map (updatePoint color thickness) circle.points
  }

updatePoint : String -> Int -> Point -> Point
updatePoint color thickness point =
  { x = point.x
  , y = point.y
  , thickness = thickness
  , color = color
  }

-- UPDATE

update : Msg -> Circle -> (Circle, Cmd Msg)
update msg circle =
    case msg of
        ChangeColor color ->
          ( updateCircle color circle.thickness circle, Cmd.none )
        ChangeThickness thickness ->
          ( updateCircle circle.color thickness circle, Cmd.none )
        ChangeColorThickness color thickness ->
          ( updateCircle color thickness circle, Cmd.none )

-- SUBSCRIPTIONS


subscriptions : Circle -> Sub Msg
subscriptions circle =
    Sub.none
