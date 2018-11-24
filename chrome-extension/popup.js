const bkg = chrome.extension.getBackgroundPage()

const getCookies = () => {
  const url = document.getElementById("urlText").value
  bkg.getAllCookies(url, setCurrentText)
}
const deleteCookies = () => {
  const url = document.getElementById("urlText").value
  bkg.deleteAllCookies(url, setCurrentText)
}
const setCookies = () => {
  const url = document.getElementById("urlText").value
  const newCookies = JSON.parse(document.getElementById("newText").value)
  bkg.setAllCookies(url, newCookies, setNewText)
}

const setCurrentText = (_url, json) => {
  text = JSON.stringify(json)
  document.getElementById("currentText").value = text
}
const setNewText = (_url, json) => {
  text = JSON.stringify(json)
  document.getElementById("newText").value = text
}
document.getElementById('getCookiesBtn').addEventListener('click', getCookies);
document.getElementById('setCookiesBtn').addEventListener('click', setCookies);
document.getElementById('deleteCookiesBtn').addEventListener('click', deleteCookies);

chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
  document.getElementById('urlText').value = tabs[0].url;
});
