var config = require('../config');

var gulp = require('gulp'),
    bower = require('gulp-bower');

module.exports = function () {
    return bower()
        .pipe(gulp.dest(config.bower));
};