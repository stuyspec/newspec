passport = require "passport"
####### ACTIONS ################
module.exports =
  #CREATE SESSION
  process: (req, res) ->
    passport.authenticate("local", (err, user, info) ->
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
  if req.wantsJSON then res.badRequest "Authentication failed"
  else res.redirect "/login"

login_fail = (req, res) ->
  if req.wantsJSON then res.badRequest "Login failed"
  else res.redirect "/login"

login_success = (req, res) ->
  if req.wantsJSON then res.ok "Login successful"
  else res.redirect "/" unless req.wantsJSON

