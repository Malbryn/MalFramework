$("#main-form").submit(function(event) {
    console.log($(this).serializeArray());
    event.preventDefault();
});
