-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Recipes.Object.Ingredients_min_fields exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Recipes.InputObject
import Recipes.Interface
import Recipes.Object
import Recipes.Scalar
import Recipes.ScalarCodecs
import Recipes.Union


additional_information : SelectionSet (Maybe String) Recipes.Object.Ingredients_min_fields
additional_information =
    Object.selectionForField "(Maybe String)" "additional_information" [] (Decode.string |> Decode.nullable)


amount : SelectionSet (Maybe Recipes.ScalarCodecs.Numeric) Recipes.Object.Ingredients_min_fields
amount =
    Object.selectionForField "(Maybe ScalarCodecs.Numeric)" "amount" [] (Recipes.ScalarCodecs.codecs |> Recipes.Scalar.unwrapCodecs |> .codecNumeric |> .decoder |> Decode.nullable)


amount_unit : SelectionSet (Maybe String) Recipes.Object.Ingredients_min_fields
amount_unit =
    Object.selectionForField "(Maybe String)" "amount_unit" [] (Decode.string |> Decode.nullable)


id : SelectionSet (Maybe Int) Recipes.Object.Ingredients_min_fields
id =
    Object.selectionForField "(Maybe Int)" "id" [] (Decode.int |> Decode.nullable)


name : SelectionSet (Maybe String) Recipes.Object.Ingredients_min_fields
name =
    Object.selectionForField "(Maybe String)" "name" [] (Decode.string |> Decode.nullable)


recipe : SelectionSet (Maybe Int) Recipes.Object.Ingredients_min_fields
recipe =
    Object.selectionForField "(Maybe Int)" "recipe" [] (Decode.int |> Decode.nullable)
