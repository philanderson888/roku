var rokuDeploy = require('roku-deploy');

console.log('deploying zip package to roku device...');

console.log('__filename')
console.log(__filename)
console.log('__dirname')
console.log(__dirname)

outDir = "/Users/phil/github/RokuCommunity/roku/out",
console.log('outDir')
console.log(outDir)

rokuDeploy.deploy({
    rootDir: "/Users/phil/github/RokuCommunity/roku/dist",
    host: '192.168.87.39',
    password: 'developer'
});
