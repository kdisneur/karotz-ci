class Clipboard

  constructor: (element) ->
    clip = new ZeroClipboard(element, moviePath: '/assets/ZeroClipboard.swf')

$(-> $.each($('*[data-clipboard]'), (index, element) -> new Clipboard(element)))
