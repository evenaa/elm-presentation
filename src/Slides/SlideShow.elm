module Slides.SlideShow exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Slide, SlideContent)
import RemoteData exposing (WebData)
import Routing exposing (slidePath)


view : Slide -> Html Msg
view slide =
    div []
        [ slideView slide
        ]


nav : Slide -> Html Msg
nav slide =
    div []
        [ div [ class "left p2" ] [ text ("Slides " ++ slide.id) ]
        ]


slideView : Slide -> Html Msg
slideView slide =
    div [ class slide.slideType ]
        [ h1 [] [ text slide.heading ]
        , h2 [] (List.map (slideContent) slide.content)
        , div [ class "slide-nav" ]
            (slideNav slide)
        ]


slideContent : SlideContent -> Html Msg
slideContent content =
    text content.contentString


slideNav : Slide -> List (Html Msg)
slideNav slide =
    [ span [ class "fa fa-arrow-left" ] []
    , span [ class "slide-number" ] [ text slide.id ]
    , span [ class "fa fa-arrow-right" ] []
    ]
