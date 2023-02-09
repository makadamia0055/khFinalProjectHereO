window.onload = function () {
  setInterval(function () {
    $(".main__imgBox-container2 li")
      .first()
      .animate(
        {
          marginLeft: "-1000px",
        },
        5000,
        function () {
          $(this)
            .detach()
            .appendTo(".main__imgBox-container2")
            .removeAttr("style");
        }
      );
  }, 5000);
};
