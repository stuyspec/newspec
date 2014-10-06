module.exports = 
    types:
        capabilities: (caps)->
            return false if not (/^[a-zA-Z-_]*$/).test(cap) for cap in caps
            return true
    attributes:
        name:
            type: 'string'
            required: true
           # unique: true
           # alpha: true

        caps:
            type: 'array'
           # required: true
           # default: []
           # array: true
           # capabilities: true

