Promise = require("bluebird")
bcrypt = Promise.promisifyAll require('bcrypt')
module.exports =
  attributes:
    name:
      type: 'string'
      required: true
      alpha: true

    members:
      collection: 'user'
      via: 'department'
  
    addMember: (user) ->
      user.department = @id
      user.save()

    getEditors: ->
      Role.findOne({name:"Editor"})
      .then (editor) ->
        User.find({department: @id, role: editor.id})
