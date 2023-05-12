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
    
    // 타석타수안타타점 도루 클릭이벤트
    var countPa=0;
    var countAb=0;
    var countHit=0;
    var countRbi=0;
    var countTheft=0;
    
    $('.btn-pa').click(function(){
        countPa=countPa+1;
        $(this).find('.result-pa').innerText=countPa;
    });
    $('.btn-ab').click(function(){
        countAb=countAb+1;
        document.querySelector(".result-ab").innerText=countAb;
    });
    $('.btn-hit').click(function(){
        countHit=countHit+1;
        document.querySelector(".result-hit").innerText=countHit;
    });
    $('.btn-rbi').click(function(){
        countRbi=countRbi+1;
        document.querySelector(".result-rbi").innerText=countRbi;
    });
    $('.btn-theft').click(function(){
        countTheft=countTheft+1;
        document.querySelector(".result-theft").innerText=countTheft;
    });

})