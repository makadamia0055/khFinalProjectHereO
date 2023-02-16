//나중에 window.onload = 붙이기
$(function () {
  setInterval(function () {
    if (!$(".main__imgBox-container2 li").is(":animated"))
      //움직이지 않을 때에만 움직이도록
      $(".main__imgBox-container2 li")
        .first()
        .animate(
          {
            marginLeft: "-25%",
            opacity: "0.7",
          },
          3000,
          function () {
            $(this)
              .detach()
              .appendTo(".main__imgBox-container2")
              .removeAttr("style");
          }
        );
  }, 3010);
  $(".newTeam__list").hover(
    function () {
      $(this).css("box-shadow", "4px 12px 30px 6px rgb(0 0 0 / 13%)");
      $(this).css("cursor", "pointer");
    },
    function () {
      $(this).css("box-shadow", "4px 12px 30px 6px rgb(0 0 0 / 9%)");
    }
  );
});
