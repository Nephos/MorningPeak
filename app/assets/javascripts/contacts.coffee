# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
updateViewAtWhenClick = () ->
        $('.contact-link-view_at').bind('ajax:success', (event, data, status, xhr) ->
                this.parentNode.childNodes[15].textContent = data["view_at"]
        )

$ ->
        updateViewAtWhenClick()
