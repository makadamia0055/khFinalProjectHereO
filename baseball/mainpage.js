//나중에 window.onload = 붙이기
$(function () {
  setInterval(function () {
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
  }, 3000);
}); //다른 화면으로 넘어간 후 다시 해당 페이지로 오는 경우 애니메이션 효과가 겹침.
