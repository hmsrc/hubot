# Description:
#   calls the 'whats' gem to do puppetdb lookups
#
# Commands:
#   hubot whats <hostname>- <what the respond trigger does>
#
# Author:
#   sjoeboo
module.exports = (robot) ->
  robot.respond /whats (.*)/i, (msg) ->
    host = msg.match[1]
    exec = require('child_process').exec
    whats_cmd = "whats #{host} -q -j"
    exec whats_cmd, (error, stdout, stderr) ->
      message = "```"
      for k,v of JSON.parse stdout
         message = message + "*#{k}*: #{v}\n"
      message = message + "```"
      msg.send message
