Promise = require("bluebird")
bcrypt = Promise.promisifyAll require('bcrypt')
module.exports =
  attributes:
    name:
      type: 'string'
      required: true
      alpha: true

    articles:
      collection: 'article'
      via: 'department'

    members:
      collection: 'user'
      via: 'department'
  
    addMember: (user) ->
      user.department = @id
      user.save()

    getEditors: ->
      Role.findOne {name:"Editor"}
      .then (editor) ->
        User.find {department: @id, role: editor.id}
