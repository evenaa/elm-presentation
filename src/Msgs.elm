module Msgs exposing (..)

import Models exposing (Pizza)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchPizzas (WebData (List Pizza))
    | OnLocationChange Location
