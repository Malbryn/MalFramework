/*
 *  Briefing generator made for MalFramework script library for Arma 3.
 *
 *  GitHub: https://github.com/Malbryn/MalFramework
 */


/*
 *  Event fired when the user submits the form.
 */
$("#main-form").submit(function(e) {
    let fields = $(this).serializeArray();
    
    e.preventDefault();

    generateBriefing(fields);
})


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
    fields.forEach(e => {
        e['value'] = convertLineBreaks(e['value']);
    });

    // Select side colour
    let sideColour = fields[27]['value'] === "BLUFOR" ? "#21749c" : "#9c2d21";

    // Output
    let template = `// This briefing file was generated with the Briefing Builder tool

NEWTAB("I. Organisation")
<br/><font color='${sideColour}' size='18' face='PuristaBold'>BLUFOR ORBAT</font>
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>${fields[0]['value']}</font>
<br/>${fields[1]['value']}
ENDTAB;

NEWTAB("II. Situation")
<br/><font color='${sideColour}' size='18' face='PuristaBold'>SUMMARY</font>
<br/>${fields[2]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>AREA OF OPERATIONS</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Terrain</font>
<br/>${fields[3]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Weather</font>
<br/><font size='12' face='PuristaMedium'>Current:</font>
<br/>${fields[4]['value']}
<br/>
<br/><font size='12' face='PuristaMedium'>Forecast:</font>
<br/>${fields[5]['value']}
<br/>
<br/><font size='12' face='PuristaMedium'>Visibility:</font>
<br/>${fields[6]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Civilian presence</font>
<br/>${fields[7]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>ENEMY FORCES</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Composition and Strength</font>
<br/>${fields[8]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Capabilities:</font>
<br/><font size='12' face='PuristaMedium'>Armour:</font>
<br/>${fields[9]['value']}
<br/>
<br/><font size='12' face='PuristaMedium'>Air:</font>
<br/>${fields[10]['value']}
<br/>
<br/><font size='12' face='PuristaMedium'>Artillery:</font>
<br/>${fields[11]['value']}
<br/>
<br/><font size='12' face='PuristaMedium'>Explosives:</font>
<br/>${fields[12]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Rules of engagement:</font>
<br/>${fields[13]['value']}
ENDTAB;

NEWTAB("III. Mission:")
<br/><font color='${sideColour}' size='18' face='PuristaBold'>MISSION INTENT</font>
<br/>${fields[14]['value']}
ENDTAB;

NEWTAB("IV. Support & Logistics:")
<br/><font color='${sideColour}' size='18' face='PuristaBold'>SUPPORT</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Available supports:</font>
<br/>${fields[15]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>LOGISTICS</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Maintenance:</font>
<br/>${fields[16]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Transportation:</font>
<br/>${fields[17]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Resupplies:</font>
<br/>${fields[18]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>SIGNALS</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Radio frequencies</font>
<br/>${fields[19]['value']}
<br/>
ENDTAB;

NEWTAB("V. Notes:")
<br/><font color='${sideColour}' size='18' face='PuristaBold'>RESPAWNS</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Player respawn</font>
<br/>${fields[20]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Asset respawn</font>
<br/>${fields[21]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Reinsertion</font>
<br/>${fields[22]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>END CONDITIONS</font>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Success</font>
<br/>${fields[23]['value']}
<br/>
<br/><font color='${sideColour}' size='14' face='PuristaSemiBold'>Failure</font>
<br/>${fields[24]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>RESTRICTIONS</font>
<br/>${fields[25]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>JIP</font>
<br/>${fields[26]['value']}
<br/>
<br/>
<br/><font color='${sideColour}' size='18' face='PuristaBold'>Mission maker's notes</font>
<br/>${fields[27]['value']}
ENDTAB;`

    // Display output
    $("#output").val(template);
    $("#output-field").css("display", "flex");

    // Scroll down
    $("#output-field")[0].scrollIntoView({
        behavior: "smooth",
        block: "start"
    });
}
