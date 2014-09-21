keystone = require("keystone")
uniqueValidator = require('mongoose-unique-validator')
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
        unique: true

    role:
        type: Types.Relationship
        ref: 'Role'
        required: false

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

User.schema.plugin uniqueValidator, { message: "Email must be unique" }

###*
Registration
###
User.defaultColumns = "name, email, isAdmin, role"
User.register()
