App.CommentsView = Ember.View.extend
  templateName: 'comments'
  className: 'ul'
  didInsertElement: ->
    @$('li').condense
      moreText: 'more &raquo;'
      lessText: '&laquo; less'
      # ellipsis: null
