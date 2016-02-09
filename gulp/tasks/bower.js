var config = require('../config');

var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    bower = require('gulp-bower');

module.exports = function () {
    return bower()
        .pipe(plumber())
        .pipe(gulp.dest(config.bower));
};