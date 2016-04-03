// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  if($(".time-line")[0] != undefined){
    left = $(".time-line")[0].offsetLeft;
    width = $(".time-line").width();
    result = left+width/2;
    $(".line").css("left",result);
    $(window).resize(function() {
        left = $(".time-line")[0].offsetLeft
        width = $(".time-line").width();
        result = left+width/2;
        $(".line").css("left",result);
    });
  }

  footer = $("#footer")[0];
  if((footer.offsetTop + footer.clientHeight) < window.outerHeight){
    $(footer).css("position" , "fixed");
  }

  // baiduapi
  // api_key  = "732b40aadc7409a1349780c6fb7a55f3";
  // 获取ip所在地
  // http_url = "http://apis.baidu.com/apistore/iplookupservice/iplookup";
  // http_arg = {ip:"117.89.35.58"};
  // $.ajax({
  //   url:http_url,
  //   data:http_arg,
  //   type:'GET',
  //   beforeSend: function(xhr){xhr.setRequestHeader('apikey',api_key );},
  //   success:function(data){
  //     console.log(data);
  //   }
  // })
  // 获取天气
  // http_url = "http://apis.baidu.com/apistore/weatherservice/citylist";
  // http_arg = {cityname:"江宁"};
  // arg = '';
  // $.ajax({
  //   url:http_url,
  //   data:http_arg,
  //   type:'GET',
  //   dataType:'json',
  //   beforeSend: function(xhr){xhr.setRequestHeader('apikey',api_key );},
  //
  //   success:function(data){
  //     http_url = "http://apis.baidu.com/apistore/weatherservice/cityid";
  //     http_arg = {cityid:data["retData"][0]["area_id"]}
  //     $.ajax({
  //       url:http_url,
  //       data:http_arg,
  //       type:'GET',
  //       dataType:'json',
  //       beforeSend: function(xhr){xhr.setRequestHeader('apikey',api_key );},
  //       success:function(data){
  //         if(data["retData"]["weather"]=="多云"){
  //
  //         }
  //       }
  //     })
  //   }
  // })
})
