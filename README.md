![logo](src/Client/media/logo.png) [![Build Status](https://travis-ci.org/melanchat/melanchat.svg?branch=master)](https://travis-ci.com/melanchat/melanchat) <h1> BootCamp </h1>

BootCamp is a fork of melonchat at https://github.com/melonchat/melonchat, with the bootstrap of IHP at https://github.com/digitallyinduced/ihp

BootCamp offers a similar model to Coursera, but differs by partnering experienced coders (the teachers) with beginners in correcting and offering insight into programming "homework".  


![Web Site System](https://raw.githubusercontent.com/supunlakmal/thismypc/master/doc/gifAnimations/web_site_system.gif)

## App Screenshots

Desktop App  Login         |  Desktop App Open | Web App  computer  hard drives       |  Web App computer hard drives Open
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://raw.githubusercontent.com/supunlakmal/thismypc/master/thisMyPCWeb/src/assets/images/screen/app-login.PNG" title="Desktop App  Login " width="100%"> |<img src="https://raw.githubusercontent.com/supunlakmal/thismypc/master/thisMyPCWeb/src/assets/images/screen/app-home.PNG" title="Desktop App Open" width="100%">|<img src="https://raw.githubusercontent.com/supunlakmal/thismypc/master/thisMyPCWeb/src/assets/images/screen/web-system.PNG" title="Web App  PC  Drivers" width="100%"> |<img src="https://raw.githubusercontent.com/supunlakmal/thismypc/master/thisMyPCWeb/src/assets/images/screen/web-system.PNG" title="Web App  PC  Drivers" width="100%">

## Folder Structure

    .
    ├── .github/ISSUE_TEMPLATE
    ├── doc                          # All Api doc and gif files
    ├── thisMyPCApp                  # Electron JS app folder
    ├── thisMyPCServer               # Node JS MongoDB and Express JS server folder
    ├── thisMyPCWeb                  # Angular website folder
    ├── .gitignore
    ├── .gitlab-ci.yml
    ├── CODE_OF_CONDUCT.md
    ├── LICENSE
    └── README.md

## What (This my pc) ?

The concept behind thismypc app was transferred your computer folder and file information through nodeJS server to web end as a json data.  

## Why (This my pc) ?

- The app's responsive web interface helps you to browse file in any resolution device.
- You can use source code for your own projects.
- It works well in low bandwidth environments.

## How to (Wiki) ?

All usage instruction and information update on [Github Wiki](https://github.com/supunlakmal/thismypc/wiki).

## Developing

### Platforms

Platform| Status
------------ | -------------
Microsoft Windows | Developing
Linux  | Pending
Mac os | Pending
Android  | Developing

#### Built With

- [Node JS](https://nodejs.org/en/)
- [GraphQL](http://graphql.org)
- [Express JS](https://expressjs.com/)
- [Socket IO](https://socket.io/)
- [Angular](https://angularjs.org/)
- [Electron JS](https://electronjs.org/)
- [Mongodb](https://www.mongodb.com/)
- [React Native](https://facebook.github.io/react-native/)

#### Clone Project

```shell
git clone https://github.com/supunlakmal/thismypc.git
```
![git clone https://github.com/supunlakmal/thismypc.git](https://raw.githubusercontent.com/supunlakmal/thismypc/master/doc/gifAnimations/gitClone.gif)

This Command  will copy a full  project  to your local  environment

## Angular Project

### Setting up Angular Project

```shell
    cd thisMyPCWeb
    npm i
```

![Setting up Angular Project](https://raw.githubusercontent.com/supunlakmal/thismypc/master/doc/gifAnimations/angularSetup.gif)

`cd thisMyPCWeb` Move into angular Project Folder
`npm i` install all  dependency.

### Run Angular Project

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Electron Project

### Setting up Electron Project

```shell
cd thisMyPCApp
npm i
```

![ Setting up Electron Project](https://raw.githubusercontent.com/supunlakmal/thismypc/master/doc/gifAnimations/electronSetup.gif)

`cd thisMyPCWeb` Move into  Electron  Project Folder
`npm i` install all  dependency.

### Run Electron  Project

Run `npm run start` start electron app in debug mode

## Node Server

### Setting up Node Server

```shell
cd thisMyPCServer
npm i
```

`cd thisMyPCServer` Move into  Node  Project Folder
`npm i` install all  dependency.

### Run Node  Project

Run `npm node index.js` to start node server

## Graphql

 URL |
 ------------- |
 /api/v1/graphql |

## REST  API

### API Reference

- PC - Personal Computer
- thismypc.com:5000 - This is Thismypc web site API url. You can use your own localhost server link instead default Link.
- ":userID" -  User ID
- ":computerKey" - Computer Key

### Web API

Web API| URL | Description
------------ | ------------- | -------------
User Register| /api/v1/user/register | -
User Login | /api/v1/user/login | -
User Logout | /api/v1/user/:userID/logout | -
User Auth | /api/v1/user/authentication | -
User Info | /api/v1/user/:userID | -
User Online PC List| /api/v1/user/computer/online | -
Public PC Access | /api/v1/computer/public/access | -
User PC List | /api/v1/user/computer | -
Update User Account | /api/v1/user/update | -
Update User Password | /api/v1/user/password/edit | -
Update User PC Public status | /api/v1/user/computer/public/status/update | -
Update User PC Public Key | /api/v1/user/computer/public/key/update | -

### Web socket IO

Socket Name| Socket | Type | Description
------------ | ------------- |------------- | -------------
Join Socket from Web | joinFromWeb | emit | -
Folder or Driver  Open Request   | openFolder | emit | -
PC access  Requests  | pcAccessRequest | emit | -
Get Hard Drive List | hDDList | on | -
Folder or  hard drive open data   | openFolderRequestToWeb | on | -

### App API

APP API| URL | Description
------------ | ------------- | -------------
User Login From App | /api/v1/user/computer/login | -
User Info | /api/v1/user/:userID/computer/:computerKey | -
User Logout | /api/v1/user/:userID/computer/logout | -

### App socket IO

Socket Name| Socket | Type | Description
------------ | ------------- |------------- | -------------
Join Socket from APP | joinFromApp | emit | -
Send Hard Drive List   | hDDList | emit | -
Send Data inside Folder or  Hard Drive  | sendOpenFolderRequest | emit | -
Send callback  of Folder Create Function  | folderCreateCallback | emit | -
PC access user and data | pcAccessRequest | on | -
Folder or Hard drive  open request   | openFolderRequest | on | -
Folder Validation   | validateFolderName | on | -

## Database

MongoDB use as Database.

## Licensing

The Apache License 2

Pull requests are welcome! We have a [spec](docs/README.md). Issues correspond to spec items, but feel free to contact me (or just fork the thing) if you wish to help.

See [CONTRIBUTING](CONTRIBUTING.md) for how to get started and [ARCHITECTURE](ARCHITECTURE.md) for a high level overview of the project.
