$(function(){
	$('.pagination .page-item').click(function(e){
e.preventDefault();
let activeItem = $('.pagination .page-item.active');
$('.pagination li').removeClass('active');
if($(this).hasClass('prev')){
if($(activeItem).prev().hasClass('prev')){
activeItem.addClass('active');
}else{
$(activeItem).prev().addClass('active');
}
}else if($(this).hasClass('next')){
if($(activeItem).next().hasClass('next')){
activeItem.addClass('active');
}else{
$(activeItem).next().addClass('active');
}
}else{
$(this).addClass('active');

}
})
})
