var config = require('../config');

var gulp  = require('gulp');

module.exports = function () {
    return gulp.src(config.files.src_fonts)
        .pipe(gulp.dest(config.dist_fonts));
};