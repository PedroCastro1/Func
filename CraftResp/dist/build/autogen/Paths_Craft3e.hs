{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Craft3e (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\alfio\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\alfio\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\Craft3e-0.1.1.0-8d0kIU2fcX0EmngWBDSD6I"
datadir    = "C:\\Users\\alfio\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\Craft3e-0.1.1.0"
libexecdir = "C:\\Users\\alfio\\AppData\\Roaming\\cabal\\Craft3e-0.1.1.0-8d0kIU2fcX0EmngWBDSD6I"
sysconfdir = "C:\\Users\\alfio\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Craft3e_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Craft3e_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Craft3e_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Craft3e_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Craft3e_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
