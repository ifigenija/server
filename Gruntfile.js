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
        exec: {          
            autoload_aaa: {
                cwd: 'module/Aaa',
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
