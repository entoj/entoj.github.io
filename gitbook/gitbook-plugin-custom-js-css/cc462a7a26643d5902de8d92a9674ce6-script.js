require(['jquery'], function($)
{
    var $sections = $('h4 + pre, h5 + pre');
    console.log($sections.length);
    $sections.each(function()
    {
        var $code = $(this);
        var $headline = $code.prev();
        var $section = $('<div class="section"></div>');
        $code.after($section);
        $headline.remove();
        $code.remove();         
        $headline.appendTo($section);
        $code.appendTo($section);
    });
});