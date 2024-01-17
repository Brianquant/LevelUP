
$(document).ready(function () {

    //Show modal by click on Lootbox
    $('.lootbox').on('click', function () {
        // Get the LootboxType of the clicked Lootbox
        var lootboxType = $(this).data('item');
        var anzahl = $(this).data('count');

        // Make an AJAX request to your server
    $.ajax({
      url: '/lootbox?type=' + lootboxType, // Update the endpoint to match your server route
      method: 'GET',
      success: function (data) {
        // Handle the server response here
        //console.log('Server response:', data);

        $('#LootboxInfoLabel').text(lootboxType + '-Lootbox');

        // Display the item details in the modal body
        var lootboxDetails = '<div style="text-align:center;"><img src="/assets/lootboxen/' + lootboxType + '_Lootbox.png"></div>';
        lootboxDetails += '<p><span class="purple">In Besitz: ' + anzahl +'</span></p>'
        lootboxDetails += '<p><span class="purple">Kann enthalten:</span></p>';
        lootboxDetails += '<ul class="item-list">';
        for (var i = 0; i < data.length; i++) {
            lootboxDetails += '<li>' + data[i].bezeichnung + '</li>';
        }
        lootboxDetails += '</ul>';

        $('#lootbox-details').html(lootboxDetails);

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
    var lootboxType = $('#LootboxInfoLabel').text().split('-')[0];


        console.log('Opening ' + lootboxType + ' lootbox...');

        $.ajax({
            url: '/lootbox/open',
            method: 'GET',
            data: { lootboxType: lootboxType },
            success: function (data) {
              console.log('Server response:', data);
              $('#inventarButton').data('itemData', data);
              $('#LootboxInfo').modal('hide');
              $('#ItemInfoLabel').text(data.bezeichnung);
              $('#item-details').empty();
              $('#item-details').html(`
              <div style="text-align:center;"><img class="fading-edges" src="/assets/lootboxen/OpenLootbox.jpg"></div>
              <p><span class="purple">Seltenheit:</span> ${data.seltenheit}</p>
              <p><span class="purple">Beschreibung:</span> ${data.beschreibung}</p>
              `);
              $('#ItemInfo').modal('show');
            },
            error: function (error) {
              console.error('Error:', error);
            }
          });

}

function openInventory(){
  var itemData = $('#inventarButton').data('itemData');

  localStorage.setItem('itemData', JSON.stringify(itemData));
}

