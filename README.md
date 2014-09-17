The Stuyvesant Spectator
========================

This will be the custom CMS for the Stuyvesant Spectator

Models
------

### Models Concerning Users


#### User
````
User:
    name: Types.Name, required, index
    email: Types.Email, initial, required, index
    password: Types.Password, initial, required
    bio: String
    pic: path/to/pic.jpg 
    role: Role
```

#### Role
````
Role:
    name: Types.name
    abilities: [String]
```

#### Department
````
Department:
    Members: [User]
    Editors: [User]
```

### Models Concerning Articles


#### Article
````
Article:
    author(s): [User]
    content: Etherpad Changest idk
    html_contnet: String
    department: Department
    status: string
    publish_date: Date
    issue: Issue
    tags: Tag
```

#### Year
````
Year:
    year: 4-digit num
    issues: [Issue]
```

#### Issue
````
Issue:
   issue: num 
   year: Year
   articles: [Article]
```

#### Tag
````
Tag:
    name: String
    slug: String
```



Depencies
---------

[NodeJS](http://nodejs.org/), [KeystoneJS](http://keystonejs.com/), and [EtherPad](http://etherpad.org/).
