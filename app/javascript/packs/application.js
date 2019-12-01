// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.toggleItemEdit = function(itemNode) {
  console.log(itemNode)
  itemNode.querySelectorAll(".item-option").forEach(function(itemOption) {
    console.log(itemOption)
    itemOption.classList.toggle("item-option-hidden")
  })
}

window.copyToClipboard = str => {
  const el = document.createElement('textarea');
  el.value = str;
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
};
