module Slides.SlideShow exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Slide, SlideContent, SlideType)
import RemoteData exposing (WebData)
import Routing exposing (slidePath)
import Time.Clock exposing (view)
import Time exposing (Time)


view : Slide -> Time -> Html Msg
view slide time =
    div []
        [ slideView slide time
        ]


slideView : Slide -> Time -> Html Msg
slideView slide time =
    div [ class (slideClass slide.slideType) ]
        [ Time.Clock.view time
        , div [ class "slide-nav" ]
            (slideNav slide)
        , h1 [] [ text slide.heading ]
        , h2 [] (List.map (slideContent) slide.content)
        ]


slideClass : SlideType -> String
slideClass slideType =
    case slideType of
        Models.Heading class ->
            class

        Models.Info class ->
            class


slideContent : SlideContent -> Html Msg
slideContent content =
    text content.contentString


slideNav : Slide -> List (Html Msg)
slideNav slide =
    [ span [ class "fa fa-arrow-left", onClick Msgs.PrevSlide ] []
    , span [ class "slide-number" ] [ text (toString slide.id) ]
    , span [ class "fa fa-arrow-right", onClick Msgs.NextSlide ] []
    ]
