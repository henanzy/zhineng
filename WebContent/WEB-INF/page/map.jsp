<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
  <title></title>
  <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
  <script src="../js/jquery-1.7.1.min.js""></script>
  <style>
    html,
    body,
    #container {
      width: 100%;
      height: 100%;
    }

    #map-styles .input-item {
      height: 2rem;
    }

    #map-styles .input-item span{
      display: inline-block;
      width: 4rem;
    }

    #map-styles .input-item .input-text {
      color: #0288d1;
      margin-left: 1rem;
      margin-right: 0rem;
      width: 6rem;
    }
    
    .warnIcon{
    	background-image: url(../images/navimap/circle.png);
	    animation-name: scaleout;
	    animation-duration: 1.5s;
	    animation-timing-function: ease-in-out;
	    animation-iteration-count: infinite;
	    width: 64px;
	    height: 64px;
	    position: relative;
	    left: 0px;
	    top: 0px;
	    filter: url(blur.svg#blur);
	    -webkit-filter: blur(2px);
	    -moz-filter: blur(2px);
	    -ms-filter: blur(2px);
	    filter: blur(2px);
	    filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius=2, MakeShadow=false);
	    z-index: 0;
	    pointer-events: none;
	    /*-webkit-box-shadow: 0 0 10px #ff0;*/
			position: relative;
	    left:-12px; /*-9*/
	    top:-12px;  /*-4*/
	    z-index: 0;
    }
    
    
    @keyframes scaleout {
    0% {
        transform: scale(0.2);
        opacity: 1;
    }
    100% {
        transform: scale(2.0);
        opacity: 0;
    }
}
@keyframes warn-light {
    0% {
        background-image:linear-gradient(90deg,red,white,red);
    }
    100% {
        background-image:linear-gradient(90deg,white,red,white);
    }
}
@keyframes warn-light-outside {
    0% {
        background-image:linear-gradient(45deg,red,black,red);
    }
    100% {
        background-image:linear-gradient(0deg,black,red,black);
    }
}
@keyframes twinkle {
    0% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}

    
  </style>
</head>

<body>
  <div id="container"></div>
  
  <script src="https://cache.amap.com/lbs/static/es5.min.js"></script>
  <script src="https://webapi.amap.com/maps?v=1.4.15&key=ef9a51f031e725d524e057c1e62b103f"></script>
  <script>

	 	 $(function(){
	    //初始化地图
	    var map = new AMap.Map('container', {
	    	center:[111.180341,34.786371],
	        resizeEnable: true, //是否监控地图容器尺寸变化
	        mapStyle: "amap://styles/darkblue",
	        viewMode:'3D'
	    });

	    var markers = [{
	        icon: '../images/navimap/normal.png',
	        position: [111.171049,34.783178],
	        title:'金领时代换热站'
	    },{
	        icon: '../images/navimap/normal.png',
	        position: [111.189871,34.789124],
	        title:'建业壹号城邦换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.20442,34.779861],
	        title:'砥柱大厦换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.185321,34.773588],
	        title:'越海华府换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.179546,34.774539],
	        title:'枫桥水岸换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.193809,34.793432],
	        title:'金盾园换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.165555,34.795189],
	        title:'枢纽局西苑小区换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.165869,34.785429],
	        title:'天鹅堡换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.177323,34.781041],
	        title:'联通嘉苑换热站'
	    }, {
	        icon: '../images/navimap/normal.png',
	        position: [111.175522,34.79366],
	        title:'舒馨苑换热站'
	    },  {
	        icon: '../images/navimap/warning.png',
	        position: [111.180341,34.786371],
	        title:'警报'
	    }];
	
	    // 添加一些分布不均的点到地图上,地图上添加三个点标记，作为参照
	    markers.forEach(function(marker) {
	        new AMap.Marker({
	            map: map,
	            icon: marker.icon,
	            title:marker.title,
	            position: [marker.position[0], marker.position[1]],
	            offset: new AMap.Pixel(-13, -30)
	        });
	    });
	//  自适应
	    map.setFitView();
	      map.on('complete', function() {
	        var amapicon = $(".amap-icon");
	        $(".amap-icon img").css("z-index","1");
		    	var html = "<div class='warnIcon'></div>"
		    	amapicon.append(html);
		    
	    });
   
	    	
    });
   
    
    
  </script>
</body>
	
</html>