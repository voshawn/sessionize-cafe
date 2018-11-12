
function getAllCookies(url, callback) {
 chrome.cookies.getAll(
   {"url": url}, c => {
     callback(url, c)
   })
}

function setAllCookies(url, cookies, callback) {
  cookies.map(cookie => {setCookie(url, cookie)})
  getAllCookies(url, callback)
}

function deleteAllCookies(url, callback) {
  getAllCookies(url, deleteCookie)
  callback(url,"Removed Cookies!")
}

const deleteCookie = (url, cookies) => {
  cookies.map(({ name }) => {
    chrome.cookies.remove(
      {
        url,
        name
      },
      c => {
        console.log("REMOVED: ", c)
    })
  })
}
const setCookie = (url, {domain, expirationDate, httpOnly,
  name, path, sameSite, secure, storeId, value}) => {
  const details = {
    domain, expirationDate, httpOnly, name,
    path, sameSite, secure, storeId, url, value,
  }
  chrome.cookies.set(
    details,
    c => {
      console.log("SET: ", c)
    }
  )
}

