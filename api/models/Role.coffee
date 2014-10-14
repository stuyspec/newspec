module.exports =
  types:
    capabilities: (caps)->
      for cap in caps
        return false if not (/^[a-zA-Z-_]*$/).test(cap)
      return true
  attributes:
    name:
      type: 'string'
      required: true
      unique: true
      alpha: true

    caps:
      type: 'array'
      defaultsTo: []

    default:
      type: 'boolean'
      defaultsTo: false

    addCap: (cap) ->
      @caps.push cap
      @save()
    
    can: (cap) ->
      @name == "Admin" || @caps.indexOf cap > 0

  getDefault: -> Role.findOne({default: true})
