var _               =   require('lodash'),
    path            =   require('path'),
    del             =   require('del'),
    run             =   require('run-sequence'),
    sync            =   require('browser-sync'),
    gulp            =   require('gulp'),
    sass            =   require('gulp-sass'),
    sourcemaps      =   require('gulp-sourcemaps'),
    autoprefixer    =   require('gulp-autoprefixer'),
    minify          =   require('gulp-minify-css'),
    uglify          =   require('gulp-uglify'),
    include         =   require('gulp-include'),
    imagemin        =   require('gulp-imagemin'),
    cache           =   require('gulp-cache'),
    watch           =   require('gulp-watch'),
    bower           =   require('gulp-bower'),
    svgtopng        =   require('gulp-svg2png');
;

var config = {
    // Source Config
    src_fonts           :    [
                                './bower_components/bootstrap-sass-official/assets/fonts/bootstrap',
                                './bower_components/font-awesome/fonts/*' // Glob FA to keep paths default
                             ],
    src_tmp             :     './templates/',                       // Source Templates
    src_images          :    './src/images/',                       // Source Images Directory
    src_javascripts     :    './src/javascript/',                   // Source Javascripts Directory
    src_main_js         :    './src/javascript/layout.js',          // Source main.js
    src_stylesheets     :    './src/sass/',                         // Source Styles Sheets Directory
    // Destination Config
    dist_fonts          :    './fonts/',                            // Destination Fonts Directory
    dist_images         :    './images/',                           // Destination Images Directory
    dist_javascripts    :    './javascript/',                       // Destination Javascripts Directory
    dist_stylesheets    :    './css/',                              // Destination Styles Sheets Directory
    // Bower Config
    bower               :    './bower_components/',                 // Bower Components
    // Auto Prefixer
    autoprefix          :    'last 3 version',                      // Number of version Auto Prefixer to use
    // Server
    host                :    'localhost',                           // Webserverhost
    port                :    8080                                   // Webserver port
};

// Bower
gulp.task('bower', function() {
    return bower()
        .pipe(gulp.dest(config.bower)) // Possibly rework this to install to './src/bower/' would need to update sass includePaths and add '.bowerrc' for gulp-bower
});

// Styles
gulp.task('styles', function () {
    return gulp.src(path.join(config.src_stylesheets, '/**/*.scss'))
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'expanded',
            precision: 10,
            includePaths: [config.bower],
            errLogToConsole: true
        }))
        .pipe(autoprefixer(config.autoprefix))
        .pipe(minify())
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest(config.dist_stylesheets))
        .pipe(sync.reload({stream:true}))
});

// Scripts
gulp.task('scripts', function () {
    return gulp.src(config.src_main_js)
        .pipe(include())
        .pipe(uglify())
        .pipe(gulp.dest(config.dist_javascripts))
        .pipe(sync.reload({stream:true}))
});

// Templates
gulp.task('templates', function() {
    return gulp.src(path.join(config.src_tmp, '/**/*.ss'))
        .pipe(sync.reload({stream:true}))
})

// SVG to PNG
gulp.task('svgtopng', function () {
    gulp.src(path.join(config.src_images, '/**/*.svg'))
        .pipe(svgtopng())
        .pipe(gulp.dest(config.src_images));
});

// Image Optimization
gulp.task('images', ['svgtopng'], function() { // Always call 'svgtopng' before executing
    return gulp.src(path.join(config.src_images, '/**/*'))
        .pipe(cache(imagemin({ optimizationLevel: 5, progressive: true, interlaced: true })))
        .pipe(gulp.dest(config.dist_images))
});

// Fonts
gulp.task('fonts', function () {
    return gulp.src(config.src_fonts)
        .pipe(gulp.dest(config.dist_fonts));
});

// Clean
gulp.task('clean', function() {
    del([config.dist_fonts, config.dist_images, config.dist_javascripts, config.dist_stylesheets])
});

// Watch
gulp.task('watch', function() {
    sync({
        proxy: config.host + ':' + config.port
    });
    gulp.watch(path.join(config.src_stylesheets, '/**/*.scss'), ['styles']);
    gulp.watch(path.join(config.src_javascripts, '/**/*.js'), ['scripts']);
    gulp.watch(path.join(config.src_tmp, '/**/*.ss'), ['templates']);
});

// Prep
gulp.task('build', function (cb) {
    run('clean', 'bower', 'styles', 'scripts', 'templates', 'fonts', 'images', cb);
});

// Default
gulp.task('default', function(cb) {
    run('build', ['watch'], cb);
});