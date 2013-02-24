App.PostView = Ember.View.extend
  tagName: 'section'
  classNames: ['panel']
  didInsertElement: ->
    @$('.truncate').condense
      moreText: 'more &raquo;'
      lessText: '&laquo; less'
      # ellipsis: null
