var config = require('../config');

var gulp  = require('gulp'),
    imagemin = require('gulp-imagemin');

module.exports = function () {
    return gulp.src(path.join(config.src_images, '/**/*'))
        .pipe(imagemin({optimizationLevel: 5, progressive: true, interlaced: true}))
        .pipe(gulp.dest(config.dist_images))
};