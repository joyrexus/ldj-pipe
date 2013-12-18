#!/usr/bin/env coffee 
pipe = require '../../index'

filter = (d) ->
  id:        d.id
  hands:     d.hands
  timestamp: d.timestamp

pipe.through filter
