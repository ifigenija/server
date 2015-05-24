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
            autoload_util: {
                cwd: 'module/Util',
                cmd: classmap_generator
            },
            autoload_max: {
                cwd: 'module/Max',
                cmd: classmap_generator
            },
            autoload_aaa: {
                cwd: 'module/Aaa',
                cmd: classmap_generator
            },
            autoload_App: {
                cwd: 'module/App',
                cmd: classmap_generator    
            },
            autoload_Produkcija: {
                cwd: 'module/Produkcija',
                cmd: classmap_generator
            },
            autoload_Koledar: {
                cwd: 'module/Koledar',
                cmd: classmap_generator
            },
            autoload_Prisotnost: {
                cwd: 'module/Prisotnost',
                cmd: classmap_generator
            },   
            autoload_abonmaji: {
                cwd: 'module/Abonmaji',
                cmd: classmap_generator
            },               
            autoload_prodaja: {
                cwd: 'module/Prodaja',
                cmd: classmap_generator
            },               
            autoload_stevilcenje: {
                cwd: 'module/Stevilcenje',
                cmd: classmap_generator
            },      
            autoload_testAssets: {
                cwd: 'tests/TestAssets',
                cmd: classmap_generator
            },               

            proxies: {
                cmd: function () {
                    if (os.platform() === 'win32') {
                        return 'bin\\util.bat orm:generate-proxies';
                    }
                    return  'php ./bin/util.php  orm:generate-proxies';
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

    grunt.loadNpmTasks('grunt-exec');

// Default task(s).
    grunt.registerTask('default', [  'exec']);

};
