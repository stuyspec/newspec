keystone = require("keystone")
Types = keystone.Field.Types

###*
User Model
==========
###
User = new keystone.List("User")
User.add
  name:
    type: Types.Name
    required: true
    index: true

  email:
    type: Types.Email
    initial: true
    required: true
    index: true

  password:
    type: Types.Password
    initial: true
    required: true
, "Permissions",
  isAdmin:
    type: Boolean
    label: "Can access Keystone"
    index: true

User.relationship
    path: 'author'
    ref: 'Author'
    refPath: 'user'

# Provide access to Keystone
User.schema.virtual("canAccessKeystone").get ->
  @isAdmin


###*
Registration
###
User.defaultColumns = "name, email, isAdmin"
User.register()
