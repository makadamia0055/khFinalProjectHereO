var itemContents = document.getElementsByClassName("item-content");
for (var i = 0; i < itemContents.length; i++) {
    var content = itemContents[i].querySelector("input, select").value;
    console.log(content);
}