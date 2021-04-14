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

import Web.Controller.MatchSets
import Web.Controller.Matchs
import Web.Controller.Terrains
import Web.Controller.PouleMatchs
import Web.Controller.PouleEquipes
import Web.Controller.Gymnases
import Web.Controller.TournoiPoules
import Web.Controller.TournoiBranches
import Web.Controller.TournoiPhases
import Web.Controller.Equipes
import Web.Controller.Personnes
import Web.Controller.Tournois
import Web.Controller.Clubs
import Web.Controller.Static

instance FrontController WebApplication where
  controllers =
    [ startPage DashboardAction,
      parseRoute @DashboardController
    , parseRoute @SessionsController -- <--------------- add this
    , parseRoute @AdminsController
    , parseRoute @MatchSetsController
    , parseRoute @MatchsController
    , parseRoute @TerrainsController
    , parseRoute @PouleMatchsController
    , parseRoute @PouleEquipesController
    , parseRoute @GymnasesController
    , parseRoute @TournoiPoulesController
    , parseRoute @TournoiBranchesController
    , parseRoute @TournoiPhasesController
    , parseRoute @EquipesController
    , parseRoute @PersonnesController
    , parseRoute @TournoisController
    , parseRoute @ClubsController
    ]

instance InitControllerContext WebApplication where
  initContext = do
    setLayout defaultLayout
    initAuthentication @Admin
    initAutoRefresh
