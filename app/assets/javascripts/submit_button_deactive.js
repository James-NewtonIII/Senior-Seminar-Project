//Found at:         https://stackoverflow.com/questions/12534457/how-to-disable-a-submit-button-if-text-field-is-empty-in-ruby-on-rails
//Working demo at:  http://jsbin.com/utasar/1/edit?html,js,output
$(document).on('turbolinks:load', function() {
    if($('#reason_field').val() ==  "") 
        $('#ba_reject_button').prop('disabled', true);

    $('#reason_field').keyup(function(){
        if($('#reason_field').val() !=  "") 
            $('#ba_reject_button').prop('disabled', false);    
        else
            $('#ba_reject_button').prop('disabled', true);   
    });
});