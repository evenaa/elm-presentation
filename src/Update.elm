module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (Model, Slide)
import Routing exposing (parseLocation, homeRoute)
import Random exposing (..)
import RemoteData


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchSlides response ->
            ( { model | slides = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                if newRoute == Models.PresentationRoute then
                    { model | route = newRoute }
                        |> update (Msgs.Start)
                else
                    ( { model | route = newRoute }, Cmd.none )

        Msgs.Start ->
            ( { model | slidePage = 1 }, Cmd.none )

        Msgs.NextSlide ->
            nextSlide model

        Msgs.PrevSlide ->
            prevSlide model

        Msgs.Home ->
            ( { model | route = homeRoute, slidePage = 0 }, Cmd.none )

        Msgs.KeyMsg keycode ->
            if keycode == 39 then
                nextSlide model
            else if keycode == 37 then
                prevSlide model
            else
                ( model, Cmd.none )

        Msgs.Tick newTime ->
            ( { model | time = newTime }, Cmd.none )


nextSlide : Model -> ( Model, Cmd Msg )
nextSlide model =
    ( { model | slidePage = increment model.slidePage }, Cmd.none )


prevSlide : Model -> ( Model, Cmd Msg )
prevSlide model =
    ( { model | slidePage = decrement model.slidePage }, Cmd.none )


increment : Int -> Int
increment a =
    a + 1


decrement : Int -> Int
decrement a =
    if a <= 0 then
        0
    else
        a - 1
