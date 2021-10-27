flight %>%
  count(DEST, sort = TRUE) %>%
  top_n(1) %>%
  print()