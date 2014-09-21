keystone = require("keystone")
Types = keystone.Field.Types

Issue = new keystone.List 'Issue'
Issue.add 
    issue:
        type: Types.Number
        required: true
        initial: true
        index: true

    articles:
        type: Types.Relationship
        ref: 'Article'
        required: false
        multi: true

Issue.relationship
    path: 'year'
    ref: 'Year'
    refPath: 'issues'

Issue.defaultColumns = 'issue'
Issue.register()
