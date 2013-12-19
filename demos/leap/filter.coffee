#!/usr/bin/env coffee 
pipe = require '../../index'

filter = (frame) ->
  id:        frame.id
  hands:     frame.hands
  timestamp: frame.timestamp

pipe.through filter
