module View exposing (..)

import Html exposing (Html, div, text, header, a, nav, ul, li, img, h1, p)
import Html.Attributes exposing (id, class, src, alt, href)
import Msgs exposing (Msg)
import Models exposing (Model, PizzaId)
import Pizzas.List
import Pizzas.Order
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ page model
            ]
        , div [ id "wrapper" ]
            [ header [ id "header" ]
                [ div [ class "logo" ]
                    [ img [ class "logoImage", src "src/images/iconalpha_white.png", alt "logo" ] []
                    ]
                , div [ class "content" ]
                    [ div [ class "inner" ]
                        [ h1 []
                            [ text "Puma Pizza" ]
                        , p [] [ text "Serving pizzas to the people" ]
                        ]
                    ]
                , nav []
                    [ ul []
                        [ li []
                            [ a [ href "intro" ] [ text "Intro" ]
                            ]
                        , li []
                            [ a [ href "#work" ] [ text "Work" ]
                            ]
                        , li []
                            [ a [ href "#work" ] [ text "About" ]
                            ]
                        , li []
                            [ a [ href "#work" ] [ text "Contact" ]
                            ]
                        , li []
                            [ a [ href "#work" ] [ text "Elements" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.PizzasRoute ->
            Pizzas.List.view model.pizzas

        Models.PizzaRoute id ->
            pizzaOrderPage model id

        Models.NotFoundRoute ->
            notFoundView


pizzaOrderPage : Model -> PizzaId -> Html Msg
pizzaOrderPage model pizzaId =
    case model.pizzas of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success pizzas ->
            let
                maybePizza =
                    pizzas
                        |> List.filter (\pizza -> pizza.id == pizzaId)
                        |> List.head
            in
                case maybePizza of
                    Just pizza ->
                        Pizzas.Order.view pizza

                    Nothing ->
                        notFoundView

        RemoteData.Failure error ->
            text (toString error)


notFoundView : Html msg
notFoundView =
    text "Not found"
