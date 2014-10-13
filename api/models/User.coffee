Promise = require("bluebird")
bcrypt = Promise.promisifyAll require('bcrypt')
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
    console.log "start beforeCreate"
    delete user.confirm
    console.log "confirm deleted"

    bcrypt.genSaltAsync 10
    .then (salt) ->
      console.log "salt generated"
      bcrypt.hashAsync user.password, salt
    .then (hash) ->
      console.log "password hashed"
      user.password = hash
      console.log "hash set as password"
    .then ->
      if not user.role? then Role.getDefault().then (def) ->
        user.role = def
        console.log "role set"
    .then ->
      Profile.create()
    .then (prof) ->
      user.profile = prof.id
    .finally ->
      cb null, user
    , ->
      console.log err
      cb err, null

  afterCreate: (user, cb) ->
    console.log "start afterCreate"
    Profile.update(user.profile, {user: user.id})
    .then ->
      console.log "updated profile with id"
      cb null, user
    , ->
      console.log err
      cb err, null
