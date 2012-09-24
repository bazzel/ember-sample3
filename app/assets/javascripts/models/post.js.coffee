App.Post = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')
  published: DS.attr('boolean')
  # https://github.com/emberjs/data/issues/365
  picture_number: DS.attr('number')
  comments: DS.hasMany('App.Comment',
    embedded: true
  )
  trackbacks: DS.hasMany('App.Trackback',
    embedded: true
  )
  category: DS.belongsTo('App.Category',
    embedded: true
  )
  categoryName: ( ->
    @get('category.name')
  ).property('category')
  imageUrl: (->
    url = "http://lorempixel.com".w()
    # Show b/w image when not published
    url.push 'g' unless @get("published")
    url.push "120/120/#{@get('categoryName')}/#{@get('picture_number')}"
    url.join('/')
  ).property('published', 'categoryName', 'picture_number')
