// $("#fan, #artist").hover(function() {
//     $("#artist h2").css({
//         color: "red"
//     });
// });

// - - - - -
// Home
// - - - - -

// CTA Hover Effect
$("#fan, #artist").each(function() {
    $(this).data("standardWidth", $(this).width());
});

$("#fan, #artist").hover(function() {
    $(this).parent().children().not(this).animate({
        width: "39%"
    }, 200 );
    $(this).animate({
        width: "60%"
    }, 200 );

}, function() {
    $(this).parent().children().each(function() {
        $(this).animate({
            width: $(this).data("standardWidth")
        }, 200 );
    });
});

// Carousel Auto-Cycle
$(document).ready(function() {
    $('.carousel').carousel({
        interval: 6000
    })
});

// - - - - -
// About
// - - - - -



// - - - - -
// Profile
// - - - - -

// Follow and Message buttons
$("section#profile .actions a.button-lightgreen").mouseenter(function() {
    $("img", this).fadeOut(250);
    $("span", this).delay(250).fadeIn(250);
});

$("section#profile .actions a.button-lightgreen").mouseout(function() {
    $("span", this).fadeOut(250);
    $("img", this).delay(250).fadeIn(250);
});