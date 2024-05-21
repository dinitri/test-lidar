var exec = require('cordova/exec');

exports.startLidar = function (arg0, success, error) {
    exec(success, error, 'Lidar', 'startLidar', []);
};