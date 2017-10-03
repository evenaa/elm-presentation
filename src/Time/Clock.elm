module Time.Clock exposing (..)

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Models exposing (Model)
import Msgs exposing (Msg)
import Time exposing (Time)


view : Time -> Html Msg
view model =
    let
        numSeconds =
            (floor (Time.inSeconds model)) % 60

        numMinutes =
            (floor (Time.inMinutes model)) % 60

        numMinutesFloat =
            getFraction (Time.inMinutes model) + toFloat numMinutes

        numHours =
            (floor (Time.inHours model)) % 24 + 2

        numHoursFloat =
            getFraction ((Time.inHours model) + 2) + toFloat numHours

        angleSecondsRad =
            (toFloat numSeconds) / (toFloat 60) * 360 / (toFloat 180) * pi

        angleMinutesRad =
            numMinutesFloat / (toFloat 60) * 360 / (toFloat 180) * pi

        angleHoursRad =
            numHoursFloat / (toFloat 12) * 360 / (toFloat 180) * pi

        secondX =
            toString (50 + 40 * sin angleSecondsRad)

        secondY =
            toString (50 - 40 * cos angleSecondsRad)

        minuteX =
            toString (50 + 35 * sin angleMinutesRad)

        minuteY =
            toString (50 - 35 * cos angleMinutesRad)

        hourX =
            toString (50 + 20 * sin angleHoursRad)

        hourY =
            toString (50 - 20 * cos angleHoursRad)
    in
        div [ class "svg-clock" ]
            [ svg [ viewBox "0 0 100 100", width "100px" ]
                [ circle [ cx "50", cy "50", r "45", fill "#1b1f22" ] []

                --, line [ x1 "50", y1 "50", x2 secondX, y2 secondY, stroke "#FFF" ] []
                , line [ x1 "50", y1 "50", x2 minuteX, y2 minuteY, stroke "#FFF" ] []
                , line [ x1 "50", y1 "50", x2 hourX, y2 hourY, stroke "#FFF" ] []
                ]

            {- , div []
               [ Html.text
                   (String.right 2 (String.pad 2 '0' (toString numHours))
                       ++ ":"
                       ++ String.right 2 (String.pad 2 '0' (toString numMinutes))
                       ++ ":"
                       ++ String.right 2 (String.pad 2 '0' (toString numSeconds))
                   )
               ]
            -}
            --, div [] [ Html.text (toString numMinutes) ]
            --, div [] [ Html.text (toString numHours) ]
            --, div [] [ Html.text (toString numHoursFloat) ]
            --, div [] [ Html.text (toString (Time.inHours model)) ]
            --, div [] [ Html.text (toString (angleMinutesRad)) ]
            ]


getFraction : Float -> Float
getFraction timeFloat =
    timeFloat - toFloat (floor (timeFloat))
