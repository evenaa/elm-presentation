module Msgs exposing (..)

import Models exposing (Model, Slide)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Keyboard
import Time exposing (Time)


type Msg
    = OnFetchSlides (WebData (List Slide))
    | OnLocationChange Location
    | NextSlide
    | PrevSlide
    | Start
    | Home
    | KeyMsg Keyboard.KeyCode
    | Tick Time
