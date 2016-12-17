module Types exposing (..)

-- MODEL

type alias Circle =
  { radius: Int
  , thickness: Int
  , color: String
  , points: List Point
  }

type alias Point =
  { x: Int
  , y: Int
  , thickness: Int
  , color: String
  }

-- MSG

type Msg
  = ChangeColor String
  | ChangeThickness Int
  | ChangeColorThickness String Int
