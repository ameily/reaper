# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@markdown_editor = ($e) ->
    id = $e.attr('id')
    $parent = $e.parent()
    $preview = $("<div class='tab-pane markdown'>").attr('id', id+'-preview-tab').css('min-height', $e.height()+'px')
    $wrapper = $("<div class='tab-pane active'>").attr('id', id+'-write-tab')

    $e.replaceWith(
        $("<div>").append(
            $("<ul class='nav nav-tabs'>").append(
                $("<li class='active'>").append(
                    $("<a data-toggle='tab'><span class='glyphicon glyphicon-pencil'></span> Write</a>")
                        .attr('href', '#'+id+'-write-tab')
                )
            ).append(
                $("<li>").append(
                    $("<a data-toggle='tab'><span class='glyphicon glyphicon-picture'></span> Preview</a>")
                        .attr('href', '#'+id+'-preview-tab').click(->
                            $preview.html(marked($e.val(), { breaks: true }))
                    )
                )
            )
        ).append(
            $("<div class='tab-content'>").append(
                $wrapper
            ).append(
                $preview
            )
        )
    )
    $wrapper.append($e)
