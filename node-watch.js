var watch = require('node-watch');
var childProcess = require('child_process');


function runScript(scriptPath, callback) {

    // keep track of whether callback has been invoked to prevent multiple invocations
    var invoked = false;

    var process = childProcess.fork(scriptPath);

    // listen for errors as they may prevent the exit event from firing
    process.on('error', function (err) {
        if (invoked) return;
        invoked = true;
        callback(err);
    });

    // execute the callback once the process has finished running
    process.on('exit', function (code) {
        if (invoked) return;
        invoked = true;
        var err = code === 0 ? null : new Error('exit code ' + code);
        callback(err);
    });

}

watch('/Users/phil/github/RokuCommunity/roku/projects/', { recursive: true }, function(evt, name) {
  console.log('%s changed.', name);

    childProcess.exec('/Users/phil/github/RokuCommunity/roku/.scripts/main-script.sh', function(err, stdout, stderr) {
        if (err) {
            console.error(err);
            return;
        }
        console.log(stdout);
        console.log('finished running main-script.sh from node-watch.js');
    });

    // Now we can run a script and invoke a callback when complete, e.g.
    /*
    runScript('./roku-deploy.js', function (err) {
        if (err) throw err;
        console.log('finished running roku-deploy.js');
    });
    */

});
