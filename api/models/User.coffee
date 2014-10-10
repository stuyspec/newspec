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

        profile:
            model: 'profile'

        role:
            model: 'role'

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
#        Profile.create({user: user.id}).exec (err, created) ->
#            console.log 'profile create'
#            if err
#                console.log err
#                cb err
#            else 
#                #User.update( user.id, {profile: created.id} ).exec ->
#                console.log 'user update'
#                user.profile = created.id
#                cb null, user
#            return

        return
