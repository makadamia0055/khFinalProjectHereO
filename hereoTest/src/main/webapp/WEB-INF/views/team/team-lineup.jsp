<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<link	rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="/hereoTest/resources/js/common/jquery.validate.min.js"></script>

	<style>
		.bsPark{
			position: relative;
			display: inline-block;
			width: 1000px; height: 600px;
			border-radius: 5px;
			background-image: url(<c:url value='/resources/img/team/baseballpark.jpg'></c:url>);
			background-size: 1000px 600px;
		}
		

		.container-bsPark{
			width: 1400px;
			
		}
		.right-panel{
			float: right;
		}
		.right-panel .container-line_up{
			padding : 5px;
			border-top: 3px double #dee2e6;
		}


		.box-player{
			border: 1px solid black;
			background-color: rgb(255, 255, 255);
			border-radius: 5px;
		}
		.box-player.selected{
			background-color: rgb(243, 241, 111);
		}
		.icon-player{
			width: 75px;
			height: 75px;
			border-radius: 32px;
		}
		.table-position{
			table-layout: fixed;
			background-color: rgba(255, 255, 255, 0.8);
			position: absolute;
			display: inline-block;
			border-radius: 5px;
			height: 100px; width: 100px;
		}
		.table-position .name-position{
			text-align: center;
		}
		
		.table-position[data-position="1"]{
			top: 350px;
			left: 450px;
		}
		.table-position[data-position="2"]{
			bottom: -16px;
			left: 450px;
		}
		.table-position[data-position="3"]{
			top: 350px;
			left: 720px;
		}
		.table-position[data-position="4"]{
			top: 200px;
			left: 450px;
		}
		.table-position[data-position="5"]{
			top: 350px;
			right: 720px;
		}
		.table-position[data-position="6"]{
			top: 250px;
			right: 600px;
		}
		.table-position[data-position="7"]{
			top: 100px;
			left: 720px;
		}
		.table-position[data-position="8"]{
			top: 50px;
			left: 450px;
		}
		.table-position[data-position="9"]{
			top: 100px;
			right: 720px;
		}
		.table-position[data-position="10"]{
			top: 0px;
			left: 0px;
		}
		
		col{
			width: 100%;
		}
		.bsPark .reference{
			position: absolute;
			bottom: 0px;
			right : 0px;
		}



		.bench{
			display: inline-block;
			position: absolute;
			bottom: -100px;
			border: 1px solid black;
			border-radius: 5px;
			width: 1000px;
			height: 100px;

		}
		.item-hitOrder{
			border: 1px solid black;
		}
		.table-position .select-position{
			width: 100%;
		}
		.box-name{
			font-weight: 700;
			font-size: 12px;
		}
		.box-name .bakNum-player{
			color: darkblue;
			font-weight: 700;
			font-size: 9px;
		}
		.right-panel tr[data-num="10"]{
			display: none;
		}
		
		
	</style>
	
	<section>
		<div class="container-bsPark">
			<div class="bsPark">
				<div class="">
					<c:forEach var="i" begin="1" end="9">
						<div class="table-position" data-position="${i}">
							<div class="name-position" draggable="false" data-position="${i}"></div>
							<div class="content-position" draggable="false" data-position="${i}">
								<select name="" class="select-position" id="position${i}">
									<option class="defaultN" value="0">-선수-</option>
									<c:forEach items="${tPlayerList}" var="tp">
										<c:choose>
											<c:when test="${tp.tp_auth > 1}">
												<option value="${tp.tp_num}" data-baknum="${tp.tp_backnum }">
													<c:forEach items="${playerList}" var="pl">
														<c:if test="${pl.pl_num eq tp.tp_pl_num}">${tp.tp_backnum}.${pl.me_nickname}</c:if>
													</c:forEach>
												</option>
											</c:when>
										</c:choose>
										
									</c:forEach>
								</select>
								<label for="order-hit${i}">타순 : </label>
								<select name="" class="form-control-inline select-hitorder" id="order-hit${i}">
									<option class="defaultN" value="0">--</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
		
								</select>
	
							</div>
						</div>
					</c:forEach>
					
					<div class="table-position" data-position="10" >
						<div class="name-position form-check-inline" data-position="10" draggable="false">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input checkbox-DH" value="true">지명타자
							</label>
						</div>
						<div class="content-position" draggable="false" data-position="10">
							<select class="select-position" id="position10">
								<option class="defaultN" value="0">-선수-</option>
								<c:forEach items="${tPlayerList}" var="tp">
										<c:choose>
											<c:when test="${tp.tp_auth > 1}">
												<option value="${tp.tp_num}" data-baknum="${tp.tp_backnum}">
													<c:forEach items="${playerList}" var="pl">
														<c:if test="${pl.pl_num eq tp.tp_pl_num}">${tp.tp_backnum}.${pl.me_nickname}</c:if>
													</c:forEach>
												</option>
											</c:when>
											
										</c:choose>
										
								</c:forEach>
							</select>
							<label for="order-hit10">타순 : </label>
							<select class="form-control-inline select-hitorder" id="order-hit10">
								<option class="defaultN" value="0">--</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
	
							</select>
						</div>
					</div>

				</div>
				<div class="bench">
					<div class="title-bench">벤치 <button class="btn btn-sm btn-dark btn-bench-append">추가</button>
					<div class="d-flex flex-wrap content-bench"></div>	
					</div>
					


				</div>
				<a class="reference" href="https://kr.freepik.com/free-vector/baseball-field-isometric-composition_23505339.htm#query=%EC%95%BC%EA%B5%AC%EC%9E%A5&position=1&from_view=keyword&track=robertav1_2_sidr">구장 이미지 By 작가 macrovector</a> 출처 Freepik

			</div>
			<div class="right-panel">
				<div class="container-line_up text-center">
					<span class="">선발 라인업 </span>
					<button class="btn btn-success btn-sm btn-scan" hidden>새로고침</button>
					<table class="table" id="lineupTable">
						<thead>
							<tr>
								<th>타순</th>
								<th>등번호</th>
								<th>선수</th>
								<th>포지션</th>
							</tr>
							<tr data-num="1">
								<td class="num-battingOrd">1</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="2">
								<td class="num-battingOrd">2</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="3">
								<td class="num-battingOrd">3</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="4">
								<td class="num-battingOrd">4</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="5">
								<td class="num-battingOrd">5</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="6">
								<td class="num-battingOrd">6</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="7">
								<td class="num-battingOrd">7</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="8">
								<td class="num-battingOrd">8</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="9">
								<td class="num-battingOrd">9</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="10">
								<td class="num-battingOrd">P</td>
								<td class="bakNum-player"></td>
								<td class="name-player"></td>
								<td class="name-position"></td>
							</tr>
							<tr data-num="11">
								<td class="num-battingOrd">벤치</td>
								<td class="benchMem" colspan="3">
									

								</td>
							</tr>
						</thead>
					</table>



	
				</div>
	
				 <button type="button" class="btn btn-pill btn-primary btn-save">저장</button>
				 <!-- <button type="button" class="btn btn-pill btn-primary">초기화</button>
				 <button type="button" class="btn btn-pill btn-primary">제출</button><br> -->
	
			</div>

		</div>

		
		<form action="POST">
			
		</form>
	</section>

	
	<script>
	
	
	
	let playerCnt = $('.box-player').length;
	console.log(playerCnt)
	if(playerCnt<9){
		if(!confirm("팀의 플레이어가 9명보다 작습니다. 계속 라인업을 작성합니까?")){
			alert('이전 페이지로 이동합니다.')
			location.href(history.back());
		}
	}
	
	
	
	let $playerBox = $('.box-player');
	let $tableTd = $('.table-position');
	let $contentBox = $('.content-position')
	let $btnPlayer = $('.btn-player');
	let $bench = $('.content-bench');
	
	let btnPlayerMove = false;
	let btnOnBtn = false;

 	let _ml_ms_num = 1 ;//'${ms_num}';
	let positionMap = new Map();
	positionMap.set(1,"투수"); 
	positionMap.set(2,"포수"); 
	positionMap.set(3,"1루수"); 
	positionMap.set(4,"2루수"); 
	positionMap.set(5,"3루수"); 
	positionMap.set(6,"유격수"); 
	positionMap.set(7,"우익수"); 
	positionMap.set(8,"중견수"); 
	positionMap.set(9,"좌익수"); 
	positionMap.set(10,"지명타자");
	positionMap.set(11,"벤치");
	positionMap.set(12,"내야수");
	positionMap.set(13,"외야수");
	
	$('.table-position .name-position').each(function(){
		let dataNum = $(this).data('position');
		if(dataNum==10)
			return;
		let dataPo =  positionMap.get(dataNum);
		$(this).text(dataPo);
	})
	

	let LineUp = {
		line : [],
		benchLine: [],

		add(ml_tp_num){
			this.line.push(LUObj(ml_tp_num));
		},
		delete(ml_tp_num){
			for(let i = 0; i<this.line.length; i++){
				if(this.line[i].ml_tp_num==ml_tp_num){
					this.line.splice(i, 1);
				}
			}
		},
		search(ml_tp_num){
			return this.line.find(el=>el.ml_tp_num==ml_tp_num);
		}, 
		// 설정된 라인업 값을 읽어오는 함수
		scan(){
			this.line = [];
			for(let tmp of $tableTd){
				let ml_tp_num = $(tmp).find('.select-position option:selected').val();
				let ml_battingorder = $(tmp).find('.select-hitorder option:selected').val();
				// 선수 선택 x일때 객체 만들지 않기
				if(ml_tp_num==0)
					continue;
				let ml_type = '선발';
				let ml_po_num = $(tmp).data('position');
				// 배팅 순서 값 없을 때 투수이며, 지명타자 있는 경우인지 체크해서 객체 안만들기
				if(ml_battingorder==0&&ml_po_num!=0&&!$('.checkbox-DH').is(":checked"))
					continue;

				let tmpObj = new LUObj(ml_tp_num, ml_battingorder, ml_type, ml_po_num);
				this.line.push(tmpObj);
			}
		},
		scanBench(){
			this.benchLine = [];
			for(let tmp of $bench){
				let ml_tp_num = $(tmp).find('.select-position option:selected').val();
				console.log(ml_tp_num);
				if(ml_tp_num == 0 || ml_tp_num == undefined)
					continue;
				let tmpObj = new LUObj(ml_tp_num);
				tmpObj.ml_type = '벤치';
				tmpObj.ml_po_num = 11;
				tmpObj.ml_battingorder= 0;
				this.benchLine.push(tmpObj);
			}
		},
		
		// 설정된 라인업 값을 라인업에 출력하는 함수
		print(){
			// 정규 라인 선수 프린트
			for(let tmp of this.line){
				// 배팅 오더 없는 경우 건너뛰기
				if(tmp.ml_battingorder==0 && tmp.ml_po_num!=1){
					continue;
				}
					
				let hitNum = tmp.ml_battingorder;
				// 투수의 경우 체크
				if($('.checkbox-DH').is(":checked")&&tmp.ml_po_num==1&&tmp.ml_battingorder==0){
					hitNum = 10;
					console.log(hitNum)
				}


				let poNum = tmp.ml_po_num;
				let $tr = $('.container-line_up table tr').filter(function(e){
					if($(this).data('num')==hitNum){
						return this;
					}
				});
				let tmpPlayerBox = $playerBox.filter(function(){
					if($(this).data('tpnum')==tmp.ml_tp_num)
						return this;
				});
				let playerN = tmpPlayerBox.find('.name-player').text();
				let playerB = tmpPlayerBox.find('.bakNum-player').text();
				$tr.find('.name-player').text(playerN);
				$tr.find('.bakNum-player').text(playerB);
				$tr.find('.name-position').text(positionMap.get(poNum));
			}
			// 벤치 멤버 프린트
			let benchStr='';
			let benchCol =  $('#lineupTable').find('.benchMem');
			for(let tmp of this.benchLine){
				let tmpPlayerBox = $playerBox.filter(function(){
					if($(this).data('tpnum')==tmp.ml_tp_num)
					return this;
				});
				let playerB = tmpPlayerBox.find('.bakNum-player').text();
			
				benchStr += '<span class="badge badge-pill badge-success">'+playerB+'</span>';
			}
			
			benchCol.append(benchStr);
			
		}
	}
	function LUObj(ml_tp_num){
		this.ml_ms_num = _ml_ms_num;
		this.ml_tp_num = ml_tp_num;

	}
	function LUObj(ml_tp_num, ml_battingorder, ml_type, ml_po_num){
		this.ml_ms_num = _ml_ms_num;
		this.ml_tp_num = ml_tp_num;
		this.ml_battingorder = ml_battingorder;
		this.ml_type = ml_type;
		this.ml_po_num = ml_po_num;

	}
	function clearBoard(){
		let $td = $('.container-line_up table td');
		for(let tmp of $td){
			$(tmp).not('td.num-battingOrd').empty();
		}
	}
	

	// btn-bench-append
	let benchSeat = 0;
	
	$('.btn-bench-append').on('click', function(e){
		let $selectPlayerOpt = $('.select-position:first').clone(true)
		$selectPlayerOpt.removeAttr("selected")
		console.log($selectPlayerOpt)
		
		let playerSelector = '<select class="select-position p-2" name="" id="positionBench'+benchSeat+'">'
		$selectPlayerOpt.each(function(){
			playerSelector += $(this).html();
		})
		playerSelector +='</select>';
		++benchSeat;
		e.preventDefault();
		$($bench).append(playerSelector);

		$('.select-position').on('change', function(e){
			checkDuplicatePO(this);
			$('.btn-scan').click();

		})
	})
checkbox_DH_toggler(true);
	/* 지명타자 칸 관련 */
function checkbox_DH_toggler(bool){
	if(bool){
		// 지명타자 칸 얼리기
		$('#position10').val(0);
		$('#position10 option').not(':selected').attr('disabled', 'disabled');
		$('#order-hit10').val(0);
		$('#order-hit10 option').not(':selected').attr('disabled', 'disabled');
	}else{
			// 지명타자 칸 해동
			$('#position10 option').not(':selected').removeAttr('disabled');
			$('#order-hit10 option').not(':selected').removeAttr('disabled');
	}
	
}
// 체크박스 이벤트
$('.checkbox-DH').click(function(e){
		if($(this).is(':checked')){
			$('.right-line_up .line-DH').show();
			// 투수칸 타순 얼리기
			$('#order-hit1').val(0);
			$('#order-hit1 option').not(':selected').attr('disabled', 'disabled');
			
			checkbox_DH_toggler(false);
			// 라인업 10열 나오게하기
			$('.right-panel tr[data-num="10"]').show();
		}else{
			$('.right-line_up .line-DH').hide();
			// 투수칸 타순 해동
			$('#order-hit1 option').not(':selected').removeAttr('disabled');
			
			checkbox_DH_toggler(true);
			// 라인업 10열 숨기기
			$('.right-panel tr[data-num="10"]').hide();
		}
	})
	
$('.select-hitorder').on('change', function(e){
	checkDuplicateHO(this);
	$('.btn-scan').click();
	
})
$('.select-position').on('change', function(e){
	checkDuplicatePO(this);
	$('.btn-scan').click();
})

function checkDuplicateHO(data){
	let poData = $(data).find(':selected').val();
	let poId = $(data).attr('id');
	let $selectHO =$('.select-hitorder').not(data).find(':selected');
	for(let i of $selectHO){
		if($(i).val()== poData){
			$(i).parent().find('.defaultN').prop('selected', true);
		}
	}
}
function checkDuplicatePO(data){
	let poData = $(data).find(':selected').val();
	let poDataPosition = $(data).data('position');
	let $selectPO =$('.select-position').not(data).find(':selected');
	for(let i of $selectPO){
		if($(i).val()== poData){
			$(i).parent().find('.defaultN').prop('selected', true);
		}
	}	

}
$('.btn-scan').click(function(e){
		LineUp.scan();
		LineUp.scanBench();
		clearBoard();
		LineUp.print();
	})

$('.btn-save').click(function(e){
		let lineObj = LineUp.line;
		let benchObj = LineUp.benchLine;
		if(Object.keys(lineObj).length<9){
			if(!confirm("라인업이 완벽하게 등록되지 않았습니다. 그래도 저장합니까?"))
				return;
		}
		ajaxAsync("POST", lineObj.concat(benchObj), '<c:url value="/ajax/lineup_save?teamNum=${team.tm_num}&ms_num=${ms_num}"></c:url>', function(data){
			if(data.res==1){
				alert('라인업이 저장되었습니다.')
			}else{
				alert('라인업 저장에 실패했습니다.')
			}
		})
		
})
	function ajaxAsync(method, obj, url, successFunc, errorFunc){
	$.ajax({
		async:true,
		type: method,
		data: JSON.stringify(obj),
		url: url, 
		dataType: "json",
		contentType:"application/json; charset=UTF-8",
		success: successFunc,
		error: errorFunc
		
	});
}
function ajax(method, obj, url, successFunc, errorFunc){
	$.ajax({
		async:false,
		type: method,
		data: JSON.stringify(obj),
		url: url, 
		dataType: "json",
		contentType:"application/json; charset=UTF-8",
		success: successFunc,
		error: errorFunc
		
	});
}
	
	
</script>
    