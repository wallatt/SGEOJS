!(function (e, t) {
    var d = "createElement",
        n = "getElementsByTagName",
        c = "setAttribute",
        a = document.getElementById(e);
    return (
        a && a.parentNode && a.parentNode.removeChild(a),
        (a = document[d + "NS"] && document.documentElement.namespaceURI),
        (a = a ? document[d + "NS"](a, "script") : document[d]("script")),
        a[c]("id", e),
        a[c]("src", t),
        void (document[n]("head")[0] || document[n]("body")[0]).appendChild(a)
    );
})("altmetric-embed-js", "/plugins/themes/saludColectiva/js/altmetric_badges-dae2a658e53c442cd84f4390def938db5569f7911cfa1aa78d8970054ec2f48f.js");
