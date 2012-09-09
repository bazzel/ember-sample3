App.PostView = Ember.View.extend
  templateName: 'post'
  didInsertElement: ->
    @$('.truncate').condense
      moreText: 'more &raquo;'
      lessText: '&laquo; less'
      # ellipsis: null
