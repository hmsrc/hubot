module.exports = (robot) ->
    robot.respond /whats (.*)/i, (msg) ->
      host = msg.match[1]
      exec = require('child_process').exec
      whats_cmd = "whats #{host} -q"
      exec whats_cmd, (error, stdout, stderr) -> msg.send stdout
