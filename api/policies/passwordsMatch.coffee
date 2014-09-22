module.exports = (req, res, next) ->
  if req.params.username isnt req.params.confirm
    res.badRequest "Passwords do not match"
  next()

