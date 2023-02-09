//나중에 window.onload = 붙이기
$(function () {
  setInterval(function () {
    $(".main__imgBox-container2 li2")
      .first()
      .animate(
        {
          marginLeft: "-1000px",
        },
        7000,
        function () {
          $(this)
            .detach()
            .appendTo(".main__imgBox-container2")
            .removeAttr("style");
        }
      );
  }, 7000);
});
