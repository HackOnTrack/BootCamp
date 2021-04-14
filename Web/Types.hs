module Web.Types where

import Generated.Types
import IHP.ModelSupport
import IHP.Prelude
import IHP.LoginSupport.Types

data WebApplication
  = WebApplication
  deriving (Eq, Show)

data DashboardController
  = DashboardAction
  | RoomDashboardAction {roomId :: Id Room}
  | NewUserDashboardAction
  | CreateUserDashboardAction
  | CreateRoomDashboardAction
  | CreateMessageDashboardAction {roomId :: Id Room}
  deriving (Eq, Show, Data)

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/"

instance HasNewSessionUrl Admin where
    newSessionUrl _ = "/"

type instance CurrentAdminRecord = Admin
type instance CurrentUserRecord = User

data AdminsController
    = AdminsAction
    | NewAdminAction
    | ShowAdminAction { adminId :: !(Id Admin) }
    | CreateAdminAction
    | EditAdminAction { adminId :: !(Id Admin) }
    | UpdateAdminAction { adminId :: !(Id Admin) }
    | DeleteAdminAction { adminId :: !(Id Admin) }
    deriving (Eq, Show, Data)
