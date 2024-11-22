# brighterscript

*** take 1 ***

## contents

- [brighterscript](#brighterscript)
  - [contents](#contents)
  - [getting started](#getting-started)
  - [hello-world-brighterscript](#hello-world-brighterscript)
  - [to generate a `brighterscript` project from scratch](#to-generate-a-brighterscript-project-from-scratch)
  - [maestro sample app with testing framework](#maestro-sample-app-with-testing-framework)
  - [retry with other code block, `maestro-roku-sample`](#retry-with-other-code-block-maestro-roku-sample)
  - [retry with `rooibos`](#retry-with-rooibos)
  - [retry by adding `rooibos` to `brighterscript` project](#retry-by-adding-rooibos-to-brighterscript-project)
  - [install brighterscript template](#install-brighterscript-template)
  - [deploying an app using `roku-deploy`](#deploying-an-app-using-roku-deploy)

## getting started

https://github.com/rokucommunity/brighterscript

check node and npm, yarn and pnpm are latest

```js
node -v
// v22.9.0
npm -v
// 10.8.3
npm install -g npm@latest
npm -v
// 10.9.0
node -v
// 22.9.0
// now check using homebrew
brew update 
brew upgrade node
npm install -g npm
npm -v
// 10.9.0
node -v
// v23.1.0
```

also another newer way

```js
sudo brew install n
n latest
```



so we have now updated node and npm to latest, let's check with yarn and pnpm


firstly yarn

```js
yarn -v
// 1.22.22
npm install -g corepack
corepack enable
yarn set version stable
yarn -v
// 4.5.1
```

secondly pnpm

```js
pnpm -v
// 9.12.3

// update

curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.zshrc
// or wget (if curl is not installed)
brew install wget // mac
wget -qO- https://get.pnpm.io/install.sh | sh -

pnpm -v
// 9.12.3
```


```js
// install
npm install brighterscript -g
// run
bsc
```

this creates a zip file but we are unable to push it to the tv until we install development mode

to install development mode we can run

```
HHHUURLRLR
```

set a password like `developer` for your roku device


## hello-world-brighterscript

use brighterscript compiler to run a basic brightscript project

bsc --watch --deploy --host 192.168.87.41 --password developer --project ../../bsconfig.json

create a `bsconfig.json` file in the root

```json
{
    "rootDir": "./projects/hello-world-02",
    "stagingDir": "./out"
}
```

and make sure it points to the project root of the project you are running

you can also configure your `launch.json` in vscode

```json
{
    "version": "0.2.0",
    "configurations": [

      {
        "type": "brightscript",
        "request": "launch",
        "name": "BrightScript Debug: Launch",
        "host": "192.168.87.41",
        "password": "developer",
        "rootDir": "${workspaceFolder}/projects/hello-world-01",
        "stopOnEntry": false
      }
    ]
  }
```


## to generate a `brighterscript` project from scratch

```
npx roku-dev-cli init my-brighterscript-project
cd my-brighterscript-project
npm install
```

... seems like this `init` does not generate or scaffold an app ... can investigate this later ...




## maestro sample app with testing framework

i am going to scaffold an app to see if i can 

a) get a proper app to run with a more complex setup

b) see how testing a more modern roku app works

working from these docs here

https://github.com/georgejecook/maestro-roku/blob/master/docs/index.md

firstly just clone the project

```js
git clone https://github.com/georgejecook/maestro-roku.git
cd maestro-roku
npm install
npm run ropm
// open project in vscode
code ./
// ensure brighterscript extension installed
// rename vscode/.env.sample to .vscode/.env and edit the ROKU_DEV_TARGET and ROKU_DEVPASSWORD variables, to match your roku device.
// run the code 
// fails ... 
```



## retry with other code block, `maestro-roku-sample`

using this code repository

https://github.com/georgejecook/maestro-roku-sample


... this also fails ..


## retry with `rooibos`

https://github.com/rokucommunity/rooibos

also has a sample app

https://github.com/rokucommunity/rooibos-roku-sample


this fails ..

## retry by adding `rooibos` to `brighterscript` project

https://github.com/rokucommunity/rooibos/blob/master/docs/index.md#getting-started

You can do the setup from scratch as followes:

Ensure your project is set up for use with npm (npm init, and follow the steps)

```js
npm install brighterscript --save-dev
npm install rooibos-roku --save-dev
```

this gets clean message 'running tests ... but no tests found'


## install brighterscript template

https://github.com/rokucommunity/brighterscript-template

```js
npx degit rokucommunity/brighterscript-template hello-world-07-brighterscript -y
cd hello-world-07-brighterscript
npm install
bsc
```

this creates a zip file in the /out/ folder which can be manually uploaded to the tv screen

## deploying an app using `roku-deploy`

`roku-deploy` is an npm package which is used to deploy a brighterscript app to your roku device

using this as a guide

https://github.com/RokuCommunity/roku-deploy#readme

first of all let's install it using 

```js
npm install roku-deploy
```

we now have `package.json` as

```json
{
  "dependencies": {
    "roku-deploy": "^3.12.2"
  }
}
```

create a `roku-deploy.json` file

```json
{
    "host": "192.168.1.101",
    "password": "securePassword"
}
```

add a node file to push zip to the tv

```js
var rokuDeploy = require('roku-deploy');

//deploy a .zip package of your project to a roku device
rokuDeploy.deploy({
    host: 'ip-of-roku',
    password: 'password for roku dev admin portal'
    //other options if necessary
}).then(function(){
    //it worked
}, function(error) {
    //it failed
    console.error(error);
});
```

... this does not seem to work (see /projects/roku-deploy/roku-deploy-01)

let's try a more complex version

```js
/create a signed package of your project
rokuDeploy.publish({
    host: 'ip-of-roku',
    password: 'password for roku dev admin portal',
    outDir: 'folder/where/your/zip/resides/',
    outFile: 'filename-of-your-app.zip'
    //...other options if necessary
}).then(function(){
    //the app has been sideloaded
}, function(error) {
    //it failed
    console.error(error);
});
```


this is not having any effect.

current file is as follows

```js
var rokuDeploy = require('roku-deploy');

console.log('deploying zip package to roku device...');

console.log('__filename')
console.log(__filename)
console.log('__dirname')
console.log(__dirname)

outDir = __dirname + '/out'
console.log('outDir')
console.log(outDir)

console.log('rokuDeploy')
console.log(rokuDeploy)

console.log('rokuDeploy.publish')
console.log(rokuDeploy.publish)

rokuDeploy.publish({
    host: '192.168.87.39',
    password: 'developer',
    outDir: outDir,
    outFile: 'roku-deploy-01.zip'
}).then(function(){
    console.log('deployed!');
}, function(error) {
    console.error('failed to deploy');
    console.error(error);
});
```

which does do something but not the deploy part

```
➜  roku-deploy-01 git:(main) ✗ node ./roku-deploy.js
deploying zip package to roku device...
__filename
/Users/phil/github/RokuCommunity/roku/projects/roku-deploy/roku-deploy-01/roku-deploy.js
__dirname
/Users/phil/github/RokuCommunity/roku/projects/roku-deploy/roku-deploy-01
outDir
/Users/phil/github/RokuCommunity/roku/projects/roku-deploy/roku-deploy-01/out
rokuDeploy ...
```

referring to the documentation we read

https://github.com/RokuCommunity/roku-deploy?tab=readme-ov-file#running-roku-deploy-as-an-npm-script

From an npm script in package.json. (Requires rokudeploy.json to exist at the root level where this is being run)

```json
{
    "scripts": {
        "deploy": "node roku-deploy.js"
    }
}
```

then we try running it with 

```js
npm run deploy
```

this definitely runs the same script but nothing actually deploys to the tv

