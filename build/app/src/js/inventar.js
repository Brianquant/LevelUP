$(document).ready(function () {
    //Show modal by click on slot
    $('.slot').on('click', function () {
        // Get the item-data of the clicked slot
        var itemData = $(this).data('item');

        // Update modal title
        $('#ItemInfoLabel').text(itemData.bezeichnung);

        // Display the item details in the modal body
        $('#item-details').html(`
            <p>Seltenheit: ${itemData.seltenheit}</p>
            <p>Beschreibung: ${itemData.beschreibung}</p>
        `);

        // Show the modal
        $('#ItemInfo').modal('show');
    });
});