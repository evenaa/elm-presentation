module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class, src, alt, href)


-- MODEL


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    header [ id "header" ]
        [ div [ class "logo" ]
            [ img [ class "logoImage", src "src/images/iconalpha_white.png", alt "logo" ] []
            ]
        , div [ class "content" ]
            [ div [ class "inner" ]
                [ h1 []
                    [ text "Finstadbru Båtbyggeri" ]
                , p [] [ text "Building wooden and fibreglass boats" ]
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



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
