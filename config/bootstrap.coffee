###*
Bootstrap
(sails.config.bootstrap)

An asynchronous bootstrap function that runs before your Sails app gets lifted.
This gives you an opportunity to set up your data model, run jobs, or perform some special logic.

For more information on bootstrapping your app, check out:
http://sailsjs.org/#/documentation/reference/sails.config/sails.config.bootstrap.html
###
Promise = require("bluebird")
module.exports.bootstrap = (cb) ->
  
  Role.count()
  .then (roles) ->
    if roles == 0
      Role.create {name:"Admin"}
  .then ->
    Role.count {default: true}
  .then (defaults) ->
    if defaults == 0
      Role.create {name:"Writer", default: true}
  .then -> Promise.all [ User.count(), Role.findOne {name:"Admin"} ]
  .then (results) ->
    users = results[0]
    admin = results[1]
    if users == 0
      User.create({username:"admin", password:"admin", role: admin.id})
  # It's very important to trigger this callback method when you are finished
  # with the bootstrap!  (otherwise your server will never lift, since it's waiting on the bootstrap)
  cb()
  return
