module.exports = 
    attributes:
        first: 'string'
        last: 'string'
        name: -> first + last
        
        email: 
            type: 'string'
            email: true

        pic: 'string'

        user: 
            model: 'user'
