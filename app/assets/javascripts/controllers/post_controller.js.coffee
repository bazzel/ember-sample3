App.PostController = Ember.ObjectController.extend
  categories: (->
    App.Category.find()
  ).property()
