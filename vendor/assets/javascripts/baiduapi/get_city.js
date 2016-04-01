
function getCity(){
  http_url = "http://apis.baidu.com/apistore/iplookupservice/iplookup";
  http_arg = {ip:"117.89.35.58"};
  api_key  = "732b40aadc7409a1349780c6fb7a55f3";
  $.ajax({
    url:http_url,
    data:http_arg,
    type:'GET',
    beforeSend: function(xhr){xhr.setRequestHeader('apikey',api_key );},
    success:function(data){
      return data;
    }
  })
}
