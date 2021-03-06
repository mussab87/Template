// ***********************************************************************
// Assembly         : Edu
// Author           : Ali Aljarrah && Walid Azouzi
// Created          : 02-23-2020
//
// Last Modified By : Ali Aljarrah && Walid Azouzi
// Last Modified On : 10-14-2019
// ***********************************************************************
// <copyright file="Gruntfile.js" company="Expert Systems">
//     Copyright ?  2019
// </copyright>
// <summary></summary>
// ***********************************************************************
'use strict';

module.exports = function (grunt) {
	
	/// <summary>
	/// </summary>
	/// <param name="grunt">The grunt.</param>
	var fs = require('fs');
	var mochaPath = fs.realpathSync('./node_modules/.bin/mocha');

  grunt.initConfig(
    { pkg: grunt.file.readJSON('package.json')

    , watch:
      { test:
        { files:  [ 'Gruntfile.js'
                  , 'test.js'
                  , 'moment-hijri.js'
                  ]
        , tasks: 'test'
        , options:
          { atBegin: true
          }
        }
      }

    , uglify:
      { min:
        { files:
          { 'moment-hijri-min.js': 'moment-hijri.js'
          }
        }
      }

    , jshint:
      { options: '<%= pkg.jshintConfig %>'

      , grunt: { files: { src: 'Gruntfile.js' } }

      , test:
        { files: { src: 'test.js' }
        , options:
          { expr: true
          , globals:
            { describe: false
            , it: false
            }
          }
        }

      , source: { files: { src: 'moment-hijri.js' } }
      }

    , shell:
      { mocha:
        { command: mochaPath
                 + ' -R spec'
                 + ' -u bdd'
                 + ' -c'
                 + ' --check-leaks'
                 + ' test.js'
        , options:
          { stdout: true
          , stderr: true
          , failOnError: true
          }
        }
      }
    }
  )

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-shell')

  grunt.registerTask('default', ['build'])
  grunt.registerTask('test', ['jshint', 'shell:mocha'])
  grunt.registerTask('build', ['test', 'uglify:min'])
  grunt.registerTask('dev', ['watch:test'])

}
