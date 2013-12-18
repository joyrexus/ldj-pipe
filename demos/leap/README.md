# Leap Demo

* increment each `id` attribute by one 
* split the `name` attribute into `first` and `last`
* ignore everything else


## Usage

    cat in.ldj | filter.coffee > out.ldj

... or:

    filter.coffee < in.ldj > out.ldj


## Input

The given input (`in.ldj`):

    ...


## Output

The desired output (`out.ldj`):

    ...


## Filter

```coffeescript
pipe = require 'ldj-pipe'

filter = (d) ->
  # extract and transform incoming data element
  # then return the set of desired attributes

pipe.through filter
```
