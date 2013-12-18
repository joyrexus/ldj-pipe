# Basic Demo

* increment each `id` attribute by one 
* split the `name` attribute into `first` and `last`
* ignore everything else


## Usage

    cat in.ldj | filter.coffee > out.ldj

... or:

    filter.coffee < in.ldj > out.ldj


## Input

The given input (`in.ldj`):

    { "id": 0, "name": "Fred Jones", "age": 40, "sex": "M" }
    { "id": 1, "name": "Mary Jones", "age": 38, "sex": "F" }
    { "id": 2, "name": "Davy Jones", "age": 12, "sex": "M" }


## Output

The desired output (`out.ldj`):

    { "id": 1, "first": "Fred", "last": "Jones" }
    { "id": 2, "first": "Mary", "last": "Jones" }
    { "id": 3, "first": "Davy", "last": "Jones" }


## Filter

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
