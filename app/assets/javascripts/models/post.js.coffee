App.Post = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')
  published: DS.attr('boolean')
  pictureNumber: DS.attr('number')
  #comments: DS.hasMany('App.Comment')
  #trackbacks: DS.hasMany('App.Trackback')
  category: DS.belongsTo('App.Category')
  categoryName: ( ->
    @get('category.name')
  ).property('category')
  imageUrl: (->
    url = "http://lorempixel.com".w()
    # Show b/w image when not published
    url.push 'g' unless @get("published")
    url.push "120/120/#{@get('categoryName')}/#{@get('pictureNumber')}"
    url.join('/')
  ).property('published', 'categoryName', 'pictureNumber')
