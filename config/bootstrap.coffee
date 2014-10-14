###
Bootstrap
(sails.config.bootstrap)

An asynchronous bootstrap function that runs before your Sails app gets lifted.
This gives you an opportunity to set up your data model, run jobs, or perform some special logic.

For more information on bootstrapping your app, check out:
http://sailsjs.org/#/documentation/reference/sails.config/sails.config.bootstrap.html
###
Promise = require("bluebird")
module.exports.bootstrap = (cb) ->
  first_run = false
  Role.count() # check to see if there are any Roles
  .then (roles) ->
    if roles == 0 # if not this is the first run and we'd better set up some default Roles
      first_run = true
  .then ->
    if first_run
      Promise.all
        [
          Role.create
            name: "Admin"

          Role.create
            name: "Editor-in-Chief"

          Role.create
            name: "Editor"

          Role.create
            name: "Writer"

        ]
  .then ->
    Role.count {default: true} # check if there is a default role set
  .then (defaults) ->
    if defaults == 0
      Role.update {name:"Writer"}, {default: true} # if no default set the Writer as default
  .then -> Promise.all [ User.count(), Role.findOne {name:"Admin"} ] # get the number of Users and the Admin Role
  .then (results) ->
    users = results[0]
    admin = results[1]
    if users == 0
      User.create({username:"admin", password:"admin", role: admin.id}) # so we can create an Admin user

  # It's very important to trigger this callback method when you are finished
  # with the bootstrap!  (otherwise your server will never lift, since it's waiting on the bootstrap)
  cb()
  return
