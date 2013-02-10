App.PostsController = Ember.ArrayController.extend
  itemController: ['post']
  postsCount: (->
    @get('content.length')
  ).property('content.@each')
