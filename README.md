The Stuyvesant Spectator
========================

This will be the custom CMS for the Stuyvesant Spectator

Models
------

### Models Concerning Users


#### User
```
User:
    name: Types.Name, required, index
    email: Types.Email, initial, required, index
    password: Types.Password, initial, required
    pic: path/to/pic.jpg
    role: Role
    author: Author, optional
```

#### Role
```
Role:
    name: Types.name
    abilities: [String]
```

### Models Concerning Articles


#### Article
```
Article:
    author(s): [Author]
    content: Etherpad Changest idk
    html_contnet: String
    department: Department
    status: string
    publish_date: Date
    issue: Issue
    tags: Tag
```

#### Author
```
Author:
    name: Types.Name, required, index
    bio: String
    pic: path/to/pic.jpg
    user: User, optional
```

#### Year
```
Year:
    year: 4-digit num
    issues: [Issue]
```

#### Issue
```
Issue:
   issue: num
   year: Year
   articles: [Article]
```

#### Tag
```
Tag:
    name: String
    slug: String
```

TODO (planning of course, everything is techinically 'TODO')
------------------------------------------------------------
- [x] diffrentiate User from Author, but link them
- [ ] photo spreads
- [ ] captions
- [ ] general storage or integration with external service


Depencies
---------

[NodeJS](http://nodejs.org/), [KeystoneJS](http://keystonejs.com/), and [EtherPad](http://etherpad.org/).

