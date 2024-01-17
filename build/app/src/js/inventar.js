$(document).ready(function () {
    //get the item if it comes from the lootbox
    var storedItemData = localStorage.getItem('itemData');
    //remove it from the localStorage
    localStorage.removeItem('itemData');

    //if an item is in the localStorage show the item in a modal
    if(storedItemData){
        openItemModal(JSON.parse(storedItemData));
        storedItemData = null;
        console.log(storedItemData);
    }
    // show item in modal when clicked on
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