// basket logo toggle
let Basket = document.querySelector(".flex-basket");
function basketshow() {
    Basket.classList.toggle("hide")
}

$('.carousel').carousel({
    interval: 1800
})

$(document).ready(function () {
    // collapse
    // Remove border when the collapse is shown
    $('#accordion').on('shown.bs.collapse', function (e) {
        $(e.target).closest('.card').css('border', 'none');
    });

    // Add border back when the collapse is hidden
    $('#accordion').on('hidden.bs.collapse', function (e) {
        $(e.target).closest('.card').css('border', '1px solid var(--border-collapse-item_card)');
    });


    // show more detail combo
    $('.more-link').on('click', function () {
        $(this).hide();
    });

    $('.combo-card').each(function () {
        var comboId = $(this).find('.card-body_text').data('combo-id');
        var combo = document.getElementById('combo-' + comboId);
        var moreLink = $('#more-link-' + comboId);
        if (combo.scrollHeight > combo.clientHeight && combo.scrollHeight > 63) {
            moreLink.show();
            moreLink.css('display', 'ruby');
        } else {
            moreLink.hide();
        }
    });


    // show more in detail product page
    $('#accordion').on('shown.bs.collapse', function () {
        checkComboCardHeight();
    });

    function checkComboCardHeight() {
        $('.combo-card').each(function () {
            var comboId = $(this).find('.card-body_text').data('combo-id');
            var combo = document.getElementById('combo-' + comboId);
            var moreLink = $('#more-link-' + comboId);
            console.log(comboId);
            if (combo.scrollHeight > combo.clientHeight && combo.scrollHeight > 63) {
                moreLink.show();
                moreLink.css('display', 'ruby');
            } else {
                moreLink.hide();
            }
        });
    }

    // nav
    var path = window.location.pathname;

    $('.navbar-nav a').each(function () {
        var href = $(this).attr('href');
        if (href === path) {
            $(this).addClass('active');
        }
    });

    // // Define the input variable here
    // const input = $('input[data-cart-detail-index]');
    // const index = input.attr("data-cart-detail-index");
    // const el = document.getElementById(`cartDetails${index}.quantity`);
    // $(el).val(newVal);

});



