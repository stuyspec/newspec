bcrypt = require("bcrypt")
module.exports =
  attributes:
    username:
      type: "string"
      required: true
      unique: true

    password:
      type: "string"
      required: true


    #Override toJSON method to remove password from API
    toJSON: ->
      obj = @toObject()
      delete obj.password
      obj

  beforeCreate: (user, cb) ->
    delete user.confirm

    bcrypt.genSalt 10, (err, salt) ->
      bcrypt.hash user.password, salt, (err, hash) ->
        if err
          console.log err
          cb err
        else
          user.password = hash
          cb null, user
        return

      return

    return

