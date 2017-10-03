module Msgs exposing (..)

import Models exposing (Model, Slide)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchSlides (WebData (List Slide))
    | OnLocationChange Location
    | NextSlide
    | PrevSlide
    | Home
