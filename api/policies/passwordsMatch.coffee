module.exports = (req, res, next) ->
    if not req.body.confirm? then res.badRequest "Password confirmation is required"
    else if req.body.password isnt req.body.confirm
      res.badRequest "Passwords do not match"
    else next()

