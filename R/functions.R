## Based on this blog https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

viking_colours=c(
  "Blyhvid"="#f4edd8",
  "Auripigment"="#ffbe28",
  "Okker"="#bd6819",
  "Blymønje"="#ff470b",
  "Cinnober"= "#d8301f",
  "Jernoxydrød"="#882f25",
  "Brændt umbra" ="#302724",
  "Kobbergrøn"="#54795a",
  "Vivianit" = "#252828",
  "Vivianit + blyhvid"="#758582",
  "Trækulsort"="#2e2d2e",
  "Trækulsort + blyhvid"="#6e6d71")


#' Function to extract viking colours as hex codes
#'
#' @param ... Character names of viking_colours
#'
viking_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (viking_colours)

  viking_colours[cols]
}


viking_palettes <- list(
  "Hvid"  = viking_cols("Blyhvid "),
  "Gul" = viking_cols("Auripigment", "okker"),
  "Rød" = viking_cols("Blymønje","Cinnober","Jernoxydrød"),
  "Brun"=viking_cols("Brændt umbra"),
  "Grøn" =viking_cols("Kobbergrøn"),
  "Blå"=viking_cols("Vivianit",   "Vivianit + blyhvid"),
  "Sort"=viking_cols("Trækulsort", "Trækulsort + blyhvid" ),
  "Alle"=viking_cols())

#' Return function to interpolate a viking colour palette
#'
#' @param palette Character name of palette in viking_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
viking_pal <- function(palette = "Alle", reverse = FALSE, ...) {
  pal <- viking_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' colour scale constructor for viking colours
#'
#' @param palette Character name of palette in viking_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_colour_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
scale_colour_viking <- function(palette = "Alle", discrete = TRUE, reverse = FALSE, ...) {
  pal <- viking_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("viking_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for viking colours
#'
#' @param palette Character name of palette in viking_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
scale_fill_viking <- function(palette = "Alle", discrete = TRUE, reverse = FALSE, ...) {
  pal <- viking_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("viking_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
