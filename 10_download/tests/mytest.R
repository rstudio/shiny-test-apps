app <- ShinyDriver$new("..")
app$snapshotInit("mytest")

app$setInputs(dataset = "pressure")
app$snapshotDownload("downloadData")
app$setInputs(dataset = "cars")
app$snapshotDownload("downloadData")
