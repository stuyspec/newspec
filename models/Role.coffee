keystone = require "keystone"
Types = keystone.Field.Types
Role = new keystone.List "Role"
User = keystone.list('User')

Role.add
    name: 
        type: Types.Text
        required: true
        index: true

Role.schema.add
    capabilities:
        type: [String]

Role.relationship
    path: 'users'
    ref: 'User'
    refPath: 'role'

Role.schema.virtual 'count', ->
   User.find().where('role', this._id).count()

Role.defaultColumns = "name, count"
Role.register()
