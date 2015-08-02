commentableLoadComments = (base_url) ->
  $.get(base_url + "/comments/about").done (e) ->
    $("#comments").html(e)

$(document).ready ->
  commentableLoadComments(window.location.href)
  $(document).on "ajax:success", "#new_comment", (e, data, status, xhr) ->
    commentableLoadComments(window.location.href)
