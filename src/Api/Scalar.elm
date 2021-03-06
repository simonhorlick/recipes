-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Scalar exposing (Codecs, Id(..), Numeric(..), defaultCodecs, defineCodecs, unwrapCodecs, unwrapEncoder)

import Graphql.Codec exposing (Codec)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode


type Id
    = Id String


type Numeric
    = Numeric String


defineCodecs :
    { codecId : Codec valueId
    , codecNumeric : Codec valueNumeric
    }
    -> Codecs valueId valueNumeric
defineCodecs definitions =
    Codecs definitions


unwrapCodecs :
    Codecs valueId valueNumeric
    ->
        { codecId : Codec valueId
        , codecNumeric : Codec valueNumeric
        }
unwrapCodecs (Codecs unwrappedCodecs) =
    unwrappedCodecs


unwrapEncoder :
    (RawCodecs valueId valueNumeric -> Codec getterValue)
    -> Codecs valueId valueNumeric
    -> getterValue
    -> Graphql.Internal.Encode.Value
unwrapEncoder getter (Codecs unwrappedCodecs) =
    (unwrappedCodecs |> getter |> .encoder) >> Graphql.Internal.Encode.fromJson


type Codecs valueId valueNumeric
    = Codecs (RawCodecs valueId valueNumeric)


type alias RawCodecs valueId valueNumeric =
    { codecId : Codec valueId
    , codecNumeric : Codec valueNumeric
    }


defaultCodecs : RawCodecs Id Numeric
defaultCodecs =
    { codecId =
        { encoder = \(Id raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map Id
        }
    , codecNumeric =
        { encoder = \(Numeric raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map Numeric
        }
    }
