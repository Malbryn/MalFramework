/*
 *  Intel creator made for MalFramework script library for Arma 3.
 *  Supports v1.11.2 of the framework.
 *
 *  GitHub: https://github.com/Malbryn/MalFramework
 */

let output = [];

/*
 *  Adds a new intel card.
 */
$("#add-intel").on("click", function(e) {
    e.preventDefault();

    let $lastCard = $("div[id^='card_']:last");
    let newID = parseInt($lastCard.prop("id").match(/\d+/g), 10) + 1;
    let $cardClone = $lastCard.clone().prop("id", "card_" + newID);
    let $cardCloneID = '#' + $cardClone.attr('id');

    $("#main-form").append($cardClone);

    clearForm($cardCloneID);
    setIntelID($cardCloneID);
})


/*
 *  Removes the selected intel card. 
 */
$(".main-form-container").on("click", ".card-remove", function(e) {
    e.preventDefault();

    $(this).closest(".card").remove();

    // Re-assign ID's
    refreshIntelIDs();
})


/*
 *  Event fired when the user submits the form.
 */
$("#main-form").submit(e => {
    e.preventDefault();

    generateIntel();
})


/*
 *  Refreshes the intel IDs.
 */
function refreshIntelIDs() {
    let cards = $(".main-form-container").find("div[id^='card_']");

    Array.from(cards).forEach(function (e, i) {
        setCardID(e, i);
    });
}


/*
 *  Refreshes the ID of a card.
 */
function setCardID(oldID, index) {
    let newID = 'card_' + index;

    $(oldID).prop("id", newID);
    setIntelID('#' + newID);
}


/**
 *  Changes the card header according to the ID of the intel card.
 */
function setIntelID(cardID) {
    let intelTitle = "Intel #" + cardID.split("_")[1];

    $(cardID).find("h3").html(intelTitle);
}


/*
 *  Clears the form after cloning it.
 */
function clearForm(cardID) {
    let formElements = $(cardID).find('.user-input');

    Array.from(formElements).forEach(e => {
        $(e).attr('type') === 'checkbox' ? $(e).prop('checked', false) : $(e).val('');
    });
}


/*
 *  Converts the line breaks to "<br/>".
 */
function convertLineBreaks(str) {
    str = str.split("\n").join("\n<br/>");
    return str;
}


/*
 *  Generates the intel template.
 */
function generateIntel() {
    let cards = $(".main-form-container").find("div[id^='card_']");

    Array.from(cards).forEach(e => {
        let formElements = $(e).find('.user-input');
        let intelArray = [];

        Array.from(formElements).forEach(e => {
            intelArray.push(
                $(e).attr('type') === 'checkbox' ? $(e).prop('checked') : convertLineBreaks($(e).val())
            );
        });

        // Convert the duration to integer
        intelArray[2] = parseInt(intelArray[2]);

        output.push(intelArray);
    });
    
    let template = `// This intel file was generated with the Intel Creator tool

EGVAR(intel,intelList) = [${ formatOutput(output) }];
    `

    // Display output
    $("#output").val(template);
    $("#output-field").css("display", "flex");

    // Scroll down
    $("#output-field")[0].scrollIntoView({
        behavior: "smooth",
        block: "start"
    });

    // Reset output
    output = [];
}


/**
 *  Format the output array.
 */
function formatOutput(output) {
    let templateString = "";

    output.forEach(e => {
        templateString += '["' + e[0] + '", "' + e[1] + '", ' + e[2] + ', ' + e[3] + ', ' + e[4] + '], ';
    })

    // Delete the last comma
    templateString = templateString.slice(0, -2);

    return templateString;
}


/*
 *  Copy to clipboard event fired when the user clicks the button.
 */
$("#copy-button").click(e => {
    let text = $("#output");

    text.select();
    document.execCommand("copy");
    document.getSelection().removeAllRanges();

    // Button text
    $("#panel").slideDown("slow");

    setTimeout(function() {
        $("#panel").slideUp("slow");
    }, 3000);
})
