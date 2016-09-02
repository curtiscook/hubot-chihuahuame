# Description:
#   Pugme is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot chihuahua me - Receive a chihuahua
#   hubot chihuahua bomb N - get N chihuahuas

module.exports = (robot) ->
  robot.respond /chihuahua me/i, (msg) ->
    msg.http("http://chihuahua.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).chihuahua

  robot.respond /chihuahua bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http("http://chihuahua.herokuapp.com/bomb?count=" + count)
      .get() (err, res, body) ->
        msg.send pug for pug in JSON.parse(body).chihuahuas

  robot.respond /how many chihuahuas are there/i, (msg) ->
    msg.http("http://chihuahua.herokuapp.com/count")
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).chihuahua_count} chihuahuas."

