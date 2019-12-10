function loadPage() {
  $(".js-visa-form").hide();
  $(".js-mastercard-form").hide();
  $(".js-amex-form").hide();
}

function visaForm() {
  $(".js-default-form").hide();
  $(".js-mastercard-form").hide();
  $(".js-amex-form").hide();
  $(".js-visa-form").show();
  $(".js-mastercard").removeClass("active");
  $(".js-amex").removeClass("active");
  $(".js-visa").addClass("active");
}

function mastercardForm() {
  $(".js-default-form").hide();
  $(".js-amex-form").hide();
  $(".js-visa-form").hide();
  $(".js-mastercard-form").show();
  $(".js-visa").removeClass("active");
  $(".js-amex").removeClass("active");
  $(".js-mastercard").addClass("active");
}

function amexForm() {
  $(".js-default-form").hide();
  $(".js-mastercard-form").hide();
  $(".js-visa-form").hide();
  $(".js-amex-form").show();
  $(".js-visa").removeClass("active");
  $(".js-mastercard").removeClass("active");
  $(".js-amex").addClass("active");
}