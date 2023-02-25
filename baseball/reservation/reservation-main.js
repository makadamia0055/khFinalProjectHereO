//페이지네이션
$(function() {
   const pages = $('.page-link');
   const prevLink = $('.prev-link');
   const nextLink = $('.next-link');
   const contents = $('.content');
   
   let currentPage = 1;
   showPage(currentPage);
   
   pages.on('click', function() {
     currentPage = parseInt($(this).text());
     showPage(currentPage);
   });
   
   prevLink.on('click', function() {
     if (currentPage > 1) {
       currentPage--;
       showPage(currentPage);
     }
   });
   
   nextLink.on('click', function() {
     if (currentPage < pages.length) {
       currentPage++;
       showPage(currentPage);
     }
   });
   
   function showPage(pageNumber) {
     pages.removeClass('active');
     contents.hide();
     
     const index = pageNumber - 1;
     $(pages[index]).addClass('active');
     $(contents[index]).show();
   }
 });