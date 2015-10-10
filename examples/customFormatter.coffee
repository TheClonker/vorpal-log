# This example shows how to add a custom formatter with vorpal-log.

vorpal = (require 'vorpal')()
vorpalLog = require '../index'

vorpal.use vorpalLog
  .delimiter 'get-yelled-at $'
  .show()

logger = vorpal.logger

logger.addFormatter 'yell', 30, (msg) ->
  return "#{msg.toUpperCase()}!!1eleven"

vorpal.command 'yell'
  .description 'yell at the user'
  .action (args, cb) ->
    logger.yell 'Why are you wasting your time reading stupid examples? Go do something useful instead!'
    cb()

logger.log ''
logger.info 'This is a demo program for the vorpal-log extension.'
logger.info 'Run yell to produce some output.'
logger.info 'Run loglevel <level> to change the level, e.g. \'loglevel warn\''
logger.log ''
