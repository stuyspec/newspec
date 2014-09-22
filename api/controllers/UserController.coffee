module.exports =
  ###
  #CREATE USER
  create: (req, res) ->
    User.create(
      username: req.params.username
      password: req.params.password
    ).exec (err, created) ->
      res.ok created
    return

  #READ USER
  findOne: (req, res) ->
    User.findByUsername(req.params.username).exec (err, found) ->
      if err then res.badRequest 'User not found' else
        res.ok found

  #UPDATE USER
  update: (req, res) ->
    permitted = ['username', 'password']
    User.update(req.params.username, _.pick(req.params.user, permitted)).exec (err, updated) ->
      if err then res.badRequest 'Error updating' else
        res.ok updated


  #DESTROY USER
  destroy: (req, res) ->
    User.destroy(req.params.username).exec (err) ->
      if err then res.badRequest 'Error destroying user' else
        res.ok 'User destroyed'
  ###
  _config: {}

# HELPER FUNCTIONS

