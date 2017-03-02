import { Meteor } from "meteor/meteor";
import apn from 'apn'

isNpmActive = () ->
  typeof apn == "object" && typeof apn.Notification == "function"

if isNpmActive
  console.log "Yes, this is the APN NPM module, and it's working!"
else
  console.log "ERROR: No NPM 'apn' module loaded."

Meteor.methods
  checkNpmActive: ->
    isNpmActive()