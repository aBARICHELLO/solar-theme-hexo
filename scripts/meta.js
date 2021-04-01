/**
* Meta Helper
* @description Generate meta tags for HTML header
* @example
*     <%- meta(post) %>
*/
function trim (str) {
    return str.trim().replace(/^"(.*)"$/, "$1").replace(/^"(.*)"$/, "$1");
}

function split (str, sep) {
    var result = [];
    var matched = null;
    while (matched = sep.exec(str)) {
        result.push(matched[0]);
    }
    return result;
}
