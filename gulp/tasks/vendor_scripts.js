var config = require('../config');

var gulp   = require('gulp'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify');

module.exports = function () {
    return gulp.src(config.files.vend_javascripts)
        .pipe(concat(config.vend_main_js))
        .pipe(uglify())
        .pipe(gulp.dest(config.dist_javascripts))
};