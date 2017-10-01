module Msgs exposing (..)

import Models exposing (Pizza)
import RemoteData exposing (WebData)


type Msg
    = OnFetchPizzas (WebData (List Pizza))
