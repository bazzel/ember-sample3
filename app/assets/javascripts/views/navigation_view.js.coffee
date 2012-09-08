App.NavigationView = Em.View.extend
  templateName: 'navigation'
  tagName: 'dl'
  classNames: 'tabs pill'.w()
  NavItemView: Em.View.extend
    tagName: 'dd'
    classNameBindings: 'isActive:active'.w()
    selectedBinding: 'controller.selected'
    isActive: (->
      @.get('item') is @get('selected')
    ).property('item', 'selected')
