bcrypt = require("bcrypt")
module.exports =
    attributes:
        username:
            type: "string"
            primaryKey: true
            required: true
            unique: true

        password:
            type: "string"
            required: true

        profile:
            model: 'profile'

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

    afterCreate: (user, cb) ->
        Profile.create({user: user.id}).exec (err, created) ->
            if err
                console.log err
                cb err
            else 
                User.update( user.id, {profile: created.id} ).exec ->
                    cb null, user
                    return
                #user.profile = created.id
                #cb null, user
            return
        return
    _config: 
        autoPK: false
