$(function () {
  $("ul#chapter").sortable();
  $("ul.section").sortable({
    connectWith: 'ul.section'
  });
  $("ul.lesson").sortable({
    connectWith: 'ul.lesson'
  });

  $("input#save_order").click(function (click) {
    var count = 1;
    $.each($('input.chapter'), function() {
      $(this).val(count++)
    });

    var count = 1;
    $.each($('input.section_number'), function() {
      $(this).val(count++)
    });

    var count = 1;
    $.each($('input.lesson'), function() {
      $(this).val(count++)
    });

    $.each($('input.section_chapter_id'), function() {
      var chapter_id = $(this).parents('li.chapter').attr('id');
      var id = chapter_id.substr(8);
      $(this).val(id);
    });

    $.each($('input.lesson_section_id'), function() {
      var section_id = $(this).parents('li.section').attr('id');
      var id = section_id.substr(8);
      $(this).val(id);
    });
  });
});
