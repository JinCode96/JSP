/**
 * 
 */
 
 	//데이터 검증에 사용하는 정규표현식
	let regUid = /^[a-z]+[a-z0-9]{4,12}$/g;
	let regPass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	let regName = /^[ㄱ-힣]+$/;
	let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let regHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
	let regCorpNum = /^\d{3}-\d{2}-\d{5}$/;
	let regTel = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
	
	// 폼 데이터 검증 결과 상태변수
	let isUidOk = false;
	let isPass1Ok = false;
	let isPass2Ok = false;
	let isNameOk = false;
	let isEmailOk = false;
	let isEmailAuthOk = false;
	let isHpOk = false;
	let isCorpNumOk = false;
	let isTelOk = false;
	let isCeoOk = false;
	
	// 인증번호 전송 중복클릭 방지
	let preventDoubleClick = false;
	
	$(function(){

		// 값이 변경 되었을때 초기화
		$('input[name=km_uid]').keydown(function(){
			$('.msgId').css('color', 'black').text('영문, 숫자로 4~12자까지 설정해 주세요.');
			isUidOk = false;
		});
		
		$('input[name=km_pass1]').keydown(function(){
			$('.msgPass1').css('color', 'black').text('영문, 숫자, 특수문자를 조합하여 8~16자까지 설정해 주세요.');
			isPass1Ok = false;
		});
		
		$('input[name=km_pass2]').keydown(function(){
			$('.msgPass2').css('color', 'black').text('비밀번호 재입력');
			isPass2Ok = false;
		});
		
		$('input[name=km_name]').keydown(function(){
			$('.msgName').css('color', 'black').text('');
			isNameOk = false;
		});
		
		$('input[name=kms_email]').keydown(function(){
			// 이메일 인증이 완료되었을 경우 초기화x 
			if(isEmailAuthOk){return;}
			
			$('.msgEmail').css('color', 'black').text('');
			isEmailOk = false;
			isEmailAuthOk = false;
			$('.auth').hide();
			preventDoubleClick = false;
		});
		
		$('input[name=km_hp]').keydown(function(){
			$('.msgHp').css('color', 'black').text('- 포함 13자리를 입력하세요.');
			isHpOk = false;
		});
		
		$('input[name=kms_corp_reg]').keydown(function(){
			$('.msgCorp').css('color', 'black').text('- 표시 포함 12자리 입력, 예) 123-45-67890');
			isCorpNumOk = false;
		});
		
		$('input[name=kms_tel]').keydown(function(){
			$('.msgTel').css('color', 'black').text('- 표시 포함, 지역번호 포함 입력, 예) 02-234-1234');
			isTelOk = false;
		});
		
		$('input[name=kms_ceo]').keydown(function(){
			$('.msgCeo').css('color', 'black').text('');
			isCeoOk = false;
		});
		
		// 아이디 검사하기
		$('.btnIdCheck').click(function(){
			
			let uid = $('input[name=km_uid]').val();
			
			if(isUidOk) {
				return;
			}
			
			if(!uid.match(regUid)) {
				isUidOk = false;
				$('.msgId').css('color', 'red').text('유효한 아이디 형식이 아닙니다.');
				return;
			}
			
			let jsonData = {"uid":uid};
			
			setTimeout(function(){
				
				$.ajax({
					url: '/Kmarket/member/checkUid.do',
					method:'get',
					data: jsonData,
					dataType: 'json',
					success: function(data) {
						
						if(data.result == 0) {
							isUidOk = true;
							$('.msgId').css('color', 'green').text('사용 가능한 아이디 입니다.');
						}else {
							isUidOk = false;
							$('.msgId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
						}
					}
				});
				
			}, 500);
		});
		
		// 비밀번호 검사
		$('input[name=km_pass1]').focusout(function() {
			
			let pass1 = $('input[name=km_pass1]').val();
			
			if(pass1 == ''){
				return;
			}
			
			if(!pass1.match(regPass)){
				isPass1Ok = false;
				$('.msgPass1').css('color', 'red').text('숫자,영문,특수문자 포함 8자리 이상이어야 합니다.');
			}else {
				isPass1Ok = true;
				$('.msgPass1').css('color', 'green').text('사용 가능한 비밀번호 입니다.');
			}
		});
		
		$('input[name=km_pass2]').focusout(function() {
			
			let pass1 = $('input[name=km_pass1]').val();
			let pass2 = $('input[name=km_pass2]').val();
			
			if(pass1 == ''){
				return;
			}
			
			if(pass2 == ''){
				return;
			}
			
			if (pass1 == pass2) {
				isPass2Ok = true;
			} else {
				isPass2Ok = false;
				$('.msgPass2').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}
		
		});
		
		
		// 이름 검사
		$('input[name=km_name]').focusout(function() {
			
			let name = $('input[name=km_name]').val();
			
			if(name == ''){
				return;
			}
			
			if(!name.match(regName)){
				isNameOk = false;
				$('.msgName').css('color', 'red').text('유효한 이름이 아닙니다.');
			}else {
				isNameOk = true;
			}
		});
		
	
		// 이메일 인증 검사
		let emailCode = 0;
		$('.auth').hide();
			
		$('.btnEmailAuth').click(function(){
			
			let email = $('input[name=kms_email]').val();
			
			if(email == ''){
				$('.msgEmail').css('color', 'red').text('이메일을 입력하세요.');
				return;
			}
			
			// 중복 클릭 방지
			if(preventDoubleClick){
				return;
			}
			
			// 이메일 형식검사
			if (!email.match(regEmail)) {
				isEmailOk = false;
				$('.msgEmail').css('color', 'red').text('유효한 이메일형식이 아닙니다.');
				return;
				
			} else {
				
				isEmailOk = true;
				preventDoubleClick = true;
				
				$('.msgEmail').css('color', 'black').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
				
				setTimeout(function(){
					
					$.ajax({
						url: '/Kmarket/member/emailAuth.do',
						method: 'get', 
						data: {"email":email},
						dataType: 'json',
						success: function(data){
							
							console.log(data);
							
							if(data.status == 1) {
								// 메일 발송 성공
								emailCode = data.code;
								
								$('.msgEmail').text('인증코드를 전송 했습니다. 이메일을 확인하세요');
								$('.auth').show();
							}else{
								// 메일 발송 실패
								$('.msgEmail').text('이메일 전송을 실패했습니다. 이메일을 확인 후 다시 시도하세요.');
								preventDoubleClick = false;
							}
						
						}
					});
					
				}, 1000);
			}
			
		});
			
		// 이메일 인증코드 확인
		$('.btnEmailConfirm').click(function(){
			
			let code = $('input[name=auth]').val();
			
			if(code == ''){
				alert('이메일을 확인 후 인증코드를 입력하세요.');
				return;
			}
			
			if(code == emailCode){
				isEmailAuthOk = true;
				$('input[name=kms_email]').attr('readonly', true);
				$('.msgEmail').css('color', 'green').text('이메일이 인증되었습니다.');
				$('.auth').hide();
			}else {
				isEmailAuthOk = false;
				$('.msgEmail').css('color', 'red').text('인증 코드가 틀립니다. 다시 확인하세요.');
			}
			
		});
	
		// 휴대폰 검사
		$('input[name=km_hp]').focusout(function() {
			
			let hp = $('input[name=km_hp]').val();
			
			if(hp == ''){
				return;
			}
			
			if(!hp.match(regHp)){
				isHpOk = false;
				$('.msgHp').css('color', 'red').text('유효한 휴대폰번호 형식이 아닙니다.');
			}else {
				isHpOk = true;
			}
		});
		
		// 사업자인증번호 검사
		$('input[name=kms_corp_reg]').focusout(function() {
			
			let corpNum = $('input[name=kms_corp_reg]').val();
			
			if(corpNum == ''){
				return;
			}
			
			if(!corpNum.match(regCorpNum)){
				isCorpNumOk = false;
				$('.msgCorp').css('color', 'red').text('유효한 사업자등록번호 형식이 아닙니다.');
			}else {
				isCorpNumOk = true;
			}
		});
		
		// 전화번호 검사
		$('input[name=kms_tel]').focusout(function() {
			
			let tel = $('input[name=kms_tel]').val();
			
			if(tel == ''){
				return;
			}
			
			if(!tel.match(regTel)){
				isTelOk = false;
				$('.msgTel').css('color', 'red').text('유효한 전화번호 형식이 아닙니다.');
			}else {
				isTelOk = true;
			}
		});
		
		// 대표자 이름 검사
		$('input[name=kms_ceo]').focusout(function() {
			
			let ceo = $('input[name=kms_ceo]').val();
			
			if(ceo == ''){
				return;
			}
			
			if(!ceo.match(regName)){
				isCeoOk = false;
				$('.msgCeo').css('color', 'red').text('유효한 이름이 아닙니다.');
			}else {
				isCeoOk = true;
			}
		});
		
		
		// 최종 폼 전송
		$('.registerSeller > form').submit(function() {
			
			// 아이디 검증
			if (!isUidOk) {
				alert('아이디를 확인하십시오.');
				return false;
			}
			// 비밀번호 검증
			if (!isPass1Ok) {
				alert('비밀번호가 유효하지 않습니다.');
				return false;
			}
			
			if (!isPass2Ok) {
				alert('비밀번호가 유효하지 않습니다.');
				return false;
			}
			
			// 이름 검증
			if (!isNameOk) {
				alert('이름이 유효하지 않습니다.');
				return false;
			}

			// 이메일 검증
			if (!isEmailOk) {
				alert('이메일이 유효하지 않습니다.');
				return false;
			}
			
			// 이메일 인증 검증
			if (!isEmailAuthOk) {
				alert('이메일을 인증하셔야합니다.');
				return false;
			}
			
			// 휴대폰 검증
			if (!isHpOk) {
				alert('휴대폰이 유효하지 않습니다.');
				return false;
			}
			
			// 사업자등록번호 검증
			if (!isCorpNumOk) {
				alert('사업자등록번호가 유효하지 않습니다.');
				return false;
			}
			
			// 전화번호 검증
			if (!isTelOk) {
				alert('전화번호가 유효하지 않습니다.');
				return false;
			}
			
			// 주소 검증
			let addr1 = $('input[name=kms_addr1]').val();
			
			if (addr1 == ''){
				alert('주소를 입력하셔야 합니다.');
				return false;
			}
			
			// 대표자 이름 검증
			if (!isCeoOk) {
				alert('대표자 이름이 유효하지 않습니다.');
				return false;
			}

			return true;
		});
		
	});