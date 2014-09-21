keystone = require 'keystone'
Types = keystone.Field.Types
###
User Model
==========
###

Author = new keystone.List 'Author'
Author.add
    name:
        type: Types.Name
        required: true
        inital: true
        index: true
    bio:
        type: Types.Textarea
        required: false
    pic: 
        type: Types.CloudinaryImage
        required: false
    user:
        type: Types.Relationship
        ref: 'User'

# get an author's articles
###
Author.schema.virtual('articles').get ->
    Article.find()
        .where 'author', this
###

###
Registration
============
###
Author.defaultColumns = 'name, user'
Author.register()
