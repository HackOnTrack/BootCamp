module Web.FrontController where

import IHP.RouterPrelude
-- Controller Imports
import Web.Controller.Dashboard
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Admins
import Web.Controller.Static
import Web.Controller.Sessions
import IHP.LoginSupport.Middleware

instance FrontController WebApplication where
  controllers =
    [ startPage DashboardAction,
      parseRoute @DashboardController
    , parseRoute @SessionsController -- <--------------- add this
      -- Generator Marker
    , parseRoute @AdminsController
    ]

instance InitControllerContext WebApplication where
  initContext = do
    setLayout defaultLayout
    initAuthentication @Admin
    initAutoRefresh
