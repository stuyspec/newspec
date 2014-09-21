keystone = require("keystone")
uniqueValidator = require('mongoose-unique-validator')
Types = keystone.Field.Types

Year = new keystone.List 'Year'
Year.add
    year: 
        type: Types.Number
        required: true
        initial: true
        index: true
        unique: true
        format: '0'

    issues: 
        type: Types.Relationship
        ref: 'Issue'
        required: false
        multi: true

Year.schema.plugin uniqueValidator, { message: "Year must be unique" }
Year.defaultColumns = 'year'
Year.register()
