App.PostsController = Ember.ArrayController.extend
  itemController: 'Post'
  postsCount: (->
    @get('content.length')
  ).property('content.@each')
