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
