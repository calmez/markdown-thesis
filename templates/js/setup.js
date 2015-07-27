$(document).ready(function () {
    $("#toc").tocify({
        selectors: "h1,h2,h3,h4",
        theme: "bootstrap",
        extendPage: true,
        highlightOnScroll: true,
        ignoreSelector: ".not-in-toc"
    });
    $(".references").prepend('<h1 id="references">References</h1>');
    $("figure img").addClass("img-responsive img-rounded");
});

//MathJax.Hub.Config({
    //tex2jax: {
      //processClass: "math"
    //},
    //TeX: {
        //TagSide: "left",
        //TagIndent: "1.2em",
        //equationNumbers: {
            //autoNumber: "AMS"
        //},
        //Macros: {
            //ensuremath: ["#1",1],
            //textsf: ["\\mathsf{\\text{#1}}",1],
            //texttt: ["\\mathtt{\\text{#1}}",1]
        //}
    //},
    //"HTML-CSS": { 
        //scale: 100,
        //availableFonts: ["TeX"], 
        //preferredFont: "TeX",
        //webFont: "TeX",
        //imageFont: "TeX",
        //EqnChunk: 1000
    //}
//});
