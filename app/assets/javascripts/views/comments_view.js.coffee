App.CommentsView = Ember.View.extend
  templateName: 'comments'
  tagName: 'ul'
  didInsertElement: ->
    @$('li').condense
      moreText: 'more &raquo;'
      lessText: '&laquo; less'
