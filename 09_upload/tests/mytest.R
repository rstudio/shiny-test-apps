app <- ShinyDriver$new("..")
app$snapshotInit("mytest")

app$uploadFile(file1 = "rock.csv")
app$snapshot()
app$setInputs(disp = "all")
app$snapshot()
