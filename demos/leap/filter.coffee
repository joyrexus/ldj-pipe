#!/usr/bin/env coffee 
pipe = require '../../index'

start = null                              # starting timestamp

filter = (frame) ->
  if frame.id                             # only filter items with id
    start = frame.timestamp if not start  # set starting time

    id:        frame.id
    hands:     frame.hands                # hand motion data
    timestamp: frame.timestamp - start    # time since start

pipe.through filter
