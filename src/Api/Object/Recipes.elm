-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.Recipes exposing (..)

import Api.Enum.Ingredients_select_column
import Api.InputObject
import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


cover_image_url : SelectionSet String Api.Object.Recipes
cover_image_url =
    Object.selectionForField "String" "cover_image_url" [] Decode.string


description : SelectionSet String Api.Object.Recipes
description =
    Object.selectionForField "String" "description" [] Decode.string


id : SelectionSet Int Api.Object.Recipes
id =
    Object.selectionForField "Int" "id" [] Decode.int


type alias IngredientsOptionalArguments =
    { distinct_on : OptionalArgument (List Api.Enum.Ingredients_select_column.Ingredients_select_column)
    , limit : OptionalArgument Int
    , offset : OptionalArgument Int
    , order_by : OptionalArgument (List Api.InputObject.Ingredients_order_by)
    , where_ : OptionalArgument Api.InputObject.Ingredients_bool_exp
    }


{-| An array relationship

  - distinct\_on - distinct select on columns
  - limit - limit the number of rows returned
  - offset - skip the first n rows. Use only with order\_by
  - order\_by - sort the rows by one or more columns
  - where\_ - filter the rows returned

-}
ingredients :
    (IngredientsOptionalArguments -> IngredientsOptionalArguments)
    -> SelectionSet decodesTo Api.Object.Ingredients
    -> SelectionSet (List decodesTo) Api.Object.Recipes
ingredients fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { distinct_on = Absent, limit = Absent, offset = Absent, order_by = Absent, where_ = Absent }

        optionalArgs =
            [ Argument.optional "distinct_on" filledInOptionals.distinct_on (Encode.enum Api.Enum.Ingredients_select_column.toString |> Encode.list), Argument.optional "limit" filledInOptionals.limit Encode.int, Argument.optional "offset" filledInOptionals.offset Encode.int, Argument.optional "order_by" filledInOptionals.order_by (Api.InputObject.encodeIngredients_order_by |> Encode.list), Argument.optional "where" filledInOptionals.where_ Api.InputObject.encodeIngredients_bool_exp ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "ingredients" optionalArgs object_ (identity >> Decode.list)


type alias IngredientsAggregateOptionalArguments =
    { distinct_on : OptionalArgument (List Api.Enum.Ingredients_select_column.Ingredients_select_column)
    , limit : OptionalArgument Int
    , offset : OptionalArgument Int
    , order_by : OptionalArgument (List Api.InputObject.Ingredients_order_by)
    , where_ : OptionalArgument Api.InputObject.Ingredients_bool_exp
    }


{-| An aggregated array relationship

  - distinct\_on - distinct select on columns
  - limit - limit the number of rows returned
  - offset - skip the first n rows. Use only with order\_by
  - order\_by - sort the rows by one or more columns
  - where\_ - filter the rows returned

-}
ingredients_aggregate :
    (IngredientsAggregateOptionalArguments -> IngredientsAggregateOptionalArguments)
    -> SelectionSet decodesTo Api.Object.Ingredients_aggregate
    -> SelectionSet decodesTo Api.Object.Recipes
ingredients_aggregate fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { distinct_on = Absent, limit = Absent, offset = Absent, order_by = Absent, where_ = Absent }

        optionalArgs =
            [ Argument.optional "distinct_on" filledInOptionals.distinct_on (Encode.enum Api.Enum.Ingredients_select_column.toString |> Encode.list), Argument.optional "limit" filledInOptionals.limit Encode.int, Argument.optional "offset" filledInOptionals.offset Encode.int, Argument.optional "order_by" filledInOptionals.order_by (Api.InputObject.encodeIngredients_order_by |> Encode.list), Argument.optional "where" filledInOptionals.where_ Api.InputObject.encodeIngredients_bool_exp ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "ingredients_aggregate" optionalArgs object_ identity


instructions : SelectionSet String Api.Object.Recipes
instructions =
    Object.selectionForField "String" "instructions" [] Decode.string


name : SelectionSet String Api.Object.Recipes
name =
    Object.selectionForField "String" "name" [] Decode.string