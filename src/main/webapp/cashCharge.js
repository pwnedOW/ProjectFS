document.addEventListener("DOMContentLoaded", function() {
    const initialAmount = '50000'; // The initial amount
    const currentCashElement = document.getElementById("currentCash");
    const amountSelectElement = document.getElementById("amountSelect");

    let currentCash = parseInt(currentCashElement.textContent.replace(/,/g, ''));
    let chargeAmount = parseInt(initialAmount.replace(/,/g, ''));

    // Set the initial selected value in the dropdown
    amountSelectElement.value = initialAmount;
});

function handleFormSubmit(event) {
    console.log("Form submit event triggered");
    event.preventDefault(); // Prevent the default form submission

    // Gather form data
    const form = event.target;
    const formData = new FormData(form);
    const amount = formData.get('amount');

    // Optionally, you can add an AJAX request here to send the data to the server

    // Show alert message
    alert("충전이 완료되었습니다.");

    // Close the window
    window.close();
}

function openCashChargeWindow(options = {}) {
    // 기본 옵션 설정
    const defaultOptions = {
        url: 'cashCharge.jsp',
        windowName: '캐시충전',
        width: 800,
        height: 750,
        left: undefined,
        top: undefined,
        resizable: 'yes',
        scrollbars: 'yes'
    };

    const settings = { ...defaultOptions, ...options };

    // 창 중앙에 위치시키기 (left와 top이 지정되지 않은 경우)
    if (settings.left === undefined || settings.top === undefined) {
        settings.left = (window.screen.width - settings.width) / 2;
        settings.top = (window.screen.height - settings.height) / 2;
    }

    const windowFeatures = `width=${settings.width},height=${settings.height},left=${settings.left},top=${settings.top},resizable=${settings.resizable},scrollbars=${settings.scrollbars}`;

    // 새 창 열기
    try {
        const popupWindow = window.open(settings.url, settings.windowName, windowFeatures);
        if (!popupWindow || popupWindow.closed || typeof popupWindow.closed == 'undefined') {
            alert("팝업 차단이 활성화되어 있습니다. 이 사이트의 팝업을 허용해 주세요.");
        }
    } catch (error) {
        console.error("캐시 충전 창을 열 수 없습니다:", error);
        alert("캐시 충전 창을 열 수 없습니다. 오류가 발생했습니다.");
    }
}