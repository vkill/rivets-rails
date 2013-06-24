module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    meta:
      banner:
        '// rivets.custom_by_vkill.js\n' +
        '// version: <%= pkg.version %>\n' +
        '// author: <%= pkg.author %>\n' +
        '// license: <%= pkg.licenses[0].type %>\n'

    coffee:
      all:
        files:
          'dist/rivets.custom.configure.js': 'src/rivets.custom.configure.coffee'
          'dist/rivets.custom.binders.js': 'src/rivets.custom.binders.coffee'
          'dist/rivets.custom.formatters.js': 'src/rivets.custom.formatters.coffee'
          'dist/rivets.custom.general_adapter.js': 'src/rivets.custom.general_adapter.coffee'         
          # 'dist/rivets.custom.Backbone_adapter.js': 'src/rivets.custom.Backbone_adapter.coffee'
          # 'dist/rivets.custom.Watch_adapter.js': 'src/rivets.custom.Watch_adapter.coffee'
          # 'dist/rivets.custom.CanJS_adapter.js': 'src/rivets.custom.CanJS_adapter.coffee'
          # 'dist/rivets.custom.Spine_adapter.js': 'src/rivets.custom.Spine_adapter.coffee'
          # 'dist/rivets.custom.Spine_adapter.js': 'src/rivets.custom.Spine_adapter.coffee'
    
    concat:
      all:
        options:
          banner: '<%= meta.banner %>'
        files:
          'dist/rivets.general_custom.js': [
            'dist/rivets.custom.configure.js',
            'dist/rivets.custom.binders.js',
            'dist/rivets.custom.formatters.js',
            'dist/rivets.custom.general_adapter.js'
          ]

    uglify:
      all:
        options:
          banner: '<%= meta.banner %>'
          report: 'gzip'
        files:
          'dist/rivets.general_custom.js.min.js': 'dist/rivets.general_custom.js'
    
    copy:
      main:
        files: [
          {expand: true, flatten: true, src: ['dist/**'], dest: 'vendor/assets/javascripts/'}
        ]

    watch:
      all:
        files: ['src/*.coffee']
        tasks: ['build']
    


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build',   ['coffee', 'concat', 'uglify', 'copy']
