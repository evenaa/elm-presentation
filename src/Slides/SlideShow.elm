module Slides.SlideShow exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Slide)
import RemoteData exposing (WebData)
import Routing exposing (slidePath)
import Time.Clock exposing (view)
import Time exposing (Time)
import Markdown exposing (..)
import Slides.Slides


view : Slide -> Time -> Html Msg
view slide time =
    div []
        [ slideView slide time
        ]


slideView : Slide -> Time -> Html Msg
slideView slide time =
    div [ class slide.slideType ]
        [ Time.Clock.view time
        , div [ class "slide-nav" ]
            (slideNav slide)
        , (Slides.Slides.slide slide.id)
        ]


slideNav : Slide -> List (Html Msg)
slideNav slide =
    [ span [ class "fa fa-arrow-left", onClick Msgs.PrevSlide ] []
    , span [ class "slide-number" ] [ text (toString slide.id) ]
    , span [ class "fa fa-arrow-right", onClick Msgs.NextSlide ] []
    ]
