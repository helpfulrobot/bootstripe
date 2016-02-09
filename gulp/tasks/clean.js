var config = require('../config');

var del  = require('del');

module.exports = function () {
    del(config.clean_paths)
};