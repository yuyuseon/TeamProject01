<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
    <title>오픈 API Map Test - 이벤트 등록</title>
    <!-- prevent IE6 flickering -->
    <script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>

    <script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=0x7nqgscan"></script>
</head>
<body>
<div id="testMap" style="border:1px solid #000; width:500px; height:400px; margin:20px;"></div>
<button onclick="javascript:addClickEvent();">클릭 이벤트 추가</button>
<button onclick="javascript:removeClickEvent();">클릭 이벤트 해제</button>
<script>
$(function(){

	var mapOptions = {
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 10
		};

	var map = new naver.maps.Map('map', mapOptions);

	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.5666805, 126.9784147),
	    zoom: 4
	});

	var jeju = new naver.maps.LatLng(33.3590628, 126.534361),
	    busan = new naver.maps.LatLng(35.1797865, 129.0750194),
	    dokdo = new naver.maps.LatLngBounds(
	                new naver.maps.LatLng(37.2380651, 131.8562652),
	                new naver.maps.LatLng(37.2444436, 131.8786475)),
	    seoul = new naver.maps.LatLng(37.7010174173061, 127.18379493229875);
				/* new naver.maps.LatLngBounds(
	                new naver.maps.LatLng(37.42829747263545, 126.76620435615891),
	                new naver.maps.LatLng(37.7010174173061, 127.18379493229875)); */
	
	$("#to-jeju").on("click", function(e) {
	    e.preventDefault();
	
	    map.panTo(jeju);
	});
	
	$("#to-gwangju").on("click", function(e) {
	    e.preventDefault();
	
	    searchAddressToCoordinate('광주시');
	    //map.setZoom(1, true);
	});
	
	$("#to-dokdo").on("click", function(e) {
	    e.preventDefault();
	
	    map.fitBounds(dokdo);
	});
	
	$("#to-busan").on("click", function(e) {
	    e.preventDefault();
	
	    map.panTo(busan);
	});
	
	$("#to-seoul").on("click", function(e) {
	    e.preventDefault();
	
	    map.panTo(seoul);
	});
	
	$("#panBy").on("click", function(e) {
	    e.preventDefault();
	
	    map.panBy(new naver.maps.Point(10, 10));
	});
	
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});


	// search by tm128 coordinate
	function searchCoordinateToAddress(latlng) {
	    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

	    infoWindow.close();

	    naver.maps.Service.reverseGeocode({
	        location: tm128,
	        coordType: naver.maps.Service.CoordType.TM128
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var items = response.result.items,
	            htmlAddresses = [];

	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
	        }

	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	                htmlAddresses.join('<br />'),
	                '</div>'
	            ].join('\n'));

	        infoWindow.open(map, latlng);
	    });
	}

	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);

	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
	                addrType +' '+ item.address +'<br />',
	                '</div>'
	            ].join('\n'));


	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}

	function initGeocoder() {
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });

	    $('#address').on('keydown', function(e) {
	        var keyCode = e.which;

	        if (keyCode === 13) { // Enter Key
	            searchAddressToCoordinate($('#address').val());
	        }
	    });

	    $('#submit').on('click', function(e) {
	        e.preventDefault();

	        searchAddressToCoordinate($('#address').val());
	    });

	    //searchAddressToCoordinate('정자동 178-1');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
});
</script>
</body>
</html>