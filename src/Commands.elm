module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Msgs exposing (Msg)
import Models exposing (SlideId, Slide, SlideContent, SlideType)
import RemoteData


fetchSlides : Cmd Msg
fetchSlides =
    Http.get fetchLocalSlidesUrl slidesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchSlides


fetchSlidesUrl : String
fetchSlidesUrl =
    "http://localhost:4000/slideList"


fetchLocalSlidesUrl : String
fetchLocalSlidesUrl =
    "./src/Slides/slides.json"


slidesDecoder : Decode.Decoder (List Slide)
slidesDecoder =
    Decode.list slideDecoder


slideDecoder : Decode.Decoder Slide
slideDecoder =
    decode Slide
        |> required "id" Decode.int
        |> required "slideType" slideTypeDecoder
        |> required "heading" Decode.string
        |> required "content" (Decode.list (slideContentDecoder))


slideContentDecoder : Decode.Decoder SlideContent
slideContentDecoder =
    decode SlideContent
        |> required "num" Decode.string
        |> required "contentString" Decode.string


headingDecoder : Decode.Decoder SlideType
headingDecoder =
    Decode.map Models.Heading Decode.string


infoDecoder : Decode.Decoder SlideType
infoDecoder =
    Decode.map Models.Info Decode.string


slideTypeDecoder : Decode.Decoder SlideType
slideTypeDecoder =
    Decode.oneOf [ headingDecoder, infoDecoder ]



--|> required "content" Decode.float
-- Add a contentDecoder??
