{-# LANGUAGE DeriveGeneric #-}

module ServantUtil.Types
  ( EntityRecord(..)
  ) where

import           Data.Aeson   ( FromJSON, ToJSON )
import           GHC.Generics ( Generic )

data EntityRecord i a =
  EntityRecord
    { id     :: i
    , entity :: a
    }
  deriving (Show, Ord, Eq, Generic)

instance (FromJSON i, FromJSON a) => FromJSON (EntityRecord i a)

instance (ToJSON i, ToJSON a) => ToJSON (EntityRecord i a)
