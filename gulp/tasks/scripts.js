var config = require('../config');

var gulp    = require('gulp'),
    plumber = require('gulp-plumber'),
    path    = require('path'),
    sync    = require('browser-sync'),
    uglify  = require('gulp-uglify'),
    include = require('gulp-include');

module.exports = function () {
    var pipe = gulp.src(path.join(config.src_javascripts, '/[^_]*.js'))
        .pipe(plumber())
        .pipe(include());

    if (config.environment == 'prod') {
        pipe.pipe(uglify())
    }

    pipe.pipe(gulp.dest(config.dist_javascripts))
        .pipe(sync.reload({stream: true}));

    return pipe;
};
