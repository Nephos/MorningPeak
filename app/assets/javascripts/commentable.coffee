commentableLoadComments = (base_url) ->
  $.get(base_url + "/comments/about").done (e) ->
    $("#comments").html(e)

$(document).ready ->
  url = window.location.pathname
  commentableLoadComments(url)
  $(document).on "ajax:success", "#new_comment", (e, data, status, xhr) ->
    commentableLoadComments(url)
  $(document).on "ajax:complete", ".remove-comment", (e, data, status, xhr) ->
    commentableLoadComments(url)
