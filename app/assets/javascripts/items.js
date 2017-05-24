$(document).ready(function(){
  $("#item-finder").submit(function(event){
    event.preventDefault();
    var itemId = $("input[name=item_id]").val();
    var url = "/items/" + itemId + ".json";

    $.get(url, function(data){
      console.log("SUCCESS:", data.id, data.name);

      $("#items-list").append(
        "<li>Id: " + data.id + ", Name:" + data.name + "</li>"
      );
    });
  });
});