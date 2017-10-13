for (f in list.files(path="scripts/", pattern="*.R")){
  file = paste("scripts/", f, sep="/")
  source(file)
}
