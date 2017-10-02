module Msgs exposing (..)

import Models exposing (Slide, Model)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchSlides (WebData (List Slide))
    | OnLocationChange Location
    | NextSlide
    | PrevSlide
    | Home
