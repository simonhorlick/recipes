-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Recipes.Object.Ingredients_stddev_fields exposing (..)

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


amount : SelectionSet (Maybe Float) Recipes.Object.Ingredients_stddev_fields
amount =
    Object.selectionForField "(Maybe Float)" "amount" [] (Decode.float |> Decode.nullable)


id : SelectionSet (Maybe Float) Recipes.Object.Ingredients_stddev_fields
id =
    Object.selectionForField "(Maybe Float)" "id" [] (Decode.float |> Decode.nullable)


recipe : SelectionSet (Maybe Float) Recipes.Object.Ingredients_stddev_fields
recipe =
    Object.selectionForField "(Maybe Float)" "recipe" [] (Decode.float |> Decode.nullable)
