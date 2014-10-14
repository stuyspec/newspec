module.exports =
  attributes:
    title:
      type: 'string'
      required: true

    author:
      collection: "user"
      via: "articles"
      dominant: true
      required: true

    department:
      model: 'department'

    status:
      type: 'string'
      enum: ["draft", "editor", "eic", "pending", "published"]
      defaultsTo: 'draft'
      required: true

    publish_date:
      type: 'datetime'
