$(function () {
  $(".submenu-containerBox1").hide();
  $(".submenu__background").hide();

  $(".top-menu__team-hover").hover(function(){
    $(".submenu__background").css({"background-color" : "#FFC54D"});
    $(".submenu__background").show();
    $(".team-submenu__01").show();
  },function(){
    $(".submenu__background").css({"background-color" : "#fffbe9"});
    $(".submenu-containerBox1").hide();
    $(".submenu__background").hide();
  })

  $(".top-menu__league-hover").hover(function(){
    $(".submenu__background").css({"background-color" : "#FFC54D"});
    $(".submenu__background").show();
    $(".league-submenu__01").show();
  },function(){
    $(".submenu__background").css({"background-color" : "#fffbe9"});
    $(".submenu-containerBox1").hide();
    $(".league__background").hide();
  })


  $(".top-menu__commu-hover").hover(function(){
    $(".submenu__background").css({"background-color" : "#FFC54D"});
    $(".submenu__background").show();
    $(".commu-submenu__01").show();
  },function(){
    $(".submenu__background").css({"background-color" : "#fffbe9"});
    $(".submenu-containerBox1").hide();
    $(".submenu__background").hide();
  })

   $(".top-menu__reservation-hover").hover(function(){
    $(".submenu__background").css({"background-color" : "#FFC54D"});
    $(".submenu__background").show();
    $(".reserve-submenu__01").show();
  },function(){
    $(".submenu__background").css({"background-color" : "#fffbe9"});
    $(".submenu-containerBox1").hide();
    $(".submenu__background").hide();
  })
});
