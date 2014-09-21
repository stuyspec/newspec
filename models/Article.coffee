keystone = require("keystone")
Types = keystone.Field.Types

Article = new keystone.List 'Article'
Article.add
    title:
        type: String
        required: true
        initial: true
    
    authors:
        type: Types.Relationship
        ref: 'Author'
        required: true
        multi: true
        initial: true

    status: 
        type: String
        required: true
        default: 'draft'

    pad_id:
        type: String
        required: false #true
        inital: false
    
    section:
        type: String
        required: false

    publish_date:
        type: Date
        required: false

Article.relationship
    path: 'issue'
    ref: 'Issue'
    refPath: 'article'

Article.defaultColumns = 'title, author, status, publish_date'
Article.register()
