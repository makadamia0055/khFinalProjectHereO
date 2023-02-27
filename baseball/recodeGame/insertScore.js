$(function(){
    $('.home-team span').click(function(){
        $('.middle-recode-board-away').hide();
        $('.middle-recode-board-home').show();
        $('.away-team').attr('aria-selected',false);
        $('.home-team').attr('aria-selected',true);
    });

    $('.away-team span').click(function(){
        $('.middle-recode-board-home').hide();
        $('.middle-recode-board-away').show();
        $('.home-team').attr('aria-selected',false);
        $('.away-team').attr('aria-selected',true);
    });

    $('.middle-recode-board-away .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerLeft = $('.middle-recode-board-away .substitute-num option:selected').val();
        console.log(addPlayerLeft);
    });
    $('.middle-recode-board-home .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerRight = $('.middle-recode-board-home .recodePlayer5').html();
        $('.middle-recode-board-home .recodePlayer5').append(addPlayerRight);
    });


})
