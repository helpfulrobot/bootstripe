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
    svgmin          =   require('gulp-svgmin'),
    cache           =   require('gulp-cache'),
    watch           =   require('gulp-watch'),
    bower           =   require('gulp-bower')
    ;

var config = {
    // Source Config
    src_tmp             :    './src/templates/',                    // Source Templates Directory
    src_fonts           :    './src/assets/fonts/',                 // Source Fonts Directory
    src_images          :    './src/assets/images/',                   // Source Images Directory
    src_javascripts     :    './src/javascript/',                   // Source Javascripts Directory
    src_stylesheets     :    './src/sass/',                         // Source Styles Sheets Directory
    src_main_scss       :    './src/sass/layout.scss',              // Source main.scss
    src_main_js         :    './src/javascript/main.js',            // Source main.js
    // Destination Config
    dist_fonts          :    './fonts/',               // Destination Fonts Directory
    dist_images         :    './images/',                 // Destination Images Directory
    dist_javascripts    :    './javascript/',                  // Destination Javascripts Directory
    dist_stylesheets    :    './css/',                 // Destination Styles Sheets Directory
    // Bower Config
    bower               :    './bower_components/',             // Bower Components
    // Auto Prefixer
    autoprefix          :    'last 3 version',                  // Number of version Auto Prefixer to use
    // Server
    host                :    'localhost',                       // Webserverhost
    port                :    8080                                 // Webserver port
};

// Styles
gulp.task('styles', function () {
    return gulp.src(config.src_main_scss)
        .pipe(sass({
            outputStyle: 'expanded',
            precision: 10,
            includePaths: config.bower
        }))
        .pipe(autoprefixer(config.autoprefix))
        //.pipe(minify())
        .pipe(gulp.dest(config.dist_stylesheets))
        .pipe(sync.reload({stream:true}))
});

// Minify

// Scripts
gulp.task('scripts', function () {
    return gulp.src(config.src_main_js)
        .pipe(include())
        //.pipe(uglify())
        .pipe(gulp.dest(config.dist_javascripts))
        .pipe(sync.reload({stream:true}))
});

// Uglify

// Templates
gulp.task('templates', function() {
    return gulp.src([path.join(config.src, '/**/*.ss')])
        .pipe(gulp.dest(config.tmp))
        .pipe(sync.reload({stream:true}))
});

// Image
gulp.task('images', function() {
    return gulp.src(path.join(config.src_images, '/**/*.png'))
        .pipe(cache(imagemin({ optimizationLevel: 5, progressive: true, interlaced: true })))
        .pipe(gulp.dest(config.dist_images))
});

// SVG
gulp.task('svg', function() {
    return gulp.src(path.join(config.src_images, '/**/*.svg'))
        .pipe(svgmin())
        .pipe(gulp.dest(config.dist_images))
});

// Fonts
gulp.task('fonts', function () {
    return gulp.src(path.join(config.src_fonts, '/**/*'))
        .pipe(connect.reload())
        .pipe(gulp.dest(config.dist_fonts));
});

// Clean
//gulp.task('clean', function() {
//    del(path.join(config.dist, '/**/*'))
//});

// Watch
gulp.task('watch', function() {
    sync({
        proxy: config.host + ':' + config.port
    });

    gulp.watch(path.join(config.src_stylesheets, '/**/*.scss'), ['styles']);
    gulp.watch(path.join(config.src_javascripts, '/**/*.js'), ['scripts']);
    gulp.watch(path.join(config.src, '/**/*.ss'), ['templates']);
});

// Prep
gulp.task('prep', function (cb) {
    run(/*'clean', */'styles', 'scripts', 'php', 'images', 'svg', cb);
});

// Default
gulp.task('default', function(cb) {
    run('prep', ['watch'], cb);
});

// Build
gulp.task('build', function (cb) {
    run('prep', 'minify', 'uglify', cb);
});

// TODO: Add minify and uglify to css and scripts