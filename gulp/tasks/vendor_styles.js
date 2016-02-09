var config = require('../config');

var gulp  = require('gulp'),
    concat = require('gulp-concat'),
    minify = require('gulp-cssnano');

module.exports = function () {
    return gulp.src(config.files.vend_stylesheets)
        .pipe(concat(config.vend_main_css))
        .pipe(minify({safe: true, discardDuplicates: false, verbose: true}))
        .pipe(gulp.dest(config.dist_stylesheets))
};