module Tests exposing (..)

import ElmTest exposing (..)
import Html
import ISO8601 exposing (DayOfWeek(..))
import ISO8601.Helpers
import Array


testToStringPerformance : Test
testToStringPerformance =
  let
      n = 500000 * 3
      time = ISO8601.fromTime 1469573340427
      iter = Array.repeat n time
      f time = 
        ISO8601.toString time
      result = Array.map f iter
  in
      equals n (Array.length result)

all =
    suite "ISO8601 benchmark"
        [ testToStringPerformance
        ]


main =
    Html.pre []
        [ Html.text (stringRunner all)
        ]
