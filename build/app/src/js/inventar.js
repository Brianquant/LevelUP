$(document).ready(function () {

    var storedItemData = localStorage.getItem('itemData');
    localStorage.removeItem('itemData');
    console.log(storedItemData);
    if(storedItemData){
        openItemModal(JSON.parse(storedItemData));
        storedItemData = null;
        console.log(storedItemData);
    }
    // Event handler for clicking on a slot
    $('.slot').on('click', function () {
    // Get the item-data of the clicked slot
    var itemData = $(this).data('item');

    // Open the item modal using the function
    openItemModal(itemData);
    });

});

// Function to open the item modal
function openItemModal(itemData) {
    console.log(itemData);
    // Update modal title
    $('#ItemInfoLabel').text(itemData.bezeichnung);

    // Display the item details in the modal body
    $('#item-details').html(`
        <p>Seltenheit: ${itemData.seltenheit}</p>
        <p>Beschreibung: ${itemData.beschreibung}</p>
    `);

    // Show the modal
    $('#ItemInfo').modal('show');
}