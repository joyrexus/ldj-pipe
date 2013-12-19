# ldj-pipe


This module enables quick creation of unix-style [filters](http://en.wikipedia.org/wiki/Filter_(Unix)) for [line-delimited JSON](http://en.wikipedia.org/wiki/Line_Delimited_JSON).

It provides the [pipeline](http://en.wikipedia.org/wiki/Pipeline_(Unix)) ...

    LDJSON via STDIN  >  FILTER  >  STDOUT
                         ******

... and you provide the filter to pipe each line of JSON through: 

![filter](filter.gif)


## Usage

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

So, the filter we define takes a single argument: a parsed line of JSON coming
from upstream (STDIN).  You can then extract attributes from this object and return a transformed object to be sent downstream (STDOUT).

The parsing and serialization for each line of JSON is handled for you.  All
you need to do is specify how the filtering and transformation for a given line is to be done.

We can then use the resulting filter as follows:

    cat in.ldj | filter.coffee > out.ldj

... or:

    filter.coffee < in.ldj > out.ldj

In general:

    STREAM OF LDJSON | YOUR FILTER [ | FURTHER FILTERING ]


## Install

    npm install -g ldj-pipe


## See also

The `ldj-pipe` module streams STDIN through the filter you define to STDOUT.
If you need to control the streams you're piping from and to, I'd recommend
using [ldjson-stream](https://github.com/maxogden/ldjson-stream).

The following command-line options are nice alternatives if you're filtering
consists mostly of selecting attributes and reshaping them into some new form
without a lot of conditional or calculational logic:

* [logmap](https://github.com/hij1nx/logmap) which uses [JSONSelect](http://jsonselect.org) selection syntax.

* [jq](http://stedolan.github.io/jq/) - like `sed` for JSON.
