passport = require "passport"
####### ACTIONS ################
module.exports =
  #CREATE SESSION
  process: (req, res) ->
    console.log 'controller called'
    passport.authenticate("local", (err, user, info) ->
      console.log 'start auth'
      if (err) or (not user)
        auth_fail(req, res)
      else
        req.logIn user, (err) ->
          if err then login_fail(req, res) else login_success(req, res)
          return
      return
    )(req, res)
    return

  #DESTROY SESSION
  logout: (req, res) ->
    req.logout()
    res.ok "Logout successful"
    res.redirect "/" unless req.wantsJSON
  _config: {}


####### HELPER FUNCTIONS ########
auth_fail = (req, res) ->
  console .log 'auth fail'
  res.badRequest "Authentication failed"
  res.redirect "/login" unless req.wantsJSON

login_fail = (req, res) ->
  console.log 'login fail'
  res.badRequest "Login failed"
  res.redirect "/login" unless req.wantsJSON

login_success = (req, res) ->
  console.log 'login succes'
  res.ok "Login successful"
  res.redirect "/" unless req.wantsJSON

