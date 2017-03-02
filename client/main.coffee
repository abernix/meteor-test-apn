import { Template } from "meteor/templating"
import { ReactiveVar } from "meteor/reactive-var"
import './main.html'

updateServerNpmStatus = (variableToUpdate) ->
  Meteor.call "checkNpmActive", (error, result) ->
    if error
      alert "Error"
    else
      variableToUpdate.set result

Template.body.onCreated ->
  @npmStatus = new ReactiveVar(false)
  updateServerNpmStatus @.npmStatus

Template.body.helpers
  "npmStatus": ->
    Template.instance().npmStatus.get()