var config = require('../config');

var gulp  = require('gulp'),
    plumber = require('gulp-plumber');

module.exports = function () {
    return gulp.src(config.files.src_fonts)
        .pipe(plumber())
        .pipe(gulp.dest(config.dist_fonts));
};