var HH = HH || {};
$(document).ready(function(){

  $('#create_lesson').click(function(event){
    event.preventDefault();
    var lesson_title = $('#lesson_title').val(),
      lesson_description = $('#lesson_description').val(),
      unit_id = $('#lesson_unit_id').val();
    HH.create_lesson(lesson_title, lesson_description, unit_id);
    lesson_title.val("");
    lesson_description.text("");
    return false;
  });
});

HH.create_lesson = function(lesson_title, lesson_description, unit_id) {
  $.ajax({
      url: '/lessons',
      type: 'POST',
      dataType: 'json',
      data: { lesson: {title: lesson_title, description: lesson_description, unit_id: unit_id}},
    })
    .done(function(lesson) {
      var container = $('#unit_' + lesson.unit_id);
      HH.render_lesson(container, lesson);
      console.log("success");
    })
    .fail(function(data) {
      console.log(data);
    })
    .always(function() {
      console.log("complete");
    });
};

HH.render_lesson = function(container, lesson){
  var div = $('<div class="lesson">'),
    lesson_text = lesson.title;
  div.append(lesson_text);
  container.append(div);
};
