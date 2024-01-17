
$(document).ready(function () {

    //Show Lootbox-Modal by click on Lootbox
    $('.lootbox').on('click', function () {
        // Get the LootboxType of the clicked Lootbox
        var lootboxType = $(this).data('item');
        var anzahl = $(this).data('count');

    // Make an AJAX request to the server to get lootbox data
    $.ajax({
      url: '/lootbox?type=' + lootboxType,
      method: 'GET',
      success: function (data) {

        $('#LootboxInfoLabel').text(lootboxType + '-Lootbox'); //Change Modal title according to Lootbox type

        // Display the lootbox details in the modal body
        var lootboxDetails = '<div style="text-align:center;"><img src="/assets/lootboxen/' + lootboxType + '_Lootbox.png"></div>';
        lootboxDetails += '<p><span class="purple">In Besitz: ' + anzahl +'</span></p>'
        lootboxDetails += '<p><span class="purple">Kann enthalten:</span></p>';
        lootboxDetails += '<ul class="item-list">';
        for (var i = 0; i < data.length; i++) {
            lootboxDetails += '<li>' + data[i].bezeichnung + '</li>';
        }
        lootboxDetails += '</ul>';

        $('#lootbox-details').html(lootboxDetails);

        //If no lootbox of this type is owned disable the "Öffnen" button
        if(anzahl === 0){
          $("#openLootbox").prop("disabled", true);
        }else{
          $("#openLootbox").prop("disabled", false);
        }
        
        // Show the modal
        $('#LootboxInfo').modal('show');


      },
      error: function (error) {
        console.error('Error:', error);
      }
    });


    });

});


function openLootbox(){

    //Get the Lootboxtype out of the modal-title
    var lootboxType = $('#LootboxInfoLabel').text().split('-')[0];

    //Server request to get the item from the lootbox
    $.ajax({
        url: '/lootbox/open',
        method: 'GET',
        data: { lootboxType: lootboxType },
        success: function (data) {
          $('#inventarButton').data('itemData', data); //Store the item data in the button
          $('#LootboxInfo').modal('hide'); //hide the lootbox-modal
          
          //Add the item details to the item-modal
          $('#ItemInfoLabel').text(data.bezeichnung);
          $('#item-details').empty();
          $('#item-details').html(`
          <div style="text-align:center;"><img class="fading-edges" src="/assets/lootboxen/OpenLootbox.jpg"></div>
          <p><span class="purple">Seltenheit:</span> ${data.seltenheit}</p>
          <p><span class="purple">Beschreibung:</span> ${data.beschreibung}</p>
          `);
          
          //show the item-modal
          $('#ItemInfo').modal('show');
        },
        error: function (error) {
          console.error('Error:', error);
        }
      });

}

//function to show the received item on the inventory page
function openInventory(){
  var itemData = $('#inventarButton').data('itemData'); //get the item data from the button

  localStorage.setItem('itemData', JSON.stringify(itemData)); //store the item in the local storage
}

