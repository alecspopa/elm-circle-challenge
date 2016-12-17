module DrawCircle exposing (main)

import Html exposing (program)

import Types exposing (..)
import State
import View

main =
  Html.program
    { init = State.init
    , view = View.rootView
    , update = State.update
    , subscriptions = State.subscriptions
    }
