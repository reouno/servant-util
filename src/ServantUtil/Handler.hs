{-# LANGUAGE MultiParamTypeClasses #-}

module ServantUtil.Handler
  ( Entity(..)
  , EntityKey(..)
  , DataPool(..)
  , BaseCrudApiPureHandler(..)
  ) where

import           Control.Monad.IO.Class ( liftIO )
import           Data.Aeson             ( FromJSON, ToJSON )
import           Servant

import           ServantUtil.Api        ( BaseCrudApi )

class (FromJSON a, ToJSON a) =>
      Entity a


class (FromJSON i, ToJSON i) =>
      EntityKey i


class DataPool a

class (Entity a, EntityKey i, Eq i) =>
      BaseCrudApiPureHandler a i
  where
  baseCrudApiPureHandler :: [(i, a)] -> Server (BaseCrudApi a i)
  baseCrudApiPureHandler entityRecords =
    getEntities :<|> newEntity :<|> operations
    where
      getEntities = liftIO $ return entityRecords
      newEntity = error "newEntity is not implemented yet"
      operations id' = getEntity id' :<|> updateEntity id' :<|> deleteEntity id'
      getEntity id' =
        liftIO $ return $ head [x | (i, x) <- entityRecords, i == id']
      updateEntity id' = error "updateEntity is not implemented yet"
      deleteEntity id' = error "deleteEntity is not implemented yet"
