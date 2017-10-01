module View exposing (..)

import Html exposing (Html, div, text, header, a, nav, ul, li, img, h1, p)
import Html.Attributes exposing (id, class, src, alt, href)
import Msgs exposing (Msg)
import Models exposing (Model, SlideId)
import Slides.SlideShow
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.IntroRoute ->
            introView model

        Models.SlideRoute id ->
            slidePage model id

        Models.NotFoundRoute ->
            notFoundView


slidePage : Model -> SlideId -> Html Msg
slidePage model slideId =
    case model.slides of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success slides ->
            let
                maybeSlide =
                    slides
                        |> List.filter (\slide -> slide.id == slideId)
                        |> List.head
            in
                case maybeSlide of
                    Just slide ->
                        Slides.SlideShow.view slide

                    Nothing ->
                        notFoundView

        RemoteData.Failure error ->
            text (toString error)


introView : Model -> Html Msg
introView model =
    div [ id "wrapper" ]
        [ header [ id "header" ]
            [ div [ class "logo" ]
                [ img [ class "logoImage", src "src/images/iconalpha_white.png", alt "logo" ] []
                ]
            , div [ class "content" ]
                [ div [ class "inner" ]
                    [ h1 []
                        [ text "Elm" ]
                    , p [] [ text "A functional webapp alternative" ]
                    ]
                ]
            , nav []
                [ ul []
                    [ li []
                        [ a [ href "#slide/1" ] [ text "Intro" ]
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


notFoundView : Html msg
notFoundView =
    text "Not found"
