# ldj-pipe

This module enables quick creation of unix-style filters for [line-delimited JSON](http://en.wikipedia.org/wiki/Line_Delimited_JSON).

For example, suppose we're given the following input:

    { "id": 0, "name": "Fred Jones", "age": 40, "sex": "M" }
    { "id": 1, "name": "Mary Jones", "age": 38, "sex": "F" }
    { "id": 2, "name": "Davy Jones", "age": 12, "sex": "M" }

... and desire the following output:

    { "id": 1, "first": "Fred", "last": "Jones" }
    { "id": 2, "first": "Mary", "last": "Jones" }
    { "id": 3, "first": "Davy", "last": "Jones" }

In other words, we want to ...

* increment each `id` attribute by one 
* split the `name` attribute into `first` and `last`
* ignore everything else

We can use `ldj-pipe` to produce the needed filter:

```coffeescript
pipe = require 'ldj-pipe'

filter = (d) ->

  # extract and transform incoming data element
  id = d.id + 1
  [first, last] = d.name.split ' '

  # return the set of desired attributes
  id:    id
  first: first
  last:  last

pipe.through filter
```

We can then use the resulting filter as follows:

    cat in.ldj | filter.coffee > out.ldj

... or:

    filter.coffee < in.ldj > out.ldj


## Install

    npm install -g ldj-pipe


## See also

* [logmap](https://github.com/hij1nx/logmap) which uses [JSONSelect](http://jsonselect.org) selection syntax.

* [jq](http://stedolan.github.io/jq/)

