module View exposing (..)

import Html exposing (Html, div, text, header, a, nav, ul, li, img, h1, p)
import Html.Attributes exposing (id, class, src, alt, href)
import Msgs exposing (Msg)
import Models exposing (Model)


view : Model -> Html Msg
view model =
    div [ id "wrapper" ]
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
