module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (parseLocation, homeRoute)


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
                ( { model | route = newRoute }, Cmd.none )

        Msgs.NextSlide ->
            ( { model | slidePage = increment model.slidePage }, Cmd.none )

        Msgs.PrevSlide ->
            ( { model | slidePage = decrement model.slidePage }, Cmd.none )

        Msgs.Home ->
            ( { model | route = homeRoute, slidePage = 1 }, Cmd.none )


increment : Int -> Int
increment a =
    a + 1


decrement : Int -> Int
decrement a =
    if a <= 1 then
        1
    else
        a - 1
