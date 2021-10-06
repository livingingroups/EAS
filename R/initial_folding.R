create_html_header <- function(fold_at_start = "show"){
  codejs <- readr::read_lines("vignettes/js/codefolding.js")
  collapsejs <- readr::read_lines("vignettes/js/collapse.js")
  transitionjs <- readr::read_lines("vignettes/js/transition.js")
  dropdownjs <- readr::read_lines("vignettes/js/dropdown.js")
  linksanchorjs <- readr::read_lines("vignettes/js/book.js")
  
  htmlhead <- c(
    paste('
<script>',
          paste(transitionjs, collapse = "\n"),
          '</script>
<script>',
          paste(collapsejs, collapse = "\n"),
          '</script>
<script>',
          paste(codejs, collapse = "\n"),
          '</script>
<script>',
          paste(dropdownjs, collapse = "\n"),
          '</script>
<script>',
          paste(linksanchorjs, collapse = "\n"),
          paste0('</script>
<link rel="shortcut icon" href="img/favicon.ico" />
<script>
$(document).ready(function () {
  window.initializeCodeFolding("show" === "',fold_at_start,'");
});
</script>
'), sep = "\n"),
    paste0('<script>document.write(\'<div class="btn-group pull-right" style="position: absolute; top: 35px; right: 2%; z-index: 10"><button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"aria-expanded="true" data-_extension-text-contrast=""><span>global code</span><span class="caret"></span></button><ul class="dropdown-menu" style="min-width: 50px;"><li><a id="rmd-show-all-code" href="#">Show All</a></li><li><a id="rmd-hide-all-code" href="#">Hide All</a></li></ul></div>\')</script>')
  )
  
  readr::write_lines(htmlhead, file = "vignettes/header.html")
}