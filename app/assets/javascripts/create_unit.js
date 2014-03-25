var HH = HH || {};
$(document).ready(function(){
  var c_id = $('#c_id').val(),
      unit_num = $('#unit_num').val(),
      unit_title = $('#unit_title').val(),
      unit_desc = $('#unit_desc').val();

  $('#create_unit').click(function(event){
    event.preventDefault();
    var c_id = $('#c_id').val(),
      unit_num = $('#unit_num').val(),
      unit_title = $('#unit_title').val(),
      unit_desc = $('#unit_desc').val();

    HH.create_unit(c_id, unit_num, unit_title, unit_desc);
    return false;
  });

  $('#create_new_lesson').click(function(event){
    window.location.pathname = Routes.new_course_lesson_path(c_id);
  });
});

HH.create_unit = function(course_id, unit_num, unit_title, unit_desc) {
  $.ajax({
      url: '/courses/' + course_id + '/units',
      type: 'POST',
      dataType: 'json',
      data: { unit: {unit_number: unit_num, title: unit_title, description: unit_desc, course_id: course_id}},
    })
    .done(function(unit) {
      var container = $('.units');
      HH.render_unit(container, unit);
      console.log("success");
    })
    .fail(function(data) {
      console.log(data);
    })
    .always(function() {
      console.log("complete");
    });
};

HH.render_unit = function(container, unit){
  var div = $('<div class="unit">'),
    unit_text = unit.unit_number + " " + unit.title;
  div.append(unit_text);
  container.append(div);
};
