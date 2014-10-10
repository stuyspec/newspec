module.exports = 
    attributes:
        first: 'string'
        last: 'string'
        name: -> first + last
        
        email: 
            type: 'string'
            email: true

        pic: 'string'

        default:
            type: 'boolean'
            defaultTo: false
        
        user: 
            model: 'user'

    getDefault: (cb) ->
       Profile.findOne({default: true}).exec (err, found) ->
           if err? then cb err, null
           else cb null, found

    setDefault: (q, cb) ->
        @getDefault (err, def) ->
            if err? then cb err, null
            else Profile.update(def, {default: false})
        Profile.update(q, {default: true})
