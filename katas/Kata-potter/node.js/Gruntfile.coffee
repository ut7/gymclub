module.exports = (grunt) ->

  # Import plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-simple-mocha'

  grunt.initConfig
    watch:
      tests:
        files: ['app/**/*', 'test/**/*']
        tasks: ['simplemocha']
    simplemocha:
      options:
        globals: ['should']
        timeout: 3000
        ignoreLeaks: false
        ui: 'bdd'
        reporter: 'nyan'
      all:
        src: "test/**/*"

  # Default task.
  grunt.registerTask 'default', ['simplemocha']
