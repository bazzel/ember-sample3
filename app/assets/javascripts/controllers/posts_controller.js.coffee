App.PostsController = Ember.ArrayController.extend
  postsCount: (->
    @get('content.length')
  ).property('content.@each')
