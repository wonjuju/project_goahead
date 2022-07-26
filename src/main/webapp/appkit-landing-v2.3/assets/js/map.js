 $(document).ready(function() {
    	mapload();
    	})
    		
	// mapload()함수가 없으면 지도 좌표값이 변경돼도 지도가 재실행이 안됨 에이젝스 성공하면 지도 재실행하게 
	function mapload() {
		
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
	
		center: new kakao.maps.LatLng(lat, long),
        level: 3 // 지도의 확대 레벨
    };
	
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
// 임의의 값 넣어주기? gps컬럼이 하나라 분리해서 넣어야할것같아여
		
		
var markerPosition  = new kakao.maps.LatLng(lat, long); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
	}
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
