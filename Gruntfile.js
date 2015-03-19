module.exports = function (grunt) {

    var os = require('os');
    var classmap_generator = function () {
        if (os.platform() === 'win32') {
            return '..\\..\\vendor\\bin\\classmap_generator.php.bat';
        }
        return  '../../vendor/bin/classmap_generator.php';
    };

// Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jshint: {
            files: ['Gruntfile.js', 'public/js/app/**/*.js'],
            options: {
                curly: true,
                eqeqeq: true,
                immed: true,
                latedef: true,
                newcap: true,
                noarg: true,
                sub: true,
                undef: true,
                boss: true,
                eqnull: true,
                browser: true,
                multistr: true,
                scripturl: true,
                globals: {
                    // Globals defined by RequireJS
                    define: false,
                    console: false,
                    // Globals defined by QUnit
                    require: false,
                    module: false

                }
            }
        },
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            build: {
                src: 'src/<%= pkg.name %>.js',
                dest: 'build/<%= pkg.name %>.min.js'
            }
        },
        requirejs: {
            compile: {
                options: {
                    baseUrl: "public/js",
                    paths: {
                        'application': 'app/application',
                        'underscore': 'lib/underscore',
                        'bootstrap': 'lib/bootstrap',
                        'jquery': 'lib/jquery',
                        'jquery.fileupload': 'lib/jquery.fileupload',
                        'jquery.ui.widget': 'lib/jquery.ui.widget',
                        'backbone': 'lib/backbone',
                        'text': 'lib/text',
                        'marionette': 'lib/backbone.marionette',
                        'backgrid': 'lib/backgrid',
                        'pageable': 'lib/pageable',
                        'backbone-forms': 'lib/backbone-forms',
                        'deep-model': 'lib/backbone-deep-model',
                        'backbone-modal': 'lib/backbone-modal',
                        'jquery.jsonrpc': 'lib/jquery.jsonrpcclient',
                        'moment': 'lib/moment'
                    },
                    shim: {
                        underscore: {
                            exports: '_'
                        },
                        backbone: {
                            deps: ['jquery', 'underscore'],
                            exports: 'Backbone'
                        },
                        marionette: {
                            deps: ['jquery', 'underscore', 'backbone'],
                            exports: 'Marionette'
                        },
                        backgrid: {
                            deps: ['jquery', 'backbone', 'underscore'],
                            exports: 'Backgrid'
                        },
                        'bootstrap': ['jquery'],
                        'lib/bootstrap-datepicker': ['jquery', 'bootstrap'],
                        'lib/dx.chartjs': ['jquery', 'lib/globalize.sl'],
                        'lib/globalize.sl': ['lib/globalize'],
                        'lib/globalize': {
                            exports: 'Globalize'
                        }
                    },
                    noGlobal: true,
                    dir: 'public/js/optimized',
                    findNestedDependencies: true,
                    removeCombined: true,
                    preserveLicenseComments: false,
                    stubModules: ['text'],
                    fileExclusionRegExp: /^\./,
                    uglify: {
                        toplevel: true,
                        ascii_only: true,
                        max_line_length: 1000,
                        no_mangle: true,
                        report: 'gzip'
                    },
                    modules: [
                        {
                            name: 'application',
                            exclude: ['baseUrl',
                                'jquery',
                                'backbone',
                                'underscore',
                                'moment',
                                'marionette',
                                'backbone-modal',
                                'lib/dx.chartjs',
                                'deep-model',
                                'bootstrap',
                                'lib/bootstrap-datepicker',
                                'backgrid',
                                'jquery.fileupload',
                                'jquery.ui.widget'
                            ]
                        },
                        {
                            name: 'lib/dx.chartjs',
                            exclude: ['jquery', 'lib/globalize', 'lib/globalize.sl', 'baseUrl']
                        }
                    ]
                }
            }
        },
        cssmin: {
            combine: {
                files: {
                    "public/css/site.min.css": [
                        'public/css/bootstrap.css',
                        'public/css/backgrid.css',
                        'public/css/max-backgrid.css',
                        'public/css/font-awesome.css',
                        'public/css/site.css',
                        'public/css/layout.css'
                    ]
                }

            }
        },
        exec: {
            autoload_logistika: {
                cwd: 'module/Logistika',
                cmd: classmap_generator

            },
            autoload_aaa: {
                cwd: 'module/Aaa',
                cmd: classmap_generator
            },
            autoload_TestAssets: {
                cwd: 'module/TestAssets',
                cmd: classmap_generator
            },
            autoload_vfs: {
                cwd: 'module/Vfs',
                cmd: classmap_generator
            },
            autoload_workflow: {
                cwd: 'module/Workflow',
                cmd: classmap_generator
            },
            proxies: {
                cmd: function () {
                    if (os.platform() === 'win32') {
                        return 'bin\\ifi.bat orm:generate-proxies';
                    }
                    return  './vendor/bin/doctrine-module orm:generate-proxies';
                }

            },
            clean_config: {
                cmd: function () {
                    if (os.platform() === 'win32') {
                        return 'del data\\module-config-cache.4q6dayvdr46we87rw9er3224.php';
                    }
                    return  'rm -f data/module-config-cache.4q6dayvdr46we87rw9er3224.php';
                }
            },
            clean_tmp: {
                cmd: function () {
                    if (os.platform() === 'win32') {
                        return 'del data\\tmp\\html*';
                    }
                    return  'rm -f data/tmp/html*';
                }
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-contrib-qunit');
    grunt.loadNpmTasks('grunt-contrib-jshint');

// Default task(s).
    grunt.registerTask('default', ['cssmin', 'requirejs', 'exec', 'jshint']);

};
