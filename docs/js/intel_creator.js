/*
 *  Intel creator made for MalFramework script library for Arma 3.
 *  Supports v1.11.2 of the framework.
 *
 *  GitHub: https://github.com/Malbryn/MalFramework
 */

/*
 *  Event fired when the user submits the form.
 */
$("#main-form").submit(function(e) {
    e.preventDefault();
    let fields = $(this).serializeArray();

    generateBriefing(fields);
})

/*
 *  Adds a new intel card.
 */
$(function() {
    const $cardTemplate = $(".card").clone();

    $("#add-intel").on("click", function(e) {
        e.preventDefault();

        let $cardClone = $cardTemplate.clone();
        $("#main-form").append($cardClone);
    });    
})

/*
 *  Converts the line breaks to "<br/>".
 */
function convertLineBreaks(str) {
    return str.split("\n").join("\n<br/>");
}

/*
 *  Generates the briefing template.
 */
function generateBriefing(fields) {
    // Convert line breaks
    fields.forEach(element => {
        element['value'] = convertLineBreaks(element['value']);
    });

    // Output
    let template = ``

    // Display output
    $("#briefing-output").val(template);
    $("#briefing-output-field").css("display", "flex");

    // Scroll down
    $("#briefing-output-field")[0].scrollIntoView({
        behavior: "smooth",
        block: "start"
    });
}

/*
 *  Copy to clipboard event fired when the user clicks the button.
 */
$("#copy-button").click(function(event) {
    let text = $("#briefing-output");

    text.select();
    document.execCommand("copy");
    document.getSelection().removeAllRanges();

    // Button text
    $("#panel").slideDown("slow");

    setTimeout(function() {
        $("#panel").slideUp("slow");
    }, 3000);
})
