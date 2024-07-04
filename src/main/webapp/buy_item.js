function openPurchaseWindow(event) {
    // 클릭된 아이템의 정보 가져오기
    var itemInfo = event.target.parentNode.querySelector('p').innerText.trim();
    var itemImage = event.target.parentNode.querySelector('img').src;
    var itemPrice = event.target.parentNode.querySelector('.price').innerText.trim();

    // URL에 파라미터로 전달할 데이터 인코딩
    var encodedItemInfo = encodeURIComponent(itemInfo);
    var encodedItemImage = encodeURIComponent(itemImage);
    var encodedItemPrice = encodeURIComponent(itemPrice);

    // buy_item.jsp로 전달할 URL 생성
    var url = `buy_item.jsp?itemInfo=${encodedItemInfo}&itemImage=${encodedItemImage}&itemPrice=${encodedItemPrice}`;

    // 팝업 창 열기
    var width = 800;
    var height = 600;

    // 듀얼 모니터 설정 고려
    var left, top;
    if (window.screen.availWidth > window.screen.width) {
        // 듀얼 모니터
        // 화면 너비와 높이의 절반으로 위치를 조정
        left = window.screen.Left + (window.screen.Width / 2 - width / 2);
        top = window.screen.Top + (window.screen.Height / 2 - height / 2);
    } else {
        // 싱글 모니터
        left = window.screen.width / 2 - width / 2;
        top = window.screen.height / 2 - height / 2;
    }

    var windowFeatures = `width=${width},height=${height},left=${left},top=${top},scrollbars=yes`;

    // 팝업 창 열기
    var newWindow = window.open(url, "PurchaseWindow", windowFeatures);

    if (newWindow) {
        newWindow.focus();
		keepFocus(newWindow);
		disableCashShopEvents();
		newWindow.onbeforeunload = enableCashShopEvents;
    } else {
        alert("팝업이 차단되어 있습니다. 팝업을 허용으로 변경해주세요.");
    }
	
	function keepFocus(popup) {
	    setInterval(() => {
	        if (popup && !popup.closed) {
	            popup.focus();
	        }
	    }, 100);
	}
	
	function disableCashShopEvents() {
	    document.addEventListener('click', preventEvent, true);
	    document.addEventListener('mousedown', preventEvent, true);
	    document.addEventListener('mouseup', preventEvent, true);
	    document.addEventListener('focus', preventEvent, true);
	    document.addEventListener('keydown', preventEvent, true);
	}

	function enableCashShopEvents() {
	    document.removeEventListener('click', preventEvent, true);
	    document.removeEventListener('mousedown', preventEvent, true);
	    document.removeEventListener('mouseup', preventEvent, true);
	    document.removeEventListener('focus', preventEvent, true);
	    document.removeEventListener('keydown', preventEvent, true);
	}

	function preventEvent(event) {
	    if (newWindow && !newWindow.closed) {
	        event.stopPropagation();
	        event.preventDefault();
	    }
	}

	
	function closeWindow() {
	    window.close();
	}
	
}

