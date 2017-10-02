module View exposing (..)

import Html exposing (Html, div, text, header, a, nav, ul, li, img, h1, h2, p)
import Html.Attributes exposing (id, class, src, alt, href)
import Html.Events exposing (onClick)
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
            slidePage model

        Models.PresentationRoute ->
            slidePage model

        Models.NotFoundRoute ->
            notFoundView


slidePage : Model -> Html Msg
slidePage model =
    case model.slides of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success slides ->
            let
                maybeSlide =
                    slides
                        |> List.filter (\slide -> slide.id == model.slidePage)
                        |> List.head
            in
                case maybeSlide of
                    Just slide ->
                        Slides.SlideShow.view slide

                    Nothing ->
                        notFoundView

        RemoteData.Failure error ->
            text (toString error)


presentationPage : Model -> Html Msg
presentationPage model =
    slidePage model


introView : Model -> Html Msg
introView model =
    let
        verb =
            if model.slidePage == 1 then
                "Start"
            else
                "Continue"
    in
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
                            [ a [ href "#presentation" ] [ text (verb ++ " presentation") ]
                            ]
                        ]
                    ]
                ]
            ]


notFoundView : Html Msg
notFoundView =
    div [ class "heading-slide" ]
        [ h1 [] [ text "The End" ]
        , h2 [ onClick Msgs.Home ] [ text "Home" ]
        ]
