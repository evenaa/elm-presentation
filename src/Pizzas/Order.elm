module Pizzas.Order exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Msgs exposing (Msg)
import Models exposing (Pizza)
import Routing exposing (pizzasPath)


view : Pizza -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Pizza -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Pizza -> Html Msg
form pizza =
    div [ class "m3" ]
        [ h1 [] [ text pizza.name ]
        , formLevel pizza
        ]


formLevel : Pizza -> Html Msg
formLevel pizza =
    div [ class "clearfix py1" ]
        [ div [ class "col col-5" ] [ text "Price" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString pizza.price) ]
            , btnOrder pizza
            , btnRecommend pizza
            ]
        ]


btnOrder : Pizza -> Html Msg
btnOrder pizza =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] []
        ]


btnRecommend : Pizza -> Html Msg
btnRecommend pizza =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] []
        ]


listBtn : Html Msg
listBtn =
    a [ class "btn regular", href pizzasPath ]
        [ i [ class "fa fa-chevron-left mr1" ] []
        , text "List"
        ]
