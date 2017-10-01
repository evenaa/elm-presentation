module Pizzas.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Pizza)
import RemoteData exposing (WebData)
import Routing exposing (pizzaPath)


view : WebData (List Pizza) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


maybeList : WebData (List Pizza) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success pizzas ->
            list pizzas

        RemoteData.Failure error ->
            text (toString error)


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Pizzas" ]
        ]


list : List Pizza -> Html Msg
list pizzas =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Price" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map pizzaRow pizzas)
            ]
        ]


pizzaRow : Pizza -> Html Msg
pizzaRow pizza =
    tr []
        [ td [] [ text pizza.id ]
        , td [] [ text pizza.name ]
        , td [] [ text (toString pizza.price) ]
        , td [] [ detailBtn pizza ]
        ]


detailBtn : Pizza -> Html.Html Msg
detailBtn pizza =
    let
        path =
            pizzaPath pizza.id
    in
        a [ class "btn regular", href path ]
            [ i [ class "fa fa-pencil mr1" ] []
            , text "Details"
            ]
