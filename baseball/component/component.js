$(function () {
  $(".submenu-containerBox1").hide();
  $(".submenu__background").hide();

  $(".top-menu__team-hover").hover(function(){
    $(".submenu__background").show();
    $(".team-submenu__01").show();
  },function(){
    $(".submenu-containerBox1").hide();
    $(".submenu__background").hide();
  })

  $(".top-menu__commu-hover").hover(function(){
    $(".submenu__background").show();
    $(".commu-submenu__01").show();
  },function(){
    $(".submenu-containerBox1").hide();
    $(".submenu__background").hide();
  })
});
