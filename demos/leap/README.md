# Leap Demo

The [Leap Motion device](https://www.leapmotion.com) provides a websocket stream of line-delimited JSON (details [here](https://gist.github.com/joyrexus/7217032)).

This filter extracts the `id`, `hands`, and `timestamp` attributes from each [frame](https://gist.github.com/xseignard/5858797) and ignores everything else.  We also set the timestamp of the first frame to zero and set each timestamp thereafter as the delta from the original starting timestamp.

    cat in.ldj | filter.coffee > out.ldj

... or:

    filter.coffee < in.ldj > out.ldj
