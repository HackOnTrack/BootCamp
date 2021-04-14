{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Warning: Don't Move This Top-Level Comment!

Due to how `dhall format` currently works, this comment's
instructions cannot appear near corresponding sections below
because `dhall format` will delete the comment. However,
it will not delete a top-level comment like this one.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
Replace the overrides' "{=}" (an empty record) with the following idea
The "//" or "⫽" means "merge these two records and
  when they have the same value, use the one on the right:"
-------------------------------
let overrides =
  { packageName =
      upstream.packageName // { updateEntity1 = "new value", updateEntity2 = "new value" }
  , packageName =
      upstream.packageName // { version = "v4.0.0" }
  , packageName =
      upstream.packageName // { repo = "https://www.example.com/path/to/new/repo.git" }
  }
-------------------------------

Example:
-------------------------------
let overrides =
  { halogen =
      upstream.halogen // { version = "master" }
  , halogen-vdom =
      upstream.halogen-vdom // { version = "v4.0.0" }
  }
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
Replace the additions' "{=}" (an empty record) with the following idea:
-------------------------------
let additions =
  { package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , etc.
  }
-------------------------------

Example:
-------------------------------
let additions =
  { benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
  }
-------------------------------
-}

let upstream =
      https://github.com/purerl/package-sets/releases/download/erl-0.13.8-20201120/packages.dhall sha256:fae9f78aca10f80d46819a1e836cb817f2b57542d583ec891ffafd670cff9b4c

let overrides = { erl-cowboy =
          { dependencies = [ "erl-modules" ]
          , repo = "https://github.com/robashton/purescript-erl-cowboy.git"
          , version = "52ba8267dc4498f8d0d73df6eeec1a7aa4dfa812"
          },

      erl-lists =
              upstream.erl-lists
          //  { version = "1d059f0df04f1c83f35a6eae706bd86cda8b015e" },

      erl-pinto =
          { dependencies = [ "erl-process" ]
          , repo = "ssh://git@github.com/id3as/purescript-erl-pinto.git"
          , version = "d94d1220fe0fd6bc6840e62bd14920e9ab30c234"
          },

      erl-stetson =
          { dependencies = ["erl-atom" , "erl-binary" , "erl-lists" , "erl-maps" , "erl-tuples" , "erl-modules" , "foreign" , "maybe" , "prelude" , "transformers" , "routing-duplex"]
          , repo = "ssh://git@github.com/id3as/purescript-erl-stetson.git"
          , version = "27aa696d9eac708119e1bf6110dd2a1088b9b7ed"
          }
      }
      
let additions =
      { payload =
        { dependencies =
          [ "aff"
          , "affjax"
          , "console"
          , "debug"
          , "effect"
          , "foreign-generic"
          , "node-fs"
          , "node-fs-aff"
          , "node-http"
          , "prelude"
          , "psci-support"
          , "record"
          , "simple-json"
          , "stringutils"
          , "test-unit"
          , "typelevel-prelude"
          ]
        , repo = "https://github.com/hoodunit/purescript-payload.git"
        , version = "v0.3.1"
        }
      , postgresql-client =
        { dependencies =
          [ "aff"
          , "argonaut"
          , "arrays"
          , "assert"
          , "bifunctors"
          , "bytestrings"
          , "console"
          , "datetime"
          , "decimals"
          , "effect"
          , "either"
          , "exceptions"
          , "foldable-traversable"
          , "foreign"
          , "foreign-generic"
          , "foreign-object"
          , "js-date"
          , "lists"
          , "maybe"
          , "newtype"
          , "nullable"
          , "prelude"
          , "psci-support"
          , "string-parsers"
          , "test-unit"
          , "transformers"
          , "tuples"
          ]
        , repo = "https://github.com/rightfold/purescript-postgresql-client.git"
        , version = "v3.0.2"
        }
      , browser-cookies =
        { dependencies =
          [ "prelude"
          , "console"
          , "effect"
          , "maybe"
          , "foldable-traversable"
          , "strings"
          , "js-date"
          ]
        , repo = "https://github.com/vilu/purescript-browser-cookies.git"
        , version = "v0.0.1"
        }
      , flame =
        { dependencies =
          [ "prelude"
          , "console"
          , "effect"
          , "web-events"
          , "web-dom"
          , "web-html"
          , "nullable"
          , "aff"
          , "signal"
          , "foreign-object"
          , "argonaut-generic"
          ]
        , repo = "https://github.com/easafe/purescript-flame.git"
        , version = "f35c4b7d16e59352f666324a06a9c51c0e8ddef0"
        }
      , erl-simplebus =
          { dependencies =
              [ "erl-process"
              , "effect"
              ]
          , repo = "ssh://git@github.com/id3as/purescript-erl-simplebus.git"
          , version = "499883e219c9d828ad67cb68726c8e8c4335ff7b"
          },
       erl-logger =
          { dependencies =
              [ "record"
              ]
          , repo = "ssh://git@github.com/id3as/purescript-erl-logger.git"
          , version = "4966aba0f7a3579c1ff8646f0fb6747d49c241a7"
          },
       sequences =
          { dependencies =
              [ "prelude"
              , "unsafe-coerce"
              , "unfoldable"
              , "lazy"
              , "arrays"
              , "profunctor"
              , "maybe"
              , "tuples"
              , "newtype"
              ]
          , repo = "ssh://git@github.com/hdgarrood/purescript-sequences.git"
          , version = "448919594e979cfd2a45ebcde619c22a9fb984fc"
          }
      }

in  (    upstream
    //  overrides
    //  additions)

in  upstream // overrides // additions
