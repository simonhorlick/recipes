-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Recipes.Object.Ingredients_mutation_response exposing (..)

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


{-| number of affected rows by the mutation
-}
affected_rows : SelectionSet Int Recipes.Object.Ingredients_mutation_response
affected_rows =
    Object.selectionForField "Int" "affected_rows" [] Decode.int


{-| data of the affected rows by the mutation
-}
returning :
    SelectionSet decodesTo Recipes.Object.Ingredients
    -> SelectionSet (List decodesTo) Recipes.Object.Ingredients_mutation_response
returning object_ =
    Object.selectionForCompositeField "returning" [] object_ (identity >> Decode.list)
