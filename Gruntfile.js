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
            autoload_programdela: {
                cwd: 'module/ProgramDela',
                cmd: classmap_generator
            },
            autoload_testAssets: {
                cwd: 'tests/TestAssets',
                cmd: classmap_generator
            },
            autoload_zapisi: {
                cwd: 'module/Zapisi',
                cmd: classmap_generator
            },
            autoload_zapisi: {
                cwd: 'module/Jobs',
                cmd: classmap_generator
            },
            proxies: {
                cmd: function () {
                    if (os.platform() === 'win32') {
                        return 'bin\\util.bat orm:generate-proxies';
                    }
                    return  'php ./bin/util.php  orm:generate-proxies';
                }
            }
        },
        clean: {
            config: [
                "data/module*"
            ]
        }
    });

    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-contrib-clean');

// Default task(s).
    grunt.registerTask('default', ['exec', "clean"]);

};
