<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/gongmo/resources/styles/js/bootstrap.min.js"></script>
<link href="/gongmo/resources/styles/css/bootstrap.min.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="Stylesheet" href="/gongmo/resources/styles/css/default.css" /> 
 
  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c6292734fec2c656a1ae18a9086544ba"></script>
    
<style>

  
</style> 
<script type='text/javascript' src='http://www.google.com/jsapi'></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
       google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
          var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day', ],
            ['Work',     40],
            ['Eat',      2],
            ['Commute',  2],
            ['Watch TV', 2],
            ['Sleep',    7]
          ]);

          var options = {
            title: 'My Daily Activities',
            is3D: true,
          };

          var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
          chart.draw(data, options);
        }
      
    </script>

</head>
<body>

<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
   

</body>
</html>
