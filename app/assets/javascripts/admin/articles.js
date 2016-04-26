// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require ckeditor/init
$("document").ready(function(){

    // $(document).on("keydown",".current_input_tag",function(event){
    //     if(event.keyCode==32) {
    //         current_tag = $(".current_input_tag");
    //         tag_name = current_tag.children("input")[0].value;
    //         if(tag_name == "") return;
    //         inputed_tags = $("ul.tag-ul li.inactive");
    //         found_tag = null;
    //         for(i=0;i<inputed_tags.length;i++){
    //             //console.log(inputed_tags.eq(i).children("input")[0].value);
    //             if(inputed_tags.eq(i).children("input")[0].value==tag_name){
    //                 found_tag = inputed_tags.eq(i);
    //                 //console.log(i);
    //                 break;
    //             }
    //         }

    //         if(found_tag){
    //             current_tag.insertAfter(found_tag);
    //         }else{
    //             current_tag.before('<li class="inactive"><input type="text" name="admin_article[tag_names][]" value="'+tag_name+'"><span class="glyphicon glyphicon-remove"></span></li>');
    //         }
    //         current_tag.children("input")[0].value = "";
    //         current_tag.children("input")[0].focus();

    //     }
    // })
    // $(document).on("click",".glyphicon-remove",function(event){
    //     $(this).parent("li").remove();
    // })

    $(document).on("click","#tool-preview",function(event){
      preview_text = $("#preview_text").val();
      $.post("/admin/mdtools/preview",
      {
        text:preview_text
      },function(data,status){
        if($("#tool-preview").hasClass("glyphicon-eye-open")){
          $("#tool-preview").removeClass("glyphicon glyphicon-eye-open");
          $("#tool-preview").addClass("glyphicon glyphicon-eye-close");
          $("#side-preview").slideDown("fast");
        }else{
          $("#tool-preview").removeClass("glyphicon glyphicon-eye-close");
          $("#tool-preview").addClass("glyphicon glyphicon-eye-open");
          $("#side-preview").slideUp("fast");
        }

      })
    })
    $("select").select2({dropdownCssClass: 'dropdown-inverse'});
    $(':checkbox').radiocheck();
})
