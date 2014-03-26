$(document).ready(function() {
  $('button#pre-order').click(function() {
    var stripe_button = $('.stripe-button-el'),
      sign_in_link = $('a.stripe-button-link');
    if (stripe_button.length !== 0) {
      stripe_button.click();
    } else {
      window.location.pathname = '/users/sign_in'
    }
  });
});
