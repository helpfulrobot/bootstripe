var config = require('../config');

var del  = require('del');

module.exports = function () {
    return del(config.clean_paths)
};