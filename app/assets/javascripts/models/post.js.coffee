App.Post = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')
  published: DS.attr('boolean')
  comments: DS.hasMany('App.Comment',
    embedded: true
  )
  trackbacks: DS.hasMany('App.Trackback',
    embedded: true
  )
