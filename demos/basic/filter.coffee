#!/usr/bin/env coffee 
pipe = require '../../index'

filter = (d) ->

  # extract and transform incoming data element
  id = d.id + 1
  [first, last] = d.name.split ' '

  # return the set of desired attributes
  id:    id
  first: first
  last:  last

pipe.through filter
