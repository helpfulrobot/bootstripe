'use strict';

module.exports = function (grunt) {
    // show elapsed time at the end
    require('time-grunt')(grunt);

    // load all grunt tasks
    require('load-grunt-tasks')(grunt);

    grunt.initConfig({

        // Configuration globals
        // ------------------------------------------------
        config: {
            // Must match the directory name of the theme
            themeName: 'bootstripe',
            themeDir: '/themes/<%= config.themeName %>'
        },

        // Clean up generated files
        // ------------------------------------------------
        clean: {
            main: [
                '.sass-cache',
                '.tmp',
                'css',
                'images',
                'javascript',
                'templates'
            ]
        },

        // Build tasks which can be run concurrently
        // ------------------------------------------------
        concurrent: {
            serve: [
                'compass:serve',
                'copy:serve',
                'copy:templates'
            ],
            dist: [
                'compass:dist',
                'copy:dist',
                'imagemin:dist',
                'svgmin:dist'
            ]
        },

        // Compass
        // ------------------------------------------------
        compass: {
            options: {
                sassDir: 'src/sass',
                importPath: 'bower_components'
            },
            serve: {
                options: {
                    cssDir: 'css'
                }
            },
            dist: {
                options: {
                    cssDir: '.tmp/css',
                    fontsDir: 'fonts'
                }
            }
        },

        // Copy files
        // ------------------------------------------------
        copy: {
            templates: {
                files: [
                    {
                        expand: true,
                        cwd: 'src/templates/',
                        src: ['**'],
                        dest: 'templates'
                    }
                ]
            },
            serve: {
                files: [
                    {
                        expand: true,
                        cwd: 'src/images/',
                        src: ['**'],
                        dest: 'images'
                    }, {
                        expand: true,
                        cwd: 'src/javascript/',
                        src: ['**'],
                        dest: 'javascript'
                    }
                ]
            },
            dist: {
                files: [
                    {
                        expand: true,
                        cwd: 'src/templates/',
                        src: ['**'],
                        dest: 'templates'
                    }, {
                        expand: true,
                        dot: true,
                        cwd: 'src',
                        dest: '',
                        src: [
                            '*.{ico,png,txt}'
                        ]
                    }
                ]
            }
        },

        // Optimise images
        // ------------------------------------------------
        imagemin: {
            dist: {
                options: {
                    cache: false
                },
                files: [
                    {
                        expand: true,
                        cwd: 'src/images',
                        src: '**/*.{gif,jpeg,jpg,png}',
                        dest: 'images'
                    }
                ]
            }
        },

        svgmin: {
            dist: {
                files: [
                    {
                        expand: true,
                        cwd: 'src/images',
                        src: '{,*/}*.svg}',
                        dest: 'images'
                    }
                ]
            }
        },

        // Convert any base urls to use the theme dir
        // ------------------------------------------------
        replace: {
            serve: {
                options: {
                    patterns: [
                        {
                            match: '/{themedir}/g',
                            replacement: '$ThemeDir/',
                            expression: true
                        }
                    ]
                },
                files: [
                    {
                        expand: true,
                        src: ['templates/**/*.ss'],
                        dest: ''
                    }
                ]
            },
            dist: {
                options: {
                    patterns: [
                        {
                            match: '/{themedir}/g',
                            replacement: '',
                            expression: true
                        }
                    ]
                },
                files: [
                    {
                        expand: true,
                        src: ['templates/**/*.ss'],
                        dest: ''
                    }
                ]
            },
            preMin: {
                options: {
                    patterns: [
                        {
                            match: '/href="css//g',
                            replacement: 'href="../css/',
                            expression: true
                        }, {
                            match: '/src="images//g',
                            replacement: 'src="../images/',
                            expression: true
                        }, {
                            match: '/src="javascript//g',
                            replacement: 'src="../javascript/',
                            expression: true
                        }
                    ]
                },
                files: [
                    {
                        expand: true,
                        src: ['templates/**/*.ss'],
                        dest: ''
                    }
                ]
            },
            postMin: {
                options: {
                    patterns: [
                        {
                            match: '/href="../css//g',
                            replacement: 'href="$ThemeDir/css/',
                            expression: true
                        }, {
                            match: '/src="../images//g',
                            replacement: 'src="$ThemeDir/images/',
                            expression: true
                        }, {
                            match: '/src="../javascript//g',
                            replacement: 'src="$ThemeDir/javascript/',
                            expression: true
                        }
                    ]
                },
                files: [
                    {
                        expand: true,
                        src: ['templates/**/*.ss'],
                        dest: ''
                    }
                ]
            }
        },

        // Parse the templates for usemin tasks
        // ------------------------------------------------
        useminPrepare: {
            options: {
                dest: './'
            },
            html: 'templates/**/*.ss'
        },

        // Apply vendor prefixes to css
        // ------------------------------------------------
        autoprefixer: {
            dist: {
                options: {
                    browsers: ['last 1 version']
                },
                dist: {
                    files: [
                        {
                            expand: true,
                            cwd: '.tmp/css',
                            src: '{,*/}*.css',
                            dest: '.tmp/css'
                        }
                    ]
                }
            }
        },

        // Renames files for browser caching purposes
        // ------------------------------------------------
        rev: {
            dist: {
                files: {
                    src: [
                        'css/**/*.css',
                        'images/**/*.{gif,jpeg,jpg,png,svg}',
                        'javascript/**/*.js'
                    ]
                }
            }
        },

        // Update references to minified files
        // ------------------------------------------------
        usemin: {
            html: ['templates/**/*.ss'],
            css: ['css/**/*.css'],
            options: {
                assetsDirs: [
                    'css',
                    'images',
                    'javascript'
                ]
            }
        },

        // Complete the minification of the templates
        // ------------------------------------------------
        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    removeCommentsFromCDATA: true,
                    collapseWhitespace: true,
                    collapseBooleanAttributes: true,
                    removeAttributeQuotes: true,
                    removeRedundantAttributes: true,
                    useShortDoctype: true,
                    removeEmptyAttributes: true
                },
                files: [
                    {
                        expand: true,
                        cwd: 'templates/',
                        src: '**/*.ss',
                        dest: 'templates/'
                    }
                ]
            }
        },

        // Watch for changes
        // ------------------------------------------------
        watch: {
            compass: {
                files: ['src/sass/{,*}/*.{scss,sass}'],
                tasks: ['compass:serve'],
                options: {
                    livereload: true
                }
            },
            serve: {
                files: ['src/images/**', 'src/javascript/**'],
                tasks: ['newer:copy:serve']
            },
            templates: {
                files: ['src/templates/**'],
                tasks: ['newer:copy:templates', 'newer:replace:serve'],
                options: {
                    livereload: true
                }
            },
            livereload: {
                files: ['src/images/**'],
                tasks: [],
                options: {
                    livereload: true
                }
            }
        }
    });

    // Watch Task
    // ------------------------------------------------------------------------
    grunt.registerTask('serve', [
        'clean',
        'concurrent:serve',
        'replace:serve',
        'watch'
    ]);

    // Build Task
    //
    // We have to run usemin twice as the paths to the revisioned css and js
    // are in the wrong place.
    // The first time concatenates any files, the second replaces with the rev.
    // ------------------------------------------------------------------------
    grunt.registerTask('build', [
        'clean',
        'concurrent:dist',
        'replace:dist',
        'useminPrepare',
        'autoprefixer',
        'concat',
        'cssmin',
        'uglify',
        'rev',
        'usemin',
        'replace:preMin',
        'usemin',
        'replace:postMin',
        'htmlmin'
    ]);

    // Default Task
    // ------------------------------------------------------------------------
    grunt.registerTask('default', [
        'serve'
    ]);
};
