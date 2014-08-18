define ['angular', 'css!style/app/signin'], ->
  'use strict'
  angular.module('controller', [])


  #common controller
  angular.module('controller')
  #AppCtrl is base controller
  .controller 'AppCtrl', ($scope, Message, Alert, Breadcrumb, UserService)->
#    $scope.message = Message
    $scope.currentUser = UserService.currentUser
    $scope.breadcrumb = Breadcrumb
    $scope.signout = (outpath) ->
      UserService.signout(outpath)

#    if !$.support.leadingWhitespace
#      Alert.addAlert({type: 'danger', msg: '不支持该浏览器，推荐使用最新版本以获得更好的体验!', keep: true})

  #HeaderCtrl is Navbar
  .controller 'HeaderCtrl', ($scope, $log, $modal, AppService, UserService) ->
    $scope.menus = [
      {icon: 'user', name: 'Center', url: '/center', children: [{icon: 'user', name: 'Center1', url: '/center'}
                                                                  {icon: 'info', name: 'About1', url: '/about'}]}
      {icon: 'calendar', name: 'Calendar', url: '/calendar'}
      {icon: 'info', name: 'About', url: '/about'}
    ]

    #    console.log $scope.menus[0].children.length
    if UserService.isAuthed
      $scope.menus = UserService.user.menus || $scope.menus

    $scope.searchAll = (content)->
      if content && $.trim(content) != ''
        AppService.searchAll(content)


  #FooterCtrl is Version
  .controller 'FooterCtrl', ($scope) ->
    $scope.foot = 'foot'

  #HomeCtrl is first page
  .controller 'HomeCtrl', ($scope, User) ->
    $scope.name = 'baby'

    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS!!!',
      'RequireJS',
      'Foundation',
      'Karma',
      'haha']

  #SignupCtrl is sign up page
#  .controller 'SignupCtrl', ($scope, Email) ->
#    $scope.user =
#      username: "example@hello.com"
#      password: "123456"
#
#    $scope.create = (user, captcha) ->
#      $scope.email = new Email()
#      $scope.email.user = user
#      $scope.email.captcha = captcha
#
#      console.log $scope.email


  #SigninCtrl is sign in page
  .controller 'SigninCtrl', ($scope, UserService) ->
    $scope.signin = (user, captcha) ->
      UserService.signin(user, captcha)
  #About me
  .controller 'AboutCtrl', ($scope)->
    $scope.organize = 'Icedog'