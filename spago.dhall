{ name = "halogen"
, repository = "https://github.com/HackOnTrack/BootCamp"
, dependencies =
  [ "affjax"
  , "argonaut-generic"
  , "browser-cookies"
  , "console"
  , "debug"
  , "effect"
  , "enums"
  , "exceptions"
  , "flame"
  , "foreign-object"
  , "form-urlencoded"
  , "http-methods"
  , "node-fs"
  , "node-process"
  , "now"
  , "payload"
  , "postgresql-client"
  , "prelude"
  , "psci-support"
  , "read"
  , "run"
  , "simple-jwt"
  , "unordered-collections"
  , "uuid"
  , "web-dom"
  , "web-socket"
  , "web-storage"
  , "web-uievents",
  "test-unit",
  "halogen"
  ]
, packages = ./packages.dhall
, sources = ["halogen/**/*.purs", "src/**/*.purs", "test/**/*.purs"]
}
