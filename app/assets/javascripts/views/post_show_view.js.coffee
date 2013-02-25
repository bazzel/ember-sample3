App.PostShowView = Ember.View.extend
  didInsertElement: ->
    @$('.truncate').condense
      moreText: 'more &raquo;'
      lessText: '&laquo; less'
