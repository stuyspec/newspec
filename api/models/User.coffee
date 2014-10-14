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

    can: (cap) ->
      @role.can cap

    department:
      model: 'department'

    articles:
      collection: 'article'
      via: 'author'

    #Override toJSON method to remove password from API
    toJSON: ->
      obj = @toObject()
      delete obj.password
      obj

  beforeCreate: (user, cb) ->
    delete user.confirm
## generate salt
    bcrypt.genSaltAsync 10
## hash password
    .then (salt) ->
      bcrypt.hashAsync user.password, salt
## set hash as password
    .then (hash) ->
      user.password = hash
## set role to default if unset
    .then ->
      if not user.role? then Role.getDefault().then (def) ->
        user.role = def.id
## create a new profile
    .then ->
      Profile.create()
## set the new profile to the user
    .then (prof) ->
      user.profile = prof.id
## if no errors throughout, callback with user
    .finally ->
      cb null, user
## if errors, callback with errors
    , ->
      console.log err
      cb err, null

  afterCreate: (user, cb) ->
## now that the user has been created and has an id
## update his profile with the id
    Profile.update(user.profile, {user: user.id})
    .then ->
      cb null, user
    , ->
      console.log err
      cb err, null
